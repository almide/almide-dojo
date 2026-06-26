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
error: '&&' is not valid in Almide at line 11:14
  --> /tmp/dojo-result-pipeline-0.almd:11:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
11 |   if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
   |              ^
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:15:22
   |
15 |   |> result.flat_map(fn(x) => validate_positive(x))
   |                      ^
error: Expected function name at line 15:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:15:24
   |
15 |   |> result.flat_map(fn(x) => validate_positive(x))
   |                        ^
error: Expected function name at line 16:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:16:24
   |
16 |   |> result.flat_map(fn(x) => validate_range(x, 1, 100))
   |                        ^
error: Expected function name at line 17:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:17:19
   |
17 |   |> result.map(fn(x) => "valid: " + int.to_string(x))
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
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn(x) => validate_positive(x))
  |> result.flat_map(fn(x) => validate_range(x, 1, 100))
  |> result.map(fn(x) => "valid: " + int.to_string(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:15:22
   |
15 |   |> result.flat_map(fn(x) => validate_positive(x))
   |                      ^
error: Expected function name at line 15:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:15:24
   |
15 |   |> result.flat_map(fn(x) => validate_positive(x))
   |                        ^
error: Expected function name at line 16:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:16:24
   |
16 |   |> result.flat_map(fn(x) => validate_range(x, 1, 100))
   |                        ^
error: Expected function name at line 17:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:17:19
   |
17 |   |> result.map(fn(x) => "valid: " + int.to_string(x))
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
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn(x) => validate_positive(x))
  |> result.flat_map(fn(x) => validate_range(x, 1, 100))
  |> result.map(fn(x) => "valid: " + int.to_string(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:15:22
   |
15 |   |> result.flat_map(fn(x) => validate_positive(x))
   |                      ^
error: Expected function name at line 15:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:15:24
   |
15 |   |> result.flat_map(fn(x) => validate_positive(x))
   |                        ^
error: Expected function name at line 16:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:16:24
   |
16 |   |> result.flat_map(fn(x) => validate_range(x, 1, 100))
   |                        ^
error: Expected function name at line 17:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:17:19
   |
17 |   |> result.map(fn(x) => "valid: " + int.to_string(x))
   |                   ^

4 error(s) found
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
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn(x) => validate_positive(x))
  |> result.flat_map(fn(x) => validate_range(x, 1, 100))
  |> result.map(fn(x) => "valid: " + int.to_string(x))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map((x) => validate_positive(x))
  |> result.flat_map((x) => validate_range(x, 1, 100))
  |> result.map((x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:15:22
   |
15 |   |> result.flat_map(fn(x) => validate_positive(x))
   |                      ^
error: Expected function name at line 15:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:15:24
   |
15 |   |> result.flat_map(fn(x) => validate_positive(x))
   |                        ^
error: Expected function name at line 16:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:16:24
   |
16 |   |> result.flat_map(fn(x) => validate_range(x, 1, 100))
   |                        ^
error: Expected function name at line 17:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:17:19
   |
17 |   |> result.map(fn(x) => "valid: " + int.to_string(x))
   |                   ^
error: Expected ')' to close function call opened at line 23:16
  --> /tmp/dojo-result-pipeline-3.almd:25:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
23 |   |> result.map((x)
   |                --------------- '(' opened here
...
25 | test "parse_int valid" { assert_eq(parse_int("42"), ok(42)) }
   | ^^^^

5 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
