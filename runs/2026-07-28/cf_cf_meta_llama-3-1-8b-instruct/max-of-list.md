# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] {
    if list.is_empty(xs) {
        none
    } else {
        list.reduce(xs, fn(a, b) => if a > b then a else b)
    }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error: Missing '=' before function body at line 1:46
  --> /tmp/dojo-max-of-list-0.almd:1:46
  hint: Almide requires '=' before the body. Write: fn max_of_list(...) -> Type = { ... }
  |
1 | fn max_of_list(xs: List[Int]) -> Option[Int] {
  |                                              ^
error: Expected function name at line 5:27 (got LParen '(')
  --> /tmp/dojo-max-of-list-0.almd:5:27
  |
5 |         list.reduce(xs, fn(a, b) => if a > b then a else b)
  |                           ^

2 error(s) found
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
    if list.is_empty(xs) then none
    else list.reduce(xs, fn(a, b) => if a > b then a else b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error: Expected expression at line 3:26 (got Fn 'fn')
  --> /tmp/dojo-max-of-list-1.almd:3:26
  |
3 |     else list.reduce(xs, fn(a, b) => if a > b then a else b)
  |                          ^
error: Expected function name at line 3:28 (got LParen '(')
  --> /tmp/dojo-max-of-list-1.almd:3:28
  |
3 |     else list.reduce(xs, fn(a, b) => if a > b then a else b)
  |                            ^

2 error(s) found
Compile error for /tmp/dojo-max-of-list-1.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
    if list.is_empty(xs) then none
    else list.fold(xs, 
        fn(acc, x) => if x > acc then x else acc, 
        list.first(xs).unwrap_or(0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error: Expected expression at line 4:9 (got Fn 'fn')
  --> /tmp/dojo-max-of-list-2.almd:4:9
  |
4 |         fn(acc, x) => if x > acc then x else acc,
  |         ^
error: Expected function name at line 4:11 (got LParen '(')
  --> /tmp/dojo-max-of-list-2.almd:4:11
  |
4 |         fn(acc, x) => if x > acc then x else acc,
  |           ^

2 error(s) found
Compile error for /tmp/dojo-max-of-list-2.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
    if list.is_empty(xs) then none
    else list.fold(xs, 
        fn (acc, x) => if x > acc then x else acc, 
        list.first(xs).unwrap_or(0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error: Expected expression at line 4:9 (got Fn 'fn')
  --> /tmp/dojo-max-of-list-3.almd:4:9
  |
4 |         fn (acc, x) => if x > acc then x else acc,
  |         ^
error: Expected function name at line 4:12 (got LParen '(')
  --> /tmp/dojo-max-of-list-3.almd:4:12
  |
4 |         fn (acc, x) => if x > acc then x else acc,
  |            ^

2 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
