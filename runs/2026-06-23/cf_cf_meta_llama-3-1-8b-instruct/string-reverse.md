# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

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
  --> /tmp/dojo-string-reverse-0.almd:4:21
  in call to string.from_chars()
  hint: Did you mean `string.from_bytes`?
  try:
      // string.from_chars(...)  →  string.from_bytes(...)
      string.from_bytes(...)
  |
4 |   string.from_chars(reversed)
  |                     ^^^^^^^^

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
  string.from_bytes(list.to_bytes(reversed))
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error[E002]: undefined function 'list.to_bytes'
  --> /tmp/dojo-string-reverse-1.almd:4:35
  in call to list.to_bytes()
  hint: No function 'to_bytes' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
4 |   string.from_bytes(list.to_bytes(reversed))
  |                                   ^^^^^^^^

1 error(s) found
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
  string.from_bytes(list.map(reversed, fn(x) => x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-2.almd
error: Expected expression at line 4:40 (got Fn 'fn')
  --> /tmp/dojo-string-reverse-2.almd:4:40
  |
4 |   string.from_bytes(list.map(reversed, fn(x) => x))
  |                                        ^
error[E001]: type mismatch in fn 'reverse': expected String but got Unit
  --> /tmp/dojo-string-reverse-2.almd:3:31
  in fn 'reverse'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
3 |   let reversed = list.reverse(chars)
  |                               ^^^^^

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
  string.from_bytes(list.map(reversed, fn(x) => x.to_string()))
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-3.almd
error: Expected expression at line 4:40 (got Fn 'fn')
  --> /tmp/dojo-string-reverse-3.almd:4:40
  |
4 |   string.from_bytes(list.map(reversed, fn(x) => x.to_string()))
  |                                        ^
error[E001]: type mismatch in fn 'reverse': expected String but got Unit
  --> /tmp/dojo-string-reverse-3.almd:3:31
  in fn 'reverse'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
3 |   let reversed = list.reverse(chars)
  |                               ^^^^^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-3.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-3.almd

1/1 test file(s) failed

```
