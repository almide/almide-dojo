# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(|_| "not a number: " ++ s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " ++ int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n && n <= hi then ok(n) else err("out of range: " ++ int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
    |> result.flat_map(fn n => validate_positive(n))
    |> result.flat_map(fn n => validate_range(n, 1, 100))
    |> result.map(fn n => "valid: " ++ int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: '|x|' closure syntax is not valid in Almide at line 2:24
  --> /tmp/dojo-result-pipeline-0.almd:2:24
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |   int.parse(s).map_err(|_| "not a number: " ++ s)
  |                        ^
error: '&&' is not valid in Almide at line 8:14
  --> /tmp/dojo-result-pipeline-0.almd:8:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
8 |   if lo <= n && n <= hi then ok(n) else err("out of range: " ++ int.to_string(n))
  |              ^
error: Expected expression at line 12:24 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:12:24
   |
12 |     |> result.flat_map(fn n => validate_positive(n))
   |                        ^
error: Expected LParen at line 12:29 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:12:29
   |
12 |     |> result.flat_map(fn n => validate_positive(n))
   |                             ^
error: Expected LParen at line 13:29 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:13:29
   |
13 |     |> result.flat_map(fn n => validate_range(n, 1, 100))
   |                             ^
error: Expected LParen at line 14:24 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:14:24
   |
14 |     |> result.map(fn n => "valid: " ++ int.to_string(n))
   |                        ^
error: operator '++' has been removed. Use '+' for concatenation
  --> /tmp/dojo-result-pipeline-0.almd:5:70
  in operator ++
  hint: Replace ++ with +
  |
5 |   if n > 0 then ok(n) else err("must be positive: " ++ int.to_string(n))
  |                                                                      ^

7 error(s) found
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(|err| "not a number: " + err)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
    |> result.flat_map((n) => validate_positive(n))
    |> result.flat_map((n) => validate_range(n, 1, 100))
    |> result.map((n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected expression at line 2:24 (got Pipe '|')
  --> /tmp/dojo-result-pipeline-1.almd:2:24
  |
2 |   int.parse(s).map_err(|err| "not a number: " + err)
  |                        ^

1 error(s) found
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(|err| "not a number: " + err)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  int.parse(input)
    |> result.map_err(|err| "not a number: " + err)
    |> result.flat_map((n) => validate_positive(n))
    |> result.flat_map((n) => validate_range(n, 1, 100))
    |> result.map((n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Expected expression at line 2:24 (got Pipe '|')
  --> /tmp/dojo-result-pipeline-2.almd:2:24
  |
2 |   int.parse(s).map_err(|err| "not a number: " + err)
  |                        ^
error: Expected expression at line 12:23 (got Pipe '|')
  --> /tmp/dojo-result-pipeline-2.almd:12:23
   |
12 |     |> result.map_err(|err| "not a number: " + err)
   |                       ^

2 error(s) found
Compile error for /tmp/dojo-result-pipeline-2.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(|err| "not a number: " + err)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  int.parse(input)
  |> result.map_err(|err| "not a number: " + err)
  |> result.flat_map(fn(n) => validate_positive(n))
  |> result.flat_map(fn(n) => validate_range(n, 1, 100))
  |> result.map(fn(n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: Expected expression at line 2:24 (got Pipe '|')
  --> /tmp/dojo-result-pipeline-3.almd:2:24
  |
2 |   int.parse(s).map_err(|err| "not a number: " + err)
  |                        ^
error: Expected expression at line 12:21 (got Pipe '|')
  --> /tmp/dojo-result-pipeline-3.almd:12:21
   |
12 |   |> result.map_err(|err| "not a number: " + err)
   |                     ^
error: Expected function name at line 13:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:13:24
   |
13 |   |> result.flat_map(fn(n) => validate_positive(n))
   |                        ^
error: Expected function name at line 14:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:14:24
   |
14 |   |> result.flat_map(fn(n) => validate_range(n, 1, 100))
   |                        ^
error: Expected function name at line 15:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:15:19
   |
15 |   |> result.map(fn(n) => "valid: " + int.to_string(n))
   |                   ^

5 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
