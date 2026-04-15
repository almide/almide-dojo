# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

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
  if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  .flat_map(fn(n) => validate_positive(n))
  .flat_map(fn(n) => validate_range(n, 1, 100))
  .map(fn(n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: '&&' is not valid in Almide at line 11:14
  --> /tmp/dojo-result-pipeline-0.almd:11:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
11 |   if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
   |              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 15:3 (got Dot '.')
  --> /tmp/dojo-result-pipeline-0.almd:15:3
   |
15 |   .flat_map(fn(n) => validate_positive(n))
   |   ^
error: Expected function name at line 15:15 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:15:15
   |
15 |   .flat_map(fn(n) => validate_positive(n))
   |               ^
error: Expected function name at line 16:15 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:16:15
   |
16 |   .flat_map(fn(n) => validate_range(n, 1, 100))
   |               ^
error: Expected function name at line 17:10 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:17:10
   |
17 |   .map(fn(n) => "valid: " + int.to_string(n))
   |          ^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:25:59
  in call to validate_range()
  hint: Check the function name
   |
25 | test "validate_range in" { assert_eq(validate_range(5, 1, 10), ok(5)) }
   |                                                           ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:26:61
  in call to validate_range()
  hint: Check the function name
   |
26 | test "validate_range out" { assert_eq(validate_range(15, 1, 10), err("out of range: 15")) }
   |                                                             ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:27:60
  in call to validate_range()
  hint: Check the function name
   |
27 | test "validate_range low" { assert_eq(validate_range(0, 1, 10), err("out of range: 0")) }
   |                                                            ^^
error[E001]: type mismatch in fn 'process': expected Result[String, String] but got Result[Int, String]
  --> /tmp/dojo-result-pipeline-0.almd:14:13
  in fn 'process'
  hint: Fix the expression type or change the expected type
   |
14 |   parse_int(input)
   |             ^^^^^

9 error(s) found
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
  .flat_map(fn(r) => match r {
    ok(n) => validate_positive(n),
    err(e) => err(e)
  })
  .flat_map(fn(r) => match r {
    ok(n) => validate_range(n, 1, 100),
    err(e) => err(e)
  })
  .map(fn(n) => "valid: " + int.to_string(n))
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
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 15:3 (got Dot '.')
  --> /tmp/dojo-result-pipeline-1.almd:15:3
   |
15 |   .flat_map(fn(r) => match r {
   |   ^
error: Expected function name at line 15:15 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:15:15
   |
15 |   .flat_map(fn(r) => match r {
   |               ^
error: Expected function name at line 19:15 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:19:15
   |
19 |   .flat_map(fn(r) => match r {
   |               ^
error: Expected function name at line 23:10 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:23:10
   |
23 |   .map(fn(n) => "valid: " + int.to_string(n))
   |          ^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-1.almd:31:59
  in call to validate_range()
  hint: Check the function name
   |
31 | test "validate_range in" { assert_eq(validate_range(5, 1, 10), ok(5)) }
   |                                                           ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-1.almd:32:61
  in call to validate_range()
  hint: Check the function name
   |
32 | test "validate_range out" { assert_eq(validate_range(15, 1, 10), err("out of range: 15")) }
   |                                                             ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-1.almd:33:60
  in call to validate_range()
  hint: Check the function name
   |
33 | test "validate_range low" { assert_eq(validate_range(0, 1, 10), err("out of range: 0")) }
   |                                                            ^^
error[E001]: type mismatch in fn 'process': expected Result[String, String] but got Result[Int, String]
  --> /tmp/dojo-result-pipeline-1.almd:14:13
  in fn 'process'
  hint: Fix the expression type or change the expected type
   |
14 |   parse_int(input)
   |             ^^^^^

9 error(s) found
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
  .flat_map(fn(r) => match r {
    ok(n) => validate_positive(n),
    err(e) => err(e)
  })
  .flat_map(fn(r) => match r {
    ok(n) => validate_range(n, 1, 100),
    err(e) => err(e)
  })
  .map(fn(n) => "valid: " + int.to_string(n))
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
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 15:3 (got Dot '.')
  --> /tmp/dojo-result-pipeline-2.almd:15:3
   |
15 |   .flat_map(fn(r) => match r {
   |   ^
error: Expected function name at line 15:15 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:15:15
   |
15 |   .flat_map(fn(r) => match r {
   |               ^
error: Expected function name at line 19:15 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:19:15
   |
19 |   .flat_map(fn(r) => match r {
   |               ^
error: Expected function name at line 23:10 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:23:10
   |
23 |   .map(fn(n) => "valid: " + int.to_string(n))
   |          ^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-2.almd:31:59
  in call to validate_range()
  hint: Check the function name
   |
31 | test "validate_range in" { assert_eq(validate_range(5, 1, 10), ok(5)) }
   |                                                           ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-2.almd:32:61
  in call to validate_range()
  hint: Check the function name
   |
32 | test "validate_range out" { assert_eq(validate_range(15, 1, 10), err("out of range: 15")) }
   |                                                             ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-2.almd:33:60
  in call to validate_range()
  hint: Check the function name
   |
33 | test "validate_range low" { assert_eq(validate_range(0, 1, 10), err("out of range: 0")) }
   |                                                            ^^
error[E001]: type mismatch in fn 'process': expected Result[String, String] but got Result[Int, String]
  --> /tmp/dojo-result-pipeline-2.almd:14:13
  in fn 'process'
  hint: Fix the expression type or change the expected type
   |
14 |   parse_int(input)
   |             ^^^^^

9 error(s) found
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
  .flat_map(fn(r) => match r {
    ok(n) => validate_positive(n),
    err(e) => err(e)
  })
  .flat_map(fn(r) => match r {
    ok(n) => validate_range(n, 1, 100),
    err(e) => err(e)
  })
  .map(fn(n) => "valid: " + int.to_string(n))
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
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 15:3 (got Dot '.')
  --> /tmp/dojo-result-pipeline-3.almd:15:3
   |
15 |   .flat_map(fn(r) => match r {
   |   ^
error: Expected function name at line 15:15 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:15:15
   |
15 |   .flat_map(fn(r) => match r {
   |               ^
error: Expected function name at line 19:15 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:19:15
   |
19 |   .flat_map(fn(r) => match r {
   |               ^
error: Expected function name at line 23:10 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:23:10
   |
23 |   .map(fn(n) => "valid: " + int.to_string(n))
   |          ^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-3.almd:31:59
  in call to validate_range()
  hint: Check the function name
   |
31 | test "validate_range in" { assert_eq(validate_range(5, 1, 10), ok(5)) }
   |                                                           ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-3.almd:32:61
  in call to validate_range()
  hint: Check the function name
   |
32 | test "validate_range out" { assert_eq(validate_range(15, 1, 10), err("out of range: 15")) }
   |                                                             ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-3.almd:33:60
  in call to validate_range()
  hint: Check the function name
   |
33 | test "validate_range low" { assert_eq(validate_range(0, 1, 10), err("out of range: 0")) }
   |                                                            ^^
error[E001]: type mismatch in fn 'process': expected Result[String, String] but got Result[Int, String]
  --> /tmp/dojo-result-pipeline-3.almd:14:13
  in fn 'process'
  hint: Fix the expression type or change the expected type
   |
14 |   parse_int(input)
   |             ^^^^^

9 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
