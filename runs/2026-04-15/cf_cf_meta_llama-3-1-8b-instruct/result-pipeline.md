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
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:38:59
  in call to validate_range()
  hint: Check the function name
   |
38 | test "validate_range in" { assert_eq(validate_range(5, 1, 10), ok(5)) }
   |                                                           ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:39:61
  in call to validate_range()
  hint: Check the function name
   |
39 | test "validate_range out" { assert_eq(validate_range(15, 1, 10), err("out of range: 15")) }
   |                                                             ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:40:60
  in call to validate_range()
  hint: Check the function name
   |
40 | test "validate_range low" { assert_eq(validate_range(0, 1, 10), err("out of range: 0")) }
   |                                                            ^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:41:42
  in call to process()
  hint: Check the function name
   |
41 | test "process valid" { assert_eq(process("42"), ok("valid: 42")) }
   |                                          ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:42:50
  in call to process()
  hint: Check the function name
   |
42 | test "process invalid parse" { assert_eq(process("abc"), err("not a number: abc")) }
   |                                                  ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:43:45
  in call to process()
  hint: Check the function name
   |
43 | test "process negative" { assert_eq(process("-5"), err("must be positive: -5")) }
   |                                             ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:44:49
  in call to process()
  hint: Check the function name
   |
44 | test "process out of range" { assert_eq(process("200"), err("out of range: 200")) }
   |                                                 ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:45:47
  in call to process()
  hint: Check the function name
   |
45 | test "process boundary 1" { assert_eq(process("1"), ok("valid: 1")) }
   |                                               ^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:46:49
  in call to process()
  hint: Check the function name
   |
46 | test "process boundary 100" { assert_eq(process("100"), ok("valid: 100")) }
   |                                                 ^^^^^

14 error(s) found
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
      err(e) => e
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: '&&' is not valid in Almide at line 11:14
  --> /tmp/dojo-result-pipeline-1.almd:11:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
11 |   if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
   |              ^
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:15:22
   |
