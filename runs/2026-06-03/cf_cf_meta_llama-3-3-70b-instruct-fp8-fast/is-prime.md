# is-prime

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(
    list.range(2, int.to_float(n).|> math.sqrt().|> float.to_int() + 1),
    (x) => n % x != 0
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Expected name at line 4:35 (got PipeArrow '|>')
  --> /tmp/dojo-is-prime-0.almd:4:35
  |
4 |     list.range(2, int.to_float(n).|> math.sqrt().|> float.to_int() + 1),
  |                                   ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(
    list.range(2, int.to_float(n) |> math.sqrt() |> float.to_int() + 1),
    (x) => n % x != 0
  )
```
