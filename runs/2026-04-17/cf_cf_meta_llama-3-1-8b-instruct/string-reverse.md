# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String {
  var result = ""
  for c in string.chars(s) {
    result = string.insert(result, 0, string.to_string(c))
  }
  result
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
  var result = ""
  for c in string.chars(s) {
    result = string.insert(result, 0, string.to_string(c))
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error[E002]: undefined function 'string.to_string'
  --> /tmp/dojo-string-reverse-1.almd:4:56
  in call to string.to_string()
  hint: No function 'to_string' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
4 |     result = string.insert(result, 0, string.to_string(c))
  |                                                        ^
error[E002]: undefined function 'string.insert'
  --> /tmp/dojo-string-reverse-1.almd:4:56
  in call to string.insert()
  hint: No function 'insert' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
4 |     result = string.insert(result, 0, string.to_string(c))
  |                                                        ^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn reverse(s: String) -> String = {
  var result = ""
  for c in string.chars(s) {
    result = string.insert(result, 0, string.from_codepoint(c))
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-2.almd
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-string-reverse-2.almd:4:61
  in call to string.from_codepoint()
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  |
4 |     result = string.insert(result, 0, string.from_codepoint(c))
  |                                                             ^
error[E002]: undefined function 'string.insert'
  --> /tmp/dojo-string-reverse-2.almd:4:61
  in call to string.insert()
  hint: No function 'insert' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
4 |     result = string.insert(result, 0, string.from_codepoint(c))
  |                                                             ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got String
  --> /tmp/dojo-string-reverse-2.almd:4:61
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  |
4 |     result = string.insert(result, 0, string.from_codepoint(c))
  |                                                             ^

3 error(s) found
Compile error for /tmp/dojo-string-reverse-2.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn reverse(s: String) -> String = {
  var result = ""
  for c in string.chars(s) {
    result = result + string.from_codepoint(c)
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-3.almd
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-string-reverse-3.almd:4:45
  in call to string.from_codepoint()
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  |
4 |     result = result + string.from_codepoint(c)
  |                                             ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got String
  --> /tmp/dojo-string-reverse-3.almd:4:45
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  |
4 |     result = result + string.from_codepoint(c)
  |                                             ^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-3.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-3.almd

1/1 test file(s) failed

```
