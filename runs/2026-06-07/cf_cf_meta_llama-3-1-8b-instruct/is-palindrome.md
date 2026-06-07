# is-palindrome

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  list.equal(list.chars(s), list.reverse(list.chars(s)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-0.almd
error[E002]: undefined function 'list.chars'
  --> /tmp/dojo-is-palindrome-0.almd:2:25
  in call to list.chars()
  hint: No function 'chars' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
2 |   list.equal(list.chars(s), list.reverse(list.chars(s)))
  |                         ^
error[E002]: undefined function 'list.chars'
  --> /tmp/dojo-is-palindrome-0.almd:2:53
  in call to list.chars()
  hint: No function 'chars' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
2 |   list.equal(list.chars(s), list.reverse(list.chars(s)))
  |                                                     ^
error[E002]: undefined function 'list.equal'
  --> /tmp/dojo-is-palindrome-0.almd:2:53
  in call to list.equal()
  hint: No function 'equal' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
2 |   list.equal(list.chars(s), list.reverse(list.chars(s)))
  |                                                     ^

3 error(s) found
Compile error for /tmp/dojo-is-palindrome-0.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  string.chars(s) == string.reverse(string.chars(s))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-1.almd
error[E005]: argument 's' expects String but got List[String]
  --> /tmp/dojo-is-palindrome-1.almd:2:50
  in call to string.reverse()
  hint: Fix the argument type
  |
2 |   string.chars(s) == string.reverse(string.chars(s))
  |                                                  ^
error[E001]: type mismatch in call to string.reverse(): expected String but got List[String]
  --> /tmp/dojo-is-palindrome-1.almd:2:50
  in call to string.reverse()
  hint: Fix the expression type or change the expected type
  |
2 |   string.chars(s) == string.reverse(string.chars(s))
  |                                                  ^

2 error(s) found
Compile error for /tmp/dojo-is-palindrome-1.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn is_palindrome(s: String) -> Bool = 
  string.chars(s) == list.reverse(string.chars(s))
```
