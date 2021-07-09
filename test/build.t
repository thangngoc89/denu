Build single file
  $ echo 'let () = print_endline "Build 1"' > build_1.ml
  $ ../src/denu.exe build_1.ml
  Compilation successful!
  Try to execute your code with ./build_1.exe
  $ ./build_1.exe
  Build 1

Executable name is the same as entry file 
  $ echo 'let () = print_endline "Build 2"' > build_2.ml
  $ ../src/denu.exe build_2.ml
  Compilation successful!
  Try to execute your code with ./build_2.exe
  $ ./build_2.exe
  Build 2

Complex dependencies
  $ printf 'let () = Of_build_3.run ()\n' > build_3.ml
  $ printf 'let run = Of_of_build_3.run\n' > of_build_3.ml
  $ printf 'let run () = print_endline "Build 3"\n' > of_of_build_3.ml
  $ ../src/denu.exe build_3.ml
  Compilation successful!
  Try to execute your code with ./build_3.exe
  $ ./build_3.exe
  Build 3

