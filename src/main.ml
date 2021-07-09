let verbose = ref false

let exec = Utils.execute ~verbose:!verbose

let ext_none name = name |> String.trim |> Filename.remove_extension

let ext_ensure ~ext name = Printf.sprintf "%s.%s" (ext_none name) ext

module Ocamldep = struct
  (* Example output *

     depend_on_main.cmx : edge.cmx
     edge.cmx :
     main.cmx : depend_on_main.cmx abc.cmx
  *)

  let get_build_order () =
    let output = exec [ "ocamldep"; "-one-line"; "-native"; "*.ml" ] in
    let lines = String.split_on_char '\n' output in
    let graph =
      lines
      |> List.fold_left
           (fun acc line ->
             let colon_parts = String.split_on_char ':' line in
             let file, depends =
               match colon_parts with
               | [ file; depends ] -> (ext_none file, String.trim depends)
               | _ -> failwith "Unexpected Ocamldep output" in
             let depends =
               match depends |> String.length with
               | 0 -> []
               | _ -> String.split_on_char ' ' depends |> List.map ext_none
             in
             (file, depends) :: acc)
           [] in
    List.rev (Graph.toposort graph)
end

let ocamlopt ~binary_out ~files =
  let base = [ "ocamlfind"; "ocamlopt"; "-o"; binary_out ] in
  let packages =
    match Utils.stat "denu" with
    | None -> []
    | Some _ ->
        let pkgs = Utils.read_file "denu" in
        [ "-linkpkg"; "-package"; pkgs |> String.concat "," ] in

  List.concat [ base; packages; files |> List.map (ext_ensure ~ext:"ml") ]

let compile name =
  let _ml_entry =
    match Filename.extension name with
    | "" -> name ^ ".ml"
    | ".ml" -> name
    | extension ->
        failwith
          (Printf.sprintf
             "OCaml source code must have .ml extension. \n\
              You're providing %s with extension %s" name extension) in
  let () =
    let absolute_entry_path = Utils.path_resolve (Sys.getcwd ()) name in
    Sys.chdir (Filename.dirname absolute_entry_path) in

  let name = Filename.chop_extension name in
  let build_order = Ocamldep.get_build_order () in
  let _ =
    exec (ocamlopt ~binary_out:(ext_ensure ~ext:"exe" name) ~files:build_order)
  in
  print_endline "Compilation successful!";
  Printf.printf "Try to execute your code with ./%s.exe\n" name
