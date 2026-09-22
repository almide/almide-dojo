# result-pipeline

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] =
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] =
  if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] =
  result.flat_map(parse_int(input), (n) =>
    result.flat_map(validate_positive(n), (n) =>
      result.flat_map(validate_range(n, 1, 100), (n) =>
        result.map(ok(n), (n) => "valid: " + int.to_string(n))
      )
    )
  )
```

**Diagnostic:**

```
error: '&&' is not valid in Almide at line 7:14
  --> /tmp/dojo-result-pipeline-0.almd:7:14
  here: if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
7 |   if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |              ^

1 error(s) found
FAILED: /tmp/dojo-result-pipeline-0.almd
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] =
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] =
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] =
  result.flat_map(parse_int(input), (n) =>
    result.flat_map(validate_positive(n), (n) =>
      result.flat_map(validate_range(n, 1, 100), (n) =>
        result.map(ok(n), (n) => "valid: " + int.to_string(n))
      )
    )
  )
```

**Diagnostic:**

```
FAILED: /tmp/dojo-result-pipeline-1.almd
  test: parse_int invalid
  at:   /tmp/dojo-result-pipeline-1.almd:20
  expected: Err("not a number: abc")
  found:    Err("invalid digit found in string")
  test: process invalid parse
  at:   /tmp/dojo-result-pipeline-1.almd:28
  expected: Err("not a number: abc")
  found:    Err("invalid digit found in string")

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (PASS)

```almide
fn parse_int(s: String) -> Result[Int, String] =
  result.map_err(int.parse(s), (e) => "not a number: " + s)

fn validate_positive(n: Int) -> Result[Int, String] =
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] =
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] =
  result.flat_map(parse_int(input), (n) =>
    result.flat_map(validate_positive(n), (n) =>
      result.flat_map(validate_range(n, 1, 100), (n) =>
        result.map(ok(n), (n) => "valid: " + int.to_string(n))
      )
    )
  )
```
