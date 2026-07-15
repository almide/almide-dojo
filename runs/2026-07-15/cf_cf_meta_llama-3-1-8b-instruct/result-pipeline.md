# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
    |> result.flat_map(fn(x) => validate_positive(x)) 
    |> result.flat_map(fn(x) => validate_range(x, 1, 100)) 
    |> result.map(fn(x) => "valid: " + int.to_string(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: '&&' is not valid in Almide at line 8:14
  --> /tmp/dojo-result-pipeline-0.almd:8:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
8 |   if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |              ^
error: Expected expression at line 12:24 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:12:24
   |
12 |     |> result.flat_map(fn(x) => validate_positive(x))
   |                        ^
error: Expected function name at line 12:26 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:12:26
   |
12 |     |> result.flat_map(fn(x) => validate_positive(x))
   |                          ^
error: Expected function name at line 13:26 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:13:26
   |
13 |     |> result.flat_map(fn(x) => validate_range(x, 1, 100))
   |                          ^
error: Expected function name at line 14:21 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:14:21
   |
14 |     |> result.map(fn(x) => "valid: " + int.to_string(x))
   |                     ^

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
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
    |> result.flat_map((x) => validate_positive(x)) 
    |> result.flat_map((x) => validate_range(x, 1, 100)) 
    |> result.map((x) => "valid: " + int.to_string(x))
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
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
    |> result.flat_map((x) => validate_positive(x)) 
    |> result.flat_map((x) => validate_range(x, 1, 100)) 
    |> result.map((x) => "valid: " + int.to_string(x))
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
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
    |> result.flat_map((x) => validate_positive(x)) 
    |> result.flat_map((x) => validate_range(x, 1, 100)) 
    |> result.map((x) => "valid: " + int.to_string(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
