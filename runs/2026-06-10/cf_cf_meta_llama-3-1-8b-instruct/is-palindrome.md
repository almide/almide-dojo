# is-palindrome

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  string.chars(s) |> list.map(fn(c) => c) |> list.eq(list.rev(_))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-0.almd
error: Expected expression at line 2:31 (got Fn 'fn')
  --> /tmp/dojo-is-palindrome-0.almd:2:31
  |
2 |   string.chars(s) |> list.map(fn(c) => c) |> list.eq(list.rev(_))
  |                               ^
error: Expected function name at line 2:33 (got LParen '(')
  --> /tmp/dojo-is-palindrome-0.almd:2:33
  |
2 |   string.chars(s) |> list.map(fn(c) => c) |> list.eq(list.rev(_))
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
  string.chars(s) |> list.map(string.to_lower) |> list.eq(list.rev(_))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-1.almd
error[E002]: undefined function 'list.rev'
  --> /tmp/dojo-is-palindrome-1.almd:2:68
  in call to list.rev()
  hint: Did you mean `list.get`?
  try:
      // list.rev(...)  →  list.get(...)
      list.get(...)
  |
2 |   string.chars(s) |> list.map(string.to_lower) |> list.eq(list.rev(_))
  |                                                                    ^
error[E002]: undefined function 'list.eq'
  --> /tmp/dojo-is-palindrome-1.almd:2:68
  in call to list.eq()
  hint: Did you mean `list.get`?
  try:
      // list.eq(...)  →  list.get(...)
      list.get(...)
  |
2 |   string.chars(s) |> list.map(string.to_lower) |> list.eq(list.rev(_))
  |                                                                    ^

2 error(s) found
Compile error for /tmp/dojo-is-palindrome-1.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  string.chars(s) |> list.map(string.to_lower) |> list.eq(list.reverse(_))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-2.almd
error[E002]: undefined function 'list.eq'
  --> /tmp/dojo-is-palindrome-2.almd:2:72
  in call to list.eq()
  hint: Did you mean `list.get`?
  try:
      // list.eq(...)  →  list.get(...)
      list.get(...)
  |
2 |   string.chars(s) |> list.map(string.to_lower) |> list.eq(list.reverse(_))
  |                                                                        ^

1 error(s) found
Compile error for /tmp/dojo-is-palindrome-2.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  string.chars(s) |> list.map(string.to_lower) |> list.eq(list.reverse(list.first(_)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-3.almd
error[E005]: argument 'xs' expects List[A] but got Option[?0]
  --> /tmp/dojo-is-palindrome-3.almd:2:83
  in call to list.reverse()
  hint: Fix the argument type
  |
2 |   string.chars(s) |> list.map(string.to_lower) |> list.eq(list.reverse(list.first(_)))
  |                                                                                   ^
error[E002]: undefined function 'list.eq'
  --> /tmp/dojo-is-palindrome-3.almd:2:83
  in call to list.eq()
  hint: Did you mean `list.get`?
  try:
      // list.eq(...)  →  list.get(...)
      list.get(...)
  |
2 |   string.chars(s) |> list.map(string.to_lower) |> list.eq(list.reverse(list.first(_)))
  |                                                                                   ^
error[E001]: type mismatch in call to list.reverse(): expected List[A] but got Option[?0]
  --> /tmp/dojo-is-palindrome-3.almd:2:83
  in call to list.reverse()
  hint: Fix the expression type or change the expected type
  |
2 |   string.chars(s) |> list.map(string.to_lower) |> list.eq(list.reverse(list.first(_)))
  |                                                                                   ^

3 error(s) found
Compile error for /tmp/dojo-is-palindrome-3.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-3.almd

1/1 test file(s) failed

```
