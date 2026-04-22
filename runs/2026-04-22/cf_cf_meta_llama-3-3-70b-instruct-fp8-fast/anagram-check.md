# anagram-check

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let 
        clean = (string.to_lower >> (string.chars >> list.filter((x) => x != " "))
        sorted_a = list.sort(clean(a))
        sorted_b = list.sort(clean(b))
    in 
    sorted_a == sorted_b
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:9 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:9
  |
2 |     let
  |         ^
error: Expected ')' to close parenthesized expression opened at line 3:17
  --> /tmp/dojo-anagram-check-0.almd:3:83
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
3 |         clean = (string.to_lower >> (string.chars >> list.filter((x) => x != " "))
  |                 --------------- '(' opened here
  |
3 |         clean = (string.to_lower >> (string.chars >> list.filter((x) => x != " "))
  |                                                                                   ^
error: Expected expression at line 6:5 (got In 'in')
  --> /tmp/dojo-anagram-check-0.almd:6:5
  |
6 |     in
  |     ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:4:36
  in call to clean()
  hint: Check the function name
  |
4 |         sorted_a = list.sort(clean(a))
  |                                    ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:5:36
  in call to clean()
  hint: Check the function name
  |
5 |         sorted_b = list.sort(clean(b))
  |                                    ^
error[E003]: undefined variable 'sorted_a'
  --> /tmp/dojo-anagram-check-0.almd:7:5
  in variable sorted_a
  hint: Check the variable name
  |
7 |     sorted_a == sorted_b
  |     ^^^^^^^^
error[E003]: undefined variable 'sorted_b'
  --> /tmp/dojo-anagram-check-0.almd:7:17
  in variable sorted_b
  hint: Check the variable name
  |
7 |     sorted_a == sorted_b
  |                 ^^^^^^^^

7 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let 
        clean = (s) => list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(s))))
        sorted_a = clean(a)
        sorted_b = clean(b)
    in 
    sorted_a == sorted_b
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: Expected identifier at line 2:9 (got Newline '')
  --> /tmp/dojo-anagram-check-1.almd:2:9
  |
2 |     let
  |         ^
error: Expected expression at line 6:5 (got In 'in')
  --> /tmp/dojo-anagram-check-1.almd:6:5
  |
6 |     in
  |     ^
error[E005]: argument 'xs' expects List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-1.almd:3:92
  in call to list.filter()
  hint: Fix the argument type
  |
3 |         clean = (s) => list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(s))))
  |                                                                                            ^
error[E005]: argument 'f' expects fn(A) -> Bool but got List[String]
  --> /tmp/dojo-anagram-check-1.almd:3:92
  in call to list.filter()
  hint: Fix the argument type
  |
3 |         clean = (s) => list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(s))))
  |                                                                                            ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-1.almd:4:26
  in call to clean()
  hint: Check the function name
  |
4 |         sorted_a = clean(a)
  |                          ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-1.almd:5:26
  in call to clean()
  hint: Check the function name
  |
5 |         sorted_b = clean(b)
  |                          ^
error[E003]: undefined variable 'sorted_a'
  --> /tmp/dojo-anagram-check-1.almd:7:5
  in variable sorted_a
  hint: Check the variable name
  |
7 |     sorted_a == sorted_b
  |     ^^^^^^^^
error[E003]: undefined variable 'sorted_b'
  --> /tmp/dojo-anagram-check-1.almd:7:17
  in variable sorted_b
  hint: Check the variable name
  |
7 |     sorted_a == sorted_b
  |                 ^^^^^^^^
error[E001]: type mismatch in call to list.filter(): expected List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-1.almd:3:92
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
3 |         clean = (s) => list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(s))))
  |                                                                                            ^
error[E001]: type mismatch in call to list.filter(): expected fn(A) -> Bool but got List[String]
  --> /tmp/dojo-anagram-check-1.almd:3:92
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
3 |         clean = (s) => list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(s))))
  |                                                                                            ^

10 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let 
        clean = (s) => list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(s))))
    in 
    clean(a) == clean(b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
error: Expected identifier at line 2:9 (got Newline '')
  --> /tmp/dojo-anagram-check-2.almd:2:9
  |
2 |     let
  |         ^
error: Expected expression at line 4:5 (got In 'in')
  --> /tmp/dojo-anagram-check-2.almd:4:5
  |
4 |     in
  |     ^
error[E005]: argument 'xs' expects List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-2.almd:3:92
  in call to list.filter()
  hint: Fix the argument type
  |
3 |         clean = (s) => list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(s))))
  |                                                                                            ^
