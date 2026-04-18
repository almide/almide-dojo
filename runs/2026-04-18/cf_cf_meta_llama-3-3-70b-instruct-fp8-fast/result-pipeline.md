# result-pipeline

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if int.gt(n, 0) 
  then ok(n) 
  else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if int.ge(n, lo) && int.le(n, hi) 
  then ok(n) 
  else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int(input), (n) => 
    result.flat_map(validate_positive(n), (n) => 
      result.flat_map(validate_range(n, 1, 100), (n) => 
        result.map(ok(n), (n) => "valid: " + int.to_string(n))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:31:34
  in call to validate_range()
  hint: Did you mean `list.range`?
  try:
      // validate_range(...)  →  list.range(...)
      list.range(...)
   |
31 |   assert_eq(validate_range(5, 1, 10), ok(5))
   |                                  ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:35:35
  in call to validate_range()
  hint: Did you mean `list.range`?
  try:
      // validate_range(...)  →  list.range(...)
      list.range(...)
   |
35 |   assert_eq(validate_range(15, 1, 10), err("out of range: 15"))
   |                                   ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:39:34
  in call to validate_range()
  hint: Did you mean `list.range`?
  try:
      // validate_range(...)  →  list.range(...)
      list.range(...)
   |
39 |   assert_eq(validate_range(0, 1, 10), err("out of range: 0"))
   |                                  ^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:43:21
  in call to process()
  hint: Check the function name
   |
43 |   assert_eq(process("42"), ok("valid: 42"))
   |                     ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:47:21
  in call to process()
  hint: Check the function name
   |
47 |   assert_eq(process("abc"), err("not a number: abc"))
   |                     ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:51:21
  in call to process()
  hint: Check the function name
   |
51 |   assert_eq(process("-5"), err("must be positive: -5"))
   |                     ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:55:21
  in call to process()
  hint: Check the function name
   |
55 |   assert_eq(process("200"), err("out of range: 200"))
   |                     ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:59:21
  in call to process()
  hint: Check the function name
   |
59 |   assert_eq(process("1"), ok("valid: 1"))
   |                     ^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:63:21
  in call to process()
  hint: Check the function name
   |
63 |   assert_eq(process("100"), ok("valid: 100"))
   |                     ^^^^^

9 error(s) found
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 
  then ok(n) 
  else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo && n <= hi 
  then ok(n) 
  else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(int.parse(input), (n) => 
    result.flat_map(validate_positive(n), (n) => 
      result.flat_map(validate_range(n, 1, 100), (n) => 
        result.map(ok(n), (n) => "valid: " + int.to_string(n))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: '&&' is not valid in Almide at line 10:14
  --> /tmp/dojo-result-pipeline-1.almd:10:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
10 |   if n >= lo && n <= hi
   |              ^
error: Expected ')' to close function call opened at line 15:18
  --> /tmp/dojo-result-pipeline-1.almd:20:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
15 |   result.flat_map(int.parse(input), (n) =>
   |                  --------------- '(' opened here
...
20 | test "parse_int valid" { assert_eq(parse_int("42"), ok(42)) }
   | ^^^^

2 error(s) found
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 
  then ok(n) 
  else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo and n <= hi 
  then ok(n) 
  else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(int.parse(input), (n) => 
    result.flat_map(validate_positive(n), (n) => 
      result.flat_map(validate_range(n, 1, 100), (n) => 
        result.map(ok(n), (n) => "valid: " + int.to_string(n))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Expected ')' to close function call opened at line 15:18
  --> /tmp/dojo-result-pipeline-2.almd:20:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
15 |   result.flat_map(int.parse(input), (n) =>
   |                  --------------- '(' opened here
...
20 | test "parse_int valid" { assert_eq(parse_int("42"), ok(42)) }
   | ^^^^

1 error(s) found
Compile error for /tmp/dojo-result-pipeline-2.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 
  then ok(n) 
  else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo and n <= hi 
  then ok(n) 
  else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(int.parse(input), (n) => 
    result.flat_map(validate_positive(n), (n) => 
      result.flat_map(validate_range(n, 1, 100), (n) => 
        result.map(ok(n), (x) => "valid: " + int.to_string(x))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: Expected ')' to close function call opened at line 15:18
  --> /tmp/dojo-result-pipeline-3.almd:20:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
15 |   result.flat_map(int.parse(input), (n) =>
   |                  --------------- '(' opened here
...
20 | test "parse_int valid" { assert_eq(parse_int("42"), ok(42)) }
   | ^^^^

1 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
