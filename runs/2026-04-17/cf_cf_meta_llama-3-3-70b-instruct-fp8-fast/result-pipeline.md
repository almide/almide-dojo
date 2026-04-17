# result-pipeline

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n)
  else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n && n <= hi then ok(n)
  else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(int.parse(input), (n) => 
    result.flat_map(validate_positive(n), (n) => 
      result.flat_map(validate_range(n, 1, 100), (n) => 
        result.map(ok(n), (n) => "valid: " + int.to_string(n))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: '&&' is not valid in Almide at line 9:14
  --> /tmp/dojo-result-pipeline-0.almd:9:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
9 |   if lo <= n && n <= hi then ok(n)
  |              ^
error: Expected ')' to close function call opened at line 13:18
  --> /tmp/dojo-result-pipeline-0.almd:18:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
13 |   result.flat_map(int.parse(input), (n) =>
   |                  --------------- '(' opened here
...
18 | test "parse_int valid" { assert_eq(parse_int("42"), ok(42)) }
   | ^^^^

2 error(s) found
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
  if n > 0 then ok(n)
  else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n)
  else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(int.parse(input), (n) => 
    result.flat_map(validate_positive(n), (n) => 
      result.flat_map(validate_range(n, 1, 100), (n) => 
        result.map(ok(n), (n) => "valid: " + int.to_string(n))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected ')' to close function call opened at line 13:18
  --> /tmp/dojo-result-pipeline-1.almd:18:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
13 |   result.flat_map(int.parse(input), (n) =>
   |                  --------------- '(' opened here
...
18 | test "parse_int valid" { assert_eq(parse_int("42"), ok(42)) }
   | ^^^^

1 error(s) found
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n)
  else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n)
  else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(int.parse(input), (n) => 
    result.flat_map(validate_positive(n), (n) => 
      result.flat_map(validate_range(n, 1, 100), (n) => 
        result.map(ok(n), (n) => "valid: " + int.to_string(n))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Expected ')' to close function call opened at line 13:18
  --> /tmp/dojo-result-pipeline-2.almd:18:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
13 |   result.flat_map(int.parse(input), (n) =>
   |                  --------------- '(' opened here
...
18 | test "parse_int valid" { assert_eq(parse_int("42"), ok(42)) }
   | ^^^^

1 error(s) found
Compile error for /tmp/dojo-result-pipeline-2.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n)
  else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n)
  else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(int.parse(input), (n) => 
    result.flat_map(validate_positive(n), (n) => 
      result.flat_map(validate_range(n, 1, 100), (n) => 
        result.map(ok(n), (x) => "valid: " + int.to_string(x))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: Expected ')' to close function call opened at line 13:18
  --> /tmp/dojo-result-pipeline-3.almd:18:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
13 |   result.flat_map(int.parse(input), (n) =>
   |                  --------------- '(' opened here
...
18 | test "parse_int valid" { assert_eq(parse_int("42"), ok(42)) }
   | ^^^^

1 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
