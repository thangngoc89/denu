let execute ?(verbose = false) cmd =
  let s = String.concat " " cmd in
  let () = if not verbose then Printf.printf "Executing: %s\n" s in
  let ret = Unix.open_process_in s in
  let output = Buffer.create 100 in
  let () =
    try
      while true do
        let l = input ret in
        Buffer.add_string output l;
        Buffer.add_string output "\n"
      done
    with
    | End_of_file -> () in
  String.trim (Buffer.contents output)

