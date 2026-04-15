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
    false => err(format!("must be positive: {}", n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match n >= lo && n <= hi {
    true => ok(n),
    false => err(format!("out of range: {}", n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> flat_map(validate_positive)
  |> flat_map(fn(n) => validate_range(n, 1, 100))
  |> map(fn(n) => format!("valid: {}", n.to_string()))

This code defines the four functions as specified. The `process` function chains the `parse_int`, `validate_positive`, and `validate_range` functions together using `flat_map` to handle errors. The final `map` function transforms the success value into a string
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
23 |   |> map(fn(n) => format!("valid: {}", n.to_string()))
   |            ^
error[E003]: undefined variable 'format'
  --> /tmp/dojo-result-pipeline-0.almd:10:18
  in variable format
  hint: Check the variable name
   |
10 |     false => err(format!("must be positive: {}", n))
   |                  ^^^^^^

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
    false => err(string.format!("must be positive: {}", n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match n >= lo and n < hi {
    true => ok(n),
    false => err(string.format!("out of range: {}", n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> flat_map(validate_positive)
  |> flat_map(fn(n) => validate_range(n, 1, 100))
  |> map(fn(n) => string.format!("valid: {}", n.to_string()))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected expression at line 22:15 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:22:15
   |
22 |   |> flat_map(fn(n) => validate_range(n, 1, 100))
   |               ^
error: Expected function name at line 22:17 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:22:17
   |
22 |   |> flat_map(fn(n) => validate_range(n, 1, 100))
   |                 ^
error: Expected function name at line 23:12 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:23:12
   |
23 |   |> map(fn(n) => string.format!("valid: {}", n.to_string()))
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

5 error(s) found
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
    false => err(string.to_string("must be positive: ") + n.to_string())
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match n >= lo and n <= hi {
    true => ok(n),
    false => err(string.to_string("out of range: ") + n.to_string())
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> flat_map(validate_positive)
  |> flat_map(fn(n) => validate_range(n, 1, 100))
  |> map(fn(n) => string.to_string("valid: ") + n.to_string())
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
23 |   |> map(fn(n) => string.to_string("valid: ") + n.to_string())
   |            ^
error[E002]: undefined function 'string.to_string'
  --> /tmp/dojo-result-pipeline-2.almd:10:35
  in call to string.to_string()
  hint: No function 'to_string' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
10 |     false => err(string.to_string("must be positive: ") + n.to_string())
   |                                   ^^^^^^^^^^^^^^^^^^^^
error[E002]: undefined function 'string.to_string'
  --> /tmp/dojo-result-pipeline-2.almd:16:35
  in call to string.to_string()
  hint: No function 'to_string' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
16 |     false => err(string.to_string("out of range: ") + n.to_string())
   |                                   ^^^^^^^^^^^^^^^^

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
    ok(n) => ok(n),
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  match n > 0 {
    true => ok(n),
    false => err(string.from_string("must be positive: ") + n.to_string())
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match n >= lo and n < hi {
    true => ok(n),
    false => err(string.from_string("out of range: ") + n.to_string())
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> flat_map(validate_positive)
  |> flat_map(fn(n) => validate_range(n, 1, 100))
  |> map(fn(n) => string.to_upper(string.from_string("valid: ") + n.to_string()))
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
23 |   |> map(fn(n) => string.to_upper(string.from_string("valid: ") + n.to_string()))
   |            ^
error[E002]: undefined function 'string.from_string'
  --> /tmp/dojo-result-pipeline-3.almd:10:37
  in call to string.from_string()
  hint: No function 'from_string' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
10 |     false => err(string.from_string("must be positive: ") + n.to_string())
   |                                     ^^^^^^^^^^^^^^^^^^^^
error[E002]: undefined function 'string.from_string'
  --> /tmp/dojo-result-pipeline-3.almd:16:37
  in call to string.from_string()
  hint: No function 'from_string' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
16 |     false => err(string.from_string("out of range: ") + n.to_string())
   |                                     ^^^^^^^^^^^^^^^^

5 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
