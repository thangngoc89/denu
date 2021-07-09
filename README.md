# denu
A toy OCaml builder

## Introduction

denu is a toy OCaml builder that I build to learn how to build OCaml project manually.

As you can guess, `denu` is an anagram of `dune` (the de-facto OCaml builder).

## Features

- No configurations

denu takes no configurations. To compile a project, you would run 

```
denu entry_file.ml
```

This would create an executable called `entry_file.exe` in the same folder. 
This is your compiled program.

- No cache

Unlike `dune`, `denu` doesn't cache compilation result. Compilation starts from scratch on each invocation.

- Less than 200 lines of code (excluding tests)

```sh
$ cd src && find . -name '*.ml' | xargs wc -l
      38 ./utils.ml
      86 ./main.ml
      23 ./denu.ml
      12 ./graph.ml
     159 total
```

## License

MIT



