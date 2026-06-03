# is-palindrome

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
    let reversed = string.reverse(s) 
    in string.eq(s, reversed)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-0.almd
error[E002]: undefined function 'string.eq'
  --> /tmp/dojo-is-palindrome-0.almd:3:18
  in call to string.eq()
  hint: Did you mean `a == b (operator)`?
  try:
      // Almide uses operators, not comparison functions:
      //   int.gt(a, b)   →  a > b
      //   int.lt(a, b)   →  a < b
      //   int.gte(a, b)  →  a >= b
      //   int.lte(a, b)  →  a <= b
      //   int.eq(a, b)   →  a == b
      //   int.neq(a, b)  →  a != b
      // (same for float, string, bool — == and != work on any type)
  |
3 |     string.eq(s, reversed)
  |                  ^^^^^^^^

1 error(s) found
Compile error for /tmp/dojo-is-palindrome-0.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn is_palindrome(s: String) -> Bool = 
    let reversed = string.reverse(s) 
    in s == reversed
```
