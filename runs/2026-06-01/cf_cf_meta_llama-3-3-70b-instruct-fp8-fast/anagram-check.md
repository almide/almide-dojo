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
    clean = (s) => 
      string.chars(s) 
      |> list.filter((x) => not(string.is_whitespace(x)))
    sorted_chars = (s) => 
      clean(s) 
      |> list.map((x) => string.to_lower(x))
      |> list.sort
  in 
    sorted_chars(a) == sorted_chars(b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 10:3 (got In 'in')
  --> /tmp/dojo-anagram-check-0.almd:10:3
   |
10 |   in
   |   ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:7:13
  in call to clean()
  hint: Check the function name
  |
7 |       clean(s)
  |             ^
error[E002]: undefined function 'sorted_chars'
  --> /tmp/dojo-anagram-check-0.almd:11:18
  in call to sorted_chars()
  hint: Did you mean `string.chars`?
  try:
      // sorted_chars(...)  →  string.chars(...)
      string.chars(...)
   |
11 |     sorted_chars(a) == sorted_chars(b)
   |                  ^
error[E002]: undefined function 'sorted_chars'
  --> /tmp/dojo-anagram-check-0.almd:11:37
  in call to sorted_chars()
  hint: Did you mean `string.chars`?
  try:
      // sorted_chars(...)  →  string.chars(...)
      string.chars(...)
   |
11 |     sorted_chars(a) == sorted_chars(b)
   |                                     ^

5 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let 
    clean = (s) => string.chars(s) |> list.filter((x) => not(string.is_whitespace(x)))
    sorted_chars = (s) => clean(s) |> list.map((x) => string.to_lower(x)) |> list.sort
  in sorted_chars(a) == sorted_chars(b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-anagram-check-1.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-anagram-check-1.almd:5:3
  |
5 |   in sorted_chars(a) == sorted_chars(b)
  |   ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-1.almd:4:33
  in call to clean()
  hint: Check the function name
  |
4 |     sorted_chars = (s) => clean(s) |> list.map((x) => string.to_lower(x)) |> list.sort
  |                                 ^
error[E001]: type mismatch in fn 'is_anagram': expected Bool but got Unit
  --> /tmp/dojo-anagram-check-1.almd:4:71
  in fn 'is_anagram'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
4 |     sorted_chars = (s) => clean(s) |> list.map((x) => string.to_lower(x)) |> list.sort
  |                                                                       ^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let 
    clean = (s) => string.chars(s) |> list.filter((x) => not(string.is_whitespace(x))) 
    sorted_chars = (s) => clean(s) |> list.map((x) => string.to_lower(x)) |> list.sort
  in 
  sorted_chars(a) == sorted_chars(b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-anagram-check-2.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-anagram-check-2.almd:5:3
  |
5 |   in
  |   ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-2.almd:4:33
  in call to clean()
  hint: Check the function name
  |
4 |     sorted_chars = (s) => clean(s) |> list.map((x) => string.to_lower(x)) |> list.sort
  |                                 ^
error[E002]: undefined function 'sorted_chars'
  --> /tmp/dojo-anagram-check-2.almd:6:16
  in call to sorted_chars()
  hint: Did you mean `string.chars`?
  try:
      // sorted_chars(...)  →  string.chars(...)
      string.chars(...)
  |
6 |   sorted_chars(a) == sorted_chars(b)
  |                ^
error[E002]: undefined function 'sorted_chars'
  --> /tmp/dojo-anagram-check-2.almd:6:35
  in call to sorted_chars()
  hint: Did you mean `string.chars`?
  try:
      // sorted_chars(...)  →  string.chars(...)
      string.chars(...)
  |
6 |   sorted_chars(a) == sorted_chars(b)
  |                                   ^

5 error(s) found
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let 
    clean = (s) => string.chars(s) |> list.filter((x) => not(string.is_whitespace(x)))
    sorted_chars = (s) => clean(s) |> list.map((x) => string.to_lower(x)) |> list.sort
  in 
  sorted_chars(a) == sorted_chars(b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-3.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-anagram-check-3.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-anagram-check-3.almd:5:3
  |
5 |   in
  |   ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-3.almd:4:33
  in call to clean()
  hint: Check the function name
  |
4 |     sorted_chars = (s) => clean(s) |> list.map((x) => string.to_lower(x)) |> list.sort
  |                                 ^
error[E002]: undefined function 'sorted_chars'
  --> /tmp/dojo-anagram-check-3.almd:6:16
  in call to sorted_chars()
  hint: Did you mean `string.chars`?
  try:
      // sorted_chars(...)  →  string.chars(...)
      string.chars(...)
  |
6 |   sorted_chars(a) == sorted_chars(b)
  |                ^
error[E002]: undefined function 'sorted_chars'
  --> /tmp/dojo-anagram-check-3.almd:6:35
  in call to sorted_chars()
  hint: Did you mean `string.chars`?
  try:
      // sorted_chars(...)  →  string.chars(...)
      string.chars(...)
  |
6 |   sorted_chars(a) == sorted_chars(b)
  |                                   ^

5 error(s) found
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```
