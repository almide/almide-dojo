# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String = 
    let chars = string.chars(s)
    let reversed = list.reverse(chars)
    string.from_chars(reversed)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error[E002]: undefined function 'string.from_chars'
  --> /tmp/dojo-string-reverse-0.almd:4:23
  in call to string.from_chars()
  hint: Did you mean `string.from_bytes`?
  try:
      // string.from_chars(...)  →  string.from_bytes(...)
      string.from_bytes(...)
  |
4 |     string.from_chars(reversed)
  |                       ^^^^^^^^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn reverse(s: String) -> String = 
    let chars = string.chars(s)
    let reversed = list.reverse(chars)
    string.from_bytes(reversed)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error[E005]: argument 'bytes' expects List[Int] but got List[String]
  --> /tmp/dojo-string-reverse-1.almd:4:23
  in call to string.from_bytes()
  hint: Fix the argument type
  |
4 |     string.from_bytes(reversed)
  |                       ^^^^^^^^
error[E001]: type mismatch in call to string.from_bytes(): expected List[Int] but got List[String]
  --> /tmp/dojo-string-reverse-1.almd:4:23
  in call to string.from_bytes()
  hint: Fix the expression type or change the expected type
  |
4 |     string.from_bytes(reversed)
  |                       ^^^^^^^^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn reverse(s: String) -> String = 
    let chars = string.chars(s)
    let reversed = list.reverse(chars)
    string.from_bytes(list.map(reversed, int.to_string))
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-2.almd
error[E005]: argument 'f' expects fn(String) -> B but got fn(Int) -> String
  --> /tmp/dojo-string-reverse-2.almd:4:45
  in call to list.map()
  hint: Fix the argument type
  |
4 |     string.from_bytes(list.map(reversed, int.to_string))
  |                                             ^
error[E001]: type mismatch in call to list.map(): expected fn(String) -> B but got fn(Int) -> String
  --> /tmp/dojo-string-reverse-2.almd:4:45
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |     string.from_bytes(list.map(reversed, int.to_string))
  |                                             ^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-2.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn reverse(s: String) -> String = 
    let chars = string.chars(s)
    let reversed = list.reverse(chars)
    string.from_bytes(list.map(reversed, (x) => int.to_string(x)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-3.almd
error[E005]: argument 'f' expects fn(String) -> B but got fn(Int) -> String
  --> /tmp/dojo-string-reverse-3.almd:4:63
  in call to list.map()
  hint: Fix the argument type
  |
4 |     string.from_bytes(list.map(reversed, (x) => int.to_string(x)))
  |                                                               ^
error[E001]: type mismatch in call to list.map(): expected fn(String) -> B but got fn(Int) -> String
  --> /tmp/dojo-string-reverse-3.almd:4:63
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |     string.from_bytes(list.map(reversed, (x) => int.to_string(x)))
  |                                                               ^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-3.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-3.almd

1/1 test file(s) failed

```
