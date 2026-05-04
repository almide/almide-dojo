# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String {
  let chars = string.chars(s sorts_by fn(x) => -string.len(x))
  string.join(chars, "")
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
error: Expected function name at line 2:41 (got LParen '(')
  --> /tmp/dojo-string-reverse-0.almd:2:41
  |
2 |   let chars = string.chars(s sorts_by fn(x) => -string.len(x))
  |                                         ^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn reverse(s: String) -> String = {
  let chars = string.chars(s).sort_by(fn(x) => -string.len(x))
  string.join(chars, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error: Expected expression at line 2:39 (got Fn 'fn')
  --> /tmp/dojo-string-reverse-1.almd:2:39
  |
2 |   let chars = string.chars(s).sort_by(fn(x) => -string.len(x))
  |                                       ^
error[E003]: undefined variable 'chars'
  --> /tmp/dojo-string-reverse-1.almd:3:15
  in variable chars
  hint: Check the variable name
  |
3 |   string.join(chars, "")
  |               ^^^^^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn reverse(s: String) -> String = {
  let chars = string.chars(s)
  string.join(chars.sort_by(fn(x) => -string.len(x)), "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-2.almd
error: Expected expression at line 3:29 (got Fn 'fn')
  --> /tmp/dojo-string-reverse-2.almd:3:29
  |
3 |   string.join(chars.sort_by(fn(x) => -string.len(x)), "")
  |                             ^
error[E001]: type mismatch in fn 'reverse': expected String but got Unit
  --> /tmp/dojo-string-reverse-2.almd:2:28
  in fn 'reverse'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
2 |   let chars = string.chars(s)
  |                            ^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-2.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn reverse(s: String) -> String = {
  let chars = string.chars(s)
  string.join(chars.sort_by(fn(x) => -string.len(x)), "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-3.almd
error: Expected expression at line 3:29 (got Fn 'fn')
  --> /tmp/dojo-string-reverse-3.almd:3:29
  |
3 |   string.join(chars.sort_by(fn(x) => -string.len(x)), "")
  |                             ^
error[E001]: type mismatch in fn 'reverse': expected String but got Unit
  --> /tmp/dojo-string-reverse-3.almd:2:28
  in fn 'reverse'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
2 |   let chars = string.chars(s)
  |                            ^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-3.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-3.almd

1/1 test file(s) failed

```