error[E005]: argument 'f' expects fn(A) -> Bool but got List[String]
  --> /tmp/dojo-anagram-check-2.almd:3:92
  in call to list.filter()
  hint: Fix the argument type
  |
3 |         clean = (s) => list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(s))))
  |                                                                                            ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-2.almd:5:11
  in call to clean()
  hint: Check the function name
  |
5 |     clean(a) == clean(b)
  |           ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-2.almd:5:23
  in call to clean()
  hint: Check the function name
  |
5 |     clean(a) == clean(b)
  |                       ^
error[E001]: type mismatch in call to list.filter(): expected List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-2.almd:3:92
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
3 |         clean = (s) => list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(s))))
  |                                                                                            ^
error[E001]: type mismatch in call to list.filter(): expected fn(A) -> Bool but got List[String]
  --> /tmp/dojo-anagram-check-2.almd:3:92
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
3 |         clean = (s) => list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(s))))
  |                                                                                            ^

8 error(s) found
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let 
        clean = (s) => list.sort(list.filter((x) => x != " ", list.map((c) => c, string.chars(string.to_lower(s)))))
    in 
    clean(a) == clean(b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-3.almd
error: Expected identifier at line 2:9 (got Newline '')
  --> /tmp/dojo-anagram-check-3.almd:2:9
  |
2 |     let
  |         ^
error: Expected expression at line 4:5 (got In 'in')
  --> /tmp/dojo-anagram-check-3.almd:4:5
  |
4 |     in
  |     ^
error[E005]: argument 'xs' expects List[A] but got fn(?2) -> ?2
  --> /tmp/dojo-anagram-check-3.almd:3:111
  in call to list.map()
  hint: Fix the argument type
  |
3 |         clean = (s) => list.sort(list.filter((x) => x != " ", list.map((c) => c, string.chars(string.to_lower(s)))))
  |                                                                                                               ^
error[E005]: argument 'f' expects fn(A) -> B but got List[String]
  --> /tmp/dojo-anagram-check-3.almd:3:111
  in call to list.map()
  hint: Fix the argument type
  |
3 |         clean = (s) => list.sort(list.filter((x) => x != " ", list.map((c) => c, string.chars(string.to_lower(s)))))
  |                                                                                                               ^
error[E005]: argument 'xs' expects List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-3.almd:3:111
  in call to list.filter()
  hint: Fix the argument type
  |
3 |         clean = (s) => list.sort(list.filter((x) => x != " ", list.map((c) => c, string.chars(string.to_lower(s)))))
  |                                                                                                               ^
error[E005]: argument 'f' expects fn(A) -> Bool but got List[?4]
  --> /tmp/dojo-anagram-check-3.almd:3:111
  in call to list.filter()
  hint: Fix the argument type
  |
3 |         clean = (s) => list.sort(list.filter((x) => x != " ", list.map((c) => c, string.chars(string.to_lower(s)))))
  |                                                                                                               ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-3.almd:5:11
  in call to clean()
  hint: Check the function name
  |
5 |     clean(a) == clean(b)
  |           ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-3.almd:5:23
  in call to clean()
  hint: Check the function name
  |
5 |     clean(a) == clean(b)
  |                       ^
error[E001]: type mismatch in call to list.map(): expected List[A] but got fn(?2) -> ?2
  --> /tmp/dojo-anagram-check-3.almd:3:111
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
3 |         clean = (s) => list.sort(list.filter((x) => x != " ", list.map((c) => c, string.chars(string.to_lower(s)))))
  |                                                                                                               ^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got List[String]
  --> /tmp/dojo-anagram-check-3.almd:3:111
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
3 |         clean = (s) => list.sort(list.filter((x) => x != " ", list.map((c) => c, string.chars(string.to_lower(s)))))
  |                                                                                                               ^
error[E001]: type mismatch in call to list.filter(): expected List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-3.almd:3:111
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
3 |         clean = (s) => list.sort(list.filter((x) => x != " ", list.map((c) => c, string.chars(string.to_lower(s)))))
  |                                                                                                               ^
error[E001]: type mismatch in call to list.filter(): expected fn(A) -> Bool but got List[?4]
  --> /tmp/dojo-anagram-check-3.almd:3:111
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
3 |         clean = (s) => list.sort(list.filter((x) => x != " ", list.map((c) => c, string.chars(string.to_lower(s)))))
  |                                                                                                               ^

12 error(s) found
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```
