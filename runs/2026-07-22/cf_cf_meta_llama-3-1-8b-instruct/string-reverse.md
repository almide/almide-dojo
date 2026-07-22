# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

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

// Corrected version
fn reverse(s: String) -> String = string.chars(s) |> list.reverse() |> string.join("")
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error[E012]: duplicate function 'reverse'
  at line 4
  in fn reverse
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
  |
1 | fn reverse(s: String) -> String = string.chars(s) |> list.reverse(_) |> string.join(_, "")
  | ---------------------------------- first definition of 'reverse' here
...
4 | fn reverse(s: String) -> String = string.chars(s) |> list.reverse() |> string.join("")
  | ^^^^^^^^^^
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

3 error(s) found
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn reverse(s: String) -> String = string.chars(s) |> list.reverse() |> string.join("")
```
