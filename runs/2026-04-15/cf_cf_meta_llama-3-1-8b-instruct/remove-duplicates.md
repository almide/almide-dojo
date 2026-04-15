# remove-duplicates

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

## Attempts

### Attempt 1 (FAIL)

```almide
fn remove_duplicates(xs: List[Int]) -> List[Int] = 
  list.filter(xs, (x) => list.find(xs, (y) => x == y) == [x])
```

**Diagnostic:**

```
Compiling /tmp/dojo-remove-duplicates-0.almd
Compile error for /tmp/dojo-remove-duplicates-0.almd:
error[E0308]: mismatched types
   --> src/main.rs:250:13
    |
247 |           move |x| almide_eq!((__cap_0.clone()).into_iter().find(move |y| {
    |  _____________________________-
248 | |             let y: i64 = (*y);
249 | |             almide_eq!(x, y)
250 | |         }), vec![x])
    | |          -  ^^^^^^^ expected `Option<i64>`, found `Vec<i64>`
    | |__________|
    |            expected because this is `Option<i64>`
    |
    = note: expected enum `Option<i64>`
             found struct `Vec<i64>`
    = note: this error originates in the macro `vec` (in Nightly builds, run with -Z macro-backtrace for more info)


error: could not compile `almide-out` (bin "almide-out" test) due to 1 previous error; 1 warning emitted

FAILED: /tmp/dojo-remove-duplicates-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn remove_duplicates(xs: List[Int]) -> List[Int] = 
  list.filter(xs, (x) => list.find(xs, (y) => x == y) == some(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-remove-duplicates-1.almd
FAILED: /tmp/dojo-remove-duplicates-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn remove_duplicates(xs: List[Int]) -> List[Int] = 
  list.filter(xs, (x) => x == list.find(xs, (y) => x == y).unwrap())
```

**Diagnostic:**

```
Compiling /tmp/dojo-remove-duplicates-2.almd
error[E001]: type mismatch in method call: expected Option[Int] but got fn() -> Int
  --> /tmp/dojo-remove-duplicates-2.almd:2:57
  in method call
  hint: Fix the expression type or change the expected type
  |
2 |   list.filter(xs, (x) => x == list.find(xs, (y) => x == y).unwrap())
  |                                                         ^

1 error(s) found
Compile error for /tmp/dojo-remove-duplicates-2.almd:
compile failed
FAILED: /tmp/dojo-remove-duplicates-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn remove_duplicates(xs: List[Int]) -> List[Int] = 
  list.filter(xs, (x) => x == list.find(xs, (y) => x == y).unwrap().unwrap())
```

**Diagnostic:**

```
Compiling /tmp/dojo-remove-duplicates-3.almd
error[E001]: type mismatch in method call: expected Option[Int] but got fn() -> fn() -> Int
  --> /tmp/dojo-remove-duplicates-3.almd:2:57
  in method call
  hint: Fix the expression type or change the expected type
  |
2 |   list.filter(xs, (x) => x == list.find(xs, (y) => x == y).unwrap().unwrap())
  |                                                         ^

1 error(s) found
Compile error for /tmp/dojo-remove-duplicates-3.almd:
compile failed
FAILED: /tmp/dojo-remove-duplicates-3.almd

1/1 test file(s) failed

```
