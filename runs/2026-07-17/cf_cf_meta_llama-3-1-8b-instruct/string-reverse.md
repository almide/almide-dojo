# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String = 
  let chars = string.chars(s) in 
  list.reverse(chars) |> string.join(chars)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error[E005]: argument 'sep' expects String but got List[String]
  --> /tmp/dojo-string-reverse-0.almd:3:38
  in call to string.join()
  hint: Fix the argument type
  |
3 |   list.reverse(chars) |> string.join(chars)
  |                                      ^^^^^
error[E001]: type mismatch in call to string.join(): expected String but got List[String]
  --> /tmp/dojo-string-reverse-0.almd:3:38
  in call to string.join()
  hint: Fix the expression type or change the expected type
  |
3 |   list.reverse(chars) |> string.join(chars)
  |                                      ^^^^^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn reverse(s: String) -> String = 
  let chars = string.chars(s) in 
  list.reverse(chars) |> string.join("")
```
