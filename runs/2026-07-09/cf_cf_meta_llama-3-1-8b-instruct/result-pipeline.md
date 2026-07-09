# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(fn(e) => e)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn(n) => validate_positive(n))
  |> result.flat_map(fn(n) => validate_range(n, 1, 100))
  |> result.map(fn(n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: Expected expression at line 2:24 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:2:24
  |
2 |   int.parse(s).map_err(fn(e) => e)
  |                        ^
error: Expected function name at line 2:26 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:2:26
  |
2 |   int.parse(s).map_err(fn(e) => e)
  |                          ^
error: '&&' is not valid in Almide at line 8:14
  --> /tmp/dojo-result-pipeline-0.almd:8:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
8 |   if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |              ^
error: Expected expression at line 12:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:12:22
   |
12 |   |> result.flat_map(fn(n) => validate_positive(n))
   |                      ^
error: Expected function name at line 12:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:12:24
   |
12 |   |> result.flat_map(fn(n) => validate_positive(n))
   |                        ^
error: Expected function name at line 13:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:13:24
   |
13 |   |> result.flat_map(fn(n) => validate_range(n, 1, 100))
   |                        ^
error: Expected function name at line 14:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:14:19
   |
14 |   |> result.map(fn(n) => "valid: " + int.to_string(n))
   |                   ^

7 error(s) found
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(fn(e) => e)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn(r) => 
    match r {
      some(n) => validate_positive(n)
      | none => err("not a number")
    }
  )
  |> result.flat_map(fn(r) => 
    match r {
      some(n) => validate_range(n, 1, 100)
      | none => err("not a number")
    }
  )
  |> result.map(fn(n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected expression at line 2:24 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:2:24
  |
2 |   int.parse(s).map_err(fn(e) => e)
  |                        ^
error: Expected function name at line 2:26 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:2:26
  |
2 |   int.parse(s).map_err(fn(e) => e)
  |                          ^
error: Expected expression at line 12:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:12:22
   |
12 |   |> result.flat_map(fn(r) =>
   |                      ^
error: Expected function name at line 12:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:12:24
   |
12 |   |> result.flat_map(fn(r) =>
   |                        ^
error: Expected function name at line 18:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:18:24
   |
18 |   |> result.flat_map(fn(r) =>
   |                        ^
error: Expected function name at line 24:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:24:19
   |
24 |   |> result.map(fn(n) => "valid: " + int.to_string(n))
   |                   ^

6 error(s) found
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(fn(e) => e)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn(r) => 
    match r {
      some(n) => validate_positive(n)
      | none => err("not a number")
    }
  )
  |> result.flat_map(fn(r) => 
    match r {
      some(n) => validate_range(n, 1, 100)
      | none => err("not a number")
    }
  )
  |> result.map(fn(r) => match r {
    some(n) => "valid: " + int.to_string(n)
    | none => "not a number"
  })
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Expected expression at line 2:24 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:2:24
  |
2 |   int.parse(s).map_err(fn(e) => e)
  |                        ^
error: Expected function name at line 2:26 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:2:26
  |
2 |   int.parse(s).map_err(fn(e) => e)
  |                          ^
error: Expected expression at line 12:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:12:22
   |
12 |   |> result.flat_map(fn(r) =>
   |                      ^
error: Expected function name at line 12:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:12:24
   |
12 |   |> result.flat_map(fn(r) =>
   |                        ^
error: Expected function name at line 18:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:18:24
   |
18 |   |> result.flat_map(fn(r) =>
   |                        ^
error: Expected function name at line 24:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:24:19
   |
24 |   |> result.map(fn(r) => match r {
   |                   ^

6 error(s) found
Compile error for /tmp/dojo-result-pipeline-2.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(fn(e) => e)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn(r) => 
    match r {
      some(n) => validate_positive(n)
      | none => err("not a number")
    }
  )
  |> result.flat_map(fn(r) => 
    match r {
      some(n) => validate_range(n, 1, 100)
      | none => err("not a number")
    }
  )
  |> result.map(fn(r) => match r {
    some(n) => "valid: " + int.to_string(n)
    | none => "not a number"
  })
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: Expected expression at line 2:24 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:2:24
  |
2 |   int.parse(s).map_err(fn(e) => e)
  |                        ^
error: Expected function name at line 2:26 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:2:26
  |
2 |   int.parse(s).map_err(fn(e) => e)
  |                          ^
error: Expected expression at line 12:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:12:22
   |
12 |   |> result.flat_map(fn(r) =>
   |                      ^
error: Expected function name at line 12:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:12:24
   |
12 |   |> result.flat_map(fn(r) =>
   |                        ^
error: Expected function name at line 18:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:18:24
   |
18 |   |> result.flat_map(fn(r) =>
   |                        ^
error: Expected function name at line 24:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:24:19
   |
24 |   |> result.map(fn(r) => match r {
   |                   ^

6 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
