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
  |> result.flat_map(fn r => 
    match r {
      ok(n) => validate_positive(n),
      err(e) => err(e)
    }
  )
  |> result.flat_map(fn r => 
    match r {
      ok(n) => validate_range(n, 1, 100),
      err(e) => err(e)
    }
  )
  |> result.map(fn r => 
    match r {
      ok(n) => "valid: " + int.to_string(n),
      err(e
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
15 |   |> result.flat_map(fn r =>
   |                      ^
error: Expected LParen at line 15:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:15:27
   |
15 |   |> result.flat_map(fn r =>
   |                           ^
error: Expected LParen at line 21:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:21:27
   |
21 |   |> result.flat_map(fn r =>
   |                           ^
error: Expected LParen at line 27:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:27:22
   |
27 |   |> result.map(fn r =>
   |                      ^

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
  |> result.flat_map((r) => 
    match r {
      ok(n) => validate_positive(n),
      err(e) => err(e)
    }
  )
  |> result.flat_map((r) => 
    match r {
      ok(n) => validate_range(n, 1, 100),
      err(e) => err(e)
    }
  )
  |> result.map((r) => 
    match r {
      ok(n) => "valid: " + int.to_string(n),
      err(e)
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected FatArrow at line 30:13 (got Newline '')
  --> /tmp/dojo-result-pipeline-1.almd:30:13
   |
30 |       err(e)
   |             ^

1 error(s) found
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
  |> result.flat_map((r) => 
    match r {
      ok(n) => validate_positive(n),
      err(e) => err(e)
    }
  )
  |> result.flat_map((r) => 
    match r {
      ok(n) => validate_range(n, 1, 100),
      err(e) => err(e)
    }
  )
  |> result.map((r) => 
    match r {
      ok(n) => "valid: " + int.to_string(n),
      err(e)
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Expected FatArrow at line 30:13 (got Newline '')
  --> /tmp/dojo-result-pipeline-2.almd:30:13
   |
30 |       err(e)
   |             ^

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
  |> result.flat_map(r => 
    match r {
      ok(n) => validate_positive(n) |> result.flat_map(r => 
        match r {
          ok(n) => validate_range(n, 1, 100) |> result.map(r => 
            match r {
              ok(n) => "valid: " + int.to_string(n),
              err(e) => err(e)
            }
          ),
          err(e) => err(e)
        }
      ),
      err(e) => err(e)
    }
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-result-pipeline-3.almd:15:24
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
   |
15 |   |> result.flat_map(r =>
   |                        ^^

1 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
