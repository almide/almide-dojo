# is-palindrome

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  string.chars(s) |> list.zip_with(string.chars(s), fn(a, b) -> a == b) |> list.all(fn(x) -> x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-0.almd
error: Expected expression at line 2:53 (got Fn 'fn')
  --> /tmp/dojo-is-palindrome-0.almd:2:53
  |
2 |   string.chars(s) |> list.zip_with(string.chars(s), fn(a, b) -> a == b) |> list.all(fn(x) -> x)
  |                                                     ^
error: Expected function name at line 2:55 (got LParen '(')
  --> /tmp/dojo-is-palindrome-0.almd:2:55
  |
2 |   string.chars(s) |> list.zip_with(string.chars(s), fn(a, b) -> a == b) |> list.all(fn(x) -> x)
  |                                                       ^
error: Expected function name at line 2:87 (got LParen '(')
  --> /tmp/dojo-is-palindrome-0.almd:2:87
  |
2 |   string.chars(s) |> list.zip_with(string.chars(s), fn(a, b) -> a == b) |> list.all(fn(x) -> x)
  |                                                                                       ^

3 error(s) found
Compile error for /tmp/dojo-is-palindrome-0.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  string.chars(s) |> list.zip_with(string.chars(s), (a, b) -> a == b) |> list.all(x -> x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-1.almd
error: Expected ')' to close function call opened at line 2:35
  --> /tmp/dojo-is-palindrome-1.almd:2:60
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |   string.chars(s) |> list.zip_with(string.chars(s), (a, b) -> a == b) |> list.all(x -> x)
  |                                   --------------- '(' opened here
  |
2 |   string.chars(s) |> list.zip_with(string.chars(s), (a, b) -> a == b) |> list.all(x -> x)
  |                                                            ^^

1 error(s) found
Compile error for /tmp/dojo-is-palindrome-1.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  string.chars(s) |> list.zip_with(string.chars(s), (a, b) -> a == b) |> list.all(x => x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-2.almd
error: Expected ')' to close function call opened at line 2:35
  --> /tmp/dojo-is-palindrome-2.almd:2:60
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |   string.chars(s) |> list.zip_with(string.chars(s), (a, b) -> a == b) |> list.all(x => x)
  |                                   --------------- '(' opened here
  |
2 |   string.chars(s) |> list.zip_with(string.chars(s), (a, b) -> a == b) |> list.all(x => x)
  |                                                            ^^

1 error(s) found
Compile error for /tmp/dojo-is-palindrome-2.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  string.chars(s) |> list.zip_with(string.chars(s), (a, b) -> a == b) |> list.all(x => x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-3.almd
error: Expected ')' to close function call opened at line 2:35
  --> /tmp/dojo-is-palindrome-3.almd:2:60
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |   string.chars(s) |> list.zip_with(string.chars(s), (a, b) -> a == b) |> list.all(x => x)
  |                                   --------------- '(' opened here
  |
2 |   string.chars(s) |> list.zip_with(string.chars(s), (a, b) -> a == b) |> list.all(x => x)
  |                                                            ^^

1 error(s) found
Compile error for /tmp/dojo-is-palindrome-3.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-3.almd

1/1 test file(s) failed

```
