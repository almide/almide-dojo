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
    ok(n) => ok(n),
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  match n > 0 {
    true => ok(n),
    false => err("must be positive: " + int.to_string(n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match n >= lo && n <= hi {
    true => ok(n),
    false => err("out of range: " + int.to_string(n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> flat_map(validate_positive)
  |> flat_map(fn(n) => validate_range(n, 1, 100))
  |> map(fn(n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: '&&' is not valid in Almide at line 14:17
  --> /tmp/dojo-result-pipeline-0.almd:14:17
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
14 |   match n >= lo && n <= hi {
   |                 ^
error: Expected expression at line 22:15 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:22:15
   |
22 |   |> flat_map(fn(n) => validate_range(n, 1, 100))
   |               ^
error: Expected function name at line 22:17 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:22:17
   |
22 |   |> flat_map(fn(n) => validate_range(n, 1, 100))
   |                 ^
error: Expected function name at line 23:12 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:23:12
   |
23 |   |> map(fn(n) => "valid: " + int.to_string(n))
   |            ^

4 error(s) found
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  match int.parse(s) {
    ok(n) => ok(n),
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  match n > 0 {
    true => ok(n),
    false => err("must be positive: " + int.to_string(n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match n >= lo and n < hi {
    true => ok(n),
    false => err("out of range: " + int.to_string(n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> flat_map(validate_positive)
  |> flat_map(validate_range(1, 100, _))
  |> map(fn(n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected expression at line 23:10 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:23:10
   |
23 |   |> map(fn(n) => "valid: " + int.to_string(n))
   |          ^
error: Expected function name at line 23:12 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:23:12
   |
23 |   |> map(fn(n) => "valid: " + int.to_string(n))
   |            ^

2 error(s) found
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  match int.parse(s) {
    ok(n) => ok(n),
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  match n > 0 {
    true => ok(n),
    false => err("must be positive: " + int.to_string(n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match n >= lo and n <= hi {
    true => ok(n),
    false => err("out of range: " + int.to_string(n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> flat_map(validate_positive)
  |> flat_map(fn(r) => validate_range(r, 1, 100))
  |> map(fn(n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Expected expression at line 22:15 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:22:15
   |
22 |   |> flat_map(fn(r) => validate_range(r, 1, 100))
   |               ^
error: Expected function name at line 22:17 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:22:17
   |
22 |   |> flat_map(fn(r) => validate_range(r, 1, 100))
   |                 ^
error: Expected function name at line 23:12 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:23:12
   |
23 |   |> map(fn(n) => "valid: " + int.to_string(n))
   |            ^

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
    ok(n) => ok(n),
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  match n > 0 {
    true => ok(n),
    false => err("must be positive: " + int.to_string(n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match n >= lo and n < hi {
    true => ok(n),
    false => err("out of range: " + int.to_string(n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> flat_map(validate_positive)
  |> flat_map(validate_range(1, 100, _))
  |> map(fn(n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: Expected expression at line 23:10 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:23:10
   |
23 |   |> map(fn(n) => "valid: " + int.to_string(n))
   |          ^
error: Expected function name at line 23:12 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:23:12
   |
23 |   |> map(fn(n) => "valid: " + int.to_string(n))
   |            ^

2 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
