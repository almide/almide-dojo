# bounded-total

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = 
  fan.bounded(compute.ms(100)) { 
    fn sum_list(xs: List[Int], acc: Int, i: Int) -> Int = 
      if i >= list.len(xs) then acc
      else sum_list(xs, acc + list.get(xs, i) ?? 0, i + 1)
    sum_list(xs, 0, 0)
  } ?? -1
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-bounded-total-0.almd:3:5
  in nested fn
  here: fn sum_list(xs: List[Int], acc: Int, i: Int) -> Int =
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
3 |     fn sum_list(xs: List[Int], acc: Int, i: Int) -> Int =
  |     ^^

1 error(s) found
FAILED: /tmp/dojo-bounded-total-0.almd
  parse error: `fn` cannot be declared inside a function body
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-bounded-total-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
effect fn safe_total(xs: List[Int]) -> Int = 
  fan.bounded(compute.ms(100)) { 
    sum_list(xs, 0, 0)
  } ?? -1

fn sum_list(xs: List[Int], acc: Int, i: Int) -> Int = 
  if i >= list.len(xs) then acc
  else sum_list(xs, acc + list.get(xs, i) ?? 0, i + 1)
```
