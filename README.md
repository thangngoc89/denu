# denu
A toy OCaml builder

## Introduction

denu is a toy OCaml builder that I build to learn how to build OCaml project manually.

As you can guess, `denu` is an anagram of `dune` (the de-facto OCaml builder).

## Features

### No configurations

denu takes no configurations. To compile a project, you would run 

```
denu entry_file.ml
```

This would create an executable called `entry_file.exe` in the same folder. 
This is your compiled program.

### No cache

Unlike `dune`, `denu` doesn't cache compilation result. Compilation starts from scratch on each invocation.

### External libraries

Add a file called `denu` with packages name on each line and `denu` would link those packages for you.

See [src/denu](https://github.com/thangngoc89/denu/blob/master/src/denu) for example.

### `denu` could compile itself

A builder should be able to compile itself. 

### Less than 200 lines of code 
(excluding tests)

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



