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
  list.sort(string.chars(string.to_lower(a)).filter(x => x != " ")) == list.sort(string.chars(string.to_lower(b)).filter(x => x != " "))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-anagram-check-1.almd:2:55
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   list.sort(string.chars(string.to_lower(a)).filter(x => x != " ")) == list.sort(string.chars(string.to_lower(b)).filter(x => x != " "))
  |                                                       ^^

1 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(string.chars(string.to_lower(a)).filter((x) => x != " ")) == list.sort(string.chars(string.to_lower(b)).filter((x) => x != " ")))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:141 (got RParen ')')
  --> /tmp/dojo-anagram-check-2.almd:2:141
  |
2 |   list.sort(string.chars(string.to_lower(a)).filter((x) => x != " ")) == list.sort(string.chars(string.to_lower(b)).filter((x) => x != " ")))
  |                                                                                                                                             ^

1 error(s) found
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(string.chars(string.to_lower(a)).filter((x) => x != " "))) == 
  list.sort(string.chars(string.to_lower(b)).filter((x) => x != " ")))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:70 (got RParen ')')
  --> /tmp/dojo-anagram-check-3.almd:2:70
  |
2 |   list.sort(string.chars(string.to_lower(a)).filter((x) => x != " "))) ==
  |                                                                      ^
error[E001]: type mismatch in fn 'is_anagram': expected Bool but got List[String]
  --> /tmp/dojo-anagram-check-3.almd:2:42
  in fn 'is_anagram'
  hint: Fix the expression type or change the expected type
  |
2 |   list.sort(string.chars(string.to_lower(a)).filter((x) => x != " "))) ==
  |                                          ^

2 error(s) found
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```
