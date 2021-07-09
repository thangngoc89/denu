Support findlib libraries
  $ echo 'open Fpath
  > let path = add_seg (v "/a") "b" 
  > let () = print_endline (to_string path)' > library.ml
  $ echo 'fpath' > denu
  $ ../src/denu.exe library.ml
  Compilation successful!
  Try to execute your code with ./library.exe
  $ ./library.exe
  /a/b
