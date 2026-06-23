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
  match (n > 0) {
    true => ok(n),
    false => err(s"must be positive: $n")
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match (lo <= n && n <= hi) {
    true => ok(n),
    false => err(s"out of range: $n")
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(validate_positive)
  |> result.flat_map(fn(n) => validate_range(n, 1, 100))
  |> result.map(fn(n) => s"valid: $n")
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: Expected ')' to close err() opened at line 10:17
  --> /tmp/dojo-result-pipeline-0.almd:10:19
  hint: Add ')' or check for a missing delimiter inside the err()
   |
10 |     false => err(s"must be positive: $n")
   |                 --------------- '(' opened here
   |
10 |     false => err(s"must be positive: $n")
   |                   ^^^^^^^^^^^^^^^^^^^^^^
error: '&&' is not valid in Almide at line 14:18
  --> /tmp/dojo-result-pipeline-0.almd:14:18
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
14 |   match (lo <= n && n <= hi) {
   |                  ^
error: Expected expression at line 22:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:22:22
   |
22 |   |> result.flat_map(fn(n) => validate_range(n, 1, 100))
   |                      ^
error: Expected function name at line 22:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:22:24
   |
22 |   |> result.flat_map(fn(n) => validate_range(n, 1, 100))
   |                        ^
error: Expected function name at line 23:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:23:19
   |
23 |   |> result.map(fn(n) => s"valid: $n")
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
  if n > 0 then ok(n) else err(s"must be positive: $n")

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err(s"out of range: $n")

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(validate_positive)
  |> result.flat_map((n) => validate_range(n, 1, 100))
  |> result.map((n) => s"valid: $n")
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected ')' to close err() opened at line 8:31
  --> /tmp/dojo-result-pipeline-1.almd:8:33
  hint: Add ')' or check for a missing delimiter inside the err()
  |
8 |   if n > 0 then ok(n) else err(s"must be positive: $n")
  |                               --------------- '(' opened here
  |
8 |   if n > 0 then ok(n) else err(s"must be positive: $n")
  |                                 ^^^^^^^^^^^^^^^^^^^^^^
error: Expected ')' to close err() opened at line 11:45
  --> /tmp/dojo-result-pipeline-1.almd:11:47
  hint: Add ')' or check for a missing delimiter inside the err()
   |
11 |   if lo <= n and n <= hi then ok(n) else err(s"out of range: $n")
   |                                             --------------- '(' opened here
   |
11 |   if lo <= n and n <= hi then ok(n) else err(s"out of range: $n")
   |                                               ^^^^^^^^^^^^^^^^^^
error: Missing ',' between function arguments at line 17:25
  --> /tmp/dojo-result-pipeline-1.almd:17:25
  hint: Add a comma after the previous element. Example: f(a, b, c)
   |
17 |   |> result.map((n) => s"valid: $n")
   |                         ^

3 error(s) found
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
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(validate_positive)
  |> result.flat_map((n) => validate_range(n, 1, 100))
  |> result.map((n) => s"valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Missing ',' between function arguments at line 17:25
  --> /tmp/dojo-result-pipeline-2.almd:17:25
  hint: Add a comma after the previous element. Example: f(a, b, c)
   |
17 |   |> result.map((n) => s"valid: " + int.to_string(n))
   |                         ^

1 error(s) found
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
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(validate_positive)
  |> result.flat_map(fn(n) => validate_range(n, 1, 100))
  |> result.map(fn(n) => s"valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: Expected expression at line 16:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:16:22
   |
16 |   |> result.flat_map(fn(n) => validate_range(n, 1, 100))
   |                      ^
error: Expected function name at line 16:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:16:24
   |
16 |   |> result.flat_map(fn(n) => validate_range(n, 1, 100))
   |                        ^
error: Expected function name at line 17:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:17:19
   |
17 |   |> result.map(fn(n) => s"valid: " + int.to_string(n))
   |                   ^

3 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
