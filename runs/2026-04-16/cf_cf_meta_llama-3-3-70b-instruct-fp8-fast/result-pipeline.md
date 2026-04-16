# result-pipeline

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s) 
  |> result.map_err((e) => "not a number: " + s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if int.gt(n, 0) then ok(n) 
  else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if int.ge(n, lo) && int.le(n, hi) then ok(n) 
  else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> result.flat_map((n) => validate_positive(n)) 
  |> result.flat_map((n) => validate_range(n, 1, 100)) 
  |> result.map((n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:6:167
  in call to validate_range()
  hint: Did you mean `list.range`?
  try:
      // validate_range(...)  →  list.range(...)
      list.range(...)
  |
6 | fn process(input: String) -> Result[String, String] = parse_int(input) |> result.flat_map((n) => validate_positive(n)) |> result.flat_map((n) => validate_range(n, 1, 100)) |> result.map((n) => "valid: " + int.to_string(n))
  |                                                                                                                                                                       ^^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:33:34
  in call to validate_range()
  hint: Did you mean `list.range`?
  try:
      // validate_range(...)  →  list.range(...)
      list.range(...)
   |
33 |   assert_eq(validate_range(5, 1, 10), ok(5))
   |                                  ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:37:35
  in call to validate_range()
  hint: Did you mean `list.range`?
  try:
      // validate_range(...)  →  list.range(...)
      list.range(...)
   |
37 |   assert_eq(validate_range(15, 1, 10), err("out of range: 15"))
   |                                   ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:41:34
  in call to validate_range()
  hint: Did you mean `list.range`?
  try:
      // validate_range(...)  →  list.range(...)
      list.range(...)
   |
41 |   assert_eq(validate_range(0, 1, 10), err("out of range: 0"))
   |                                  ^^

4 error(s) found
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s) 
  |> result.map_err((e) => "not a number: " + s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) 
  else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo && n <= hi then ok(n) 
  else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> result.flat_map((n) => validate_positive(n)) 
  |> result.flat_map((n) => validate_range(n, 1, 100)) 
  |> result.map((n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: '&&' is not valid in Almide at line 10:14
  --> /tmp/dojo-result-pipeline-1.almd:10:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
10 |   if n >= lo && n <= hi then ok(n)
   |              ^

1 error(s) found
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s) 
  |> result.map_err((e) => "not a number: " + s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) 
  else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo and n <= hi then ok(n) 
  else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> result.flat_map((n) => validate_positive(n)) 
  |> result.flat_map((n) => validate_range(n, 1, 100)) 
  |> result.map((n) => "valid: " + int.to_string(n))
```
