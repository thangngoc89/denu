let usage_msg = "Compile OCaml code: denu [--verbose] <entry_file>.ml"

let speclist =
  [ ("--verbose", Arg.Set Main.verbose, "Output debug information") ]

let input_files = ref []

let anon_fun filename = input_files := filename :: !input_files

let error_help_text = "\nRun denu --help for more information"

let () =
  Arg.parse speclist anon_fun usage_msg;
  match !input_files with
  | [] ->
      prerr_endline
        ("Exact one <entry_file>.ml file must be provided." ^ error_help_text);
      exit 1
  | [ entry_file ] -> Main.compile entry_file
  | _x :: _tl ->
      prerr_endline ("Too many <entry_file>.ml provided." ^ error_help_text);
      exit 1