15 |   |> result.flat_map(fn r =>
   |                      ^
error: Expected LParen at line 15:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:15:27
   |
15 |   |> result.flat_map(fn r =>
   |                           ^
error: Expected LParen at line 21:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:21:27
   |
21 |   |> result.flat_map(fn r =>
   |                           ^
error: Expected LParen at line 27:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:27:22
   |
27 |   |> result.map(fn r =>
   |                      ^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-1.almd:38:59
  in call to validate_range()
  hint: Check the function name
   |
38 | test "validate_range in" { assert_eq(validate_range(5, 1, 10), ok(5)) }
   |                                                           ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-1.almd:39:61
  in call to validate_range()
  hint: Check the function name
   |
39 | test "validate_range out" { assert_eq(validate_range(15, 1, 10), err("out of range: 15")) }
   |                                                             ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-1.almd:40:60
  in call to validate_range()
  hint: Check the function name
   |
40 | test "validate_range low" { assert_eq(validate_range(0, 1, 10), err("out of range: 0")) }
   |                                                            ^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-1.almd:41:42
  in call to process()
  hint: Check the function name
   |
41 | test "process valid" { assert_eq(process("42"), ok("valid: 42")) }
   |                                          ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-1.almd:42:50
  in call to process()
  hint: Check the function name
   |
42 | test "process invalid parse" { assert_eq(process("abc"), err("not a number: abc")) }
   |                                                  ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-1.almd:43:45
  in call to process()
  hint: Check the function name
   |
43 | test "process negative" { assert_eq(process("-5"), err("must be positive: -5")) }
   |                                             ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-1.almd:44:49
  in call to process()
  hint: Check the function name
   |
44 | test "process out of range" { assert_eq(process("200"), err("out of range: 200")) }
   |                                                 ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-1.almd:45:47
  in call to process()
  hint: Check the function name
   |
45 | test "process boundary 1" { assert_eq(process("1"), ok("valid: 1")) }
   |                                               ^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-1.almd:46:49
  in call to process()
  hint: Check the function name
   |
46 | test "process boundary 100" { assert_eq(process("100"), ok("valid: 100")) }
   |                                                 ^^^^^

14 error(s) found
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
      err(e) => e
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: '&&' is not valid in Almide at line 11:14
  --> /tmp/dojo-result-pipeline-2.almd:11:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
11 |   if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
   |              ^
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:15:22
   |
15 |   |> result.flat_map(fn r =>
   |                      ^
error: Expected LParen at line 15:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:15:27
   |
15 |   |> result.flat_map(fn r =>
   |                           ^
error: Expected LParen at line 21:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:21:27
   |
21 |   |> result.flat_map(fn r =>
   |                           ^
error: Expected LParen at line 27:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:27:22
   |
27 |   |> result.map(fn r =>
   |                      ^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-2.almd:38:59
  in call to validate_range()
  hint: Check the function name
   |
38 | test "validate_range in" { assert_eq(validate_range(5, 1, 10), ok(5)) }
   |                                                           ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-2.almd:39:61
  in call to validate_range()
  hint: Check the function name
   |
39 | test "validate_range out" { assert_eq(validate_range(15, 1, 10), err("out of range: 15")) }
   |                                                             ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-2.almd:40:60
  in call to validate_range()
  hint: Check the function name
   |
40 | test "validate_range low" { assert_eq(validate_range(0, 1, 10), err("out of range: 0")) }
   |                                                            ^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-2.almd:41:42
  in call to process()
  hint: Check the function name
   |
41 | test "process valid" { assert_eq(process("42"), ok("valid: 42")) }
   |                                          ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-2.almd:42:50
  in call to process()
  hint: Check the function name
   |
42 | test "process invalid parse" { assert_eq(process("abc"), err("not a number: abc")) }
   |                                                  ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-2.almd:43:45
  in call to process()
  hint: Check the function name
   |
43 | test "process negative" { assert_eq(process("-5"), err("must be positive: -5")) }
   |                                             ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-2.almd:44:49
  in call to process()
  hint: Check the function name
   |
44 | test "process out of range" { assert_eq(process("200"), err("out of range: 200")) }
   |                                                 ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-2.almd:45:47
  in call to process()
  hint: Check the function name
   |
45 | test "process boundary 1" { assert_eq(process("1"), ok("valid: 1")) }
   |                                               ^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-2.almd:46:49
  in call to process()
  hint: Check the function name
   |
46 | test "process boundary 100" { assert_eq(process("100"), ok("valid: 100")) }
   |                                                 ^^^^^

14 error(s) found
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
      err(e) => e
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: '&&' is not valid in Almide at line 11:14
  --> /tmp/dojo-result-pipeline-3.almd:11:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
11 |   if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
   |              ^
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:15:22
   |
15 |   |> result.flat_map(fn r =>
   |                      ^
error: Expected LParen at line 15:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:15:27
   |
15 |   |> result.flat_map(fn r =>
   |                           ^
error: Expected LParen at line 21:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:21:27
   |
21 |   |> result.flat_map(fn r =>
   |                           ^
error: Expected LParen at line 27:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:27:22
   |
27 |   |> result.map(fn r =>
   |                      ^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-3.almd:38:59
  in call to validate_range()
  hint: Check the function name
   |
38 | test "validate_range in" { assert_eq(validate_range(5, 1, 10), ok(5)) }
   |                                                           ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-3.almd:39:61
  in call to validate_range()
  hint: Check the function name
   |
39 | test "validate_range out" { assert_eq(validate_range(15, 1, 10), err("out of range: 15")) }
   |                                                             ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-3.almd:40:60
  in call to validate_range()
  hint: Check the function name
   |
40 | test "validate_range low" { assert_eq(validate_range(0, 1, 10), err("out of range: 0")) }
   |                                                            ^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-3.almd:41:42
  in call to process()
  hint: Check the function name
   |
41 | test "process valid" { assert_eq(process("42"), ok("valid: 42")) }
   |                                          ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-3.almd:42:50
  in call to process()
  hint: Check the function name
   |
42 | test "process invalid parse" { assert_eq(process("abc"), err("not a number: abc")) }
   |                                                  ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-3.almd:43:45
  in call to process()
  hint: Check the function name
   |
43 | test "process negative" { assert_eq(process("-5"), err("must be positive: -5")) }
   |                                             ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-3.almd:44:49
  in call to process()
  hint: Check the function name
   |
44 | test "process out of range" { assert_eq(process("200"), err("out of range: 200")) }
   |                                                 ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-3.almd:45:47
  in call to process()
  hint: Check the function name
   |
45 | test "process boundary 1" { assert_eq(process("1"), ok("valid: 1")) }
   |                                               ^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-3.almd:46:49
  in call to process()
  hint: Check the function name
   |
46 | test "process boundary 100" { assert_eq(process("100"), ok("valid: 100")) }
   |                                                 ^^^^^

14 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
