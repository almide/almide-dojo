# string-reverse

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String = 
  string.chars(s) 
  |> list.reverse 
  |> list.map(string.from_codepoint) 
  |> list.join("")
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error[E005]: argument 'f' expects fn(String) -> B but got fn(Int) -> String
  --> /tmp/dojo-string-reverse-0.almd:4:21
  in call to list.map()
  hint: Fix the argument type
  |
4 |   |> list.map(string.from_codepoint)
  |                     ^
error[E001]: type mismatch in call to list.map(): expected fn(String) -> B but got fn(Int) -> String
  --> /tmp/dojo-string-reverse-0.almd:4:21
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |   |> list.map(string.from_codepoint)
  |                     ^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn reverse(s: String) -> String = 
  string.chars(s) 
  |> list.reverse 
  |> list.map((c) => string.from_codepoint(int.parse(c).unwrap_or(0)))
  |> list.join("")
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn reverse(s: String) -> String = 
  string.chars(s) 
  |> list.reverse 
  |> list.map((c) => c)
  |> list.join("")
```
