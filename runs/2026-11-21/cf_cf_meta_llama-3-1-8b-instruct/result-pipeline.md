# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(|_| "not a number: ")

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
    .flat_map(|n| validate_positive(n))
    .flat_map(|n| validate_range(n, 1, 100))
    .map(|n| "valid: " + int.to_string(n))
```

**Diagnostic:**

```
error: '|x|' closure syntax is not valid in Almide
  --> /tmp/dojo-result-pipeline-0.almd:2:24
  in lambda
  here: int.parse(s).map_err(|_| "not a number: ")
  hint: Write a lambda as `(x) => expr`: list.map(xs, (x) => x + 1).
  try:
      (x) => x + 1
  |
2 |   int.parse(s).map_err(|_| "not a number: ")
  |                        ^
error: '&&' is not valid in Almide
  --> /tmp/dojo-result-pipeline-0.almd:8:14
  in operator
  here: if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  hint: Use 'and' for logical AND. Example: if a and b then ...
  try:
      a and b
  |
8 |   if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |              ^^
error: '|x|' closure syntax is not valid in Almide
  --> /tmp/dojo-result-pipeline-0.almd:12:15
  in lambda
  here: .flat_map(|n| validate_positive(n))
  hint: Write a lambda as `(x) => expr`: list.map(xs, (x) => x + 1).
  try:
      (x) => x + 1
   |
12 |     .flat_map(|n| validate_positive(n))
   |               ^
error: '|x|' closure syntax is not valid in Almide
  --> /tmp/dojo-result-pipeline-0.almd:13:15
  in lambda
  here: .flat_map(|n| validate_range(n, 1, 100))
  hint: Write a lambda as `(x) => expr`: list.map(xs, (x) => x + 1).
  try:
      (x) => x + 1
   |
13 |     .flat_map(|n| validate_range(n, 1, 100))
   |               ^
error: '|x|' closure syntax is not valid in Almide
  --> /tmp/dojo-result-pipeline-0.almd:14:10
  in lambda
  here: .map(|n| "valid: " + int.to_string(n))
  hint: Write a lambda as `(x) => expr`: list.map(xs, (x) => x + 1).
  try:
      (x) => x + 1
   |
14 |     .map(|n| "valid: " + int.to_string(n))
   |          ^

5 error(s) found
FAILED: /tmp/dojo-result-pipeline-0.almd
  parse error: '|x|' closure syntax is not valid in Almide
  parse error: '&&' is not valid in Almide
  parse error: '|x|' closure syntax is not valid in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-result-pipeline-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(|e| "not a number: " + e)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
    .flat_map(|n| validate_positive(n))
    .flat_map(|n| validate_range(n, 1, 100))
    .map(|n| "valid: " + int.to_string(n))
```

**Diagnostic:**

```
error: '|x|' closure syntax is not valid in Almide
  --> /tmp/dojo-result-pipeline-1.almd:2:24
  in lambda
  here: int.parse(s).map_err(|e| "not a number: " + e)
  hint: Write a lambda as `(x) => expr`: list.map(xs, (x) => x + 1).
  try:
      (x) => x + 1
  |
2 |   int.parse(s).map_err(|e| "not a number: " + e)
  |                        ^
error: '|x|' closure syntax is not valid in Almide
  --> /tmp/dojo-result-pipeline-1.almd:12:15
  in lambda
  here: .flat_map(|n| validate_positive(n))
  hint: Write a lambda as `(x) => expr`: list.map(xs, (x) => x + 1).
  try:
      (x) => x + 1
   |
12 |     .flat_map(|n| validate_positive(n))
   |               ^
error: '|x|' closure syntax is not valid in Almide
  --> /tmp/dojo-result-pipeline-1.almd:13:15
  in lambda
  here: .flat_map(|n| validate_range(n, 1, 100))
  hint: Write a lambda as `(x) => expr`: list.map(xs, (x) => x + 1).
  try:
      (x) => x + 1
   |
13 |     .flat_map(|n| validate_range(n, 1, 100))
   |               ^
