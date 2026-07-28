# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

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
  list.sort(string.chars(string.to_lower(a)).filter(x => not string.is_whitespace(x))) ==
  list.sort(string.chars(string.to_lower(b)).filter(x => not string.is_whitespace(x)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-anagram-check-2.almd:2:55
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   list.sort(string.chars(string.to_lower(a)).filter(x => not string.is_whitespace(x))) ==
  |                                                       ^^

1 error(s) found
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  list.sort(string.chars(string.to_lower(a)).filter(x => not string.is_whitespace(x))) ==
  list.sort(string.chars(string.to_lower(b)).filter(x => not string.is_whitespace(x)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-3.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-anagram-check-3.almd:2:55
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   list.sort(string.chars(string.to_lower(a)).filter(x => not string.is_whitespace(x))) ==
  |                                                       ^^

1 error(s) found
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```
