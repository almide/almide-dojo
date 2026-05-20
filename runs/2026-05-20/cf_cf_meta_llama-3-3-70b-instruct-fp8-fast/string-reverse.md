# string-reverse

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String = 
  string.chars(s) 
  |> list.reverse 
  |> list.join 
  |> (x) => x
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error[E004]: list.join() expects 2 argument(s) but got 1
  --> /tmp/dojo-string-reverse-0.almd:2:16
  in call to list.join()
  hint: Check the number of arguments
  try:
      // list.join() takes 2 arg(s) — you passed 1
      list.join(<xs: List[String]>, <sep: String>)
  |
2 |   string.chars(s)
  |                ^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn reverse(s: String) -> String = 
  string.chars(s) 
  |> list.reverse 
  |> (xs) => list.join(xs, "")
```
