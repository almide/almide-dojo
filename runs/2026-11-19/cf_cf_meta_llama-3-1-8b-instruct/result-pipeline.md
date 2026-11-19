# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E046`

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(|_| "not a number: " ++ s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " ++ int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n && n <= hi then ok(n) else err("out of range: " ++ int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
    .flat_map(validate_positive)
    .flat_map(fn(n) => validate_range(n, 1, 100))
    .map(fn(n) => "valid: " ++ int.to_string(n))
```

**Diagnostic:**

```
error: '|x|' closure syntax is not valid in Almide
  --> /tmp/dojo-result-pipeline-0.almd:2:24
  in lambda
  here: int.parse(s).map_err(|_| "not a number: " ++ s)
  hint: Write a lambda as `(x) => expr`: list.map(xs, (x) => x + 1).
  try:
      (x) => x + 1
  |
2 |   int.parse(s).map_err(|_| "not a number: " ++ s)
  |                        ^
error: '&&' is not valid in Almide
  --> /tmp/dojo-result-pipeline-0.almd:8:14
  in operator
  here: if lo <= n && n <= hi then ok(n) else err("out of range: " ++ int.to_string(n))
  hint: Use 'and' for logical AND. Example: if a and b then ...
  try:
      a and b
  |
8 |   if lo <= n && n <= hi then ok(n) else err("out of range: " ++ int.to_string(n))
  |              ^^
error: Expected expression at line 13:15 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:13:15
  here: .flat_map(fn(n) => validate_range(n, 1, 100))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |     .flat_map(fn(n) => validate_range(n, 1, 100))
   |               ^
error: Expected function name at line 13:17 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:13:17
  here: .flat_map(fn(n) => validate_range(n, 1, 100))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |     .flat_map(fn(n) => validate_range(n, 1, 100))
   |                 ^
error: Expected function name at line 14:12 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:14:12
  here: .map(fn(n) => "valid: " ++ int.to_string(n))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |     .map(fn(n) => "valid: " ++ int.to_string(n))
   |            ^
error: operator '++' has been removed. Use '+' for concatenation
  --> /tmp/dojo-result-pipeline-0.almd:2:48
  in operator ++
  here: int.parse(s).map_err(|_| "not a number: " ++ s)
  hint: Replace ++ with +
  |
2 |   int.parse(s).map_err(|_| "not a number: " ++ s)
  |                                                ^
error: operator '++' has been removed. Use '+' for concatenation
  --> /tmp/dojo-result-pipeline-0.almd:5:70
  in operator ++
  here: if n > 0 then ok(n) else err("must be positive: " ++ int.to_string(n))
  hint: Replace ++ with +
  |
5 |   if n > 0 then ok(n) else err("must be positive: " ++ int.to_string(n))
  |                                                                      ^
error: operator '++' has been removed. Use '+' for concatenation
  --> /tmp/dojo-result-pipeline-0.almd:8:79
  in operator ++
  here: if lo <= n && n <= hi then ok(n) else err("out of range: " ++ int.to_string(n))
  hint: Replace ++ with +
  |
8 |   if lo <= n && n <= hi then ok(n) else err("out of range: " ++ int.to_string(n))
  |                                                                               ^

8 error(s) found
FAILED: /tmp/dojo-result-pipeline-0.almd
  parse error: '|x|' closure syntax is not valid in Almide
  parse error: '&&' is not valid in Almide
  parse error: Expected expression at line 13:15 (got Fn 'fn')
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
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
    .flat_map(validate_positive)
    .flat_map(fn(n) => validate_range(n, 1, 100))
    .map(fn(n) => "valid: " + int.to_string(n))
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
error: Expected expression at line 13:15 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:13:15
  here: .flat_map(fn(n) => validate_range(n, 1, 100))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |     .flat_map(fn(n) => validate_range(n, 1, 100))
   |               ^
error: Expected function name at line 13:17 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:13:17
  here: .flat_map(fn(n) => validate_range(n, 1, 100))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |     .flat_map(fn(n) => validate_range(n, 1, 100))
   |                 ^
error: Expected function name at line 14:12 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:14:12
  here: .map(fn(n) => "valid: " + int.to_string(n))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |     .map(fn(n) => "valid: " + int.to_string(n))
   |            ^

4 error(s) found
FAILED: /tmp/dojo-result-pipeline-1.almd
  parse error: '|x|' closure syntax is not valid in Almide
  parse error: Expected expression at line 13:15 (got Fn 'fn')
  parse error: Expected function name at line 13:17 (got LParen '(')
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
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
    .flat_map(validate_positive)
    .flat_map((n) => validate_range(n, 1, 100))
    .map((n) => "valid: " + int.to_string(n))
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

1 error(s) found
FAILED: /tmp/dojo-result-pipeline-2.almd
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
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
    .flat_map(validate_positive)
    .flat_map(validate_range(1, 100, _))
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
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of validate_range())
  --> /tmp/dojo-result-pipeline-3.almd:13:38
  in call argument
  here: .flat_map(validate_range(1, 100, _))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => validate_range(1, 100, x)
   |
13 |     .flat_map(validate_range(1, 100, _))
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
