# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s)

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
error: '&&' is not valid in Almide at line 8:14
  --> /tmp/dojo-result-pipeline-0.almd:8:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
8 |   if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |              ^
error: Expected expression at line 12:24 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:12:24
   |
12 |     |> result.flat_map(fn r => validate_positive(r))
   |                        ^
error: Expected LParen at line 12:29 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:12:29
   |
12 |     |> result.flat_map(fn r => validate_positive(r))
   |                             ^
error: Expected LParen at line 13:29 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:13:29
   |
13 |     |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                             ^
error: Expected LParen at line 14:24 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:14:24
   |
14 |     |> result.map(fn n => "valid: " + int.to_string(n))
   |                        ^

5 error(s) found
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
    |> result.flat_map(fn r => validate_positive(r))
    |> result.flat_map(fn r => validate_range(r, 1, 100))
    |> result.map(fn n => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected expression at line 12:24 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:12:24
   |
12 |     |> result.flat_map(fn r => validate_positive(r))
   |                        ^
error: Expected LParen at line 12:29 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:12:29
   |
12 |     |> result.flat_map(fn r => validate_positive(r))
   |                             ^
error: Expected LParen at line 13:29 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:13:29
   |
13 |     |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                             ^
error: Expected LParen at line 14:24 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:14:24
   |
14 |     |> result.map(fn n => "valid: " + int.to_string(n))
   |                        ^

4 error(s) found
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed
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
    |> result.flat_map(fn r => validate_positive(r))
    |> result.flat_map(fn r => validate_range(r, 1, 100))
    |> result.map(fn n => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Expected expression at line 12:24 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:12:24
   |
12 |     |> result.flat_map(fn r => validate_positive(r))
   |                        ^
error: Expected LParen at line 12:29 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:12:29
   |
12 |     |> result.flat_map(fn r => validate_positive(r))
   |                             ^
error: Expected LParen at line 13:29 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:13:29
   |
13 |     |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                             ^
error: Expected LParen at line 14:24 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:14:24
   |
14 |     |> result.map(fn n => "valid: " + int.to_string(n))
   |                        ^

4 error(s) found
Compile error for /tmp/dojo-result-pipeline-2.almd:
compile failed
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
    |> result.flat_map(fn r => 
      match r {
        ok(n) => validate_positive(n)
        err(e) => err(e)
      })
    |> result.flat_map(fn r => 
      match r {
        ok(n) => validate_range(n, 1, 100)
        err(e) => err(e)
      })
    |> result.map(fn n => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: Expected expression at line 12:24 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:12:24
   |
12 |     |> result.flat_map(fn r =>
   |                        ^
error: Expected LParen at line 12:29 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:12:29
   |
12 |     |> result.flat_map(fn r =>
   |                             ^
error: Expected LParen at line 17:29 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:17:29
   |
17 |     |> result.flat_map(fn r =>
   |                             ^
error: Expected LParen at line 22:24 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:22:24
   |
22 |     |> result.map(fn n => "valid: " + int.to_string(n))
   |                        ^

4 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
