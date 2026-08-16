# any-candidates

- **model**: `cli:claude`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_port(n: Int) -> Result[Int, String] =
  if n >= 1024 && n <= 65535 then ok(n) else err("out of range")

effect fn first_valid_port(candidates: List[Int]) -> Int =
  fan.any(candidates, (c) => parse_port(c)) ?? -1
```

**Diagnostic:**

```
error: '&&' is not valid in Almide at line 2:16
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-any-candidates-0.almd:2:16
  here: if n >= 1024 && n <= 65535 then ok(n) else err("out of range")
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
2 |   if n >= 1024 && n <= 65535 then ok(n) else err("out of range")
  |                ^

1 error(s) found
FAILED: /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-any-candidates-0.almd
Compile error for /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-any-candidates-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn parse_port(n: Int) -> Result[Int, String] =
  if n >= 1024 and n <= 65535 then ok(n) else err("out of range")

effect fn first_valid_port(candidates: List[Int]) -> Int =
  fan.any(candidates, (c) => parse_port(c)) ?? -1
```
