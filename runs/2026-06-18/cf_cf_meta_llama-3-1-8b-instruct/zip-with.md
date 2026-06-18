# zip-with

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => list.to_list(none)
    some(x) => match ys {
      none => list.to_list(none)
      some(y) => list.cons(f(x, y), list.zip_with(list.drop(xs, 1), list.drop(ys, 1), f))
    }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-0.almd
error[E002]: undefined function 'list.to_list'
  --> /tmp/dojo-zip-with-0.almd:3:26
  in call to list.to_list()
  hint: No function 'to_list' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
3 |     none => list.to_list(none)
  |                          ^^^^
error[E002]: undefined function 'list.to_list'
  --> /tmp/dojo-zip-with-0.almd:5:28
  in call to list.to_list()
  hint: No function 'to_list' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
5 |       none => list.to_list(none)
  |                            ^^^^
error[E002]: undefined function 'list.cons'
  --> /tmp/dojo-zip-with-0.almd:6:87
  in call to list.cons()
  hint: Did you mean `list.count`?
  try:
      // list.cons(...)  →  list.count(...)
      list.count(...)
  |
6 |       some(y) => list.cons(f(x, y), list.zip_with(list.drop(xs, 1), list.drop(ys, 1), f))
  |                                                                                       ^

3 error(s) found
Compile error for /tmp/dojo-zip-with-0.almd:
compile failed
FAILED: /tmp/dojo-zip-with-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(x) => match ys {
      none => none
      some(y) => list.cons(f(x, y), list.zip_with(list.drop(xs, 1), list.drop(ys, 1), f))
    }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-1.almd
error[E002]: undefined function 'list.cons'
  --> /tmp/dojo-zip-with-1.almd:6:87
  in call to list.cons()
  hint: Did you mean `list.count`?
  try:
      // list.cons(...)  →  list.count(...)
      list.count(...)
  |
6 |       some(y) => list.cons(f(x, y), list.zip_with(list.drop(xs, 1), list.drop(ys, 1), f))
  |                                                                                       ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?0]
  --> /tmp/dojo-zip-with-1.almd:6:87
  in fn 'zip_with'
  hint: Fix the expression type or change the expected type
  |
6 |       some(y) => list.cons(f(x, y), list.zip_with(list.drop(xs, 1), list.drop(ys, 1), f))
  |                                                                                       ^

2 error(s) found
Compile error for /tmp/dojo-zip-with-1.almd:
compile failed
FAILED: /tmp/dojo-zip-with-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match list.zip(xs, ys) {
    none => none
    some((x, y)) => match list.zip_with(list.drop(xs, 1), list.drop(ys, 1), f) {
      none => some(f(x, y))
      some(z) => some(f(x, y) :: z)
    }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-2.almd
error: Expected ')' to close some() opened at line 6:22
  --> /tmp/dojo-zip-with-2.almd:6:31
  hint: Add ')' or check for a missing delimiter inside the some()
  |
6 |       some(z) => some(f(x, y) :: z)
  |                      --------------- '(' opened here
  |
6 |       some(z) => some(f(x, y) :: z)
  |                               ^

1 error(s) found
Compile error for /tmp/dojo-zip-with-2.almd:
compile failed
FAILED: /tmp/dojo-zip-with-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match list.zip(xs, ys) {
    none => none
    some((x, y)) => 
      match list.zip_with(list.drop(xs, 1), list.drop(ys, 1), f) {
        none => some([f(x, y)])
        some(z) => some(f(x, y) :: z)
      }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-3.almd
error: Expected ')' to close some() opened at line 7:24
  --> /tmp/dojo-zip-with-3.almd:7:33
  hint: Add ')' or check for a missing delimiter inside the some()
  |
7 |         some(z) => some(f(x, y) :: z)
  |                        --------------- '(' opened here
  |
7 |         some(z) => some(f(x, y) :: z)
  |                                 ^

1 error(s) found
Compile error for /tmp/dojo-zip-with-3.almd:
compile failed
FAILED: /tmp/dojo-zip-with-3.almd

1/1 test file(s) failed

```
