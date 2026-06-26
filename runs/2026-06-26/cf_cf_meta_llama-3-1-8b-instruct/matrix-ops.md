# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  match a {
    some(xs) => match b {
      some(ys) => match list.zip(xs, ys) {
        some(pairs) => list.map(pairs, (pair) => list.map(pair, (x) => int.to_int(x + list.get(ys, pair._1._1).unwrap_or(0)))) 
      }
    }
    none => none
  }

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  match m {
    some(xs) => list.map(list.range(0, list.len(xs)), (i) => list.map(xs, (row) => list.get(row, i).unwrap_or(0)))
    none => none
  }

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  match m {
    some(xs) => list.map(xs, (row) => list.map(row, (x) => int.to_int(int.to_float(x) * s)))
    none => none
  }

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-matrix-ops-0.almd:5:100
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 |         some(pairs) => list.map(pairs, (pair) => list.map(pair, (x) => int.to_int(x + list.get(ys, pair._1._1).unwrap_or(0))))
  |                                                                                                    ^^^^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-matrix-ops-0.almd:19:89
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
   |
19 |     some(xs) => list.map(xs, (row) => list.map(row, (x) => int.to_int(int.to_float(x) * s)))
   |                                                                                         ^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-matrix-ops-0.almd:24:3
  in variable list
  hint: Check the variable name
   |
24 |   list
   |   ^^^^
error[E001]: type mismatch in match arm: expected List[List[Int]] but got Option[?6]
  --> /tmp/dojo-matrix-ops-0.almd:8:13
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
8 |     none => none
  |             ^^^^
error[E001]: type mismatch in match arm: expected List[List[Int]] but got Option[?13]
  --> /tmp/dojo-matrix-ops-0.almd:14:13
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
14 |     none => none
   |             ^^^^
error[E001]: type mismatch in match arm: expected List[List[Int]] but got Option[?17]
  --> /tmp/dojo-matrix-ops-0.almd:20:13
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
20 |     none => none
   |             ^^^^

6 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  match a {
    some(xs) => match b {
      some(ys) => list.map(xs, (row) => list.map(row, (x) => x + list.get(ys, list.index_of(ys, x).unwrap_or(0))))
    }
    none => none
  }

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  match m {
    some(xs) => list.map(list.range(0, list.len(xs)), (i) => list.map(xs, (row) => list.get(row, i).unwrap_or(0)))
    none => none
  }

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  match m {
    some(xs) => list.map(xs, (row) => list.map(row, (x) => int.to_float(x) * s))
    none => none
  }

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc +
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected expression at line 24:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-1.almd:24:1
   |
24 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error: operator '+' requires numeric, String, or List types but got ?1 and Option[?2]
  --> /tmp/dojo-matrix-ops-1.almd:4:97
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       some(ys) => list.map(xs, (row) => list.map(row, (x) => x + list.get(ys, list.index_of(ys, x).unwrap_or(0))))
  |                                                                                                 ^
error[E001]: type mismatch in match arm: expected List[List[Int]] but got Option[?3]
  --> /tmp/dojo-matrix-ops-1.almd:6:13
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
6 |     none => none
  |             ^^^^
error[E001]: type mismatch in match arm: expected List[List[Int]] but got Option[?10]
  --> /tmp/dojo-matrix-ops-1.almd:12:13
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
12 |     none => none
   |             ^^^^
error[E001]: type mismatch in match arm: expected List[List[Float]] but got Option[?13]
  --> /tmp/dojo-matrix-ops-1.almd:18:13
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
18 |     none => none
   |             ^^^^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got List[List[Float]]
  --> /tmp/dojo-matrix-ops-1.almd:18:13
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type
   |
18 |     none => none
   |             ^^^^

6 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  match a {
    some(xs) => match b {
      some(ys) => list.map(xs, (row) => list.map(row, (x) => list.get(ys, list.index_of(ys, x)).unwrap_or(0) + x))
    }
    none => none
  }

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  match m {
    some(xs) => list.map(list.range(0, list.len(xs)), (i) => list.map(xs, (row) => list.get(row, i).unwrap_or(0)))
    none => none
  }

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  match m {
    some(xs) => list.map(xs, (row) => list.map(row, (x) => int.to_float(x) * s))
    none => none
  }

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected ')' to close function call opened at line 22:12
  --> /tmp/dojo-matrix-ops-2.almd:24:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
