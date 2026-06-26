# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(string.chars(string.to_lower(a))) == 
  list.sort(string.chars(string.to_lower(b)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(string.chars(string.to_lower(a))) == 
  list.sort(string.chars(string.to_lower(b)).filter(fn(x) => x != " ")))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: Expected expression at line 3:53 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:3:53
  |
3 |   list.sort(string.chars(string.to_lower(b)).filter(fn(x) => x != " ")))
  |                                                     ^
error: Expected function name at line 3:55 (got LParen '(')
  --> /tmp/dojo-anagram-check-1.almd:3:55
  |
3 |   list.sort(string.chars(string.to_lower(b)).filter(fn(x) => x != " ")))
  |                                                       ^

2 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(string.chars(string.to_lower(a))) == 
  list.sort(string.chars(string.to_lower(b)).filter(fn(x) => x != " ")))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
error: Expected expression at line 3:53 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:3:53
  |
3 |   list.sort(string.chars(string.to_lower(b)).filter(fn(x) => x != " ")))
  |                                                     ^
error: Expected function name at line 3:55 (got LParen '(')
  --> /tmp/dojo-anagram-check-2.almd:3:55
  |
3 |   list.sort(string.chars(string.to_lower(b)).filter(fn(x) => x != " ")))
  |                                                       ^

2 error(s) found
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(string.chars(string.to_lower(a))) == 
  list.sort(string.chars(string.to_lower(b)).filter(fn(x) => x != " ")))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-3.almd
error: Expected expression at line 3:53 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-3.almd:3:53
  |
3 |   list.sort(string.chars(string.to_lower(b)).filter(fn(x) => x != " ")))
  |                                                     ^
error: Expected function name at line 3:55 (got LParen '(')
  --> /tmp/dojo-anagram-check-3.almd:3:55
  |
3 |   list.sort(string.chars(string.to_lower(b)).filter(fn(x) => x != " ")))
  |                                                       ^

2 error(s) found
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```
