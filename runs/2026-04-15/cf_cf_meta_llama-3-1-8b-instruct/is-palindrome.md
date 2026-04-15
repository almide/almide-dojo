# is-palindrome

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool {
  s == s |> string.rev
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-0.almd
error: Missing '=' before function body at line 1:37
  --> /tmp/dojo-is-palindrome-0.almd:1:37
  hint: Almide requires '=' before the body. Write: fn is_palindrome(...) -> Type = { ... }
  |
1 | fn is_palindrome(s: String) -> Bool {
  |                                     ^

1 error(s) found
Compile error for /tmp/dojo-is-palindrome-0.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = {
  s == s |> string.rev
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-1.almd
error[E002]: undefined function 'string.rev'
  --> /tmp/dojo-is-palindrome-1.almd:2:8
  in call to string.rev()
  hint: Did you mean `string.get`?
  |
2 |   s == s |> string.rev
  |        ^

1 error(s) found
Compile error for /tmp/dojo-is-palindrome-1.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = {
  s == s |> list.chars |> list.rev |> list.join
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-2.almd
error[E002]: undefined function 'list.chars'
  --> /tmp/dojo-is-palindrome-2.almd:2:8
  in call to list.chars()
  hint: No function 'chars' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
2 |   s == s |> list.chars |> list.rev |> list.join
  |        ^
error[E002]: undefined function 'list.rev'
  --> /tmp/dojo-is-palindrome-2.almd:2:8
  in call to list.rev()
  hint: Did you mean `list.get`?
  |
2 |   s == s |> list.chars |> list.rev |> list.join
  |        ^
error[E004]: list.join() expects 2 argument(s) but got 1
  --> /tmp/dojo-is-palindrome-2.almd:2:8
  in call to list.join()
  hint: Check the number of arguments
  |
2 |   s == s |> list.chars |> list.rev |> list.join
  |        ^

3 error(s) found
Compile error for /tmp/dojo-is-palindrome-2.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = {
  s == s |> string.chars |> list.rev |> list.join
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-3.almd
error[E002]: undefined function 'list.rev'
  --> /tmp/dojo-is-palindrome-3.almd:2:8
  in call to list.rev()
  hint: Did you mean `list.get`?
  |
2 |   s == s |> string.chars |> list.rev |> list.join
  |        ^
error[E004]: list.join() expects 2 argument(s) but got 1
  --> /tmp/dojo-is-palindrome-3.almd:2:8
  in call to list.join()
  hint: Check the number of arguments
  |
2 |   s == s |> string.chars |> list.rev |> list.join
  |        ^

2 error(s) found
Compile error for /tmp/dojo-is-palindrome-3.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-3.almd

1/1 test file(s) failed

```
