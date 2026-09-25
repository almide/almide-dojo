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
    some((x, y)) => list.map(list.zip_with(x, y, f), (a, b) => a + b)
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
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Int, ?1) -> Int
  --> /tmp/dojo-zip-with-0.almd:3:54
  in call to list.map()
  here: some((x, y)) => list.map(list.zip_with(x, y, f), (a, b) => a + b)
  hint: Fix the argument type
...
3 |     some((x, y)) => list.map(list.zip_with(x, y, f), (a, b) => a + b)
  |                                                      ^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-0.almd:3:54
  in match pattern
  here: some((x, y)) => list.map(list.zip_with(x, y, f), (a, b) => a + b)
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
3 |     some((x, y)) => list.map(list.zip_with(x, y, f), (a, b) => a + b)
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
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}
```

**Diagnostic:**

```
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:2:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
2 |   match list.zip(xs, ys) {
  |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-1.almd:3:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
  |
3 |     none => list.nil()
  |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:3:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
3 |     none => list.nil()
  |             ^^^^^^^^^^

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
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}

// Corrected code:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match list.zip(xs, ys) {
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
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
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:2:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
2 |   match list.zip(xs, ys) {
  |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:3:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
  |
3 |     none => list.nil()
  |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:3:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
3 |     none => list.nil()
  |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:10:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
10 |   match list.zip(xs, ys) {
   |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:11:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
   |
11 |     none => list.nil()
   |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:11:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
11 |     none => list.nil()
   |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:18:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
18 |   match list.zip(xs, ys) {
   |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:19:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
   |
19 |     none => list.nil()
   |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:19:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
19 |     none => list.nil()
   |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:26:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
26 |   match list.zip(xs, ys) {
   |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:27:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
   |
27 |     none => list.nil()
   |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:27:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
27 |     none => list.nil()
   |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:34:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
34 |   match list.zip(xs, ys) {
   |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:35:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
   |
35 |     none => list.nil()
   |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:35:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
35 |     none => list.nil()
   |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:42:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
42 |   match list.zip(xs, ys) {
   |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:43:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
   |
43 |     none => list.nil()
   |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:43:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
43 |     none => list.nil()
   |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:50:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
50 |   match list.zip(xs, ys) {
   |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:51:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
   |
51 |     none => list.nil()
   |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:51:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
51 |     none => list.nil()
   |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:58:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
58 |   match list.zip(xs, ys) {
   |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:59:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
   |
59 |     none => list.nil()
   |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:59:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
59 |     none => list.nil()
   |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:66:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
66 |   match list.zip(xs, ys) {
   |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:67:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
   |
67 |     none => list.nil()
   |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:67:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
67 |     none => list.nil()
   |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:74:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
74 |   match list.zip(xs, ys) {
   |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:75:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
   |
75 |     none => list.nil()
   |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:75:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
75 |     none => list.nil()
   |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:82:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
82 |   match list.zip(xs, ys) {
   |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:83:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
   |
83 |     none => list.nil()
   |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:83:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
83 |     none => list.nil()
   |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:90:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
90 |   match list.zip(xs, ys) {
   |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:91:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
   |
91 |     none => list.nil()
   |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:91:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
91 |     none => list.nil()
   |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:98:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
98 |   match list.zip(xs, ys) {
   |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:99:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
   |
99 |     none => list.nil()
   |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:99:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
99 |     none => list.nil()
   |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:106:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
106 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:107:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
107 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:107:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
107 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:114:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
114 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:115:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
115 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:115:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
115 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:122:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
122 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:123:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
123 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:123:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
123 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:130:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
130 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:131:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
131 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:131:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
131 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:138:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
138 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:139:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
139 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:139:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
139 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:146:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
146 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:147:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
147 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:147:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
147 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:154:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
154 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:155:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
155 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:155:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
155 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:162:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
162 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:163:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
163 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:163:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
163 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:170:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
170 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:171:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
171 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:171:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
171 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:178:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
178 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:179:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
179 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:179:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
179 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:186:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
186 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:187:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
187 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:187:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
187 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:194:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
194 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:195:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
195 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:195:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
195 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:202:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
202 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:203:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
203 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:203:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
203 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:210:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
210 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:211:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
211 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:211:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
211 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:218:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
218 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:219:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
219 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:219:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
219 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:226:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
226 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:227:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
227 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:227:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
227 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:234:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
234 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:235:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
235 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:235:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
235 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:242:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
242 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:243:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
243 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:243:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
243 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:250:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
250 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:251:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
251 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:251:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
251 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:258:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
258 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:259:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
259 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:259:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
259 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:266:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
266 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:267:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
267 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:267:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
267 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:274:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
274 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:275:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
275 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:275:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
275 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:282:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
282 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:283:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
283 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:283:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
283 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:290:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
290 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:291:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
291 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:291:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
291 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:298:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
298 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:299:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
299 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:299:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
299 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:306:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
306 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:307:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
307 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:307:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
307 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:314:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
314 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:315:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
315 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:315:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
315 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:322:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
322 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:323:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
323 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:323:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
323 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:330:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
330 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:331:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
331 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:331:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
331 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:338:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
338 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:339:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
339 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:339:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
339 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:346:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
346 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:347:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
347 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:347:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
347 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:354:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
354 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:355:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
355 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:355:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
355 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:362:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
362 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:363:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
363 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:363:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
363 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:370:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
370 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:371:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
371 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:371:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
371 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:378:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
378 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:379:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
379 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:379:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
379 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:386:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
386 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:387:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
387 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:387:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
387 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:394:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
394 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:395:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
395 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:395:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
395 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:402:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
402 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:403:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
403 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:403:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
403 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:410:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
410 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:411:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
411 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:411:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
411 |     none => list.nil()
    |             ^^^^^^^^^^
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:418:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
418 |   match list.zip(xs, ys) {
    |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:419:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
    |
419 |     none => list.nil()
    |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:419:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
419 |     none => list.nil()
    |             ^^^^^^^^^^
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
    none => list.nil()
    some(pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
  }
}
```

**Diagnostic:**

```
error: pattern `none` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:2:22
  in match pattern
  here: match list.zip(xs, ys) {
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
2 |   match list.zip(xs, ys) {
  |                      ^^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-3.almd:3:13
  in call to list.nil()
  here: none => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
  |
3 |     none => list.nil()
  |             ^^^^^^^^
error: pattern `some(..)` cannot match List[(Int, Int)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:3:13
  in match pattern
  here: none => list.nil()
  hint: the value is already a plain List[(Int, Int)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
3 |     none => list.nil()
  |             ^^^^^^^^^^

3 error(s) found
FAILED: /tmp/dojo-zip-with-3.almd
Compile error for /tmp/dojo-zip-with-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
