# string-reverse

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String = 
  string.chars(s) 
  |> list.reverse 
  |> list.join(_, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error[E004]: list.join() expects 2 argument(s) but got 3
  --> /tmp/dojo-string-reverse-0.almd:4:19
  in call to list.join()
  hint: Check the number of arguments
  try:
      // list.join() takes 2 arg(s) — you passed 3
      list.join(<xs: List[String]>, <sep: String>)
  |
4 |   |> list.join(_, "")
  |                   ^^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn reverse(s: String) -> String = 
  string.chars(s) 
  |> list.reverse 
  |> list.join("", _)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error[E004]: list.join() expects 2 argument(s) but got 3
  --> /tmp/dojo-string-reverse-1.almd:4:20
  in call to list.join()
  hint: Check the number of arguments
  try:
      // list.join() takes 2 arg(s) — you passed 3
      list.join(<xs: List[String]>, <sep: String>)
  |
4 |   |> list.join("", _)
  |                    ^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn reverse(s: String) -> String = 
  string.chars(s) 
  |> list.reverse 
  |> list.join("")
```
