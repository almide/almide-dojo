# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(string.chars(string.to_lower(a))) == list.sort(string.chars(string.to_lower(b)))
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
  list.sort(string.chars(string.to_lower(a))) == list.sort(string.chars(string.to_lower(b)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(string.chars(string.to_lower(a))) == list.sort(string.chars(string.to_lower(b))).map(fn(x) => x).to_list()
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
error: Expected expression at line 2:98 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:2:98
  |
2 |   list.sort(string.chars(string.to_lower(a))) == list.sort(string.chars(string.to_lower(b))).map(fn(x) => x).to_list()
  |                                                                                                  ^
error: Expected function name at line 2:100 (got LParen '(')
  --> /tmp/dojo-anagram-check-2.almd:2:100
  |
2 |   list.sort(string.chars(string.to_lower(a))) == list.sort(string.chars(string.to_lower(b))).map(fn(x) => x).to_list()
  |                                                                                                    ^

2 error(s) found
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(string.chars(string.to_lower(a))) == list.sort(string.chars(string.to_lower(b)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-3.almd
FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```
