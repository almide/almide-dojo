# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(fn(err) => err)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input).flat_map(fn(n) => validate_positive(n)).flat_map(fn(n) => validate_range(n, 1, 100)).map(fn(n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: Expected expression at line 2:24 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:2:24
  |
2 |   int.parse(s).map_err(fn(err) => err)
  |                        ^
error: Expected function name at line 2:26 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:2:26
  |
2 |   int.parse(s).map_err(fn(err) => err)
  |                          ^
error: '&&' is not valid in Almide at line 8:14
  --> /tmp/dojo-result-pipeline-0.almd:8:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
8 |   if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |              ^
error: Expected expression at line 11:29 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:11:29
   |
11 |   parse_int(input).flat_map(fn(n) => validate_positive(n)).flat_map(fn(n) => validate_range(n, 1, 100)).map(fn(n) => "valid: " + int.to_string(n))
   |                             ^
error: Expected function name at line 11:31 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:11:31
   |
11 |   parse_int(input).flat_map(fn(n) => validate_positive(n)).flat_map(fn(n) => validate_range(n, 1, 100)).map(fn(n) => "valid: " + int.to_string(n))
   |                               ^
error: Expected function name at line 11:71 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:11:71
   |
11 |   parse_int(input).flat_map(fn(n) => validate_positive(n)).flat_map(fn(n) => validate_range(n, 1, 100)).map(fn(n) => "valid: " + int.to_string(n))
   |                                                                       ^
error: Expected function name at line 11:111 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:11:111
   |
11 |   parse_int(input).flat_map(fn(n) => validate_positive(n)).flat_map(fn(n) => validate_range(n, 1, 100)).map(fn(n) => "valid: " + int.to_string(n))
   |                                                                                                               ^

7 error(s) found
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(fn(err) => err)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input).flat_map(fn(n) => validate_positive(n)).flat_map(fn(n) => validate_range(n, 1, 100)).map(fn(n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected expression at line 2:24 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:2:24
  |
2 |   int.parse(s).map_err(fn(err) => err)
  |                        ^
error: Expected function name at line 2:26 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:2:26
  |
2 |   int.parse(s).map_err(fn(err) => err)
  |                          ^
error: Expected expression at line 11:29 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:11:29
   |
11 |   parse_int(input).flat_map(fn(n) => validate_positive(n)).flat_map(fn(n) => validate_range(n, 1, 100)).map(fn(n) => "valid: " + int.to_string(n))
   |                             ^
error: Expected function name at line 11:31 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:11:31
   |
11 |   parse_int(input).flat_map(fn(n) => validate_positive(n)).flat_map(fn(n) => validate_range(n, 1, 100)).map(fn(n) => "valid: " + int.to_string(n))
   |                               ^
error: Expected function name at line 11:71 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:11:71
   |
11 |   parse_int(input).flat_map(fn(n) => validate_positive(n)).flat_map(fn(n) => validate_range(n, 1, 100)).map(fn(n) => "valid: " + int.to_string(n))
   |                                                                       ^
error: Expected function name at line 11:111 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:11:111
   |
11 |   parse_int(input).flat_map(fn(n) => validate_positive(n)).flat_map(fn(n) => validate_range(n, 1, 100)).map(fn(n) => "valid: " + int.to_string(n))
   |                                                                                                               ^

6 error(s) found
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
  parse_int(input).flat_map(fn(result) => 
    match result {
      some(n) => validate_positive(n).flat_map(fn(n) => validate_range(n, 1, 100)).map(fn(n) => "valid: " + int.to_string(n)),
      none => err("not a number: " + input)
    }
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
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
error: Expected function name at line 13:50 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:13:50
   |
13 |       some(n) => validate_positive(n).flat_map(fn(n) => validate_range(n, 1, 100)).map(fn(n) => "valid: " + int.to_string(n)),
   |                                                  ^
error: Expected function name at line 13:90 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:13:90
   |
13 |       some(n) => validate_positive(n).flat_map(fn(n) => validate_range(n, 1, 100)).map(fn(n) => "valid: " + int.to_string(n)),
   |                                                                                          ^

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
  parse_int(input).flat_map(fn(result) => 
    match result {
      some(n) => 
        validate_positive(n).flat_map(fn(n) => 
          validate_range(n, 1, 100).map(fn(n) => "valid: " + int.to_string(n))
        ),
      none => err("not a number: " + input)
    }
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
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
error: Expected function name at line 14:41 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:14:41
   |
14 |         validate_positive(n).flat_map(fn(n) =>
   |                                         ^
error: Expected function name at line 15:43 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:15:43
   |
15 |           validate_range(n, 1, 100).map(fn(n) => "valid: " + int.to_string(n))
   |                                           ^

4 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
