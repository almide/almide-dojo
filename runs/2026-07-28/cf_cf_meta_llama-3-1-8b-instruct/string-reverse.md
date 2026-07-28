# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String = 
  string.chars(s) |> list.reverse(list) |> string.from_chars(list)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error[E003]: undefined variable 'list'
  --> /tmp/dojo-string-reverse-0.almd:2:35
  in variable list
  hint: Check the variable name
  |
2 |   string.chars(s) |> list.reverse(list) |> string.from_chars(list)
  |                                   ^^^^
error[E004]: list.reverse() expects 1 argument(s) but got 2
  --> /tmp/dojo-string-reverse-0.almd:2:35
  in call to list.reverse()
  hint: Check the number of arguments
  try:
      // list.reverse() takes 1 arg(s) — you passed 2
      list.reverse(<xs: List[A]>)
  |
2 |   string.chars(s) |> list.reverse(list) |> string.from_chars(list)
  |                                   ^^^^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-string-reverse-0.almd:2:62
  in variable list
  hint: Check the variable name
  |
2 |   string.chars(s) |> list.reverse(list) |> string.from_chars(list)
  |                                                              ^^^^
error[E002]: undefined function 'string.from_chars'
  --> /tmp/dojo-string-reverse-0.almd:2:62
  in call to string.from_chars()
  hint: Did you mean `string.from_bytes`?
  try:
      // string.from_chars(...)  →  string.from_bytes(...)
      string.from_bytes(...)
  |
2 |   string.chars(s) |> list.reverse(list) |> string.from_chars(list)
  |                                                              ^^^^

4 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn reverse(s: String) -> String = 
  string.chars(s) |> list.reverse(string.chars(s)) |> string.from_bytes(list)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error[E004]: list.reverse() expects 1 argument(s) but got 2
  --> /tmp/dojo-string-reverse-1.almd:2:48
  in call to list.reverse()
  hint: Check the number of arguments
  try:
      // list.reverse() takes 1 arg(s) — you passed 2
      list.reverse(<xs: List[A]>)
  |
2 |   string.chars(s) |> list.reverse(string.chars(s)) |> string.from_bytes(list)
  |                                                ^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-string-reverse-1.almd:2:73
  in variable list
  hint: Check the variable name
  |
2 |   string.chars(s) |> list.reverse(string.chars(s)) |> string.from_bytes(list)
  |                                                                         ^^^^
error[E004]: string.from_bytes() expects 1 argument(s) but got 2
  --> /tmp/dojo-string-reverse-1.almd:2:73
  in call to string.from_bytes()
  hint: Check the number of arguments
  try:
      // string.from_bytes() takes 1 arg(s) — you passed 2
      string.from_bytes(<bytes: List[Int]>)
  |
2 |   string.chars(s) |> list.reverse(string.chars(s)) |> string.from_bytes(list)
  |                                                                         ^^^^
error[E005]: argument 'bytes' expects List[Int] but got List[String]
  --> /tmp/dojo-string-reverse-1.almd:2:73
  in call to string.from_bytes()
  hint: Fix the argument type
  |
2 |   string.chars(s) |> list.reverse(string.chars(s)) |> string.from_bytes(list)
  |                                                                         ^^^^
error[E001]: type mismatch in call to string.from_bytes(): expected List[Int] but got List[String]
  --> /tmp/dojo-string-reverse-1.almd:2:73
  in call to string.from_bytes()
  hint: Fix the expression type or change the expected type
  |
2 |   string.chars(s) |> list.reverse(string.chars(s)) |> string.from_bytes(list)
  |                                                                         ^^^^

5 error(s) found
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn reverse(s: String) -> String = 
  list.map(string.chars(s), (c) => c) |> list.reverse() |> string.from_bytes(list)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-2.almd
error[E003]: undefined variable 'list'
  --> /tmp/dojo-string-reverse-2.almd:2:78
  in variable list
  hint: Check the variable name
  |
2 |   list.map(string.chars(s), (c) => c) |> list.reverse() |> string.from_bytes(list)
  |                                                                              ^^^^
error[E004]: string.from_bytes() expects 1 argument(s) but got 2
  --> /tmp/dojo-string-reverse-2.almd:2:78
  in call to string.from_bytes()
  hint: Check the number of arguments
  try:
      // string.from_bytes() takes 1 arg(s) — you passed 2
      string.from_bytes(<bytes: List[Int]>)
  |
2 |   list.map(string.chars(s), (c) => c) |> list.reverse() |> string.from_bytes(list)
  |                                                                              ^^^^
error[E005]: argument 'bytes' expects List[Int] but got List[String]
  --> /tmp/dojo-string-reverse-2.almd:2:78
  in call to string.from_bytes()
  hint: Fix the argument type
  |
2 |   list.map(string.chars(s), (c) => c) |> list.reverse() |> string.from_bytes(list)
  |                                                                              ^^^^
error[E001]: type mismatch in call to string.from_bytes(): expected List[Int] but got List[String]
  --> /tmp/dojo-string-reverse-2.almd:2:78
  in call to string.from_bytes()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(string.chars(s), (c) => c) |> list.reverse() |> string.from_bytes(list)
  |                                                                              ^^^^

4 error(s) found
Compile error for /tmp/dojo-string-reverse-2.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn reverse(s: String) -> String = 
  string.chars(s) |> list.reverse() |> string.from_bytes
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-3.almd
error[E005]: argument 'bytes' expects List[Int] but got List[String]
  --> /tmp/dojo-string-reverse-3.almd:2:16
  in call to string.from_bytes()
  hint: Fix the argument type
  |
2 |   string.chars(s) |> list.reverse() |> string.from_bytes
  |                ^
error[E001]: type mismatch in call to string.from_bytes(): expected List[Int] but got List[String]
  --> /tmp/dojo-string-reverse-3.almd:2:16
  in call to string.from_bytes()
  hint: Fix the expression type or change the expected type
  |
2 |   string.chars(s) |> list.reverse() |> string.from_bytes
  |                ^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-3.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-3.almd

1/1 test file(s) failed

```
