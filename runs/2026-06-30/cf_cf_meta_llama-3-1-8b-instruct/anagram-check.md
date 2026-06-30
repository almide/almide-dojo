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
  list.sort(string.chars(string.to_lower(b)).filter(|c| c != " ")))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: '|x|' closure syntax is not valid in Almide at line 3:53
  --> /tmp/dojo-anagram-check-1.almd:3:53
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
3 |   list.sort(string.chars(string.to_lower(b)).filter(|c| c != " ")))
  |                                                     ^

1 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(string.chars(string.to_lower(a))) == 
  list.sort(string.chars(string.to_lower(b)).filter((c) => c != " ")))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 3:70 (got RParen ')')
  --> /tmp/dojo-anagram-check-2.almd:3:70
  |
3 |   list.sort(string.chars(string.to_lower(b)).filter((c) => c != " ")))
  |                                                                      ^

1 error(s) found
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(string.chars(string.to_lower(a))) == 
  list.sort(string.chars(string.to_lower(b)).filter((c) => c != " ")))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 3:70 (got RParen ')')
  --> /tmp/dojo-anagram-check-3.almd:3:70
  |
3 |   list.sort(string.chars(string.to_lower(b)).filter((c) => c != " ")))
  |                                                                      ^

1 error(s) found
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```
