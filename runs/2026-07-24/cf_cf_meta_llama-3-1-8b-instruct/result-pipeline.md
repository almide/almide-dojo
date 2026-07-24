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
    ok(n) => ok(n)
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  match n > 0 {
    true => ok(n)
    false => err(format("must be positive: {}", n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match n >= lo && n <= hi {
    true => ok(n)
    false => err(format("out of range: {}", n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> result.flat_map(fn x => validate_positive(x)) 
  |> result.flat_map(fn x => validate_range(x, 1, 100)) 
  |> result.map(fn x => format("valid: {}", x))
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
21 |   |> result.flat_map(fn x => validate_positive(x))
   |                      ^
error: Expected LParen at line 21:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:21:27
   |
21 |   |> result.flat_map(fn x => validate_positive(x))
   |                           ^
error: Expected LParen at line 22:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:22:27
   |
22 |   |> result.flat_map(fn x => validate_range(x, 1, 100))
   |                           ^
error: Expected LParen at line 23:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:23:22
   |
23 |   |> result.map(fn x => format("valid: {}", x))
   |                      ^
error[E002]: undefined function 'format'
  --> /tmp/dojo-result-pipeline-0.almd:10:49
  in call to format()
  hint: Check the function name
   |
10 |     false => err(format("must be positive: {}", n))
   |                                                 ^

6 error(s) found
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
  match n >= lo and n <= hi {
    true => ok(n)
    false => err("out of range: " + int.to_string(n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> result.flat_map(fn x => validate_positive(x)) 
  |> result.flat_map(fn x => validate_range(x, 1, 100)) 
  |> result.map(fn x => "valid: " + int.to_string(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected expression at line 21:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:21:22
   |
21 |   |> result.flat_map(fn x => validate_positive(x))
   |                      ^
error: Expected LParen at line 21:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:21:27
   |
21 |   |> result.flat_map(fn x => validate_positive(x))
   |                           ^
error: Expected LParen at line 22:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:22:27
   |
22 |   |> result.flat_map(fn x => validate_range(x, 1, 100))
   |                           ^
error: Expected LParen at line 23:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:23:22
   |
23 |   |> result.map(fn x => "valid: " + int.to_string(x))
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
  match n > 0 {
    true => ok(n)
    false => err("must be positive: " + int.to_string(n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match n >= lo and n <= hi {
    true => ok(n)
    false => err("out of range: " + int.to_string(n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> result.flat_map(fn x => validate_positive(x)) 
  |> result.flat_map(fn x => validate_range(x, 1, 100)) 
  |> result.map(fn x => "valid: " + int.to_string(x))

// corrected version with lambda
fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> result.flat_map(lambda x => validate_positive(x)) 
  |> result.flat_map
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Expected expression at line 21:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:21:22
   |
21 |   |> result.flat_map(fn x => validate_positive(x))
   |                      ^
error: Expected LParen at line 21:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:21:27
   |
21 |   |> result.flat_map(fn x => validate_positive(x))
   |                           ^
error: Expected LParen at line 22:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:22:27
   |
22 |   |> result.flat_map(fn x => validate_range(x, 1, 100))
   |                           ^
error: Expected LParen at line 23:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:23:22
   |
23 |   |> result.map(fn x => "valid: " + int.to_string(x))
   |                      ^
error: 'lambda' is not valid in Almide at line 28:22
  --> /tmp/dojo-result-pipeline-2.almd:28:22
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
28 |   |> result.flat_map(lambda x => validate_positive(x))
   |                      ^

5 error(s) found
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
  match n > 0 {
    true => ok(n)
    false => err("must be positive: " + int.to_string(n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match n >= lo and n <= hi {
    true => ok(n)
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
Compiling /tmp/dojo-result-pipeline-3.almd
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
