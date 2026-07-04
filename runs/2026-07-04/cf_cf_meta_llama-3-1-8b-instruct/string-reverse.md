# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String = 
  string.chars(s) |> list.reverse |> string.join
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error[E004]: string.join() expects 2 argument(s) but got 1
  --> /tmp/dojo-string-reverse-0.almd:2:16
  in call to string.join()
  hint: Check the number of arguments
  try:
      // string.join() takes 2 arg(s) — you passed 1
      string.join(<list: List[String]>, <sep: String>)
  |
2 |   string.chars(s) |> list.reverse |> string.join
  |                ^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn reverse(s: String) -> String = 
  string.chars(s) |> list.reverse |> string.join("", "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error[E004]: string.join() expects 2 argument(s) but got 3
  --> /tmp/dojo-string-reverse-1.almd:2:54
  in call to string.join()
  hint: Check the number of arguments
  try:
      // string.join() takes 2 arg(s) — you passed 3
      string.join(<list: List[String]>, <sep: String>)
  |
2 |   string.chars(s) |> list.reverse |> string.join("", "")
  |                                                      ^^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn reverse(s: String) -> String = 
  string.chars(s) |> list.reverse |> string.join("")
```
