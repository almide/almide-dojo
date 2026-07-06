# zip-with

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  match (xs, ys) {
    (none, _) => none
    (_, none) => none
    (some(xs), some(ys)) => list.map(list.zip(xs, ys), (p) => f(p.first, p.second))
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-0.almd
error[E001]: type mismatch in match arm: expected Option[?0] but got List[Int]
  --> /tmp/dojo-zip-with-0.almd:5:63
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
5 |     (some(xs), some(ys)) => list.map(list.zip(xs, ys), (p) => f(p.first, p.second))
  |                                                               ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?0]
  --> /tmp/dojo-zip-with-0.almd:5:63
  in fn 'zip_with'
  hint: Fix the expression type or change the expected type
  |
5 |     (some(xs), some(ys)) => list.map(list.zip(xs, ys), (p) => f(p.first, p.second))
  |                                                               ^

2 error(s) found
Compile error for /tmp/dojo-zip-with-0.almd:
compile failed
FAILED: /tmp/dojo-zip-with-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  match (xs, ys) {
    (none, _) => none
    (_, none) => none
    (some(xs), some(ys)) => list.map(list.zip(xs, ys), (p) => f(p.first, p.second)).to_list()
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-1.almd
error[E002]: undefined method 'to_list' on list
  --> /tmp/dojo-zip-with-1.almd:5:63
  in method call .to_list()
  hint: Almide doesn't use method-call syntax. Write `list.<fn>(x)` (or `x |> list.<fn>`) — there is no method `to_list` on `list`. Run `almide explain E002` for examples.
  |
5 |     (some(xs), some(ys)) => list.map(list.zip(xs, ys), (p) => f(p.first, p.second)).to_list()
  |                                                               ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?0]
  --> /tmp/dojo-zip-with-1.almd:5:63
  in fn 'zip_with'
  hint: Fix the expression type or change the expected type
  |
5 |     (some(xs), some(ys)) => list.map(list.zip(xs, ys), (p) => f(p.first, p.second)).to_list()
  |                                                               ^

2 error(s) found
Compile error for /tmp/dojo-zip-with-1.almd:
compile failed
FAILED: /tmp/dojo-zip-with-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  match (xs, ys) {
    (none, _) => none
    (_, none) => none
    (some(xs), some(ys)) => list.map(list.zip(xs, ys), (p) => f(p.first, p.second)).unwrap_or(list())
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-2.almd
error[E002]: undefined function 'list'
  --> /tmp/dojo-zip-with-2.almd:5:99
  in call to list()
  hint: Check the function name
  |
5 |     (some(xs), some(ys)) => list.map(list.zip(xs, ys), (p) => f(p.first, p.second)).unwrap_or(list())
  |                                                                                                   ^
error[E002]: undefined method 'unwrap_or' on list
  --> /tmp/dojo-zip-with-2.almd:5:63
  in method call .unwrap_or()
  hint: Almide doesn't use method-call syntax. Write `list.<fn>(x)` (or `x |> list.<fn>`) — there is no method `unwrap_or` on `list`. Run `almide explain E002` for examples.
  |
5 |     (some(xs), some(ys)) => list.map(list.zip(xs, ys), (p) => f(p.first, p.second)).unwrap_or(list())
  |                                                               ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?0]
  --> /tmp/dojo-zip-with-2.almd:5:63
  in fn 'zip_with'
  hint: Fix the expression type or change the expected type
  |
5 |     (some(xs), some(ys)) => list.map(list.zip(xs, ys), (p) => f(p.first, p.second)).unwrap_or(list())
  |                                                               ^

3 error(s) found
Compile error for /tmp/dojo-zip-with-2.almd:
compile failed
FAILED: /tmp/dojo-zip-with-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  match (xs, ys) {
    (none, _) => none
    (_, none) => none
    (some(xs), some(ys)) => list.map(list.zip(xs, ys), (p) => f(p.first, p.second)).to_list()
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-3.almd
error: Expected pattern at line 7:1 (got Test 'test')
  --> /tmp/dojo-zip-with-3.almd:7:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
7 | test "zip_with add" { assert_eq(zip_with([1, 2, 3], [10, 20, 30], (a, b) => a + b), [11, 22, 33]) }
  | ^

1 error(s) found
Compile error for /tmp/dojo-zip-with-3.almd:
compile failed
FAILED: /tmp/dojo-zip-with-3.almd

1/1 test file(s) failed

```
