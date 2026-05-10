# is-palindrome

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

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
  string.to_list(s) == list.reverse(string.to_list(s))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-1.almd
error[E002]: undefined function 'string.to_list'
  --> /tmp/dojo-is-palindrome-1.almd:2:18
  in call to string.to_list()
  hint: No function 'to_list' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
2 |   string.to_list(s) == list.reverse(string.to_list(s))
  |                  ^
error[E002]: undefined function 'string.to_list'
  --> /tmp/dojo-is-palindrome-1.almd:2:52
  in call to string.to_list()
  hint: No function 'to_list' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
2 |   string.to_list(s) == list.reverse(string.to_list(s))
  |                                                    ^

2 error(s) found
Compile error for /tmp/dojo-is-palindrome-1.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  list.eq(list.reverse(string.to_list(s)), string.to_list(s))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-2.almd
error[E002]: undefined function 'string.to_list'
  --> /tmp/dojo-is-palindrome-2.almd:2:39
  in call to string.to_list()
  hint: No function 'to_list' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
2 |   list.eq(list.reverse(string.to_list(s)), string.to_list(s))
  |                                       ^
error[E002]: undefined function 'string.to_list'
  --> /tmp/dojo-is-palindrome-2.almd:2:59
  in call to string.to_list()
  hint: No function 'to_list' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
2 |   list.eq(list.reverse(string.to_list(s)), string.to_list(s))
  |                                                           ^
error[E002]: undefined function 'list.eq'
  --> /tmp/dojo-is-palindrome-2.almd:2:59
  in call to list.eq()
  hint: Did you mean `list.get`?
  try:
      // list.eq(...)  →  list.get(...)
      list.get(...)
  |
2 |   list.eq(list.reverse(string.to_list(s)), string.to_list(s))
  |                                                           ^

3 error(s) found
Compile error for /tmp/dojo-is-palindrome-2.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  list.eq(list.reverse(string.to_list(s)), string.to_list(s))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-3.almd
error[E002]: undefined function 'string.to_list'
  --> /tmp/dojo-is-palindrome-3.almd:2:39
  in call to string.to_list()
  hint: No function 'to_list' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
2 |   list.eq(list.reverse(string.to_list(s)), string.to_list(s))
  |                                       ^
error[E002]: undefined function 'string.to_list'
  --> /tmp/dojo-is-palindrome-3.almd:2:59
  in call to string.to_list()
  hint: No function 'to_list' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
2 |   list.eq(list.reverse(string.to_list(s)), string.to_list(s))
  |                                                           ^
error[E002]: undefined function 'list.eq'
  --> /tmp/dojo-is-palindrome-3.almd:2:59
  in call to list.eq()
  hint: Did you mean `list.get`?
  try:
      // list.eq(...)  →  list.get(...)
      list.get(...)
  |
2 |   list.eq(list.reverse(string.to_list(s)), string.to_list(s))
  |                                                           ^

3 error(s) found
Compile error for /tmp/dojo-is-palindrome-3.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-3.almd

1/1 test file(s) failed

```
