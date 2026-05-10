# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let
    to_chars(s: String) = string.chars(s)
    remove_spaces(xs: List[String]) = list.filter(xs, fn(x) => not(string.is_whitespace(x)))
    sorted_chars(xs: List[String]) = list.sort(xs)
  in
    list.equals(sorted_chars(to_chars(string.to_lower(a))), sorted_chars(to_chars(string.to_lower(b))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:6
  |
2 |   let
  |      ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-anagram-check-0.almd:3:25
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
3 |     to_chars(s: String) = string.chars(s)
  |                         ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-anagram-check-0.almd:4:37
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
4 |     remove_spaces(xs: List[String]) = list.filter(xs, fn(x) => not(string.is_whitespace(x)))
  |                                     ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-anagram-check-0.almd:5:36
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
5 |     sorted_chars(xs: List[String]) = list.sort(xs)
  |                                    ^
error[E002]: undefined function 'to_chars'
  --> /tmp/dojo-anagram-check-0.almd:3:17
  in call to to_chars()
  hint: Check the function name
  |
3 |     to_chars(s: String) = string.chars(s)
  |                 ^^^^^^
error[E002]: undefined function 'remove_spaces'
  --> /tmp/dojo-anagram-check-0.almd:4:23
  in call to remove_spaces()
  hint: Check the function name
  |
4 |     remove_spaces(xs: List[String]) = list.filter(xs, fn(x) => not(string.is_whitespace(x)))
  |                       ^^^^
error[E002]: undefined function 'sorted_chars'
  --> /tmp/dojo-anagram-check-0.almd:5:22
  in call to sorted_chars()
  hint: Did you mean `string.chars`?
  try:
      // sorted_chars(...)  →  string.chars(...)
      string.chars(...)
  |
5 |     sorted_chars(xs: List[String]) = list.sort(xs)
  |                      ^^^^
error[E002]: undefined function 'to_chars'
  --> /tmp/dojo-anagram-check-0.almd:7:55
  in call to to_chars()
  hint: Check the function name
  |
7 |     list.equals(sorted_chars(to_chars(string.to_lower(a))), sorted_chars(to_chars(string.to_lower(b))))
  |                                                       ^
error[E002]: undefined function 'sorted_chars'
  --> /tmp/dojo-anagram-check-0.almd:7:55
  in call to sorted_chars()
  hint: Did you mean `string.chars`?
  try:
      // sorted_chars(...)  →  string.chars(...)
      string.chars(...)
  |
7 |     list.equals(sorted_chars(to_chars(string.to_lower(a))), sorted_chars(to_chars(string.to_lower(b))))
  |                                                       ^
error[E002]: undefined function 'to_chars'
  --> /tmp/dojo-anagram-check-0.almd:7:99
  in call to to_chars()
  hint: Check the function name
  |
7 |     list.equals(sorted_chars(to_chars(string.to_lower(a))), sorted_chars(to_chars(string.to_lower(b))))
  |                                                                                                   ^
error[E002]: undefined function 'sorted_chars'
  --> /tmp/dojo-anagram-check-0.almd:7:99
  in call to sorted_chars()
  hint: Did you mean `string.chars`?
  try:
      // sorted_chars(...)  →  string.chars(...)
      string.chars(...)
  |
7 |     list.equals(sorted_chars(to_chars(string.to_lower(a))), sorted_chars(to_chars(string.to_lower(b))))
  |                                                                                                   ^
error[E002]: undefined function 'list.equals'
  --> /tmp/dojo-anagram-check-0.almd:7:99
  in call to list.equals()
  hint: No function 'equals' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
7 |     list.equals(sorted_chars(to_chars(string.to_lower(a))), sorted_chars(to_chars(string.to_lower(b))))
  |                                                                                                   ^

12 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let
    to_chars(s: String) = string.chars(s)
    remove_spaces(xs: List[String]) = list.filter(xs, fn(x) => not(string.is_whitespace(x)))
    sorted_chars(xs: List[String]) = list.sort(remove_spaces(to_chars(string.to_lower(a))))
    sorted_chars_b = list.sort(remove_spaces(to_chars(string.to_lower(b))))
  in
    list.equals(sorted_chars, sorted_chars_b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-anagram-check-1.almd:2:6
  |
2 |   let
  |      ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-anagram-check-1.almd:3:25
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
3 |     to_chars(s: String) = string.chars(s)
  |                         ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-anagram-check-1.almd:4:37
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
4 |     remove_spaces(xs: List[String]) = list.filter(xs, fn(x) => not(string.is_whitespace(x)))
  |                                     ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-anagram-check-1.almd:5:36
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
5 |     sorted_chars(xs: List[String]) = list.sort(remove_spaces(to_chars(string.to_lower(a))))
  |                                    ^
error: Expected expression at line 7:3 (got In 'in')
  --> /tmp/dojo-anagram-check-1.almd:7:3
  |
7 |   in
  |   ^
error[E002]: undefined function 'to_chars'
  --> /tmp/dojo-anagram-check-1.almd:3:17
  in call to to_chars()
  hint: Check the function name
  |
3 |     to_chars(s: String) = string.chars(s)
  |                 ^^^^^^
error[E002]: undefined function 'remove_spaces'
  --> /tmp/dojo-anagram-check-1.almd:4:23
  in call to remove_spaces()
  hint: Check the function name
  |
4 |     remove_spaces(xs: List[String]) = list.filter(xs, fn(x) => not(string.is_whitespace(x)))
  |                       ^^^^
error[E002]: undefined function 'sorted_chars'
  --> /tmp/dojo-anagram-check-1.almd:5:22
  in call to sorted_chars()
  hint: Did you mean `string.chars`?
  try:
      // sorted_chars(...)  →  string.chars(...)
      string.chars(...)
  |
5 |     sorted_chars(xs: List[String]) = list.sort(remove_spaces(to_chars(string.to_lower(a))))
  |                      ^^^^
error[E002]: undefined function 'to_chars'
  --> /tmp/dojo-anagram-check-1.almd:6:71
  in call to to_chars()
  hint: Check the function name
  |
6 |     sorted_chars_b = list.sort(remove_spaces(to_chars(string.to_lower(b))))
  |                                                                       ^
error[E002]: undefined function 'remove_spaces'
  --> /tmp/dojo-anagram-check-1.almd:6:71
  in call to remove_spaces()
  hint: Check the function name
  |
6 |     sorted_chars_b = list.sort(remove_spaces(to_chars(string.to_lower(b))))
  |                                                                       ^
error[E003]: undefined variable 'sorted_chars'
  --> /tmp/dojo-anagram-check-1.almd:8:17
  in variable sorted_chars
  hint: Did you mean `string.chars`?
  try:
      // sorted_chars  →  string.chars
      string.chars
  |
8 |     list.equals(sorted_chars, sorted_chars_b)
  |                 ^^^^^^^^^^^^
error[E003]: undefined variable 'sorted_chars_b'
  --> /tmp/dojo-anagram-check-1.almd:8:31
  in variable sorted_chars_b
  hint: Check the variable name
  |
8 |     list.equals(sorted_chars, sorted_chars_b)
  |                               ^^^^^^^^^^^^^^
error[E002]: undefined function 'list.equals'
  --> /tmp/dojo-anagram-check-1.almd:8:31
  in call to list.equals()
  hint: No function 'equals' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
8 |     list.equals(sorted_chars, sorted_chars_b)
  |                               ^^^^^^^^^^^^^^

13 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let
    to_chars(s: String) = string.chars(s)
    remove_spaces(xs: List[String]) = list.filter(xs, fn(x) => not(string.is_whitespace(x)))
    sorted_chars_a = list.sort(remove_spaces(to_chars(string.to_lower(a))))
    sorted_chars_b = list.sort(remove_spaces(to_chars(string.to_lower(b))))
  in
    list.equals(sorted_chars_a, sorted_chars_b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-anagram-check-2.almd:2:6
  |
2 |   let
  |      ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-anagram-check-2.almd:3:25
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
3 |     to_chars(s: String) = string.chars(s)
  |                         ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-anagram-check-2.almd:4:37
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
4 |     remove_spaces(xs: List[String]) = list.filter(xs, fn(x) => not(string.is_whitespace(x)))
  |                                     ^
error: Expected expression at line 7:3 (got In 'in')
  --> /tmp/dojo-anagram-check-2.almd:7:3
  |
7 |   in
  |   ^
error[E002]: undefined function 'to_chars'
  --> /tmp/dojo-anagram-check-2.almd:3:17
  in call to to_chars()
  hint: Check the function name
  |
3 |     to_chars(s: String) = string.chars(s)
  |                 ^^^^^^
error[E002]: undefined function 'remove_spaces'
  --> /tmp/dojo-anagram-check-2.almd:4:23
  in call to remove_spaces()
  hint: Check the function name
  |
4 |     remove_spaces(xs: List[String]) = list.filter(xs, fn(x) => not(string.is_whitespace(x)))
  |                       ^^^^
error[E002]: undefined function 'to_chars'
  --> /tmp/dojo-anagram-check-2.almd:5:71
  in call to to_chars()
  hint: Check the function name
  |
5 |     sorted_chars_a = list.sort(remove_spaces(to_chars(string.to_lower(a))))
  |                                                                       ^
error[E002]: undefined function 'remove_spaces'
  --> /tmp/dojo-anagram-check-2.almd:5:71
  in call to remove_spaces()
  hint: Check the function name
  |
5 |     sorted_chars_a = list.sort(remove_spaces(to_chars(string.to_lower(a))))
  |                                                                       ^
error[E002]: undefined function 'to_chars'
  --> /tmp/dojo-anagram-check-2.almd:6:71
  in call to to_chars()
  hint: Check the function name
  |
6 |     sorted_chars_b = list.sort(remove_spaces(to_chars(string.to_lower(b))))
  |                                                                       ^
error[E002]: undefined function 'remove_spaces'
  --> /tmp/dojo-anagram-check-2.almd:6:71
  in call to remove_spaces()
  hint: Check the function name
  |
6 |     sorted_chars_b = list.sort(remove_spaces(to_chars(string.to_lower(b))))
  |                                                                       ^
error[E003]: undefined variable 'sorted_chars_a'
  --> /tmp/dojo-anagram-check-2.almd:8:17
  in variable sorted_chars_a
  hint: Check the variable name
  |
8 |     list.equals(sorted_chars_a, sorted_chars_b)
  |                 ^^^^^^^^^^^^^^
error[E003]: undefined variable 'sorted_chars_b'
  --> /tmp/dojo-anagram-check-2.almd:8:33
  in variable sorted_chars_b
  hint: Check the variable name
  |
8 |     list.equals(sorted_chars_a, sorted_chars_b)
  |                                 ^^^^^^^^^^^^^^
error[E002]: undefined function 'list.equals'
  --> /tmp/dojo-anagram-check-2.almd:8:33
  in call to list.equals()
  hint: No function 'equals' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
8 |     list.equals(sorted_chars_a, sorted_chars_b)
  |                                 ^^^^^^^^^^^^^^

13 error(s) found
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let
    to_chars(s: String) = string.chars(s)
    remove_spaces(xs: List[String]) = list.filter(xs, fn(x) => not(string.is_whitespace(x)))
    sorted_chars_a = list.sort(remove_spaces(to_chars(string.to_lower(a))))
    sorted_chars_b = list.sort(remove_spaces(to_chars(string.to_lower(b))))
  in
    list.equals(sorted_chars_a, sorted_chars_b)

fn main() =
  let
    a = "Listen"
    b = "Silent"
  in
    print(string.to_string(is_anagram(a, b)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-3.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-anagram-check-3.almd:2:6
  |
2 |   let
  |      ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-anagram-check-3.almd:3:25
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
3 |     to_chars(s: String) = string.chars(s)
  |                         ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-anagram-check-3.almd:4:37
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
4 |     remove_spaces(xs: List[String]) = list.filter(xs, fn(x) => not(string.is_whitespace(x)))
  |                                     ^
error: Expected expression at line 7:3 (got In 'in')
  --> /tmp/dojo-anagram-check-3.almd:7:3
  |
7 |   in
  |   ^
error: Expected Arrow at line 10:11 (got Eq '=')
  --> /tmp/dojo-anagram-check-3.almd:10:11
  hint: Use '->' for return type, not '='. Write: fn name() -> Type = body
   |
10 | fn main() =
   |           ^
error[E002]: undefined function 'to_chars'
  --> /tmp/dojo-anagram-check-3.almd:3:17
  in call to to_chars()
  hint: Check the function name
  |
3 |     to_chars(s: String) = string.chars(s)
  |                 ^^^^^^
error[E002]: undefined function 'remove_spaces'
  --> /tmp/dojo-anagram-check-3.almd:4:23
  in call to remove_spaces()
  hint: Check the function name
  |
4 |     remove_spaces(xs: List[String]) = list.filter(xs, fn(x) => not(string.is_whitespace(x)))
  |                       ^^^^
error[E002]: undefined function 'to_chars'
  --> /tmp/dojo-anagram-check-3.almd:5:71
  in call to to_chars()
  hint: Check the function name
  |
5 |     sorted_chars_a = list.sort(remove_spaces(to_chars(string.to_lower(a))))
  |                                                                       ^
error[E002]: undefined function 'remove_spaces'
  --> /tmp/dojo-anagram-check-3.almd:5:71
  in call to remove_spaces()
  hint: Check the function name
  |
5 |     sorted_chars_a = list.sort(remove_spaces(to_chars(string.to_lower(a))))
  |                                                                       ^
error[E002]: undefined function 'to_chars'
  --> /tmp/dojo-anagram-check-3.almd:6:71
  in call to to_chars()
  hint: Check the function name
  |
6 |     sorted_chars_b = list.sort(remove_spaces(to_chars(string.to_lower(b))))
  |                                                                       ^
error[E002]: undefined function 'remove_spaces'
  --> /tmp/dojo-anagram-check-3.almd:6:71
  in call to remove_spaces()
  hint: Check the function name
  |
6 |     sorted_chars_b = list.sort(remove_spaces(to_chars(string.to_lower(b))))
  |                                                                       ^
error[E003]: undefined variable 'sorted_chars_a'
  --> /tmp/dojo-anagram-check-3.almd:8:17
  in variable sorted_chars_a
  hint: Check the variable name
  |
8 |     list.equals(sorted_chars_a, sorted_chars_b)
  |                 ^^^^^^^^^^^^^^
error[E003]: undefined variable 'sorted_chars_b'
  --> /tmp/dojo-anagram-check-3.almd:8:33
  in variable sorted_chars_b
  hint: Check the variable name
  |
8 |     list.equals(sorted_chars_a, sorted_chars_b)
  |                                 ^^^^^^^^^^^^^^
error[E002]: undefined function 'list.equals'
  --> /tmp/dojo-anagram-check-3.almd:8:33
  in call to list.equals()
  hint: No function 'equals' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
8 |     list.equals(sorted_chars_a, sorted_chars_b)
  |                                 ^^^^^^^^^^^^^^

14 error(s) found
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```
