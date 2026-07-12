# is-palindrome

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = {
  let len = string.len(s)
  if len <= 1 then true
  else if string.first(s) != string.last(s) then false
  else is_palindrome(string.drop(s, 1) + [string.last(s)])
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-0.almd
internal compiler error: IR verify: ConcatStr expects String operands, got String and List[Option[String]] (in is_palindrome) at line 5
Compile error for /tmp/dojo-is-palindrome-0.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = {
  let len = string.len(s)
  if len <= 1 then true
  else if string.first(s) != string.last(s) then false
  else is_palindrome(list.drop(list.from_string(s), 1) + [string.last(s)])
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-1.almd
error[E002]: undefined function 'list.from_string'
  --> /tmp/dojo-is-palindrome-1.almd:5:49
  in call to list.from_string()
  hint: No function 'from_string' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
5 |   else is_palindrome(list.drop(list.from_string(s), 1) + [string.last(s)])
  |                                                 ^
error[E005]: argument 's' expects String but got List[Option[String]]
  --> /tmp/dojo-is-palindrome-1.almd:5:71
  in call to is_palindrome()
  hint: Fix the argument type
  |
1 | fn is_palindrome(s: String) -> Bool = {
  | ------------------------------- fn is_palindrome() defined here
...
5 |   else is_palindrome(list.drop(list.from_string(s), 1) + [string.last(s)])
  |                                                                       ^
error[E001]: type mismatch in call to is_palindrome(): expected String but got List[Option[String]]
  --> /tmp/dojo-is-palindrome-1.almd:5:71
  in call to is_palindrome()
  hint: Fix the expression type or change the expected type
  |
5 |   else is_palindrome(list.drop(list.from_string(s), 1) + [string.last(s)])
  |                                                                       ^

3 error(s) found
Compile error for /tmp/dojo-is-palindrome-1.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = {
  let len = string.len(s)
  if len <= 1 then true
  else if string.first(s) != string.last(s) then false
  else is_palindrome(string.drop_end(s, 1) + [string.last(s)])
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-2.almd
internal compiler error: IR verify: ConcatStr expects String operands, got String and List[Option[String]] (in is_palindrome) at line 5
Compile error for /tmp/dojo-is-palindrome-2.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = {
  let len = string.len(s)
  if len <= 1 then true
  else if string.first(s) != string.last(s) then false
  else is_palindrome(string.drop_end(s, 1) + [string.last(s)])
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-3.almd
internal compiler error: IR verify: ConcatStr expects String operands, got String and List[Option[String]] (in is_palindrome) at line 5
Compile error for /tmp/dojo-is-palindrome-3.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-3.almd

1/1 test file(s) failed

```
