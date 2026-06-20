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
    false => err(format!("must be positive: {}", n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match (n >= lo && n <= hi) {
    true => ok(n)
    false => err(format!("out of range: {}", n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> flat_map(validate_positive)
  |> flat_map(validate_range(1, 100))
  |> map(fn(n) => format!("valid: {}", n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: '&&' is not valid in Almide at line 14:18
  --> /tmp/dojo-result-pipeline-0.almd:14:18
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
14 |   match (n >= lo && n <= hi) {
   |                  ^
error: Expected expression at line 23:10 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:23:10
   |
23 |   |> map(fn(n) => format!("valid: {}", n))
   |          ^
error: Expected function name at line 23:12 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:23:12
   |
23 |   |> map(fn(n) => format!("valid: {}", n))
   |            ^
error[E003]: undefined variable 'format'
  --> /tmp/dojo-result-pipeline-0.almd:10:18
  in variable format
  hint: Check the variable name
   |
10 |     false => err(format!("must be positive: {}", n))
   |                  ^^^^^^

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
    ok(n) => ok(n)
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  match (n > 0) {
    true => ok(n)
    false => err(string.format!("must be positive: {}", n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match (n >= lo and n <= hi) {
    true => ok(n)
    false => err(string.format!("out of range: {}", n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> flat_map(validate_positive)
  |> flat_map(validate_range(1, 100))
  |> map(fn(n) => string.format!("valid: {}", n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected expression at line 23:10 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:23:10
   |
23 |   |> map(fn(n) => string.format!("valid: {}", n))
   |          ^
error: Expected function name at line 23:12 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:23:12
   |
23 |   |> map(fn(n) => string.format!("valid: {}", n))
   |            ^
error[E003]: undefined variable 'string'
  --> /tmp/dojo-result-pipeline-1.almd:10:18
  in variable string
  hint: Check the variable name
   |
10 |     false => err(string.format!("must be positive: {}", n))
   |                  ^^^^^^
error[E003]: undefined variable 'string'
  --> /tmp/dojo-result-pipeline-1.almd:16:18
  in variable string
  hint: Check the variable name
   |
16 |     false => err(string.format!("out of range: {}", n))
   |                  ^^^^^^

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
  match (n > 0) {
    true => ok(n)
    false => err(string.format!("must be positive: {}", n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match (n >= lo and n <= hi) {
    true => ok(n)
    false => err(string.format!("out of range: {}", n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> flat_map(validate_positive)
  |> flat_map(fn(n) => validate_range(n, 1, 100))
  |> map(fn(n) => string.format!("valid: {}", int.to_string(n)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Expected expression at line 22:15 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:22:15
   |
22 |   |> flat_map(fn(n) => validate_range(n, 1, 100))
   |               ^
error: Expected function name at line 22:17 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:22:17
   |
22 |   |> flat_map(fn(n) => validate_range(n, 1, 100))
   |                 ^
error: Expected function name at line 23:12 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:23:12
   |
23 |   |> map(fn(n) => string.format!("valid: {}", int.to_string(n)))
   |            ^
error[E003]: undefined variable 'string'
  --> /tmp/dojo-result-pipeline-2.almd:10:18
  in variable string
  hint: Check the variable name
   |
10 |     false => err(string.format!("must be positive: {}", n))
   |                  ^^^^^^
error[E003]: undefined variable 'string'
  --> /tmp/dojo-result-pipeline-2.almd:16:18
  in variable string
  hint: Check the variable name
   |
16 |     false => err(string.format!("out of range: {}", n))
   |                  ^^^^^^

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
  match (n > 0) {
    true => ok(n)
    false => err(string.format!("must be positive: {}", n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match (n >= lo and n <= hi) {
    true => ok(n)
    false => err(string.format!("out of range: {}", n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> flat_map(validate_positive)
  |> flat_map(fn(n) => validate_range(n, 1, 100))
  |> map(fn(n) => string.format!("valid: {}", int.to_string(n)))

fn string.format(s: String, args: List[Any]) -> String = 
  string.from_bytes(string.to_bytes(s) + list.map(args, fn(x) => int.to_string(x)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: Expected expression at line 22:15 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:22:15
   |
22 |   |> flat_map(fn(n) => validate_range(n, 1, 100))
   |               ^
error: Expected function name at line 22:17 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:22:17
   |
22 |   |> flat_map(fn(n) => validate_range(n, 1, 100))
   |                 ^
error: Expected function name at line 23:12 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:23:12
   |
23 |   |> map(fn(n) => string.format!("valid: {}", int.to_string(n)))
   |            ^
error: Expected LParen at line 25:10 (got Dot '.')
  --> /tmp/dojo-result-pipeline-3.almd:25:10
   |
25 | fn string.format(s: String, args: List[Any]) -> String =
   |          ^
error: Expected function name at line 26:59 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:26:59
   |
26 |   string.from_bytes(string.to_bytes(s) + list.map(args, fn(x) => int.to_string(x)))
   |                                                           ^
error[E003]: undefined variable 'string'
  --> /tmp/dojo-result-pipeline-3.almd:10:18
  in variable string
  hint: Check the variable name
   |
10 |     false => err(string.format!("must be positive: {}", n))
   |                  ^^^^^^
error[E003]: undefined variable 'string'
  --> /tmp/dojo-result-pipeline-3.almd:16:18
  in variable string
  hint: Check the variable name
   |
16 |     false => err(string.format!("out of range: {}", n))
   |                  ^^^^^^

7 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
