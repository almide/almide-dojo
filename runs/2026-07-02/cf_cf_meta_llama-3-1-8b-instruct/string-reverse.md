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
  string.from_chars(string.chars(s).reverse())
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error[E002]: undefined function 'string.from_chars'
  --> /tmp/dojo-string-reverse-0.almd:2:34
  in call to string.from_chars()
  hint: Did you mean `string.from_bytes`?
  try:
      // string.from_chars(...)  →  string.from_bytes(...)
      string.from_bytes(...)
  |
2 |   string.from_chars(string.chars(s).reverse())
  |                                  ^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn reverse(s: String) -> String = 
  string.from_bytes(string.chars(s).reverse())
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error[E005]: argument 'bytes' expects List[Int] but got List[String]
  --> /tmp/dojo-string-reverse-1.almd:2:34
  in call to string.from_bytes()
  hint: Fix the argument type
  |
2 |   string.from_bytes(string.chars(s).reverse())
  |                                  ^
error[E001]: type mismatch in call to string.from_bytes(): expected List[Int] but got List[String]
  --> /tmp/dojo-string-reverse-1.almd:2:34
  in call to string.from_bytes()
  hint: Fix the expression type or change the expected type
  |
2 |   string.from_bytes(string.chars(s).reverse())
  |                                  ^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn reverse(s: String) -> String = 
  string.from_codepoints(string.chars(s).reverse().map(string.codepoint))
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-2.almd
error[E002]: undefined function 'string.from_codepoints'
  --> /tmp/dojo-string-reverse-2.almd:2:39
  in call to string.from_codepoints()
  hint: Did you mean `string.from_codepoint`?
  try:
      // string.from_codepoints(...)  →  string.from_codepoint(...)
      string.from_codepoint(...)
  |
2 |   string.from_codepoints(string.chars(s).reverse().map(string.codepoint))
  |                                       ^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-2.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn reverse(s: String) -> String = 
  string.from_codepoint(string.chars(s).reverse().map(string.codepoint))
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-3.almd
error[E005]: argument 'n' expects Int but got List[Option[Int]]
  --> /tmp/dojo-string-reverse-3.almd:2:38
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
2 |   string.from_codepoint(string.chars(s).reverse().map(string.codepoint))
  |                                      ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got List[Option[Int]]
  --> /tmp/dojo-string-reverse-3.almd:2:38
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
2 |   string.from_codepoint(string.chars(s).reverse().map(string.codepoint))
  |                                      ^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-3.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-3.almd

1/1 test file(s) failed

```
