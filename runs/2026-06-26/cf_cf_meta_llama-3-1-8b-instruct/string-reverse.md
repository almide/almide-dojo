# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String = string.chars(s) |> list.reverse |> string.join
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error[E004]: string.join() expects 2 argument(s) but got 1
  --> /tmp/dojo-string-reverse-0.almd:1:48
  in call to string.join()
  hint: Check the number of arguments
  try:
      // string.join() takes 2 arg(s) — you passed 1
      string.join(<list: List[String]>, <sep: String>)
  |
1 | fn reverse(s: String) -> String = string.chars(s) |> list.reverse |> string.join
  |                                                ^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn reverse(s: String) -> String = string.chars(s) |> list.reverse |> list.join(string.from_empty())
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error[E002]: undefined function 'string.from_empty'
  --> /tmp/dojo-string-reverse-1.almd:1:97
  in call to string.from_empty()
  hint: Did you mean `string.is_empty`?
  try:
      // string.from_empty(...)  →  string.is_empty(...)
      string.is_empty(...)
  |
1 | fn reverse(s: String) -> String = string.chars(s) |> list.reverse |> list.join(string.from_empty())
  |                                                                                                 ^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn reverse(s: String) -> String = list.join(string.from_empty(), string.chars(s) |> list.reverse)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-2.almd
error[E002]: undefined function 'string.from_empty'
  --> /tmp/dojo-string-reverse-2.almd:1:62
  in call to string.from_empty()
  hint: Did you mean `string.is_empty`?
  try:
      // string.from_empty(...)  →  string.is_empty(...)
      string.is_empty(...)
  |
1 | fn reverse(s: String) -> String = list.join(string.from_empty(), string.chars(s) |> list.reverse)
  |                                                              ^
error[E005]: argument 'sep' expects String but got List[String]
  --> /tmp/dojo-string-reverse-2.almd:1:79
  in call to list.join()
  hint: Fix the argument type
  |
1 | fn reverse(s: String) -> String = list.join(string.from_empty(), string.chars(s) |> list.reverse)
  |                                                                               ^
error[E001]: type mismatch in call to list.join(): expected String but got List[String]
  --> /tmp/dojo-string-reverse-2.almd:1:79
  in call to list.join()
  hint: Fix the expression type or change the expected type
  |
1 | fn reverse(s: String) -> String = list.join(string.from_empty(), string.chars(s) |> list.reverse)
  |                                                                               ^

3 error(s) found
Compile error for /tmp/dojo-string-reverse-2.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn reverse(s: String) -> String = list.join(string.from_empty(), string.chars(s) |> list.reverse |> list.to_string)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-3.almd
error[E002]: undefined function 'string.from_empty'
  --> /tmp/dojo-string-reverse-3.almd:1:62
  in call to string.from_empty()
  hint: Did you mean `string.is_empty`?
  try:
      // string.from_empty(...)  →  string.is_empty(...)
      string.is_empty(...)
  |
1 | fn reverse(s: String) -> String = list.join(string.from_empty(), string.chars(s) |> list.reverse |> list.to_string)
  |                                                              ^
error[E002]: undefined function 'list.to_string'
  --> /tmp/dojo-string-reverse-3.almd:1:79
  in call to list.to_string()
  hint: No function 'to_string' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
1 | fn reverse(s: String) -> String = list.join(string.from_empty(), string.chars(s) |> list.reverse |> list.to_string)
  |                                                                               ^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-3.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-3.almd

1/1 test file(s) failed

```
