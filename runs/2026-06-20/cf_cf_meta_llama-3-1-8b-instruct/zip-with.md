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
    some(xs) => 
      match ys {
        some(ys) => 
          match list.zip(xs, ys) {
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
            none => none
          }
        none => none
      }
    none => none
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-0.almd
error[E001]: type mismatch in match arm: expected List[Int] but got Option[?3]
  --> /tmp/dojo-zip-with-0.almd:9:21
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
9 |             none => none
  |                     ^^^^
error[E001]: type mismatch in match arm: expected List[Int] but got Option[?4]
  --> /tmp/dojo-zip-with-0.almd:11:17
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
11 |         none => none
   |                 ^^^^
error[E001]: type mismatch in match arm: expected List[Int] but got Option[?5]
  --> /tmp/dojo-zip-with-0.almd:13:13
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
13 |     none => none
   |             ^^^^

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
    some(xs) => 
      match ys {
        some(ys) => 
          match list.zip(xs, ys) {
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
            none => list.empty[Int]
          }
        none => list.empty[Int]
      }
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
    some(xs) => 
      match ys {
        some(ys) => 
          match list.zip(xs, ys) {
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
            none => list.empty[Int]
          }
        none => list.empty[Int]
      }
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
    some(xs) => 
      match ys {
        some(ys) => 
          match list.zip(xs, ys) {
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
            none => list.empty[Int]
          }
        none => list.empty[Int]
      }
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
