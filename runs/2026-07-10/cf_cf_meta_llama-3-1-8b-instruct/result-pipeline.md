# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s).map_err(|_| s + " not a number")

fn validate_positive(n: Int) -> Result[Int, String] = if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
    parse_int(input)
        .flat_map(validate_positive)
        .flat_map(fn(n) => validate_range(n, 1, 100))
        .map(fn(n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: '|x|' closure syntax is not valid in Almide at line 1:71
  --> /tmp/dojo-result-pipeline-0.almd:1:71
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
1 | fn parse_int(s: String) -> Result[Int, String] = int.parse(s).map_err(|_| s + " not a number")
  |                                                                       ^
error: '&&' is not valid in Almide at line 5:81
  --> /tmp/dojo-result-pipeline-0.almd:5:81
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 | fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |                                                                                 ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:9 (got Dot '.')
  --> /tmp/dojo-result-pipeline-0.almd:9:9
  |
9 |         .flat_map(validate_positive)
  |         ^
error: Expected function name at line 10:21 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:10:21
   |
10 |         .flat_map(fn(n) => validate_range(n, 1, 100))
   |                     ^
error: Expected function name at line 11:16 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:11:16
   |
11 |         .map(fn(n) => "valid: " + int.to_string(n))
   |                ^

5 error(s) found
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s).map_err(|e| s + " not a number: " + e)

fn validate_positive(n: Int) -> Result[Int, String] = if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
    parse_int(input)
        .flat_map(validate_positive)
        .flat_map((n) => validate_range(n, 1, 100))
        .map((n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: '|x|' closure syntax is not valid in Almide at line 1:71
  --> /tmp/dojo-result-pipeline-1.almd:1:71
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
1 | fn parse_int(s: String) -> Result[Int, String] = int.parse(s).map_err(|e| s + " not a number: " + e)
  |                                                                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:9 (got Dot '.')
  --> /tmp/dojo-result-pipeline-1.almd:9:9
  |
9 |         .flat_map(validate_positive)
  |         ^

2 error(s) found
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s).map_err(|e| s + " not a number: " + e)

fn validate_positive(n: Int) -> Result[Int, String] = if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
    parse_int(input)
        .flat_map(validate_positive)
        .flat_map((n) => validate_range(n, 1, 100))
        .map((n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: '|x|' closure syntax is not valid in Almide at line 1:71
  --> /tmp/dojo-result-pipeline-2.almd:1:71
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
1 | fn parse_int(s: String) -> Result[Int, String] = int.parse(s).map_err(|e| s + " not a number: " + e)
  |                                                                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:9 (got Dot '.')
  --> /tmp/dojo-result-pipeline-2.almd:9:9
  |
9 |         .flat_map(validate_positive)
  |         ^

2 error(s) found
Compile error for /tmp/dojo-result-pipeline-2.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
    int.parse(s).map_err(|e| s + " not a number: " + e)

fn validate_positive(n: Int) -> Result[Int, String] = 
    if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
    if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
    parse_int(input)
        .flat_map(validate_positive)
        .flat_map((n) => validate_range(n, 1, 100))
        .map((n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: '|x|' closure syntax is not valid in Almide at line 2:26
  --> /tmp/dojo-result-pipeline-3.almd:2:26
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |     int.parse(s).map_err(|e| s + " not a number: " + e)
  |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:9 (got Dot '.')
  --> /tmp/dojo-result-pipeline-3.almd:12:9
   |
12 |         .flat_map(validate_positive)
   |         ^

2 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
