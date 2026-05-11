# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(string.chars(string.to_lower(a)) |> list.filter(fn(x) = x != ' ')) == 
  list.sort(string.chars(string.to_lower(b)) |> list.filter(fn(x) = x != ' '))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected expression at line 2:61 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-0.almd:2:61
  |
2 |   list.sort(string.chars(string.to_lower(a)) |> list.filter(fn(x) = x != ' ')) ==
  |                                                             ^
error: Expected function name at line 2:63 (got LParen '(')
  --> /tmp/dojo-anagram-check-0.almd:2:63
  |
2 |   list.sort(string.chars(string.to_lower(a)) |> list.filter(fn(x) = x != ' ')) ==
  |                                                               ^
error: Expected function name at line 3:63 (got LParen '(')
  --> /tmp/dojo-anagram-check-0.almd:3:63
  |
3 |   list.sort(string.chars(string.to_lower(b)) |> list.filter(fn(x) = x != ' '))
  |                                                               ^

3 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(string.chars(string.to_lower(a)) |> list.filter(fn(x) = x != ' ')) == 
  list.sort(string.chars(string.to_lower(b)) |> list.filter(fn(x) = x != ' '))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: Expected expression at line 2:61 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:2:61
  |
2 |   list.sort(string.chars(string.to_lower(a)) |> list.filter(fn(x) = x != ' ')) ==
  |                                                             ^
error: Expected function name at line 2:63 (got LParen '(')
  --> /tmp/dojo-anagram-check-1.almd:2:63
  |
2 |   list.sort(string.chars(string.to_lower(a)) |> list.filter(fn(x) = x != ' ')) ==
  |                                                               ^
error: Expected function name at line 3:63 (got LParen '(')
  --> /tmp/dojo-anagram-check-1.almd:3:63
  |
3 |   list.sort(string.chars(string.to_lower(b)) |> list.filter(fn(x) = x != ' '))
  |                                                               ^

3 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(string.chars(string.to_lower(a)) |> list.filter(fn(x) = x != ' ')) == 
  list.sort(string.chars(string.to_lower(b)) |> list.filter(fn(x) = x != ' '))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
error: Expected expression at line 2:61 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:2:61
  |
2 |   list.sort(string.chars(string.to_lower(a)) |> list.filter(fn(x) = x != ' ')) ==
  |                                                             ^
error: Expected function name at line 2:63 (got LParen '(')
  --> /tmp/dojo-anagram-check-2.almd:2:63
  |
2 |   list.sort(string.chars(string.to_lower(a)) |> list.filter(fn(x) = x != ' ')) ==
  |                                                               ^
error: Expected function name at line 3:63 (got LParen '(')
  --> /tmp/dojo-anagram-check-2.almd:3:63
  |
3 |   list.sort(string.chars(string.to_lower(b)) |> list.filter(fn(x) = x != ' '))
  |                                                               ^

3 error(s) found
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(string.chars(string.to_lower(a)) |> list.filter(fn(x) = x != ' ')) == 
  list.sort(string.chars(string.to_lower(b)) |> list.filter(fn(x) = x != ' '))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-3.almd
error: Expected expression at line 2:61 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-3.almd:2:61
  |
2 |   list.sort(string.chars(string.to_lower(a)) |> list.filter(fn(x) = x != ' ')) ==
  |                                                             ^
error: Expected function name at line 2:63 (got LParen '(')
  --> /tmp/dojo-anagram-check-3.almd:2:63
  |
2 |   list.sort(string.chars(string.to_lower(a)) |> list.filter(fn(x) = x != ' ')) ==
  |                                                               ^
error: Expected function name at line 3:63 (got LParen '(')
  --> /tmp/dojo-anagram-check-3.almd:3:63
  |
3 |   list.sort(string.chars(string.to_lower(b)) |> list.filter(fn(x) = x != ' '))
  |                                                               ^

3 error(s) found
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```
