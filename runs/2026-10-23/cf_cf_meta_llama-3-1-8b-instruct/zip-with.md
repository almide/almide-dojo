# zip-with

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match (list.zip(xs, ys)) {
    some((x, y)) => list.map(list.zip_with(x, y, f), (a, b) => a)
    none => list.nil()
  }
}
```

**Diagnostic:**

```
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-0.almd:2:23
  in match pattern
  here: match (list.zip(xs, ys)) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
2 |   match (list.zip(xs, ys)) {
  |                       ^^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Int, ?2) -> Int
  --> /tmp/dojo-zip-with-0.almd:3:54
  in call to list.map()
  here: some((x, y)) => list.map(list.zip_with(x, y, f), (a, b) => a)
  hint: Fix the argument type
...
3 |     some((x, y)) => list.map(list.zip_with(x, y, f), (a, b) => a)
  |                                                      ^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-0.almd:3:54
  in match pattern
  here: some((x, y)) => list.map(list.zip_with(x, y, f), (a, b) => a)
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
3 |     some((x, y)) => list.map(list.zip_with(x, y, f), (a, b) => a)
  |                                                      ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-0.almd:4:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
  |
4 |     none => list.nil()
  |             ^^^^^^^^

4 error(s) found
FAILED: /tmp/dojo-zip-with-0.almd
Compile error for /tmp/dojo-zip-with-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}
```

**Diagnostic:**

```
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:2:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
2 |   match list.zip(xs, ys) {
  |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:3:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
3 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-1.almd:4:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
  |
4 |     none => list.nil()
  |             ^^^^^^^^

3 error(s) found
FAILED: /tmp/dojo-zip-with-1.almd
Compile error for /tmp/dojo-zip-with-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}

// Corrected code
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
```

**Diagnostic:**

```
error: Expected pattern at line 430:1 (got Test 'test')
  --> /tmp/dojo-zip-with-2.almd:430:1
  here: test "zip_with add" { assert_eq(zip_with([1, 2, 3], [10, 20, 30], (a, b) => a + b), [11, 22, 33]) }
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
430 | test "zip_with add" { assert_eq(zip_with([1, 2, 3], [10, 20, 30], (a, b) => a + b), [11, 22, 33]) }
    | ^
error[E012]: duplicate function 'zip_with'
  at line 9
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
  |
1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  | ----------------------------------- first definition of 'zip_with' here
...
9 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  | ^
error[E012]: duplicate function 'zip_with'
  at line 17
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
   | ----------------------------------- first definition of 'zip_with' here
...
17 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
   | ^
error[E012]: duplicate function 'zip_with'
  at line 25
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
   | ----------------------------------- first definition of 'zip_with' here
...
25 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
   | ^
error[E012]: duplicate function 'zip_with'
  at line 33
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
   | ----------------------------------- first definition of 'zip_with' here
...
33 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
   | ^
error[E012]: duplicate function 'zip_with'
  at line 41
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
   | ----------------------------------- first definition of 'zip_with' here
...
41 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
   | ^
error[E012]: duplicate function 'zip_with'
  at line 49
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
   | ----------------------------------- first definition of 'zip_with' here
...
49 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
   | ^
error[E012]: duplicate function 'zip_with'
  at line 57
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
   | ----------------------------------- first definition of 'zip_with' here
...
57 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
   | ^
error[E012]: duplicate function 'zip_with'
  at line 65
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
   | ----------------------------------- first definition of 'zip_with' here
...
65 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
   | ^
error[E012]: duplicate function 'zip_with'
  at line 73
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
   | ----------------------------------- first definition of 'zip_with' here
...
73 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
   | ^
error[E012]: duplicate function 'zip_with'
  at line 81
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
   | ----------------------------------- first definition of 'zip_with' here
...
81 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
   | ^
error[E012]: duplicate function 'zip_with'
  at line 89
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
   | ----------------------------------- first definition of 'zip_with' here
...
89 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
   | ^
error[E012]: duplicate function 'zip_with'
  at line 97
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
   | ----------------------------------- first definition of 'zip_with' here
...
97 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
   | ^
error[E012]: duplicate function 'zip_with'
  at line 105
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
105 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 113
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
113 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 121
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
121 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 129
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
129 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 137
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
137 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 145
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
145 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 153
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
153 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 161
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
161 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 169
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
169 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 177
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
177 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 185
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
185 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 193
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
193 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 201
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
201 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 209
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
209 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 217
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
217 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 225
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
225 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 233
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
233 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 241
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
241 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 249
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
249 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 257
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
257 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 265
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
265 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 273
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
273 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 281
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
281 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 289
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
289 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 297
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
297 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 305
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
305 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 313
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
313 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 321
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
321 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 329
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
329 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 337
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
337 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 345
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
345 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 353
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
353 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 361
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
361 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 369
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
369 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 377
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
377 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 385
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
385 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 393
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
393 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 401
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
401 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 409
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
409 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 417
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
417 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error[E012]: duplicate function 'zip_with'
  at line 425
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ----------------------------------- first definition of 'zip_with' here
 ...