22 |   list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc
   |            --------------- '(' opened here
...
24 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:4:93
  in call to list.get()
  hint: Fix the argument type
  |
4 |       some(ys) => list.map(xs, (row) => list.map(row, (x) => list.get(ys, list.index_of(ys, x)).unwrap_or(0) + x))
  |                                                                                             ^
error[E001]: type mismatch in call to list.get(): expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:4:93
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
4 |       some(ys) => list.map(xs, (row) => list.map(row, (x) => list.get(ys, list.index_of(ys, x)).unwrap_or(0) + x))
  |                                                                                             ^
error[E001]: type mismatch in match arm: expected List[List[Int]] but got Option[?3]
  --> /tmp/dojo-matrix-ops-2.almd:6:13
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
6 |     none => none
  |             ^^^^
error[E001]: type mismatch in match arm: expected List[List[Int]] but got Option[?10]
  --> /tmp/dojo-matrix-ops-2.almd:12:13
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
12 |     none => none
   |             ^^^^
error[E001]: type mismatch in match arm: expected List[List[Float]] but got Option[?13]
  --> /tmp/dojo-matrix-ops-2.almd:18:13
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
18 |     none => none
   |             ^^^^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got List[List[Float]]
  --> /tmp/dojo-matrix-ops-2.almd:18:13
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type
   |
18 |     none => none
   |             ^^^^

7 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  match a {
    some(xs) => match b {
      some(ys) => list.map(xs, (row) => list.map(row, (x) => list.get(ys, list.index_of(ys, x)).unwrap_or(0) + x))
      none => none
    }
    none => none
  }

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  match m {
    some(xs) => list.map(list.range(0, list.len(xs)), (i) => list.map(xs, (row) => list.get(row, i).unwrap_or(0)))
    none => none
  }

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  match m {
    some(xs) => list.map(xs, (row) => list.map(row, (x) => int.to_float(x) * s))
    none => none
  }

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, (acc
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected ')' to close parenthesized expression opened at line 23:48
  --> /tmp/dojo-matrix-ops-3.almd:23:52
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
   |
23 |   list.fold(list.range(0, list.len(row_a)), 0, (acc
   |                                                --------------- '(' opened here
   |
23 |   list.fold(list.range(0, list.len(row_a)), 0, (acc
   |                                                    ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:4:93
  in call to list.get()
  hint: Fix the argument type
  |
4 |       some(ys) => list.map(xs, (row) => list.map(row, (x) => list.get(ys, list.index_of(ys, x)).unwrap_or(0) + x))
  |                                                                                             ^
error[E001]: type mismatch in call to list.get(): expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:4:93
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
4 |       some(ys) => list.map(xs, (row) => list.map(row, (x) => list.get(ys, list.index_of(ys, x)).unwrap_or(0) + x))
  |                                                                                             ^
error[E001]: type mismatch in match arm: expected List[List[Int]] but got Option[?3]
  --> /tmp/dojo-matrix-ops-3.almd:5:15
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
5 |       none => none
  |               ^^^^
error[E001]: type mismatch in match arm: expected List[List[Int]] but got Option[?4]
  --> /tmp/dojo-matrix-ops-3.almd:7:13
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
7 |     none => none
  |             ^^^^
error[E001]: type mismatch in match arm: expected List[List[Int]] but got Option[?11]
  --> /tmp/dojo-matrix-ops-3.almd:13:13
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
13 |     none => none
   |             ^^^^
error[E001]: type mismatch in match arm: expected List[List[Float]] but got Option[?14]
  --> /tmp/dojo-matrix-ops-3.almd:19:13
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
19 |     none => none
   |             ^^^^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got List[List[Float]]
  --> /tmp/dojo-matrix-ops-3.almd:19:13
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type
   |
19 |     none => none
   |             ^^^^

8 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
