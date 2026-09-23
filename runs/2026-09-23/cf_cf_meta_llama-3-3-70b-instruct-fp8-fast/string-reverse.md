# string-reverse

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 1
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
error[E046]: placeholder `_` is not valid in a call argument (argument 1 of list.join())
  --> /tmp/dojo-string-reverse-0.almd:4:18
  in call argument
  here: |> list.join(_, "")
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => list.join(x, /* the other arguments */)
  |
4 |     |> list.join(_, "")
  |                  ^
error[E004]: list.join() expects 2 argument(s) but got 3
  --> /tmp/dojo-string-reverse-0.almd:4:21
  in call to list.join()
  here: |> list.join(_, "")
  hint: Check the number of arguments
  try:
      // list.join() takes 2 arg(s) — you passed 3
      list.join(<xs: List[String]>, <sep: String>)
  |
4 |     |> list.join(_, "")
  |                     ^^

2 error(s) found
FAILED: /tmp/dojo-string-reverse-0.almd
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn reverse(s: String) -> String = 
    string.chars(s) 
    |> list.reverse 
    |> (xs) => list.join(xs, "")
```
