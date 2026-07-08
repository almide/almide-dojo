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
    ok(n) => ok(n)
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  match (n > 0) {
    true => ok(n)
    false => err("must be positive: " + int.to_string(n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match (lo <= n && n <= hi) {
    true => ok(n)
    false => err("out of range: " + int.to_string(n))
  }

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int, 
    fn r => result.flat_map(validate_positive, 
      fn r => result.map(validate_range(1, 100), 
        fn n => "valid: " + int.to_string(n))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: '&&' is not valid in Almide at line 14:18
  --> /tmp/dojo-result-pipeline-0.almd:14:18
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
14 |   match (lo <= n && n <= hi) {
   |                  ^
error: Expected expression at line 21:5 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:21:5
   |
21 |     fn r => result.flat_map(validate_positive,
   |     ^
error: Expected LParen at line 21:10 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:21:10
   |
21 |     fn r => result.flat_map(validate_positive,
   |          ^
error: Expected LParen at line 22:12 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:22:12
   |
22 |       fn r => result.map(validate_range(1, 100),
   |            ^
error: Expected LParen at line 23:14 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:23:14
   |
23 |         fn n => "valid: " + int.to_string(n))))
   |              ^

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
  match (n > 0) {
    true => ok(n)
    false => err("must be positive: " + int.to_string(n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match (lo <= n and n <= hi) {
    true => ok(n)
    false => err("out of range: " + int.to_string(n))
  }

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int, 
    fn r => result.flat_map(validate_positive, 
      fn r => result.map(validate_range(1, 100, r), 
        fn n => "valid: " + int.to_string(n))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected expression at line 21:5 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:21:5
   |
21 |     fn r => result.flat_map(validate_positive,
   |     ^
error: Expected LParen at line 21:10 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:21:10
   |
21 |     fn r => result.flat_map(validate_positive,
   |          ^
error: Expected LParen at line 22:12 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:22:12
   |
22 |       fn r => result.map(validate_range(1, 100, r),
   |            ^
error: Expected LParen at line 23:14 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:23:14
   |
23 |         fn n => "valid: " + int.to_string(n))))
   |              ^

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
    ok(n) => ok(n)
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int, 
    fn r => validate_positive(r))
  |> result.flat_map(
    fn r => validate_range(1, 100, r),
    fn n => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Expected expression at line 15:5 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:15:5
   |
15 |     fn r => validate_positive(r))
   |     ^
error: Expected LParen at line 15:10 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:15:10
   |
15 |     fn r => validate_positive(r))
   |          ^
error: Expected LParen at line 17:10 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:17:10
   |
17 |     fn r => validate_range(1, 100, r),
   |          ^
error: Expected LParen at line 18:10 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:18:10
   |
18 |     fn n => "valid: " + int.to_string(n))
   |          ^

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
    ok(n) => ok(n)
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int, 
    fn r => validate_positive(r).flat_map(
      fn r => validate_range(1, 100, r),
      fn n => "valid: " + int.to_string(n)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: Expected expression at line 15:5 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:15:5
   |
15 |     fn r => validate_positive(r).flat_map(
   |     ^
error: Expected LParen at line 15:10 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:15:10
   |
15 |     fn r => validate_positive(r).flat_map(
   |          ^
error: Expected LParen at line 16:12 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:16:12
   |
16 |       fn r => validate_range(1, 100, r),
   |            ^
error: Expected LParen at line 17:12 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:17:12
   |
17 |       fn n => "valid: " + int.to_string(n)))
   |            ^

4 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
