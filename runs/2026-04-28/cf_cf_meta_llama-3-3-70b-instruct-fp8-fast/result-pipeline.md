# result-pipeline

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if int.gt(n, 0) then ok(n) else err(string.concat(["must be positive: ", int.to_string(n)]))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if int.ge(n, lo) && int.le(n, hi) then ok(n) else err(string.concat(["out of range: ", int.to_string(n)]))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int(input), (n) => 
    result.flat_map(validate_positive(n), (n) => 
      result.flat_map(validate_range(n, 1, 100), (n) => 
        result.map(ok(n), (n) => string.concat(["valid: ", int.to_string(n)]))
      )
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error[E002]: undefined function 'string.concat'
  --> /tmp/dojo-result-pipeline-0.almd:5:61
  in call to string.concat()
  hint: No function 'concat' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
5 | else err(string.concat(["must be positive: ", int.to_string(n)]))
  |                                                             ^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:7:178
  in call to validate_range()
  hint: Did you mean `list.range`?
  try:
      // validate_range(...)  →  list.range(...)
      list.range(...)
  |
7 | fn process(input: String) -> Result[String, String] = result.flat_map(parse_int(input), (n) => result.flat_map(validate_positive(n), (n) => result.flat_map(validate_range(n, 1, 100), (n) => result.map(ok(n), (n) => string.concat(["valid: ", int.to_string(n)])))))
  |                                                                                                                                                                                  ^^^
error[E002]: undefined function 'string.concat'
  --> /tmp/dojo-result-pipeline-0.almd:7:256
  in call to string.concat()
  hint: No function 'concat' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
7 | fn process(input: String) -> Result[String, String] = result.flat_map(parse_int(input), (n) => result.flat_map(validate_positive(n), (n) => result.flat_map(validate_range(n, 1, 100), (n) => result.map(ok(n), (n) => string.concat(["valid: ", int.to_string(n)])))))
  |                                                                                                                                                                                                                                                                ^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:34:34
  in call to validate_range()
  hint: Did you mean `list.range`?
  try:
      // validate_range(...)  →  list.range(...)
      list.range(...)
   |
34 |   assert_eq(validate_range(5, 1, 10), ok(5))
   |                                  ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:38:35
  in call to validate_range()
  hint: Did you mean `list.range`?
  try:
      // validate_range(...)  →  list.range(...)
      list.range(...)
   |
38 |   assert_eq(validate_range(15, 1, 10), err("out of range: 15"))
   |                                   ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:42:34
  in call to validate_range()
  hint: Did you mean `list.range`?
  try:
      // validate_range(...)  →  list.range(...)
      list.range(...)
   |
42 |   assert_eq(validate_range(0, 1, 10), err("out of range: 0"))
   |                                  ^^

6 error(s) found
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
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

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
error: '&&' is not valid in Almide at line 8:14
  --> /tmp/dojo-result-pipeline-1.almd:8:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
8 |   if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |              ^

1 error(s) found
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
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

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
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

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
Compiling /tmp/dojo-result-pipeline-3.almd
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
