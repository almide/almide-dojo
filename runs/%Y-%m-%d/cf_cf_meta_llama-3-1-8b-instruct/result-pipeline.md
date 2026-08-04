# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int, fn(n) => 
    result.flat_map(validate_positive, fn(n) => 
      result.map(validate_range(1, 100, n), fn(n) => "valid: " + int.to_string(n))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: '&&' is not valid in Almide at line 8:14
  --> /tmp/dojo-result-pipeline-0.almd:8:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
8 |   if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |              ^
error: Expected expression at line 11:30 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:11:30
   |
11 |   result.flat_map(parse_int, fn(n) =>
   |                              ^
error: Expected function name at line 11:32 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:11:32
   |
11 |   result.flat_map(parse_int, fn(n) =>
   |                                ^
error: Expected function name at line 12:42 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:12:42
   |
12 |     result.flat_map(validate_positive, fn(n) =>
   |                                          ^
error: Expected function name at line 13:47 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:13:47
   |
13 |       result.map(validate_range(1, 100, n), fn(n) => "valid: " + int.to_string(n))))
   |                                               ^

5 error(s) found
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
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int, fn(r) => 
    result.flat_map(validate_positive, fn(r) => 
      result.map(validate_range(1, 100, int.to_int(r)), fn(n) => "valid: " + int.to_string(n))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected expression at line 11:30 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:11:30
   |
11 |   result.flat_map(parse_int, fn(r) =>
   |                              ^
error: Expected function name at line 11:32 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:11:32
   |
11 |   result.flat_map(parse_int, fn(r) =>
   |                                ^
error: Expected function name at line 12:42 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:12:42
   |
12 |     result.flat_map(validate_positive, fn(r) =>
   |                                          ^
error: Expected function name at line 13:59 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:13:59
   |
13 |       result.map(validate_range(1, 100, int.to_int(r)), fn(n) => "valid: " + int.to_string(n))))
   |                                                           ^

4 error(s) found
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
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int, fn(r) => 
    result.flat_map(validate_positive, fn(r) => 
      result.map(validate_range(1, 100, r), fn(n) => "valid: " + int.to_string(n))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Expected expression at line 11:30 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:11:30
   |
11 |   result.flat_map(parse_int, fn(r) =>
   |                              ^
error: Expected function name at line 11:32 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:11:32
   |
11 |   result.flat_map(parse_int, fn(r) =>
   |                                ^
error: Expected function name at line 12:42 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:12:42
   |
12 |     result.flat_map(validate_positive, fn(r) =>
   |                                          ^
error: Expected function name at line 13:47 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:13:47
   |
13 |       result.map(validate_range(1, 100, r), fn(n) => "valid: " + int.to_string(n))))
   |                                               ^

4 error(s) found
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
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int, (fn(r) => 
    result.flat_map(validate_positive, (fn(r) => 
      result.map(validate_range(1, 100, r), (fn(n) => "valid: " + int.to_string(n)))))))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int, (r => 
    result.flat_map(validate_positive, (r => 
      result.map(validate_range(1, 100, r), (n => "valid: " + int.to_string(n)))))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: Expected expression at line 11:31 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:11:31
   |
11 |   result.flat_map(parse_int, (fn(r) =>
   |                               ^
error: Expected function name at line 11:33 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:11:33
   |
11 |   result.flat_map(parse_int, (fn(r) =>
   |                                 ^
error: Expected function name at line 12:43 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:12:43
   |
12 |     result.flat_map(validate_positive, (fn(r) =>
   |                                           ^
error: Expected function name at line 13:48 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:13:48
   |
13 |       result.map(validate_range(1, 100, r), (fn(n) => "valid: " + int.to_string(n)))))))
   |                                                ^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-result-pipeline-3.almd:16:33
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
   |
16 |   result.flat_map(parse_int, (r =>
   |                                 ^^

5 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
