Repeated build
  $ echo 'let () = print_endline "One"' > build.ml
  $ ../src/denu.exe build.ml
  Compilation successful!
  Try to execute your code with ./build.exe
  $ ./build.exe
  One
  $ echo 'let () = print_endline "Two"' > build.ml
  $ ../src/denu.exe build.ml
  Compilation successful!
  Try to execute your code with ./build.exe
  $ ./build.exe
  Two
