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
  list.all(s.chars(), (c) => c == s.chars().drop_end(s.len() - s.chars().index_of(c)).first().unwrap_or('_'))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-0.almd
error: operator '-' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-is-palindrome-0.almd:2:64
  in operator -
  hint: Use numeric types (Int or Float)
  |
2 |   list.all(s.chars(), (c) => c == s.chars().drop_end(s.len() - s.chars().index_of(c)).first().unwrap_or('_'))
  |                                                                ^

1 error(s) found
Compile error for /tmp/dojo-is-palindrome-0.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  list.all(s.chars(), (c) => c == s.chars().drop_end(s.len() - s.chars().index_of(c).unwrap()).first())
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-1.almd
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-is-palindrome-1.almd:2:64
  in method call .unwrap()
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
  |
2 |   list.all(s.chars(), (c) => c == s.chars().drop_end(s.len() - s.chars().index_of(c).unwrap()).first())
  |                                                                ^
error[E005]: argument 'f' expects fn(String) -> Bool but got fn(Option[String]) -> Bool
  --> /tmp/dojo-is-palindrome-1.almd:2:35
  in call to list.all()
  hint: Fix the argument type
  |
2 |   list.all(s.chars(), (c) => c == s.chars().drop_end(s.len() - s.chars().index_of(c).unwrap()).first())
  |                                   ^

2 error(s) found
Compile error for /tmp/dojo-is-palindrome-1.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  list.all(s.chars(), (c) => c == s.chars().drop_end(s.len() - s.chars().index_of(c).unwrap_or(s.len())).first())
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-2.almd
error[E005]: argument 'f' expects fn(String) -> Bool but got fn(Option[String]) -> Bool
  --> /tmp/dojo-is-palindrome-2.almd:2:35
  in call to list.all()
  hint: Fix the argument type
  |
2 |   list.all(s.chars(), (c) => c == s.chars().drop_end(s.len() - s.chars().index_of(c).unwrap_or(s.len())).first())
  |                                   ^

1 error(s) found
Compile error for /tmp/dojo-is-palindrome-2.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  list.all(s.chars(), (c) => c == s.chars().drop_end(s.len() - s.chars().index_of(c).unwrap_or(s.len())).first().unwrap())
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-3.almd
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-is-palindrome-3.almd:2:35
  in method call .unwrap()
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
  |
2 |   list.all(s.chars(), (c) => c == s.chars().drop_end(s.len() - s.chars().index_of(c).unwrap_or(s.len())).first().unwrap())
  |                                   ^

1 error(s) found
Compile error for /tmp/dojo-is-palindrome-3.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-3.almd

1/1 test file(s) failed

```
