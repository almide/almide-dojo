# zip-with

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] {
    match (list.zip(xs, ys)) {
        some((x, y)) => list.map(list.zip_with(x, y, f), xs.len() - list.len(xs)),
        none => list.empty[Int]
    }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-0.almd
error: Missing '=' before function body at line 1:78
  --> /tmp/dojo-zip-with-0.almd:1:78
  hint: Almide requires '=' before the body. Write: fn zip_with(...) -> Type = { ... }
  |
1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] {
  |                                                                              ^

1 error(s) found
Compile error for /tmp/dojo-zip-with-0.almd:
compile failed
FAILED: /tmp/dojo-zip-with-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    match (list.zip(xs, ys)) {
        some((x, y)) => list.map(list.zip_with(x, y, f), xs.len() - list.len(xs)),
        none => list.empty[Int]
    }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-1.almd
error[E005]: argument 'f' expects fn(Int) -> B but got Int
  --> /tmp/dojo-zip-with-1.almd:3:78
  in call to list.map()
  hint: Fix the argument type
  |
3 |         some((x, y)) => list.map(list.zip_with(x, y, f), xs.len() - list.len(xs)),
  |                                                                              ^^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-zip-with-1.almd:4:17
  in variable list
  hint: Check the variable name
  |
4 |         none => list.empty[Int]
  |                 ^^^^
error[E001]: type mismatch in call to list.map(): expected fn(Int) -> B but got Int
  --> /tmp/dojo-zip-with-1.almd:3:78
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
3 |         some((x, y)) => list.map(list.zip_with(x, y, f), xs.len() - list.len(xs)),
  |                                                                              ^^

3 error(s) found
Compile error for /tmp/dojo-zip-with-1.almd:
compile failed
FAILED: /tmp/dojo-zip-with-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    match list.zip(xs, ys) {
        some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1)),
        none => list.empty[Int]
    }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-2.almd
error[E003]: undefined variable 'list'
  --> /tmp/dojo-zip-with-2.almd:4:17
  in variable list
  hint: Check the variable name
  |
4 |         none => list.empty[Int]
  |                 ^^^^

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
        some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1)),
        none => list.empty[Int]
    }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-3.almd
error[E003]: undefined variable 'list'
  --> /tmp/dojo-zip-with-3.almd:4:17
  in variable list
  hint: Check the variable name
  |
4 |         none => list.empty[Int]
  |                 ^^^^

1 error(s) found
Compile error for /tmp/dojo-zip-with-3.almd:
compile failed
FAILED: /tmp/dojo-zip-with-3.almd

1/1 test file(s) failed

```
