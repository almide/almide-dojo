# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String {
  let chars = string.chars(s)
  let reversed = chars |> list.reverse
  string.join(reversed)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error: Missing '=' before function body at line 1:33
  --> /tmp/dojo-string-reverse-0.almd:1:33
  hint: Almide requires '=' before the body. Write: fn reverse(...) -> Type = { ... }
  |
1 | fn reverse(s: String) -> String {
  |                                 ^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn reverse(s: String) -> String = {
  let chars = string.chars(s)
  let reversed = chars |> list.reverse
  string.join(reversed)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error[E004]: string.join() expects 2 argument(s) but got 1
  --> /tmp/dojo-string-reverse-1.almd:4:15
  in call to string.join()
  hint: Check the number of arguments
  |
4 |   string.join(reversed)
  |               ^^^^^^^^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn reverse(s: String) -> String = {
  let chars = string.chars(s)
  let reversed = chars |> list.reverse
  string.join("", reversed)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-2.almd
error[E005]: argument 'list' expects List[String] but got String
  --> /tmp/dojo-string-reverse-2.almd:4:19
  in call to string.join()
  hint: Fix the argument type
  |
4 |   string.join("", reversed)
  |                   ^^^^^^^^
error[E005]: argument 'sep' expects String but got List[String]
  --> /tmp/dojo-string-reverse-2.almd:4:19
  in call to string.join()
  hint: Fix the argument type
  |
4 |   string.join("", reversed)
  |                   ^^^^^^^^
error[E001]: type mismatch in call to string.join(): expected List[String] but got String
  --> /tmp/dojo-string-reverse-2.almd:4:19
  in call to string.join()
  hint: Fix the expression type or change the expected type
  |
4 |   string.join("", reversed)
  |                   ^^^^^^^^
error[E001]: type mismatch in call to string.join(): expected String but got List[String]
  --> /tmp/dojo-string-reverse-2.almd:4:19
  in call to string.join()
  hint: Fix the expression type or change the expected type
  |
4 |   string.join("", reversed)
  |                   ^^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-string-reverse-2.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-2.almd

1/1 test file(s) failed

```

### Attempt 4 (PASS)

```almide
fn reverse(s: String) -> String = {
  let chars = string.chars(s)
  let reversed = chars |> list.reverse
  list.join(reversed, "")
}
```
