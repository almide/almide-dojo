# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E0308`

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  match int.parse(s) {
    ok(n) => ok(n)
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn r => validate_positive(r))
  |> result.flat_map(fn r => validate_range(r, 1, 100))
  |> result.map(fn n => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: '&&' is not valid in Almide at line 11:14
  --> /tmp/dojo-result-pipeline-0.almd:11:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
11 |   if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
   |              ^
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:15:22
   |
15 |   |> result.flat_map(fn r => validate_positive(r))
   |                      ^
error: Expected LParen at line 15:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:15:27
   |
15 |   |> result.flat_map(fn r => validate_positive(r))
   |                           ^
error: Expected LParen at line 16:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:16:27
   |
16 |   |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                           ^
error: Expected LParen at line 17:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:17:22
   |
17 |   |> result.map(fn n => "valid: " + int.to_string(n))
   |                      ^

5 error(s) found
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  match int.parse(s) {
    ok(n) => ok(n)
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map((r) => validate_positive(r))
  |> result.flat_map((r) => validate_range(r, 1, 100))
  |> result.map((n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
FAILED: /tmp/dojo-result-pipeline-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map((r) => validate_positive(r))
  |> result.flat_map((r) => validate_range(r, 1, 100))
  |> result.map((n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
FAILED: /tmp/dojo-result-pipeline-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map((r) => match r {
    ok(n) => validate_positive(n),
    err(e) => err(e)
  })
  |> result.flat_map((r) => match r {
    ok(n) => validate_range(n, 1, 100),
    err(e) => err(e)
  })
  |> result.map((n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
Compile error for /tmp/dojo-result-pipeline-3.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0308]: mismatched types
   --> <generated.rs>:401:9
    |
400 |     almide_rt_result_map(almide_rt_result_flat_map(parse_int(input), move |r| almide_rt_result_flat_map(match r {
    |                                                                                                               - this expression has type `i64`
401 |         Ok(n) => validate_positive(n),
    |         ^^^^^ expected `i64`, found `Result<_, _>`
    |
    = note: expected type `i64`
               found enum `Result<_, _>`


error[E0308]: mismatched types
   --> <generated.rs>:402:9
    |
400 |     almide_rt_result_map(almide_rt_result_flat_map(parse_int(input), move |r| almide_rt_result_flat_map(match r {
    |                                                                                                               - this expression has type `i64`
401 |         Ok(n) => validate_positive(n),
402 |         Err(e) => Err(e),
    |         ^^^^^^ expected `i64`, found `Result<_, _>`
    |
    = note: expected type `i64`
               found enum `Result<_, _>`


error[E0308]: mismatched types
   --> <generated.rs>:404:9
    |
403 |     }, move |r| match r {
    |                       - this expression has type `i64`
404 |         Ok(n) => validate_range(n, 1i64, 100i64),
    |         ^^^^^ expected `i64`, found `Result<_, _>`
    |
    = note: expected type `i64`
               found enum `Result<_, _>`


error[E0308]: mismatched types
   --> <generated.rs>:405:9
    |
403 |     }, move |r| match r {
    |                       - this expression has type `i64`
404 |         Ok(n) => validate_range(n, 1i64, 100i64),
405 |         Err(e) => Err(e),
    |         ^^^^^^ expected `i64`, found `Result<_, _>`
    |
    = note: expected type `i64`
               found enum `Result<_, _>`


error: could not compile `almide-generated` (bin "almide-generated" test) due to 4 previous errors; 2 warnings emitted

FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
