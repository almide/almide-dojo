# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(fn(err) => s + ": " + err)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input).flat_map(validate_positive).flat_map(fn(n) => validate_range(n, 1, 100)).map(fn(n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: Expected expression at line 2:24 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:2:24
  |
2 |   int.parse(s).map_err(fn(err) => s + ": " + err)
  |                        ^
error: Expected function name at line 2:26 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:2:26
  |
2 |   int.parse(s).map_err(fn(err) => s + ": " + err)
  |                          ^
error: '&&' is not valid in Almide at line 8:14
  --> /tmp/dojo-result-pipeline-0.almd:8:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
8 |   if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |              ^
error: Expected expression at line 11:57 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:11:57
   |
11 |   parse_int(input).flat_map(validate_positive).flat_map(fn(n) => validate_range(n, 1, 100)).map(fn(n) => "valid: " + int.to_string(n))
   |                                                         ^
error: Expected function name at line 11:59 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:11:59
   |
11 |   parse_int(input).flat_map(validate_positive).flat_map(fn(n) => validate_range(n, 1, 100)).map(fn(n) => "valid: " + int.to_string(n))
   |                                                           ^
error: Expected function name at line 11:99 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:11:99
   |
11 |   parse_int(input).flat_map(validate_positive).flat_map(fn(n) => validate_range(n, 1, 100)).map(fn(n) => "valid: " + int.to_string(n))
   |                                                                                                   ^

6 error(s) found
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(fn(err) => s + ": " + err)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input).flat_map(validate_positive).flat_map(validate_range(1, 100)).map(fn(n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected expression at line 2:24 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:2:24
  |
2 |   int.parse(s).map_err(fn(err) => s + ": " + err)
  |                        ^
error: Expected function name at line 2:26 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:2:26
  |
2 |   int.parse(s).map_err(fn(err) => s + ": " + err)
  |                          ^
error: Expected expression at line 11:85 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:11:85
   |
11 |   parse_int(input).flat_map(validate_positive).flat_map(validate_range(1, 100)).map(fn(n) => "valid: " + int.to_string(n))
   |                                                                                     ^
error: Expected function name at line 11:87 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:11:87
   |
11 |   parse_int(input).flat_map(validate_positive).flat_map(validate_range(1, 100)).map(fn(n) => "valid: " + int.to_string(n))
   |                                                                                       ^

4 error(s) found
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(fn(err) => s + ": " + err)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input).flat_map(fn(result) => 
    result.flat_map(validate_positive).flat_map(fn(result) => 
      result.flat_map(validate_range(1, 100)).map(fn(n) => "valid: " + int.to_string(n))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Expected expression at line 2:24 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:2:24
  |
2 |   int.parse(s).map_err(fn(err) => s + ": " + err)
  |                        ^
error: Expected function name at line 2:26 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:2:26
  |
2 |   int.parse(s).map_err(fn(err) => s + ": " + err)
  |                          ^
error: Expected expression at line 11:29 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:11:29
   |
11 |   parse_int(input).flat_map(fn(result) =>
   |                             ^
error: Expected function name at line 11:31 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:11:31
   |
11 |   parse_int(input).flat_map(fn(result) =>
   |                               ^
error: Expected function name at line 12:51 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:12:51
   |
12 |     result.flat_map(validate_positive).flat_map(fn(result) =>
   |                                                   ^
error: Expected function name at line 13:53 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:13:53
   |
13 |       result.flat_map(validate_range(1, 100)).map(fn(n) => "valid: " + int.to_string(n))))
   |                                                     ^

6 error(s) found
Compile error for /tmp/dojo-result-pipeline-2.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(fn(err) => s + ": " + err)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input).flat_map(fn(result) => 
    result.flat_map(validate_positive).flat_map(fn(result) => 
      result.flat_map(validate_range(1, 100)).map(fn(n) => "valid: " + int.to_string(n))))

fn process(input: String) -> Result[String, String] = 
  parse_int(input).bind(validate_positive).bind(validate_range(1, 100)).map(fn(n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: Expected expression at line 2:24 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:2:24
  |
2 |   int.parse(s).map_err(fn(err) => s + ": " + err)
  |                        ^
error: Expected function name at line 2:26 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:2:26
  |
2 |   int.parse(s).map_err(fn(err) => s + ": " + err)
  |                          ^
error: Expected expression at line 11:29 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:11:29
   |
11 |   parse_int(input).flat_map(fn(result) =>
   |                             ^
error: Expected function name at line 11:31 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:11:31
   |
11 |   parse_int(input).flat_map(fn(result) =>
   |                               ^
error: Expected function name at line 12:51 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:12:51
   |
12 |     result.flat_map(validate_positive).flat_map(fn(result) =>
   |                                                   ^
error: Expected function name at line 13:53 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:13:53
   |
13 |       result.flat_map(validate_range(1, 100)).map(fn(n) => "valid: " + int.to_string(n))))
   |                                                     ^
error: Expected expression at line 16:77 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:16:77
   |
16 |   parse_int(input).bind(validate_positive).bind(validate_range(1, 100)).map(fn(n) => "valid: " + int.to_string(n))
   |                                                                             ^
error: Expected function name at line 16:79 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:16:79
   |
16 |   parse_int(input).bind(validate_positive).bind(validate_range(1, 100)).map(fn(n) => "valid: " + int.to_string(n))
   |                                                                               ^

8 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
