# zip-with

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E012`

## Attempts

### Attempt 1 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => match ys {
      none => none
      some(ys) => match list.zip(xxs, ys) {
        none => none
        some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
      }
    }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-0.almd
error[E001]: type mismatch in match arm: expected Option[?1] but got List[Int]
  --> /tmp/dojo-zip-with-0.almd:8:50
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
8 |         some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  |                                                  ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?1]
  --> /tmp/dojo-zip-with-0.almd:8:50
  in fn 'zip_with'
  hint: Fix the expression type or change the expected type
  |
8 |         some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  |                                                  ^

2 error(s) found
Compile error for /tmp/dojo-zip-with-0.almd:
compile failed
FAILED: /tmp/dojo-zip-with-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match list.zip(xs, ys) {
    none => none
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-1.almd
error[E001]: type mismatch in match arm: expected Option[?0] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:4:46
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
4 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  |                                              ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?0]
  --> /tmp/dojo-zip-with-1.almd:4:46
  in fn 'zip_with'
  hint: Fix the expression type or change the expected type
  |
4 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  |                                              ^

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
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-2.almd
error[E001]: type mismatch in match arm: expected Option[?0] but got List[Int]
  --> /tmp/dojo-zip-with-2.almd:4:46
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
4 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  |                                              ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?0]
  --> /tmp/dojo-zip-with-2.almd:4:46
  in fn 'zip_with'
  hint: Fix the expression type or change the expected type
  |
4 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  |                                              ^

2 error(s) found
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
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }

// changed to
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match list.zip(xs, ys) {
    none => none
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-3.almd
error[E012]: duplicate function 'zip_with'
  at line 8
  in fn zip_with
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
  |
1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  | ----------------------------------- first definition of 'zip_with' here
...
8 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  | ^^^^^^^^^^^
error[E001]: type mismatch in match arm: expected Option[?0] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:4:46
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
4 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  |                                              ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?0]
  --> /tmp/dojo-zip-with-3.almd:4:46
  in fn 'zip_with'
  hint: Fix the expression type or change the expected type
  |
4 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  |                                              ^
error[E001]: type mismatch in match arm: expected Option[?2] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:11:46
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
11 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
   |                                              ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?2]
  --> /tmp/dojo-zip-with-3.almd:11:46
  in fn 'zip_with'
  hint: Fix the expression type or change the expected type
   |
11 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
   |                                              ^

5 error(s) found
Compile error for /tmp/dojo-zip-with-3.almd:
compile failed
FAILED: /tmp/dojo-zip-with-3.almd

1/1 test file(s) failed

```
