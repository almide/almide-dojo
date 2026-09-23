# result-pipeline

- **model**: `cf:@cf/zai-org/glm-5.3-flash`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] =
  result.map_err(int.parse(s), (e) => "not a number: " + s)

fn validate_positive(n: Int) -> Result[Int, String] =
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] =
  if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] =
  result.flat_map(parse_int(input), (n) =>
    result.flat_map(validate_positive(n), (m) =>
      result.map(validate_range(m, 1, 100), (k) => "valid: " + int.to_string(k))))
```

**Diagnostic:**

```
error: '&&' is not valid in Almide at line 8:14
  --> /tmp/dojo-result-pipeline-0.almd:8:14
  here: if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
8 |   if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |              ^

1 error(s) found
FAILED: /tmp/dojo-result-pipeline-0.almd
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn parse_int(s: String) -> Result[Int, String] =
  result.map_err(int.parse(s), (e) => "not a number: " + s)

fn validate_positive(n: Int) -> Result[Int, String] =
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] =
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] =
  result.flat_map(parse_int(input), (n) =>
    result.flat_map(validate_positive(n), (m) =>
      result.map(validate_range(m, 1, 100), (k) => "valid: " + int.to_string(k))))
```