error: '|x|' closure syntax is not valid in Almide
  --> /tmp/dojo-result-pipeline-1.almd:14:10
  in lambda
  here: .map(|n| "valid: " + int.to_string(n))
  hint: Write a lambda as `(x) => expr`: list.map(xs, (x) => x + 1).
  try:
      (x) => x + 1
   |
14 |     .map(|n| "valid: " + int.to_string(n))
   |          ^

4 error(s) found
FAILED: /tmp/dojo-result-pipeline-1.almd
  parse error: '|x|' closure syntax is not valid in Almide
  parse error: '|x|' closure syntax is not valid in Almide
  parse error: '|x|' closure syntax is not valid in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-result-pipeline-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(|e| "not a number: " + e)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
    .flat_map(validate_positive)
    .flat_map(|n| validate_range(n, 1, 100))
    .map(|n| "valid: " + int.to_string(n))
```

**Diagnostic:**

```
error: '|x|' closure syntax is not valid in Almide
  --> /tmp/dojo-result-pipeline-2.almd:2:24
  in lambda
  here: int.parse(s).map_err(|e| "not a number: " + e)
  hint: Write a lambda as `(x) => expr`: list.map(xs, (x) => x + 1).
  try:
      (x) => x + 1
  |
2 |   int.parse(s).map_err(|e| "not a number: " + e)
  |                        ^
error: '|x|' closure syntax is not valid in Almide
  --> /tmp/dojo-result-pipeline-2.almd:13:15
  in lambda
  here: .flat_map(|n| validate_range(n, 1, 100))
  hint: Write a lambda as `(x) => expr`: list.map(xs, (x) => x + 1).
  try:
      (x) => x + 1
   |
13 |     .flat_map(|n| validate_range(n, 1, 100))
   |               ^
error: '|x|' closure syntax is not valid in Almide
  --> /tmp/dojo-result-pipeline-2.almd:14:10
  in lambda
  here: .map(|n| "valid: " + int.to_string(n))
  hint: Write a lambda as `(x) => expr`: list.map(xs, (x) => x + 1).
  try:
      (x) => x + 1
   |
14 |     .map(|n| "valid: " + int.to_string(n))
   |          ^

3 error(s) found
FAILED: /tmp/dojo-result-pipeline-2.almd
  parse error: '|x|' closure syntax is not valid in Almide
  parse error: '|x|' closure syntax is not valid in Almide
  parse error: '|x|' closure syntax is not valid in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-result-pipeline-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(|e| "not a number: " + e)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
    .flat_map(validate_positive)
    .flat_map(validate_range(1, 100, (n) => n))
    .map((n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
error: '|x|' closure syntax is not valid in Almide
  --> /tmp/dojo-result-pipeline-3.almd:2:24
  in lambda
  here: int.parse(s).map_err(|e| "not a number: " + e)
  hint: Write a lambda as `(x) => expr`: list.map(xs, (x) => x + 1).
  try:
      (x) => x + 1
  |
2 |   int.parse(s).map_err(|e| "not a number: " + e)
  |                        ^
error[E005]: argument 'hi' expects Int but got fn(?12) -> ?12
  --> /tmp/dojo-result-pipeline-3.almd:13:38
  in call to validate_range()
  here: .flat_map(validate_range(1, 100, (n) => n))
  hint: Fix the argument type
   |
 7 | fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] =
   | -------------------------------- fn validate_range() defined here
...
13 |     .flat_map(validate_range(1, 100, (n) => n))
   |                                      ^
error[E005]: argument 'f' expects fn(Int) -> Result[B, String] but got Result[Int, String]
  --> /tmp/dojo-result-pipeline-3.almd:11:13
  in call to result.flat_map()
  here: parse_int(input)
  hint: the argument is a Result[Int, String] — unwrap it first: `!` propagates the error (effect fn body), `?? fallback` supplies a default, or `match` handles ok/err
   |
11 |   parse_int(input)
   |             ^^^^^

3 error(s) found
FAILED: /tmp/dojo-result-pipeline-3.almd
  parse error: '|x|' closure syntax is not valid in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-result-pipeline-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
