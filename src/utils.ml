let execute ?(verbose = false) cmd =
  let s = String.concat " " cmd in

  if verbose then Printf.printf "Executing: %s\n" s;

  let ret = Unix.open_process_in s in
  let output = Buffer.create 100 in
  let () =
    try
      while true do
        let l = input_line ret in
        Buffer.add_string output l;
        Buffer.add_string output "\n"
      done
    with
    | End_of_file -> () in
  String.trim (Buffer.contents output)

let path_resolve first second =
  let open Fpath in
  v first // v second |> normalize |> to_string

let stat path =
  try Some (Unix.stat path) with
  | Unix.Unix_error (Unix.ENOENT, _, _) -> None

let read_file filename =
  let lines = ref [] in
  let chan = open_in filename in
  try
    while true do
      lines := input_line chan :: !lines
    done;
    !lines
  with
  | End_of_file ->
      close_in chan;
      List.rev !lines
