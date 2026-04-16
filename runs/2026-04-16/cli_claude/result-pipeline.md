# result-pipeline

- **model**: `cli:claude`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = match int.parse(s) {
  ok(n) => ok(n),
  err(_) => err("not a number: " + s)
}

fn validate_positive(n: Int) -> Result[Int, String] = if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] =
  result.map(
    result.flat_map(
      result.flat_map(parse_int(input), (n) => validate_positive(n)),
      (n) => validate_range(n, 1, 100)
    ),
    (n) => "valid: " + int.to_string(n)
  )
```

**Diagnostic:**

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-result-pipeline-0.almd
error: '&&' is not valid in Almide at line 8:81
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-result-pipeline-0.almd:8:81
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
8 | fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |                                                                                 ^

1 error(s) found
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-result-pipeline-0.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-result-pipeline-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn parse_int(s: String) -> Result[Int, String] = match int.parse(s) {
  ok(n) => ok(n),
  err(_) => err("not a number: " + s)
}

fn validate_positive(n: Int) -> Result[Int, String] = if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] =
  result.map(
    result.flat_map(
      result.flat_map(parse_int(input), (n) => validate_positive(n)),
      (n) => validate_range(n, 1, 100)
    ),
    (n) => "valid: " + int.to_string(n)
  )
```
