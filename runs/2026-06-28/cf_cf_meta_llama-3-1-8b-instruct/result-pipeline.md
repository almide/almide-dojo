# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] =
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] =
  if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] =
  parse_int(input)
  |> result.flat_map(fn r => validate_positive(r))
  |> result.flat_map(fn r => validate_range(r, 1, 100))
  |> result.map(fn r => "valid: " + int.to_string(r))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: '&&' is not valid in Almide at line 7:14
  --> /tmp/dojo-result-pipeline-0.almd:7:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
7 |   if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |              ^
error: Expected expression at line 11:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:11:22
   |
11 |   |> result.flat_map(fn r => validate_positive(r))
   |                      ^
error: Expected LParen at line 11:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:11:27
   |
11 |   |> result.flat_map(fn r => validate_positive(r))
   |                           ^
error: Expected LParen at line 12:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:12:27
   |
12 |   |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                           ^
error: Expected LParen at line 13:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:13:22
   |
13 |   |> result.map(fn r => "valid: " + int.to_string(r))
   |                      ^

5 error(s) found
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] =
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] =
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] =
  parse_int(input)
  |> result.flat_map(fn r => validate_positive(r))
  |> result.flat_map(fn r => validate_range(r, 1, 100))
  |> result.map(fn r => "valid: " + int.to_string(r))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected expression at line 11:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:11:22
   |
11 |   |> result.flat_map(fn r => validate_positive(r))
   |                      ^
error: Expected LParen at line 11:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:11:27
   |
11 |   |> result.flat_map(fn r => validate_positive(r))
   |                           ^
error: Expected LParen at line 12:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:12:27
   |
12 |   |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                           ^
error: Expected LParen at line 13:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:13:22
   |
13 |   |> result.map(fn r => "valid: " + int.to_string(r))
   |                      ^

4 error(s) found
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] =
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] =
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] =
  parse_int(input)
  |> result.flat_map((r) => validate_positive(r))
  |> result.flat_map((r) => validate_range(r, 1, 100))
  |> result.map((r) => "valid: " + int.to_string(r))
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
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] =
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] =
  parse_int(input)
  |> result.flat_map((r) => if result.is_ok(r) then validate_positive(r) else err("not a number: " + input))
  |> result.flat_map((r) => if result.is_ok(r) then validate_range(r, 1, 100) else err("must be positive: " + input))
  |> result.map((r) => "valid: " + int.to_string(r))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error[E005]: argument 'n' expects Int but got Result[A, E]
  --> /tmp/dojo-result-pipeline-3.almd:11:71
  in call to validate_positive()
  hint: Fix the argument type
   |
 3 | fn validate_positive(n: Int) -> Result[Int, String] =
   | ----------------------------------- fn validate_positive() defined here
...
11 |   |> result.flat_map((r) => if result.is_ok(r) then validate_positive(r) else err("not a number: " + input))
   |                                                                       ^
error[E005]: argument 'n' expects Int but got Result[A, E]
  --> /tmp/dojo-result-pipeline-3.almd:12:74
  in call to validate_range()
  hint: Fix the argument type
   |
 6 | fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] =
   | -------------------------------- fn validate_range() defined here
...
12 |   |> result.flat_map((r) => if result.is_ok(r) then validate_range(r, 1, 100) else err("must be positive: " + input))
   |                                                                          ^^^

2 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
