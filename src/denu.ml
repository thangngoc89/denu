let usage_msg = "Compile OCaml code: denu [--verbose] <entry_file>.ml"

let speclist =
  [ ("--verbose", Arg.Set Main.verbose, "Output debug information") ]

let entry_file = ref ""

let anon_fun filename = entry_file := filename

let () =
  Arg.parse speclist anon_fun usage_msg;
  Main.compile !entry_file

