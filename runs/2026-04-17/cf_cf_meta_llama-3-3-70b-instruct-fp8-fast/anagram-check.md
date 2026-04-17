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
    clean = (string.to_lower >> string.chars >> list.filter((x) => x != " "))
    sorted_a = list.sort(clean(a))
    sorted_b = list.sort(clean(b))
  in
  sorted_a == sorted_b
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:6
  |
2 |   let
  |      ^
error: Expected expression at line 6:3 (got In 'in')
  --> /tmp/dojo-anagram-check-0.almd:6:3
  |
6 |   in
  |   ^
error[E004]: list.filter() expects 2 argument(s) but got 1
  --> /tmp/dojo-anagram-check-0.almd:3:73
  in call to list.filter()
  hint: Check the number of arguments
  try:
      // list.filter() takes 2 arg(s) — you passed 1
      list.filter(<xs: List[A]>, <f: fn(A) -> Bool>)
  |
3 |     clean = (string.to_lower >> string.chars >> list.filter((x) => x != " "))
  |                                                                         ^^^
error[E005]: argument 'xs' expects List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-0.almd:3:73
  in call to list.filter()
  hint: Fix the argument type
  |
3 |     clean = (string.to_lower >> string.chars >> list.filter((x) => x != " "))
  |                                                                         ^^^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:4:32
  in call to clean()
  hint: Check the function name
  |
4 |     sorted_a = list.sort(clean(a))
  |                                ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:5:32
  in call to clean()
  hint: Check the function name
  |
5 |     sorted_b = list.sort(clean(b))
  |                                ^
error[E003]: undefined variable 'sorted_a'
  --> /tmp/dojo-anagram-check-0.almd:7:3
  in variable sorted_a
  hint: Check the variable name
  |
7 |   sorted_a == sorted_b
  |   ^^^^^^^^
error[E003]: undefined variable 'sorted_b'
  --> /tmp/dojo-anagram-check-0.almd:7:15
  in variable sorted_b
  hint: Check the variable name
  |
7 |   sorted_a == sorted_b
  |               ^^^^^^^^
error[E001]: type mismatch in call to list.filter(): expected List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-0.almd:3:73
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
3 |     clean = (string.to_lower >> string.chars >> list.filter((x) => x != " "))
  |                                                                         ^^^

9 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let clean = (x) => list.filter((y) => y != " ", string.chars(string.to_lower(x)))
  in list.sort(clean(a)) == list.sort(clean(b))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error[E005]: argument 'xs' expects List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-1.almd:2:80
  in call to list.filter()
  hint: Fix the argument type
  |
2 |   let clean = (x) => list.filter((y) => y != " ", string.chars(string.to_lower(x)))
  |                                                                                ^
error[E005]: argument 'f' expects fn(A) -> Bool but got List[String]
  --> /tmp/dojo-anagram-check-1.almd:2:80
  in call to list.filter()
  hint: Fix the argument type
  |
2 |   let clean = (x) => list.filter((y) => y != " ", string.chars(string.to_lower(x)))
  |                                                                                ^
error[E001]: type mismatch in call to list.filter(): expected List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-1.almd:2:80
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
2 |   let clean = (x) => list.filter((y) => y != " ", string.chars(string.to_lower(x)))
  |                                                                                ^
error[E001]: type mismatch in call to list.filter(): expected fn(A) -> Bool but got List[String]
  --> /tmp/dojo-anagram-check-1.almd:2:80
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
2 |   let clean = (x) => list.filter((y) => y != " ", string.chars(string.to_lower(x)))
  |                                                                                ^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let clean = (x) => list.filter((y) => y != " ", string.chars(string.to_lower(x)))
  in list.sort(clean(a)) == list.sort(clean(b))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
error[E005]: argument 'xs' expects List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-2.almd:2:80
  in call to list.filter()
  hint: Fix the argument type
  |
2 |   let clean = (x) => list.filter((y) => y != " ", string.chars(string.to_lower(x)))
  |                                                                                ^
error[E005]: argument 'f' expects fn(A) -> Bool but got List[String]
  --> /tmp/dojo-anagram-check-2.almd:2:80
  in call to list.filter()
  hint: Fix the argument type
  |
2 |   let clean = (x) => list.filter((y) => y != " ", string.chars(string.to_lower(x)))
  |                                                                                ^
error[E001]: type mismatch in call to list.filter(): expected List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-2.almd:2:80
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
2 |   let clean = (x) => list.filter((y) => y != " ", string.chars(string.to_lower(x)))
  |                                                                                ^
error[E001]: type mismatch in call to list.filter(): expected fn(A) -> Bool but got List[String]
  --> /tmp/dojo-anagram-check-2.almd:2:80
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
2 |   let clean = (x) => list.filter((y) => y != " ", string.chars(string.to_lower(x)))
  |                                                                                ^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let clean = (x) => list.filter((y) => y != " ", string.chars(string.to_lower(x)))
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
2 |   let clean = (x) => list.filter((y) => y != " ", string.chars(string.to_lower(x)))
  |                                                                                ^
error[E005]: argument 'f' expects fn(A) -> Bool but got List[String]
  --> /tmp/dojo-anagram-check-3.almd:2:80
  in call to list.filter()
  hint: Fix the argument type
  |
2 |   let clean = (x) => list.filter((y) => y != " ", string.chars(string.to_lower(x)))
  |                                                                                ^
error[E001]: type mismatch in call to list.filter(): expected List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-3.almd:2:80
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
2 |   let clean = (x) => list.filter((y) => y != " ", string.chars(string.to_lower(x)))
  |                                                                                ^
error[E001]: type mismatch in call to list.filter(): expected fn(A) -> Bool but got List[String]
  --> /tmp/dojo-anagram-check-3.almd:2:80
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
2 |   let clean = (x) => list.filter((y) => y != " ", string.chars(string.to_lower(x)))
  |                                                                                ^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```
