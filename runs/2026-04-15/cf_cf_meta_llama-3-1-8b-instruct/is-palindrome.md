# is-palindrome

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E010`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = s == s.rev
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-0.almd
Compile error for /tmp/dojo-is-palindrome-0.almd:
error: could not compile `almide-out` (bin "almide-out" test) due to 1 previous error; 1 warning emitted

FAILED: /tmp/dojo-is-palindrome-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = s == s.rev 

// Changed nothing
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-1.almd
Compile error for /tmp/dojo-is-palindrome-1.almd:
error: could not compile `almide-out` (bin "almide-out" test) due to 1 previous error; 1 warning emitted

FAILED: /tmp/dojo-is-palindrome-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = s == s.rev_str
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-2.almd
Compile error for /tmp/dojo-is-palindrome-2.almd:
error: could not compile `almide-out` (bin "almide-out" test) due to 1 previous error; 1 warning emitted

FAILED: /tmp/dojo-is-palindrome-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  match s {
    some(x) => x == x.rev_str,
    none => true
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-3.almd
error[E010]: non-exhaustive match: missing _
  --> /tmp/dojo-is-palindrome-3.almd:2:9
  in match
  hint: match on String requires a catch-all '_' pattern
  |
2 |   match s {
  |         ^

1 error(s) found
Compile error for /tmp/dojo-is-palindrome-3.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-3.almd

1/1 test file(s) failed

```
