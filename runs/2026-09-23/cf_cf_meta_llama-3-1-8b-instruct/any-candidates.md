# any-candidates

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_port(n: Int) -> Result[Int, String] = 
  if 1024 <= n && n <= 65535 then ok(n) else err("out of range")

effect fn first_valid_port(candidates: List[Int]) -> Int = 
  fan.any(candidates, (x) => parse_port(x) ?? -1)
```

**Diagnostic:**

```
error: '&&' is not valid in Almide at line 2:16
  --> /tmp/dojo-any-candidates-0.almd:2:16
  here: if 1024 <= n && n <= 65535 then ok(n) else err("out of range")
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
2 |   if 1024 <= n && n <= 65535 then ok(n) else err("out of range")
  |                ^
error[E001]: type mismatch in fan.any callback: expected fn(Int) -> Int but got effect fn(Int) -> Result[Int, String]
  --> /tmp/dojo-any-candidates-0.almd:5:48
  in fan.any callback
  here: fan.any(candidates, (x) => parse_port(x) ?? -1)
  hint: Fix the expression type or change the expected type
  |
5 |   fan.any(candidates, (x) => parse_port(x) ?? -1)
  |                                                ^

2 error(s) found
FAILED: /tmp/dojo-any-candidates-0.almd
Compile error for /tmp/dojo-any-candidates-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn parse_port(n: Int) -> Result[Int, String] = 
  if 1024 <= n and n <= 65535 then ok(n) else err("out of range")

effect fn first_valid_port(candidates: List[Int]) -> Int = 
  fan.any(candidates, (x) => parse_port(x).unwrap_or(-1))
```

**Diagnostic:**

```
error[E001]: type mismatch in fan.any callback: expected fn(Int) -> Int but got effect fn(Int) -> Result[Int, String]
  --> /tmp/dojo-any-candidates-1.almd:5:41
  in fan.any callback
  here: fan.any(candidates, (x) => parse_port(x).unwrap_or(-1))
  hint: Fix the expression type or change the expected type
  |
5 |   fan.any(candidates, (x) => parse_port(x).unwrap_or(-1))
  |                                         ^

1 error(s) found
FAILED: /tmp/dojo-any-candidates-1.almd
Compile error for /tmp/dojo-any-candidates-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn parse_port(n: Int) -> Result[Int, String] = 
  if 1024 <= n and n <= 65535 then ok(n) else err("out of range")

effect fn first_valid_port(candidates: List[Int]) -> Int = 
  fan.any(candidates, (x) => parse_port(x) ?? -1)
```

**Diagnostic:**

```
error[E001]: type mismatch in fan.any callback: expected fn(Int) -> Int but got effect fn(Int) -> Result[Int, String]
  --> /tmp/dojo-any-candidates-2.almd:5:48
  in fan.any callback
  here: fan.any(candidates, (x) => parse_port(x) ?? -1)
  hint: Fix the expression type or change the expected type
  |
5 |   fan.any(candidates, (x) => parse_port(x) ?? -1)
  |                                                ^

1 error(s) found
FAILED: /tmp/dojo-any-candidates-2.almd
Compile error for /tmp/dojo-any-candidates-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn parse_port(n: Int) -> Result[Int, String] = 
  if 1024 <= n and n <= 65535 then ok(n) else err("out of range")

effect fn first_valid_port(candidates: List[Int]) -> Int = 
  fan.any(candidates, (x) => parse_port(x).unwrap_or(-1))
```

**Diagnostic:**

```
error[E001]: type mismatch in fan.any callback: expected fn(Int) -> Int but got effect fn(Int) -> Result[Int, String]
  --> /tmp/dojo-any-candidates-3.almd:5:41
  in fan.any callback
  here: fan.any(candidates, (x) => parse_port(x).unwrap_or(-1))
  hint: Fix the expression type or change the expected type
  |
5 |   fan.any(candidates, (x) => parse_port(x).unwrap_or(-1))
  |                                         ^

1 error(s) found
FAILED: /tmp/dojo-any-candidates-3.almd
Compile error for /tmp/dojo-any-candidates-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
