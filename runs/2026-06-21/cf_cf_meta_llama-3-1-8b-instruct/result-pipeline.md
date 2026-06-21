# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: import-error
- **diagnostic code**: `E004`

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  match int.parse(s) {
    ok(n) => ok(n)
    err(e) => err(e)
  }

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
error: '&&' is not valid in Almide at line 11:14
  --> /tmp/dojo-result-pipeline-0.almd:11:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
11 |   if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
   |              ^
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:15:22
   |
15 |   |> result.flat_map(fn(n) => validate_positive(n))
   |                      ^
error: Expected function name at line 15:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:15:24
   |
15 |   |> result.flat_map(fn(n) => validate_positive(n))
   |                        ^
error: Expected function name at line 16:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:16:24
   |
16 |   |> result.flat_map(fn(n) => validate_range(n, 1, 100))
   |                        ^
error: Expected function name at line 17:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:17:19
   |
17 |   |> result.map(fn(n) => "valid: " + int.to_string(n))
   |                   ^

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
    ok(n) => ok(n)
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(validate_positive)
  |> result.flat_map(fn(n) => validate_range(n, 1, 100))
  |> result.map(fn(n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected expression at line 16:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:16:22
   |
16 |   |> result.flat_map(fn(n) => validate_range(n, 1, 100))
   |                      ^
error: Expected function name at line 16:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:16:24
   |
16 |   |> result.flat_map(fn(n) => validate_range(n, 1, 100))
   |                        ^
error: Expected function name at line 17:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:17:19
   |
17 |   |> result.map(fn(n) => "valid: " + int.to_string(n))
   |                   ^

3 error(s) found
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  match int.parse(s) {
    ok(n) => ok(n)
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(validate_positive)
  |> result.flat_map((n) => validate_range(n, 1, 100))
  |> result.map((n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
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
  parse_int(input)
  |> result.flat_map(validate_positive)
  |> result.flat_map(validate_range(1, 100))
  |> result.map((n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error[E004]: validate_range() expects 3 argument(s) but got 2
  --> /tmp/dojo-result-pipeline-3.almd:13:40
  in call to validate_range()
  hint: Check the number of arguments
  try:
      // validate_range() takes 3 arg(s) — you passed 2
      validate_range(<n: Int>, <lo: Int>, <hi: Int>)
   |
13 |   |> result.flat_map(validate_range(1, 100))
   |                                        ^^^
error[E005]: argument 'f' expects fn(Int) -> Result[B, String] but got Result[Int, String]
  --> /tmp/dojo-result-pipeline-3.almd:13:40
  in call to result.flat_map()
  hint: Fix the argument type
   |
13 |   |> result.flat_map(validate_range(1, 100))
   |                                        ^^^
error[E001]: type mismatch in call to result.flat_map(): expected fn(Int) -> Result[B, String] but got Result[Int, String]
  --> /tmp/dojo-result-pipeline-3.almd:13:40
  in call to result.flat_map()
  hint: Fix the expression type or change the expected type
   |
13 |   |> result.flat_map(validate_range(1, 100))
   |                                        ^^^

3 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
