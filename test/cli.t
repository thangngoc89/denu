Print error when no entry_file provided
  $ ../src/denu.exe
  Exact one <entry_file>.ml file must be provided.
  Run denu --help for more information
  [1]

Print error when there are more than one entry_file provided
  $ ../src/denu.exe one.ml two.ml three.ml
  Too many <entry_file>.ml provided.
  Run denu --help for more information
  [1]
 
