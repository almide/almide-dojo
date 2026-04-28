# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

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
  |> result.flat_map(fn(x) => validate_positive(x))
  |> result.flat_map(fn(x) => validate_range(x, 1, 100))
  |> result.map(fn(x) => "valid: " + int.to_string(x))
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
error: Expected expression at line 21:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:21:22
   |
21 |   |> result.flat_map(fn(x) => validate_positive(x))
   |                      ^
error: Expected function name at line 21:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:21:24
   |
21 |   |> result.flat_map(fn(x) => validate_positive(x))
   |                        ^
error: Expected function name at line 22:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:22:24
   |
22 |   |> result.flat_map(fn(x) => validate_range(x, 1, 100))
   |                        ^
error: Expected function name at line 23:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:23:19
   |
23 |   |> result.map(fn(x) => "valid: " + int.to_string(x))
   |                   ^

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
    ok(n) => ok(n),
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  match n > 0 {
    true => ok(n),
    false => err("must be positive: " + int.to_string(n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match (n >= lo) and (n < hi) {
    true => ok(n),
    false => err("out of range: " + int.to_string(n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn(x) => validate_positive(x))
  |> result.flat_map(fn(x) => validate_range(x, 1, 100))
  |> result.map(fn(x) => "valid: " + int.to_string(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected expression at line 21:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:21:22
   |
21 |   |> result.flat_map(fn(x) => validate_positive(x))
   |                      ^
error: Expected function name at line 21:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:21:24
   |
21 |   |> result.flat_map(fn(x) => validate_positive(x))
   |                        ^
error: Expected function name at line 22:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:22:24
   |
22 |   |> result.flat_map(fn(x) => validate_range(x, 1, 100))
   |                        ^
error: Expected function name at line 23:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:23:19
   |
23 |   |> result.map(fn(x) => "valid: " + int.to_string(x))
   |                   ^

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
    ok(n) => ok(n),
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  match n > 0 {
    true => ok(n),
    false => err("must be positive: " + int.to_string(n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match (n >= lo) and (n < hi) {
    true => ok(n),
    false => err("out of range: " + int.to_string(n))
  }

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
  match int.parse(s) {
    ok(n) => ok(n),
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  match n > 0 {
    true => ok(n),
    false => err("must be positive")
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match (n >= lo) and (n <= hi) {
    true => ok(n),
    false => err("out of range")
  }

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
