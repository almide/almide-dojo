# any-candidates

- **model**: `cli:claude`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
import fan

fn parse_port(n: Int) -> Result[Int, String] =
  if n >= 1024 && n <= 65535 then ok(n) else err("out of range")

effect fn first_valid_port(candidates: List[Int]) -> Int =
  fan.any(candidates, (x) => parse_port(x)) ?? -1
```

**Diagnostic:**

```
error: Expected identifier at line 1:8 (got Fan 'fan')
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-any-candidates-0.almd:1:8
  here: import fan
  |
1 | import fan
  |        ^
error: '&&' is not valid in Almide at line 4:16
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-any-candidates-0.almd:4:16
  here: if n >= 1024 && n <= 65535 then ok(n) else err("out of range")
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
4 |   if n >= 1024 && n <= 65535 then ok(n) else err("out of range")
  |                ^

2 error(s) found
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-any-candidates-0.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-any-candidates-0.almd

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn parse_port(n: Int) -> Result[Int, String] =
  if n >= 1024 and n <= 65535 then ok(n) else err("out of range")

effect fn first_valid_port(candidates: List[Int]) -> Int =
  fan.any(candidates, (x) => parse_port(x)) ?? -1
```
