# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s).map_err(|err| err)

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
error: Expected expression at line 1:71 (got Pipe '|')
  --> /tmp/dojo-result-pipeline-0.almd:1:71
  |
1 | fn parse_int(s: String) -> Result[Int, String] = int.parse(s).map_err(|err| err)
  |                                                                       ^
error: '&&' is not valid in Almide at line 7:14
  --> /tmp/dojo-result-pipeline-0.almd:7:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
7 |   if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |              ^
error: Expected expression at line 11:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:11:22
   |
11 |   |> result.flat_map(fn(x) => validate_positive(x))
   |                      ^
error: Expected function name at line 11:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:11:24
   |
11 |   |> result.flat_map(fn(x) => validate_positive(x))
   |                        ^
error: Expected function name at line 12:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:12:24
   |
12 |   |> result.flat_map(fn(x) => validate_range(x, 1, 100))
   |                        ^
error: Expected function name at line 13:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:13:19
   |
13 |   |> result.map(fn(x) => "valid: " + int.to_string(x))
   |                   ^

6 error(s) found
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s).map_err(|err| err)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(validate_positive)
  |> result.flat_map(fn(x) => validate_range(x, 1, 100))
  |> result.map(fn(x) => "valid: " + int.to_string(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected expression at line 1:71 (got Pipe '|')
  --> /tmp/dojo-result-pipeline-1.almd:1:71
  |
1 | fn parse_int(s: String) -> Result[Int, String] = int.parse(s).map_err(|err| err)
  |                                                                       ^
error: Expected expression at line 12:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:12:22
   |
12 |   |> result.flat_map(fn(x) => validate_range(x, 1, 100))
   |                      ^
error: Expected function name at line 12:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:12:24
   |
12 |   |> result.flat_map(fn(x) => validate_range(x, 1, 100))
   |                        ^
error: Expected function name at line 13:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:13:19
   |
13 |   |> result.map(fn(x) => "valid: " + int.to_string(x))
   |                   ^

4 error(s) found
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s).map_err(|err| err)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(validate_positive)
  |> result.flat_map(validate_range(1, 100, _))
  |> result.map(fn(x) => "valid: " + int.to_string(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Expected expression at line 1:71 (got Pipe '|')
  --> /tmp/dojo-result-pipeline-2.almd:1:71
  |
1 | fn parse_int(s: String) -> Result[Int, String] = int.parse(s).map_err(|err| err)
  |                                                                       ^
error: Expected expression at line 13:17 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:13:17
   |
13 |   |> result.map(fn(x) => "valid: " + int.to_string(x))
   |                 ^
error: Expected function name at line 13:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:13:19
   |
13 |   |> result.map(fn(x) => "valid: " + int.to_string(x))
   |                   ^

3 error(s) found
Compile error for /tmp/dojo-result-pipeline-2.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s).map_err(|err| err)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(validate_positive)
  |> result.flat_map(validate_range(1, 100, _))
  |> result.map(fn(x) => "valid: " + int.to_string(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: Expected expression at line 1:71 (got Pipe '|')
  --> /tmp/dojo-result-pipeline-3.almd:1:71
  |
1 | fn parse_int(s: String) -> Result[Int, String] = int.parse(s).map_err(|err| err)
  |                                                                       ^
error: Expected expression at line 13:17 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:13:17
   |
13 |   |> result.map(fn(x) => "valid: " + int.to_string(x))
   |                 ^
error: Expected function name at line 13:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:13:19
   |
13 |   |> result.map(fn(x) => "valid: " + int.to_string(x))
   |                   ^

3 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
