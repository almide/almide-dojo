# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  match int.parse(s) {
    ok(n) => ok(n)
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  match (n > 0) {
    true => ok(n)
    false => err("must be positive: " + int.to_string(n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match (lo <= n && n <= hi) {
    true => ok(n)
    false => err("out of range: " + int.to_string(n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn r => validate_positive(r))
  |> result.flat_map(fn r => validate_range(r, 1, 100))
  |> result.map(fn n => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: '&&' is not valid in Almide at line 14:18
  --> /tmp/dojo-result-pipeline-0.almd:14:18
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
14 |   match (lo <= n && n <= hi) {
   |                  ^
error: Expected expression at line 21:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:21:22
   |
21 |   |> result.flat_map(fn r => validate_positive(r))
   |                      ^
error: Expected LParen at line 21:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:21:27
   |
21 |   |> result.flat_map(fn r => validate_positive(r))
   |                           ^
error: Expected LParen at line 22:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:22:27
   |
22 |   |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                           ^
error: Expected LParen at line 23:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:23:22
   |
23 |   |> result.map(fn n => "valid: " + int.to_string(n))
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
  match n > 0 {
    true => ok(n)
    false => err("must be positive: " + int.to_string(n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match (lo <= n and n <= hi) {
    true => ok(n)
    false => err("out of range: " + int.to_string(n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn r => validate_positive(r))
  |> result.flat_map(fn r => validate_range(r, 1, 100))
  |> result.map(fn n => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected expression at line 21:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:21:22
   |
21 |   |> result.flat_map(fn r => validate_positive(r))
   |                      ^
error: Expected LParen at line 21:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:21:27
   |
21 |   |> result.flat_map(fn r => validate_positive(r))
   |                           ^
error: Expected LParen at line 22:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:22:27
   |
22 |   |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                           ^
error: Expected LParen at line 23:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:23:22
   |
23 |   |> result.map(fn n => "valid: " + int.to_string(n))
   |                      ^

4 error(s) found
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  match int.parse(s) {
    ok(n) => ok(n)
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if (lo <= n and n <= hi) then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(validate_positive)
  |> result.flat_map(fn r => validate_range(r, 1, 100))
  |> result.map(fn n => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Expected expression at line 16:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:16:22
   |
16 |   |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                      ^
error: Expected LParen at line 16:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:16:27
   |
16 |   |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                           ^
error: Expected LParen at line 17:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:17:22
   |
17 |   |> result.map(fn n => "valid: " + int.to_string(n))
   |                      ^

3 error(s) found
Compile error for /tmp/dojo-result-pipeline-2.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  match int.parse(s) {
    ok(n) => ok(n)
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if (lo <= n and n <= hi) then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(validate_positive)
  |> result.flat_map(validate_range(1, 100))
  |> result.map(fn n => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: Expected expression at line 17:17 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:17:17
   |
17 |   |> result.map(fn n => "valid: " + int.to_string(n))
   |                 ^
error: Expected LParen at line 17:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:17:22
   |
17 |   |> result.map(fn n => "valid: " + int.to_string(n))
   |                      ^

2 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
