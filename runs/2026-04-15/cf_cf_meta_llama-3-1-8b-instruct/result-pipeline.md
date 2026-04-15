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
  if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> result.flat_map(fn { 
    ok(n) => validate_positive(n) 
    | err(e) => err(e) 
  }) 
  |> result.flat_map(fn { 
    ok(n) => validate_range(n, 1, 100) 
    | err(e) => err(e) 
  }) 
  |> result.map(fn { 
    ok(n) => "valid: " + int.to_string(n) 
    | err(e) => e 
  })
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: '&&' is not valid in Almide at line 11:14
  --> /tmp/dojo-result-pipeline-0.almd:11:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
11 |   if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
   |              ^
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:15:22
   |
15 |   |> result.flat_map(fn {
   |                      ^
error: Expected function name at line 15:25 (got LBrace '{')
  --> /tmp/dojo-result-pipeline-0.almd:15:25
   |
15 |   |> result.flat_map(fn {
   |                         ^
error: Expected function name at line 19:25 (got LBrace '{')
  --> /tmp/dojo-result-pipeline-0.almd:19:25
   |
19 |   |> result.flat_map(fn {
   |                         ^
error: Expected function name at line 23:20 (got LBrace '{')
  --> /tmp/dojo-result-pipeline-0.almd:23:20
   |
23 |   |> result.map(fn {
   |                    ^

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
  if lo < n and n < hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> result.flat_map((fn { 
    ok(n) => validate_positive(n) 
    | err(e) => err(e) 
  })) 
  |> result.flat_map((fn { 
    ok(n) => validate_range(n, 1, 100) 
    | err(e) => err(e) 
  })) 
  |> result.map((fn { 
    ok(n) => "valid: " + int.to_string(n) 
    | err(e) => e 
  }))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected expression at line 15:23 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:15:23
   |
15 |   |> result.flat_map((fn {
   |                       ^
error: Expected function name at line 15:26 (got LBrace '{')
  --> /tmp/dojo-result-pipeline-1.almd:15:26
   |
15 |   |> result.flat_map((fn {
   |                          ^
error: Expected function name at line 19:26 (got LBrace '{')
  --> /tmp/dojo-result-pipeline-1.almd:19:26
   |
19 |   |> result.flat_map((fn {
   |                          ^
error: Expected function name at line 23:21 (got LBrace '{')
  --> /tmp/dojo-result-pipeline-1.almd:23:21
   |
23 |   |> result.map((fn {
   |                     ^

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
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> result.flat_map(fn { 
    ok(n) => validate_positive(n) 
    | err(e) => err(e) 
  }) 
  |> result.flat_map(fn { 
    ok(n) => validate_range(n, 1, 100) 
    | err(e) => err(e) 
  }) 
  |> result.map(fn { 
    ok(n) => "valid: " + int.to_string(n) 
    | err(e) => e 
  })
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:15:22
   |
15 |   |> result.flat_map(fn {
   |                      ^
error: Expected function name at line 15:25 (got LBrace '{')
  --> /tmp/dojo-result-pipeline-2.almd:15:25
   |
15 |   |> result.flat_map(fn {
   |                         ^
error: Expected function name at line 19:25 (got LBrace '{')
  --> /tmp/dojo-result-pipeline-2.almd:19:25
   |
19 |   |> result.flat_map(fn {
   |                         ^
error: Expected function name at line 23:20 (got LBrace '{')
  --> /tmp/dojo-result-pipeline-2.almd:23:20
   |
23 |   |> result.map(fn {
   |                    ^

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
  if lo < n and n < hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> result.flat_map((fn { 
    ok(n) => validate_positive(n) 
    | err(e) => err(e) 
  })) 
  |> result.flat_map((fn { 
    ok(n) => validate_range(n, 1, 100) 
    | err(e) => err(e) 
  })) 
  |> result.map((fn { 
    ok(n) => "valid: " + int.to_string(n) 
    | err(e) => e 
  }))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: Expected expression at line 15:23 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:15:23
   |
15 |   |> result.flat_map((fn {
   |                       ^
error: Expected function name at line 15:26 (got LBrace '{')
  --> /tmp/dojo-result-pipeline-3.almd:15:26
   |
15 |   |> result.flat_map((fn {
   |                          ^
error: Expected function name at line 19:26 (got LBrace '{')
  --> /tmp/dojo-result-pipeline-3.almd:19:26
   |
19 |   |> result.flat_map((fn {
   |                          ^
error: Expected function name at line 23:21 (got LBrace '{')
  --> /tmp/dojo-result-pipeline-3.almd:23:21
   |
23 |   |> result.map((fn {
   |                     ^

4 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