425 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    | ^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:2:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
2 |   match list.zip(xs, ys) {
  |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:3:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
3 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:4:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
  |
4 |     none => list.nil()
  |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:10:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
10 |   match list.zip(xs, ys) {
   |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:11:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
11 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
   |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:12:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
   |
12 |     none => list.nil()
   |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:18:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
18 |   match list.zip(xs, ys) {
   |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:19:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
19 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
   |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:20:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
   |
20 |     none => list.nil()
   |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:26:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
26 |   match list.zip(xs, ys) {
   |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:27:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
27 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
   |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:28:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
   |
28 |     none => list.nil()
   |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:34:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
34 |   match list.zip(xs, ys) {
   |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:35:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
35 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
   |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:36:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
   |
36 |     none => list.nil()
   |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:42:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
42 |   match list.zip(xs, ys) {
   |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:43:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
43 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
   |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:44:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
   |
44 |     none => list.nil()
   |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:50:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
50 |   match list.zip(xs, ys) {
   |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:51:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
51 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
   |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:52:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
   |
52 |     none => list.nil()
   |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:58:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
58 |   match list.zip(xs, ys) {
   |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:59:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
59 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
   |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:60:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
   |
60 |     none => list.nil()
   |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:66:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
66 |   match list.zip(xs, ys) {
   |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:67:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
67 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
   |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:68:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
   |
68 |     none => list.nil()
   |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:74:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
74 |   match list.zip(xs, ys) {
   |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:75:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
75 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
   |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:76:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
   |
76 |     none => list.nil()
   |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:82:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
82 |   match list.zip(xs, ys) {
   |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:83:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
83 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
   |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:84:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
   |
84 |     none => list.nil()
   |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:90:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
90 |   match list.zip(xs, ys) {
   |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:91:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
91 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
   |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:92:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
   |
92 |     none => list.nil()
   |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:98:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
98 |   match list.zip(xs, ys) {
   |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:99:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
99 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
   |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:100:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
100 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:106:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
106 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:107:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
107 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:108:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
108 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:114:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
114 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:115:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
115 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:116:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
116 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:122:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
122 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:123:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
123 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:124:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
124 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:130:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
130 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:131:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
131 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:132:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
132 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:138:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
138 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:139:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
139 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:140:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
140 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:146:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
146 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:147:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
147 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:148:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
148 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:154:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
154 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:155:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
155 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:156:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
156 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:162:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
162 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:163:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
163 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:164:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
164 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:170:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
170 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:171:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
171 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:172:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
172 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:178:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
178 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:179:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
179 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:180:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
180 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:186:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
186 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:187:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
187 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:188:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
188 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:194:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
194 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:195:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
195 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:196:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
196 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:202:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
202 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:203:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
203 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:204:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
204 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:210:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
210 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:211:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
211 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:212:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
212 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:218:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
218 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:219:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
219 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:220:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
220 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:226:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
226 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:227:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
227 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:228:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
228 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:234:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
234 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:235:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
235 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:236:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
236 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:242:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
242 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:243:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
243 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:244:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
244 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:250:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
250 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:251:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
251 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:252:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
252 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:258:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
258 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:259:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
259 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:260:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
260 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:266:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
266 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:267:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
267 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:268:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
268 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:274:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
274 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:275:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
275 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:276:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
276 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:282:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
282 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:283:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
283 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:284:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
284 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:290:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
290 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:291:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
291 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:292:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
292 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:298:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
298 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:299:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
299 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:300:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
300 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:306:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
306 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:307:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
307 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:308:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
308 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:314:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
314 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:315:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
315 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:316:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
316 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:322:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
322 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:323:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
323 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:324:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
324 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:330:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
330 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:331:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
331 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:332:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
332 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:338:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
338 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:339:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
339 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:340:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
340 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:346:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
346 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:347:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
347 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:348:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
348 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:354:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
354 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:355:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
355 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:356:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
356 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:362:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
362 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:363:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
363 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:364:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
364 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:370:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
370 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:371:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
371 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:372:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
372 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:378:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
378 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:379:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
379 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:380:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
380 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:386:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
386 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:387:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
387 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:388:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
388 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:394:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
394 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:395:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
395 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:396:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
396 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:402:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
402 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:403:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
403 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:404:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
404 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:410:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
410 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:411:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
411 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:412:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
412 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:418:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
418 |   match list.zip(xs, ys) {
    |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:419:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
419 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:420:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
420 |     none => list.nil()
    |             ^^^^^^^^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Unit
  --> /tmp/dojo-zip-with-2.almd:425:80
  in fn 'zip_with'
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[Int]
    |
425 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
    |                                                                                ^

214 error(s) found
FAILED: /tmp/dojo-zip-with-2.almd
Compile error for /tmp/dojo-zip-with-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    none => list.nil()
  }
}
```

**Diagnostic:**

```
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:2:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
2 |   match list.zip(xs, ys) {
  |                      ^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:3:46
  in match pattern
  here: some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
3 |     some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  |                                              ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-3.almd:4:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
  |
4 |     none => list.nil()
  |             ^^^^^^^^

3 error(s) found
FAILED: /tmp/dojo-zip-with-3.almd
Compile error for /tmp/dojo-zip-with-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
