# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> result.map_err(fn e => "not a number: " + e) 
  |> result.flat_map(parse_int) 
  |> validate_positive 
  |> result.map_err(fn e => "must be positive: " + e) 
  |> validate_range(1, 100) 
  |> result.map_err(fn e => "out of range: " + e) 
  |> result.map(fn n => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: '&&' is not valid in Almide at line 7:14
  --> /tmp/dojo-result-pipeline-0.almd:7:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
7 |   if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |              ^
error: Expected expression at line 11:21 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:11:21
   |
11 |   |> result.map_err(fn e => "not a number: " + e)
   |                     ^
error: Expected LParen at line 11:26 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:11:26
   |
11 |   |> result.map_err(fn e => "not a number: " + e)
   |                          ^
error: Expected LParen at line 14:26 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:14:26
   |
14 |   |> result.map_err(fn e => "must be positive: " + e)
   |                          ^
error: Expected LParen at line 16:26 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:16:26
   |
16 |   |> result.map_err(fn e => "out of range: " + e)
   |                          ^
error: Expected LParen at line 17:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:17:22
   |
17 |   |> result.map(fn n => "valid: " + int.to_string(n))
   |                      ^

6 error(s) found
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> result.map_err(fn e => "not a number: " + e) 
  |> result.flat_map(validate_positive) 
  |> result.map_err(fn e => "must be positive: " + e) 
  |> result.flat_map(fn n => validate_range(n, 1, 100)) 
  |> result.map_err(fn e => "out of range: " + e) 
  |> result.map(fn n => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected expression at line 11:21 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:11:21
   |
11 |   |> result.map_err(fn e => "not a number: " + e)
   |                     ^
error: Expected LParen at line 11:26 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:11:26
   |
11 |   |> result.map_err(fn e => "not a number: " + e)
   |                          ^
error: Expected LParen at line 13:26 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:13:26
   |
13 |   |> result.map_err(fn e => "must be positive: " + e)
   |                          ^
error: Expected LParen at line 14:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:14:27
   |
14 |   |> result.flat_map(fn n => validate_range(n, 1, 100))
   |                           ^
error: Expected LParen at line 15:26 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:15:26
   |
15 |   |> result.map_err(fn e => "out of range: " + e)
   |                          ^
error: Expected LParen at line 16:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:16:22
   |
16 |   |> result.map(fn n => "valid: " + int.to_string(n))
   |                      ^

6 error(s) found
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> result.map_err(fn e => "not a number: " + e)
  |> result.flat_map(validate_positive)
  |> result.map_err(fn e => "must be positive: " + e)
  |> result.flat_map(fn n => validate_range(n, 1, 100))
  |> result.map_err(fn e => "out of range: " + e)
  |> result.map(fn n => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Expected expression at line 11:21 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:11:21
   |
11 |   |> result.map_err(fn e => "not a number: " + e)
   |                     ^
error: Expected LParen at line 11:26 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:11:26
   |
11 |   |> result.map_err(fn e => "not a number: " + e)
   |                          ^
error: Expected LParen at line 13:26 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:13:26
   |
13 |   |> result.map_err(fn e => "must be positive: " + e)
   |                          ^
error: Expected LParen at line 14:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:14:27
   |
14 |   |> result.flat_map(fn n => validate_range(n, 1, 100))
   |                           ^
error: Expected LParen at line 15:26 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:15:26
   |
15 |   |> result.map_err(fn e => "out of range: " + e)
   |                          ^
error: Expected LParen at line 16:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:16:22
   |
16 |   |> result.map(fn n => "valid: " + int.to_string(n))
   |                      ^

6 error(s) found
Compile error for /tmp/dojo-result-pipeline-2.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> result.map_err(fn e => "not a number: " + e)
  |> result.flat_map(fn r => validate_positive(r))
  |> result.map_err(fn e => "must be positive: " + e)
  |> result.flat_map(fn r => validate_range(r, 1, 100))
  |> result.map(fn n => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: Expected expression at line 11:21 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:11:21
   |
11 |   |> result.map_err(fn e => "not a number: " + e)
   |                     ^
error: Expected LParen at line 11:26 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:11:26
   |
11 |   |> result.map_err(fn e => "not a number: " + e)
   |                          ^
error: Expected LParen at line 12:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:12:27
   |
12 |   |> result.flat_map(fn r => validate_positive(r))
   |                           ^
error: Expected LParen at line 13:26 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:13:26
   |
13 |   |> result.map_err(fn e => "must be positive: " + e)
   |                          ^
error: Expected LParen at line 14:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:14:27
   |
14 |   |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                           ^
error: Expected LParen at line 15:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:15:22
   |
15 |   |> result.map(fn n => "valid: " + int.to_string(n))
   |                      ^

6 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
