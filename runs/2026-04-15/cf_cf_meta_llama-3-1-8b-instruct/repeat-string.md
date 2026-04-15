# repeat-string

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn repeat(s: String, n: Int) -> String {
  if n == 0 {
    return ""
  }
  s + repeat(s, n - 1)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-repeat-string-0.almd
error: Missing '=' before function body at line 1:40
  --> /tmp/dojo-repeat-string-0.almd:1:40
  hint: Almide requires '=' before the body. Write: fn repeat(...) -> Type = { ... }
  |
1 | fn repeat(s: String, n: Int) -> String {
  |                                        ^

1 error(s) found
Compile error for /tmp/dojo-repeat-string-0.almd:
compile failed
FAILED: /tmp/dojo-repeat-string-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn repeat(s: String, n: Int) -> String = {
  if n == 0 {
    return ""
  }
  s + repeat(s, n - 1)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-repeat-string-1.almd
error: Expected Then at line 2:13 (got LBrace '{')
  --> /tmp/dojo-repeat-string-1.almd:2:13
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if n == 0 {
  |             ^
error: 'return' is not needed in Almide at line 3:5
  --> /tmp/dojo-repeat-string-1.almd:3:5
  hint: The last expression in a block is the return value. Use 'guard ... else' for early returns.
  |
3 |     return ""
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:3 (got Ident 's')
  --> /tmp/dojo-repeat-string-1.almd:5:3
  |
5 |   s + repeat(s, n - 1)
  |   ^
error[E001]: type mismatch in fn 'repeat': expected String but got Unit
  --> /tmp/dojo-repeat-string-1.almd:1:42
  in fn 'repeat'
  hint: Fix the expression type or change the expected type
  |
1 | fn repeat(s: String, n: Int) -> String = {
  |                                          ^

4 error(s) found
Compile error for /tmp/dojo-repeat-string-1.almd:
compile failed
FAILED: /tmp/dojo-repeat-string-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn repeat(s: String, n: Int) -> String = {
  if n == 0 {
    ""
  } else {
    s + repeat(s, n - 1)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-repeat-string-2.almd
error: Expected Then at line 2:13 (got LBrace '{')
  --> /tmp/dojo-repeat-string-2.almd:2:13
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if n == 0 {
  |             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:5 (got Else 'else')
  --> /tmp/dojo-repeat-string-2.almd:4:5
  |
4 |   } else {
  |     ^
error[E001]: type mismatch in fn 'repeat': expected String but got Unit
  --> /tmp/dojo-repeat-string-2.almd:1:42
  in fn 'repeat'
  hint: Fix the expression type or change the expected type
  |
1 | fn repeat(s: String, n: Int) -> String = {
  |                                          ^

3 error(s) found
Compile error for /tmp/dojo-repeat-string-2.almd:
compile failed
FAILED: /tmp/dojo-repeat-string-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn repeat(s: String, n: Int) -> String = {
  if n == 0 {
    ""
  } else {
    s + repeat(s, n - 1)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-repeat-string-3.almd
error: Expected Then at line 2:13 (got LBrace '{')
  --> /tmp/dojo-repeat-string-3.almd:2:13
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if n == 0 {
  |             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:5 (got Else 'else')
  --> /tmp/dojo-repeat-string-3.almd:4:5
  |
4 |   } else {
  |     ^
error[E001]: type mismatch in fn 'repeat': expected String but got Unit
  --> /tmp/dojo-repeat-string-3.almd:1:42
  in fn 'repeat'
  hint: Fix the expression type or change the expected type
  |
1 | fn repeat(s: String, n: Int) -> String = {
  |                                          ^

3 error(s) found
Compile error for /tmp/dojo-repeat-string-3.almd:
compile failed
FAILED: /tmp/dojo-repeat-string-3.almd

1/1 test file(s) failed

```
