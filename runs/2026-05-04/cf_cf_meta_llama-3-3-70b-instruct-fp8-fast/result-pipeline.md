# result-pipeline

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) 
  else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n && n <= hi then ok(n) 
  else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int(input), (n) => 
    result.flat_map(validate_positive(n), (n) => 
      result.flat_map(validate_range(n, 1, 100), (n) => 
        result.map(ok(n), (n) => "valid: " + int.to_string(n))
      )
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: '&&' is not valid in Almide at line 8:14
  --> /tmp/dojo-result-pipeline-0.almd:8:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
8 |   if lo <= n && n <= hi then ok(n)
  |              ^

1 error(s) found
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) 
  else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) 
  else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int(input), (n) => 
    result.flat_map(validate_positive(n), (n) => 
      result.flat_map(validate_range(n, 1, 100), (n) => 
        result.map(ok(n), (n) => "valid: " + int.to_string(n))
      )
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
FAILED: /tmp/dojo-result-pipeline-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) 
  else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) 
  else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int(input), (n) => 
    result.flat_map(validate_positive(n), (n) => 
      result.flat_map(validate_range(n, 1, 100), (n) => 
        result.map(ok(n), (n) => "valid: " + int.to_string(n))
      )
    )
  ) 
|> result.map_err((e) => e)
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
FAILED: /tmp/dojo-result-pipeline-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) 
  else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) 
  else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int(input), (n) => 
    result.flat_map(validate_positive(n), (n) => 
      result.flat_map(validate_range(n, 1, 100), (n) => 
        ok("valid: " + int.to_string(n))
      )
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
