# zip-with

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match xs {
    some(xxs) =>
      match ys {
        some(ys) =>
          list.zip(xxs, ys)
          |> list.map((x, y) => f(x, y))
          |> list.concat(list.zip(list.drop(xxs, 1), list.drop(ys, 1)))
          |> list.concat(list.drop(list.drop(xxs, 1), 1))
          |> list.concat(list.drop(list.drop(ys, 1), 1)),
        none => list.to_list(none)
      },
    none => list.to_list(none)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-0.almd
error[E005]: argument 'f' expects fn((?0, ?1)) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-zip-with-0.almd:7:33
  in call to list.map()
  hint: Fix the argument type
  |
7 |           |> list.map((x, y) => f(x, y))
  |                                 ^
error[E002]: undefined function 'list.concat'
  --> /tmp/dojo-zip-with-0.almd:8:68
  in call to list.concat()
  hint: No function 'concat' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
8 |           |> list.concat(list.zip(list.drop(xxs, 1), list.drop(ys, 1)))
  |                                                                    ^
error[E002]: undefined function 'list.concat'
  --> /tmp/dojo-zip-with-0.almd:9:55
  in call to list.concat()
  hint: No function 'concat' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
9 |           |> list.concat(list.drop(list.drop(xxs, 1), 1))
  |                                                       ^
error[E002]: undefined function 'list.concat'
  --> /tmp/dojo-zip-with-0.almd:10:54
  in call to list.concat()
  hint: No function 'concat' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
10 |           |> list.concat(list.drop(list.drop(ys, 1), 1)),
   |                                                      ^
error[E002]: undefined function 'list.to_list'
  --> /tmp/dojo-zip-with-0.almd:11:30
  in call to list.to_list()
  hint: No function 'to_list' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
11 |         none => list.to_list(none)
   |                              ^^^^
error[E002]: undefined function 'list.to_list'
  --> /tmp/dojo-zip-with-0.almd:13:26
  in call to list.to_list()
  hint: No function 'to_list' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
13 |     none => list.to_list(none)
   |                          ^^^^
error[E001]: type mismatch in call to list.map(): expected fn((?0, ?1)) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-zip-with-0.almd:7:33
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
7 |           |> list.map((x, y) => f(x, y))
  |                                 ^

7 error(s) found
Compile error for /tmp/dojo-zip-with-0.almd:
compile failed
FAILED: /tmp/dojo-zip-with-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match xs {
    some(xxs) =>
      match ys {
        some(ys) =>
          list.zip(xxs, ys)
          |> list.map((x, y) => f(x, y)),
        none => list.to_list(none)
      },
    none => list.to_list(none)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-1.almd
error[E005]: argument 'f' expects fn((?0, ?1)) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-zip-with-1.almd:7:33
  in call to list.map()
  hint: Fix the argument type
  |
7 |           |> list.map((x, y) => f(x, y)),
  |                                 ^
error[E002]: undefined function 'list.to_list'
  --> /tmp/dojo-zip-with-1.almd:8:30
  in call to list.to_list()
  hint: No function 'to_list' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
8 |         none => list.to_list(none)
  |                              ^^^^
error[E002]: undefined function 'list.to_list'
  --> /tmp/dojo-zip-with-1.almd:10:26
  in call to list.to_list()
  hint: No function 'to_list' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
10 |     none => list.to_list(none)
   |                          ^^^^
error[E001]: type mismatch in call to list.map(): expected fn((?0, ?1)) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-zip-with-1.almd:7:33
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
7 |           |> list.map((x, y) => f(x, y)),
  |                                 ^

4 error(s) found
Compile error for /tmp/dojo-zip-with-1.almd:
compile failed
FAILED: /tmp/dojo-zip-with-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(zipped) =>
      list.map(zipped, (pair) => f(pair.0, pair.1)),
    none => list.to_list(none)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-2.almd
error[E002]: undefined function 'list.to_list'
  --> /tmp/dojo-zip-with-2.almd:5:26
  in call to list.to_list()
  hint: No function 'to_list' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
5 |     none => list.to_list(none)
  |                          ^^^^

1 error(s) found
Compile error for /tmp/dojo-zip-with-2.almd:
compile failed
FAILED: /tmp/dojo-zip-with-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(zipped) =>
      list.map(zipped, (pair) => f(pair.0, pair.1)),
    none => list.to_list(none)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-3.almd
error[E002]: undefined function 'list.to_list'
  --> /tmp/dojo-zip-with-3.almd:5:26
  in call to list.to_list()
  hint: No function 'to_list' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
5 |     none => list.to_list(none)
  |                          ^^^^

1 error(s) found
Compile error for /tmp/dojo-zip-with-3.almd:
compile failed
FAILED: /tmp/dojo-zip-with-3.almd

1/1 test file(s) failed

```
