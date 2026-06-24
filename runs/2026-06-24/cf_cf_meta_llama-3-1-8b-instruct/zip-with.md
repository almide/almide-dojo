# zip-with

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  match xs {
    some(xxs) => match ys {
      some(ys) => match list.zip(xxs, ys) {
        some(pairs) => list.map(pairs, f)
      }
    },
    none => list.empty[Int]
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-0.almd
error[E005]: argument 'f' expects fn(A) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-zip-with-0.almd:5:40
  in call to list.map()
  hint: Fix the argument type
  |
5 |         some(pairs) => list.map(pairs, f)
  |                                        ^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-zip-with-0.almd:8:13
  in variable list
  hint: Check the variable name
  |
8 |     none => list.empty[Int]
  |             ^^^^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-zip-with-0.almd:5:40
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
5 |         some(pairs) => list.map(pairs, f)
  |                                        ^

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
    some(xxs) =>
      match ys {
        some(ys) =>
          match list.zip(xxs, ys) {
            some(pairs) =>
              list.map(pairs, (pair) => f(pair.first, pair.second)),
            none => list.empty[Int]
          },
        none => list.empty[Int]
      },
    none => list.empty[Int]
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-1.almd
error[E003]: undefined variable 'list'
  --> /tmp/dojo-zip-with-1.almd:9:21
  in variable list
  hint: Check the variable name
  |
9 |             none => list.empty[Int]
  |                     ^^^^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-zip-with-1.almd:11:17
  in variable list
  hint: Check the variable name
   |
11 |         none => list.empty[Int]
   |                 ^^^^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-zip-with-1.almd:13:13
  in variable list
  hint: Check the variable name
   |
13 |     none => list.empty[Int]
   |             ^^^^

3 error(s) found
Compile error for /tmp/dojo-zip-with-1.almd:
compile failed
FAILED: /tmp/dojo-zip-with-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  match xs {
    some(xxs) =>
      match ys {
        some(ys) =>
          match list.zip(xxs, ys) {
            some(pairs) =>
              list.map(pairs, (pair) => f(pair.first, pair.second)),
            none => list.empty[Int]
          },
        none => list.empty[Int]
      },
    none => list.empty[Int]
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-2.almd
error[E003]: undefined variable 'list'
  --> /tmp/dojo-zip-with-2.almd:9:21
  in variable list
  hint: Check the variable name
  |
9 |             none => list.empty[Int]
  |                     ^^^^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-zip-with-2.almd:11:17
  in variable list
  hint: Check the variable name
   |
11 |         none => list.empty[Int]
   |                 ^^^^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-zip-with-2.almd:13:13
  in variable list
  hint: Check the variable name
   |
13 |     none => list.empty[Int]
   |             ^^^^

3 error(s) found
Compile error for /tmp/dojo-zip-with-2.almd:
compile failed
FAILED: /tmp/dojo-zip-with-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  match xs {
    some(xxs) =>
      match ys {
        some(ys) =>
          match list.zip(xxs, ys) {
            some(pairs) =>
              list.map(pairs, (pair) => f(pair.first, pair.second)),
            none => list.empty[Int]
          },
        none => list.empty[Int]
      },
    none => list.empty[Int]
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-3.almd
error[E003]: undefined variable 'list'
  --> /tmp/dojo-zip-with-3.almd:9:21
  in variable list
  hint: Check the variable name
  |
9 |             none => list.empty[Int]
  |                     ^^^^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-zip-with-3.almd:11:17
  in variable list
  hint: Check the variable name
   |
11 |         none => list.empty[Int]
   |                 ^^^^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-zip-with-3.almd:13:13
  in variable list
  hint: Check the variable name
   |
13 |     none => list.empty[Int]
   |             ^^^^

3 error(s) found
Compile error for /tmp/dojo-zip-with-3.almd:
compile failed
FAILED: /tmp/dojo-zip-with-3.almd

1/1 test file(s) failed

```
