# is-palindrome

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E010`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = {
  let first = list.first(s.chars())
  let last = list.last(s.chars())
  if list.is_empty(s.chars()) then true else
    if first == last then is_palindrome(list.drop(s.chars(), 1)) else false
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-0.almd
error[E005]: argument 's' expects String but got List[String]
  --> /tmp/dojo-is-palindrome-0.almd:5:62
  in call to is_palindrome()
  hint: Fix the argument type
  |
1 | fn is_palindrome(s: String) -> Bool = {
  | ------------------------------- fn is_palindrome() defined here
...
5 |     if first == last then is_palindrome(list.drop(s.chars(), 1)) else false
  |                                                              ^
error[E001]: type mismatch in call to is_palindrome(): expected String but got List[String]
  --> /tmp/dojo-is-palindrome-0.almd:5:62
  in call to is_palindrome()
  hint: Fix the expression type or change the expected type
  |
5 |     if first == last then is_palindrome(list.drop(s.chars(), 1)) else false
  |                                                              ^

2 error(s) found
Compile error for /tmp/dojo-is-palindrome-0.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = {
  match s {
    some(x) => {
      let chars = s.chars();
      if list.is_empty(chars) then true else
        if list.first(chars) == list.last(chars) then is_palindrome(list.drop(chars, 1)) else false
    },
    none => true
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-1.almd
error[E010]: non-exhaustive match: missing _
  --> /tmp/dojo-is-palindrome-1.almd:2:9
  in match
  hint: match on String requires a catch-all '_' pattern
  |
2 |   match s {
  |         ^
error[E005]: argument 's' expects String but got List[String]
  --> /tmp/dojo-is-palindrome-1.almd:6:86
  in call to is_palindrome()
  hint: Fix the argument type
  |
1 | fn is_palindrome(s: String) -> Bool = {
  | ------------------------------- fn is_palindrome() defined here
...
6 |         if list.first(chars) == list.last(chars) then is_palindrome(list.drop(chars, 1)) else false
  |                                                                                      ^
error[E001]: type mismatch in call to is_palindrome(): expected String but got List[String]
  --> /tmp/dojo-is-palindrome-1.almd:6:86
  in call to is_palindrome()
  hint: Fix the expression type or change the expected type
  |
6 |         if list.first(chars) == list.last(chars) then is_palindrome(list.drop(chars, 1)) else false
  |                                                                                      ^

3 error(s) found
Compile error for /tmp/dojo-is-palindrome-1.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = {
  match s {
    some(x) => {
      let chars = s.chars();
      if list.is_empty(chars) then true else
        if list.first(chars) == list.last(chars) then
          match list.drop(chars, 1) {
            some(x) => is_palindrome(list.first(x) + list.drop(x, 1)),
            none => true
          }
        else false
    },
    none => true
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-2.almd
error[E010]: non-exhaustive match: missing _
  --> /tmp/dojo-is-palindrome-2.almd:2:9
  in match
  hint: match on String requires a catch-all '_' pattern
  |
2 |   match s {
  |         ^
error: operator '+' requires numeric, String, or List types but got Option[?0] and List[?1]
  --> /tmp/dojo-is-palindrome-2.almd:8:67
  in operator +
  hint: Use + with numeric types, String, or List
  |
8 |             some(x) => is_palindrome(list.first(x) + list.drop(x, 1)),
  |                                                                   ^
error[E005]: argument 's' expects String but got Option[?0]
  --> /tmp/dojo-is-palindrome-2.almd:8:67
  in call to is_palindrome()
  hint: Fix the argument type
  |
1 | fn is_palindrome(s: String) -> Bool = {
  | ------------------------------- fn is_palindrome() defined here
...
8 |             some(x) => is_palindrome(list.first(x) + list.drop(x, 1)),
  |                                                                   ^
error[E001]: type mismatch in call to is_palindrome(): expected String but got Option[?0]
  --> /tmp/dojo-is-palindrome-2.almd:8:67
  in call to is_palindrome()
  hint: Fix the expression type or change the expected type
  |
8 |             some(x) => is_palindrome(list.first(x) + list.drop(x, 1)),
  |                                                                   ^

4 error(s) found
Compile error for /tmp/dojo-is-palindrome-2.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = {
  match s {
    some(x) => {
      let chars = s.chars();
      if list.is_empty(chars) then true else
        if list.first(chars) == list.last(chars) then
          is_palindrome(list.drop(chars, 1))
        else false
    },
    none => true
  }
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
error[E005]: argument 's' expects String but got List[String]
  --> /tmp/dojo-is-palindrome-3.almd:7:42
  in call to is_palindrome()
  hint: Fix the argument type
  |
1 | fn is_palindrome(s: String) -> Bool = {
  | ------------------------------- fn is_palindrome() defined here
...
7 |           is_palindrome(list.drop(chars, 1))
  |                                          ^
error[E001]: type mismatch in call to is_palindrome(): expected String but got List[String]
  --> /tmp/dojo-is-palindrome-3.almd:7:42
  in call to is_palindrome()
  hint: Fix the expression type or change the expected type
  |
7 |           is_palindrome(list.drop(chars, 1))
  |                                          ^

3 error(s) found
Compile error for /tmp/dojo-is-palindrome-3.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-3.almd

1/1 test file(s) failed

```
