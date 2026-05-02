# anagram-check

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let
    clean = (string.to_lower >> (string.chars >> list.filter((x) => x != " "))
  in
  list.sort(clean(a)) == list.sort(clean(b))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:6
  |
2 |   let
  |      ^
error: Expected ')' to close parenthesized expression opened at line 3:13
  --> /tmp/dojo-anagram-check-0.almd:3:79
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
3 |     clean = (string.to_lower >> (string.chars >> list.filter((x) => x != " "))
  |             --------------- '(' opened here
  |
3 |     clean = (string.to_lower >> (string.chars >> list.filter((x) => x != " "))
  |                                                                               ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:5:19
  in call to clean()
  hint: Check the function name
  |
5 |   list.sort(clean(a)) == list.sort(clean(b))
  |                   ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:5:42
  in call to clean()
  hint: Check the function name
  |
5 |   list.sort(clean(a)) == list.sort(clean(b))
  |                                          ^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let
    clean = (s) => list.filter((x) => x != " ", string.chars(string.to_lower(s)))
  in
  list.sort(clean(a)) == list.sort(clean(b))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-anagram-check-1.almd:2:6
  |
2 |   let
  |      ^
error: Expected expression at line 4:3 (got In 'in')
  --> /tmp/dojo-anagram-check-1.almd:4:3
  |
4 |   in
  |   ^
error[E005]: argument 'xs' expects List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-1.almd:3:78
  in call to list.filter()
  hint: Fix the argument type
  |
3 |     clean = (s) => list.filter((x) => x != " ", string.chars(string.to_lower(s)))
  |                                                                              ^
error[E005]: argument 'f' expects fn(A) -> Bool but got List[String]
  --> /tmp/dojo-anagram-check-1.almd:3:78
  in call to list.filter()
  hint: Fix the argument type
  |
3 |     clean = (s) => list.filter((x) => x != " ", string.chars(string.to_lower(s)))
  |                                                                              ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-1.almd:5:19
  in call to clean()
  hint: Check the function name
  |
5 |   list.sort(clean(a)) == list.sort(clean(b))
  |                   ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-1.almd:5:42
  in call to clean()
  hint: Check the function name
  |
5 |   list.sort(clean(a)) == list.sort(clean(b))
  |                                          ^
error[E001]: type mismatch in call to list.filter(): expected List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-1.almd:3:78
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
3 |     clean = (s) => list.filter((x) => x != " ", string.chars(string.to_lower(s)))
  |                                                                              ^
error[E001]: type mismatch in call to list.filter(): expected fn(A) -> Bool but got List[String]
  --> /tmp/dojo-anagram-check-1.almd:3:78
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
3 |     clean = (s) => list.filter((x) => x != " ", string.chars(string.to_lower(s)))
  |                                                                              ^

8 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let
    clean = (s) => list.filter((x) => x != " ", string.chars(string.to_lower(s)))
  in
  list.sort(clean(a)) == list.sort(clean(b))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-anagram-check-2.almd:2:6
  |
2 |   let
  |      ^
error: Expected expression at line 4:3 (got In 'in')
  --> /tmp/dojo-anagram-check-2.almd:4:3
  |
4 |   in
  |   ^
error[E005]: argument 'xs' expects List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-2.almd:3:78
  in call to list.filter()
  hint: Fix the argument type
  |
3 |     clean = (s) => list.filter((x) => x != " ", string.chars(string.to_lower(s)))
  |                                                                              ^
error[E005]: argument 'f' expects fn(A) -> Bool but got List[String]
  --> /tmp/dojo-anagram-check-2.almd:3:78
  in call to list.filter()
  hint: Fix the argument type
  |
3 |     clean = (s) => list.filter((x) => x != " ", string.chars(string.to_lower(s)))
  |                                                                              ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-2.almd:5:19
  in call to clean()
  hint: Check the function name
  |
5 |   list.sort(clean(a)) == list.sort(clean(b))
  |                   ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-2.almd:5:42
  in call to clean()
  hint: Check the function name
  |
5 |   list.sort(clean(a)) == list.sort(clean(b))
  |                                          ^
error[E001]: type mismatch in call to list.filter(): expected List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-2.almd:3:78
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
3 |     clean = (s) => list.filter((x) => x != " ", string.chars(string.to_lower(s)))
  |                                                                              ^
error[E001]: type mismatch in call to list.filter(): expected fn(A) -> Bool but got List[String]
  --> /tmp/dojo-anagram-check-2.almd:3:78
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
3 |     clean = (s) => list.filter((x) => x != " ", string.chars(string.to_lower(s)))
  |                                                                              ^

8 error(s) found
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let clean = (s) => list.filter((x) => x != " ", string.chars(string.to_lower(s)))
  in list.sort(clean(a)) == list.sort(clean(b))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-3.almd
error[E005]: argument 'xs' expects List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-3.almd:2:80
  in call to list.filter()
  hint: Fix the argument type
  |
2 |   let clean = (s) => list.filter((x) => x != " ", string.chars(string.to_lower(s)))
  |                                                                                ^
error[E005]: argument 'f' expects fn(A) -> Bool but got List[String]
  --> /tmp/dojo-anagram-check-3.almd:2:80
  in call to list.filter()
  hint: Fix the argument type
  |
2 |   let clean = (s) => list.filter((x) => x != " ", string.chars(string.to_lower(s)))
  |                                                                                ^
error[E001]: type mismatch in call to list.filter(): expected List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-3.almd:2:80
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
2 |   let clean = (s) => list.filter((x) => x != " ", string.chars(string.to_lower(s)))
  |                                                                                ^
error[E001]: type mismatch in call to list.filter(): expected fn(A) -> Bool but got List[String]
  --> /tmp/dojo-anagram-check-3.almd:2:80
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
2 |   let clean = (s) => list.filter((x) => x != " ", string.chars(string.to_lower(s)))
  |                                                                                ^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```
