# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = {
  int.parse(s).map(r => r)
}

fn validate_positive(n: Int) -> Result[Int, String] = {
  if n > 0 then ok(n) else err("must be positive: " + n.to_string())
}

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = {
  if lo <= n && n <= hi then ok(n) else err("out of range: " + n.to_string())
}

fn process(input: String) -> Result[String, String] = {
  parse_int(input)
    .flat_map(r => validate_positive(r))
    .flat_map(r => validate_range(r, 1, 100))
    .map(r => "valid: " + r.to_string())
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-result-pipeline-0.almd:2:22
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   int.parse(s).map(r => r)
  |                      ^^
error: Lambda parameter must be wrapped in parentheses at line 2:22
  --> /tmp/dojo-result-pipeline-0.almd:2:22
  |
2 |   int.parse(s).map(r => r)
  |                      ^
error: '&&' is not valid in Almide at line 10:14
  --> /tmp/dojo-result-pipeline-0.almd:10:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
10 |   if lo <= n && n <= hi then ok(n) else err("out of range: " + n.to_string())
   |              ^
error: Expected expression at line 15:5 (got Dot '.')
  --> /tmp/dojo-result-pipeline-0.almd:15:5
   |
15 |     .flat_map(r => validate_positive(r))
   |     ^
error[E001]: type mismatch in fn 'parse_int': expected Result[Int, String] but got Unit
  --> /tmp/dojo-result-pipeline-0.almd:1:50
  in fn 'parse_int'
  hint: Fix the expression type or change the expected type
  |
1 | fn parse_int(s: String) -> Result[Int, String] = {
  |                                                  ^
error[E001]: type mismatch in fn 'validate_range': expected Result[Int, String] but got Unit
  --> /tmp/dojo-result-pipeline-0.almd:9:70
  in fn 'validate_range'
  hint: Fix the expression type or change the expected type
  |
9 | fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = {
  |                                                                      ^
error[E001]: type mismatch in fn 'process': expected Result[String, String] but got Unit
  --> /tmp/dojo-result-pipeline-0.almd:14:13
  in fn 'process'
  hint: Fix the expression type or change the expected type
   |
14 |   parse_int(input)
   |             ^^^^^

7 error(s) found
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = {
  int.parse(s).map((r) => r)
}

fn validate_positive(n: Int) -> Result[Int, String] = {
  if n > 0 then ok(n) else err("must be positive: " + n.to_string())
}

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = {
  if lo <= n && n <= hi then ok(n) else err("out of range: " + n.to_string())
}

fn process(input: String) -> Result[String, String] = {
  parse_int(input)
    .flat_map((r) => validate_positive(r))
    .flat_map((r) => validate_range(r, 1, 100))
    .map((r) => "valid: " + r.to_string())
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: '&&' is not valid in Almide at line 10:14
  --> /tmp/dojo-result-pipeline-1.almd:10:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
10 |   if lo <= n && n <= hi then ok(n) else err("out of range: " + n.to_string())
   |              ^
error: Expected expression at line 15:5 (got Dot '.')
  --> /tmp/dojo-result-pipeline-1.almd:15:5
   |
15 |     .flat_map((r) => validate_positive(r))
   |     ^
error[E001]: type mismatch in fn 'validate_range': expected Result[Int, String] but got Unit
  --> /tmp/dojo-result-pipeline-1.almd:9:70
  in fn 'validate_range'
  hint: Fix the expression type or change the expected type
  |
9 | fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = {
  |                                                                      ^
error[E001]: type mismatch in fn 'process': expected Result[String, String] but got Unit
  --> /tmp/dojo-result-pipeline-1.almd:14:13
  in fn 'process'
  hint: Fix the expression type or change the expected type
   |
14 |   parse_int(input)
   |             ^^^^^

4 error(s) found
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = {
  int.parse(s).map((r) => r)
}

fn validate_positive(n: Int) -> Result[Int, String] = {
  if n > 0 then ok(n) else err("must be positive: " + n.to_string())
}

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = {
  if lo < n and n < hi then ok(n) else err("out of range: " + n.to_string())
}

fn process(input: String) -> Result[String, String] = {
  parse_int(input)
    .flat_map((r) => validate_positive(r))
    .flat_map((r) => validate_range(r, 1, 100))
    .map((r) => "valid: " + r.to_string())
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Expected expression at line 15:5 (got Dot '.')
  --> /tmp/dojo-result-pipeline-2.almd:15:5
   |
15 |     .flat_map((r) => validate_positive(r))
   |     ^
error[E001]: type mismatch in fn 'process': expected Result[String, String] but got Unit
  --> /tmp/dojo-result-pipeline-2.almd:14:13
  in fn 'process'
  hint: Fix the expression type or change the expected type
   |
14 |   parse_int(input)
   |             ^^^^^

2 error(s) found
Compile error for /tmp/dojo-result-pipeline-2.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = {
  int.parse(s)
}

fn validate_positive(n: Int) -> Result[Int, String] = {
  if n > 0 then ok(n) else err("must be positive: " + n.to_string())
}

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = {
  if lo <= n and n <= hi then ok(n) else err("out of range: " + n.to_string())
}

fn process(input: String) -> Result[String, String] = {
  parse_int(input)
    .flat_map((r) => validate_positive(r))
    .flat_map((r) => validate_range(r, 1, 100))
    .map((r) => "valid: " + r.to_string())
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: Expected expression at line 15:5 (got Dot '.')
  --> /tmp/dojo-result-pipeline-3.almd:15:5
   |
15 |     .flat_map((r) => validate_positive(r))
   |     ^
error[E001]: type mismatch in fn 'process': expected Result[String, String] but got Unit
  --> /tmp/dojo-result-pipeline-3.almd:14:13
  in fn 'process'
  hint: Fix the expression type or change the expected type
   |
14 |   parse_int(input)
   |             ^^^^^

2 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
