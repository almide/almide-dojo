# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  string.to_lower(a) |> string.chars |> list.filter(fn(c) = string.is_alphanumeric(c)) 
  |> list.sort |> list.eq(string.to_lower(b) |> string.chars |> list.filter(fn(c) = string.is_alphanumeric(c)) |> list.sort)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected expression at line 2:53 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-0.almd:2:53
  |
2 |   string.to_lower(a) |> string.chars |> list.filter(fn(c) = string.is_alphanumeric(c))
  |                                                     ^
error: Expected function name at line 2:55 (got LParen '(')
  --> /tmp/dojo-anagram-check-0.almd:2:55
  |
2 |   string.to_lower(a) |> string.chars |> list.filter(fn(c) = string.is_alphanumeric(c))
  |                                                       ^
error: Expected function name at line 3:79 (got LParen '(')
  --> /tmp/dojo-anagram-check-0.almd:3:79
  |
3 |   |> list.sort |> list.eq(string.to_lower(b) |> string.chars |> list.filter(fn(c) = string.is_alphanumeric(c)) |> list.sort)
  |                                                                               ^

3 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  string.to_lower(a) |> string.chars |> list.filter(fn(c) = not string.is_whitespace(c) and string.is_alphanumeric(c)) 
  |> list.sort |> list.eq(string.to_lower(b) |> string.chars |> list.filter(fn(c) = not string.is_whitespace(c) and string.is_alphanumeric(c)) |> list.sort)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: Expected expression at line 2:53 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:2:53
  |
2 |   string.to_lower(a) |> string.chars |> list.filter(fn(c) = not string.is_whitespace(c) and string.is_alphanumeric(c))
  |                                                     ^
error: Expected function name at line 2:55 (got LParen '(')
  --> /tmp/dojo-anagram-check-1.almd:2:55
  |
2 |   string.to_lower(a) |> string.chars |> list.filter(fn(c) = not string.is_whitespace(c) and string.is_alphanumeric(c))
  |                                                       ^
error: Expected function name at line 3:79 (got LParen '(')
  --> /tmp/dojo-anagram-check-1.almd:3:79
  |
3 |   |> list.sort |> list.eq(string.to_lower(b) |> string.chars |> list.filter(fn(c) = not string.is_whitespace(c) and string.is_alphanumeric(c)) |> list.sort)
  |                                                                               ^

3 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.eq(
    string.to_lower(a) |> string.chars |> list.filter(fn(c) = not string.is_whitespace(c) and string.is_alphanumeric(c)) |> list.sort,
    string.to_lower(b) |> string.chars |> list.filter(fn(c) = not string.is_whitespace(c) and string.is_alphanumeric(c)) |> list.sort
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
error: Expected expression at line 3:55 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:3:55
  |
3 |     string.to_lower(a) |> string.chars |> list.filter(fn(c) = not string.is_whitespace(c) and string.is_alphanumeric(c)) |> list.sort,
  |                                                       ^
error: Expected function name at line 3:57 (got LParen '(')
  --> /tmp/dojo-anagram-check-2.almd:3:57
  |
3 |     string.to_lower(a) |> string.chars |> list.filter(fn(c) = not string.is_whitespace(c) and string.is_alphanumeric(c)) |> list.sort,
  |                                                         ^
error: Expected function name at line 4:57 (got LParen '(')
  --> /tmp/dojo-anagram-check-2.almd:4:57
  |
4 |     string.to_lower(b) |> string.chars |> list.filter(fn(c) = not string.is_whitespace(c) and string.is_alphanumeric(c)) |> list.sort
  |                                                         ^

3 error(s) found
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.eq(
    string.to_lower(a) |> string.chars |> list.filter(fn c = not string.is_whitespace(c) and string.is_alphanumeric(c)) |> list.sort,
    string.to_lower(b) |> string.chars |> list.filter(fn c = not string.is_whitespace(c) and string.is_alphanumeric(c)) |> list.sort
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-3.almd
error: Expected expression at line 3:55 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-3.almd:3:55
  |
3 |     string.to_lower(a) |> string.chars |> list.filter(fn c = not string.is_whitespace(c) and string.is_alphanumeric(c)) |> list.sort,
  |                                                       ^
error: Expected LParen at line 3:60 (got Eq '=')
  --> /tmp/dojo-anagram-check-3.almd:3:60
  |
3 |     string.to_lower(a) |> string.chars |> list.filter(fn c = not string.is_whitespace(c) and string.is_alphanumeric(c)) |> list.sort,
  |                                                            ^
error: Expected LParen at line 4:60 (got Eq '=')
  --> /tmp/dojo-anagram-check-3.almd:4:60
  |
4 |     string.to_lower(b) |> string.chars |> list.filter(fn c = not string.is_whitespace(c) and string.is_alphanumeric(c)) |> list.sort
  |                                                            ^

3 error(s) found
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```
