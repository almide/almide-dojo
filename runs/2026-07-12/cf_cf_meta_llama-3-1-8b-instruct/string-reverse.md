# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: import-error
- **diagnostic code**: `E004`

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String = string.chars(s) |> list.reverse(_) |> string.join(_, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error[E004]: list.reverse() expects 1 argument(s) but got 2
  --> /tmp/dojo-string-reverse-0.almd:1:67
  in call to list.reverse()
  hint: Check the number of arguments
  try:
      // list.reverse() takes 1 arg(s) — you passed 2
      list.reverse(<xs: List[A]>)
  |
1 | fn reverse(s: String) -> String = string.chars(s) |> list.reverse(_) |> string.join(_, "")
  |                                                                   ^
error[E004]: string.join() expects 2 argument(s) but got 3
  --> /tmp/dojo-string-reverse-0.almd:1:88
  in call to string.join()
  hint: Check the number of arguments
  try:
      // string.join() takes 2 arg(s) — you passed 3
      string.join(<list: List[String]>, <sep: String>)
  |
1 | fn reverse(s: String) -> String = string.chars(s) |> list.reverse(_) |> string.join(_, "")
  |                                                                                        ^^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn reverse(s: String) -> String = string.chars(s) |> list.reverse(_) |> string.join(_, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error[E004]: list.reverse() expects 1 argument(s) but got 2
  --> /tmp/dojo-string-reverse-1.almd:1:67
  in call to list.reverse()
  hint: Check the number of arguments
  try:
      // list.reverse() takes 1 arg(s) — you passed 2
      list.reverse(<xs: List[A]>)
  |
1 | fn reverse(s: String) -> String = string.chars(s) |> list.reverse(_) |> string.join(_, "")
  |                                                                   ^
error[E004]: string.join() expects 2 argument(s) but got 3
  --> /tmp/dojo-string-reverse-1.almd:1:88
  in call to string.join()
  hint: Check the number of arguments
  try:
      // string.join() takes 2 arg(s) — you passed 3
      string.join(<list: List[String]>, <sep: String>)
  |
1 | fn reverse(s: String) -> String = string.chars(s) |> list.reverse(_) |> string.join(_, "")
  |                                                                                        ^^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn reverse(s: String) -> String = string.chars(s) |> list.reverse(_) |> string.join(_, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-2.almd
error[E004]: list.reverse() expects 1 argument(s) but got 2
  --> /tmp/dojo-string-reverse-2.almd:1:67
  in call to list.reverse()
  hint: Check the number of arguments
  try:
      // list.reverse() takes 1 arg(s) — you passed 2
      list.reverse(<xs: List[A]>)
  |
1 | fn reverse(s: String) -> String = string.chars(s) |> list.reverse(_) |> string.join(_, "")
  |                                                                   ^
error[E004]: string.join() expects 2 argument(s) but got 3
  --> /tmp/dojo-string-reverse-2.almd:1:88
  in call to string.join()
  hint: Check the number of arguments
  try:
      // string.join() takes 2 arg(s) — you passed 3
      string.join(<list: List[String]>, <sep: String>)
  |
1 | fn reverse(s: String) -> String = string.chars(s) |> list.reverse(_) |> string.join(_, "")
  |                                                                                        ^^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-2.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn reverse(s: String) -> String = string.chars(s) |> list.reverse(_) |> string.join(_, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-3.almd
error[E004]: list.reverse() expects 1 argument(s) but got 2
  --> /tmp/dojo-string-reverse-3.almd:1:67
  in call to list.reverse()
  hint: Check the number of arguments
  try:
      // list.reverse() takes 1 arg(s) — you passed 2
      list.reverse(<xs: List[A]>)
  |
1 | fn reverse(s: String) -> String = string.chars(s) |> list.reverse(_) |> string.join(_, "")
  |                                                                   ^
error[E004]: string.join() expects 2 argument(s) but got 3
  --> /tmp/dojo-string-reverse-3.almd:1:88
  in call to string.join()
  hint: Check the number of arguments
  try:
      // string.join() takes 2 arg(s) — you passed 3
      string.join(<list: List[String]>, <sep: String>)
  |
1 | fn reverse(s: String) -> String = string.chars(s) |> list.reverse(_) |> string.join(_, "")
  |                                                                                        ^^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-3.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-3.almd

1/1 test file(s) failed

```
