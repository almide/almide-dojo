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
  string.chars(s) |> list.map(fn(c) => c) |> list.equal(list.rev(_))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-0.almd
error: Expected expression at line 2:31 (got Fn 'fn')
  --> /tmp/dojo-is-palindrome-0.almd:2:31
  |
2 |   string.chars(s) |> list.map(fn(c) => c) |> list.equal(list.rev(_))
  |                               ^
error: Expected function name at line 2:33 (got LParen '(')
  --> /tmp/dojo-is-palindrome-0.almd:2:33
  |
2 |   string.chars(s) |> list.map(fn(c) => c) |> list.equal(list.rev(_))
  |                                 ^

2 error(s) found
Compile error for /tmp/dojo-is-palindrome-0.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  string.chars(s) |> list.map(string.to_char) |> list.equal(list.rev(_))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-1.almd
error[E003]: undefined variable 'string'
  --> /tmp/dojo-is-palindrome-1.almd:2:31
  in variable string
  hint: Check the variable name
  |
2 |   string.chars(s) |> list.map(string.to_char) |> list.equal(list.rev(_))
  |                               ^^^^^^
error[E002]: undefined function 'list.rev'
  --> /tmp/dojo-is-palindrome-1.almd:2:70
  in call to list.rev()
  hint: Did you mean `list.get`?
  try:
      // list.rev(...)  →  list.get(...)
      list.get(...)
  |
2 |   string.chars(s) |> list.map(string.to_char) |> list.equal(list.rev(_))
  |                                                                      ^
error[E002]: undefined function 'list.equal'
  --> /tmp/dojo-is-palindrome-1.almd:2:70
  in call to list.equal()
  hint: No function 'equal' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
2 |   string.chars(s) |> list.map(string.to_char) |> list.equal(list.rev(_))
  |                                                                      ^

3 error(s) found
Compile error for /tmp/dojo-is-palindrome-1.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  list.equal(list.rev(string.chars(s)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-2.almd
error[E002]: undefined function 'list.rev'
  --> /tmp/dojo-is-palindrome-2.almd:2:36
  in call to list.rev()
  hint: Did you mean `list.get`?
  try:
      // list.rev(...)  →  list.get(...)
      list.get(...)
  |
2 |   list.equal(list.rev(string.chars(s)))
  |                                    ^
error[E002]: undefined function 'list.equal'
  --> /tmp/dojo-is-palindrome-2.almd:2:36
  in call to list.equal()
  hint: No function 'equal' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
2 |   list.equal(list.rev(string.chars(s)))
  |                                    ^

2 error(s) found
Compile error for /tmp/dojo-is-palindrome-2.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  list.equal(list.map(string.chars(s), (x) => x), list.map(string.chars(s), (x) => x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-3.almd
error[E002]: undefined function 'list.equal'
  --> /tmp/dojo-is-palindrome-3.almd:2:84
  in call to list.equal()
  hint: No function 'equal' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
2 |   list.equal(list.map(string.chars(s), (x) => x), list.map(string.chars(s), (x) => x))
  |                                                                                    ^

1 error(s) found
Compile error for /tmp/dojo-is-palindrome-3.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-3.almd

1/1 test file(s) failed

```
