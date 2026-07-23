# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

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
  |> result.flat_map(r, fn(n) => validate_positive(n)) 
  |> result.flat_map(r, fn(n) => validate_range(n, 1, 100)) 
  |> result.map(r, fn(n) => "valid: " + int.to_string(n))
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
error: Expected expression at line 11:25 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:11:25
   |
11 |   |> result.flat_map(r, fn(n) => validate_positive(n))
   |                         ^
error: Expected function name at line 11:27 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:11:27
   |
11 |   |> result.flat_map(r, fn(n) => validate_positive(n))
   |                           ^
error: Expected function name at line 12:27 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:12:27
   |
12 |   |> result.flat_map(r, fn(n) => validate_range(n, 1, 100))
   |                           ^
error: Expected function name at line 13:22 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:13:22
   |
13 |   |> result.map(r, fn(n) => "valid: " + int.to_string(n))
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
  |> result.flat_map(r, (n) => validate_positive(n)) 
  |> result.flat_map(r, (n) => validate_range(n, 1, 100)) 
  |> result.map(r, (n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error[E003]: undefined variable 'r'
  --> /tmp/dojo-result-pipeline-1.almd:11:22
  in variable r
  hint: Check the variable name
   |
11 |   |> result.flat_map(r, (n) => validate_positive(n))
   |                      ^
error[E004]: result.flat_map() expects 2 argument(s) but got 3
  --> /tmp/dojo-result-pipeline-1.almd:11:50
  in call to result.flat_map()
  hint: Check the number of arguments
  try:
      // result.flat_map() takes 2 arg(s) — you passed 3
      result.flat_map(<r: Result[A, E]>, <f: fn(A) -> Result[B, E]>)
   |
11 |   |> result.flat_map(r, (n) => validate_positive(n))
   |                                                  ^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-result-pipeline-1.almd:12:22
  in variable r
  hint: Check the variable name
   |
12 |   |> result.flat_map(r, (n) => validate_range(n, 1, 100))
   |                      ^
error[E004]: result.flat_map() expects 2 argument(s) but got 3
  --> /tmp/dojo-result-pipeline-1.almd:12:53
  in call to result.flat_map()
  hint: Check the number of arguments
  try:
      // result.flat_map() takes 2 arg(s) — you passed 3
      result.flat_map(<r: Result[A, E]>, <f: fn(A) -> Result[B, E]>)
   |
12 |   |> result.flat_map(r, (n) => validate_range(n, 1, 100))
   |                                                     ^^^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-result-pipeline-1.almd:13:17
  in variable r
  hint: Check the variable name
   |
13 |   |> result.map(r, (n) => "valid: " + int.to_string(n))
   |                 ^
error[E004]: result.map() expects 2 argument(s) but got 3
  --> /tmp/dojo-result-pipeline-1.almd:13:53
  in call to result.map()
  hint: Check the number of arguments
  try:
      // result.map() takes 2 arg(s) — you passed 3
      result.map(<r: Result[A, E]>, <f: fn(A) -> B>)
   |
13 |   |> result.map(r, (n) => "valid: " + int.to_string(n))
   |                                                     ^

6 error(s) found
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
  |> result.map(r, (n) => validate_positive(n)) 
  |> result.map(r, (n) => validate_range(n, 1, 100)) 
  |> result.map(r, (result) => if result.is_ok() then "valid: " + int.to_string(result.unwrap_or(0)) else result.unwrap_or(""))

fn main() = 
  process("42") 
  |> result.map(r, (result) => print(result)) 
  |> result.map(r, (result) => print(result)) 
  |> result.map(r, (result) => print(result)) 
  |> result.map
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Expected Arrow at line 15:11 (got Eq '=')
  --> /tmp/dojo-result-pipeline-2.almd:15:11
  hint: Use '->' for return type, not '='. Write: fn name() -> Type = body
   |
15 | fn main() =
   |           ^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-result-pipeline-2.almd:11:17
  in variable r
  hint: Check the variable name
   |
11 |   |> result.map(r, (n) => validate_positive(n))
   |                 ^
error[E004]: result.map() expects 2 argument(s) but got 3
  --> /tmp/dojo-result-pipeline-2.almd:11:45
  in call to result.map()
  hint: Check the number of arguments
  try:
      // result.map() takes 2 arg(s) — you passed 3
      result.map(<r: Result[A, E]>, <f: fn(A) -> B>)
   |
11 |   |> result.map(r, (n) => validate_positive(n))
   |                                             ^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-result-pipeline-2.almd:12:17
  in variable r
  hint: Check the variable name
   |
12 |   |> result.map(r, (n) => validate_range(n, 1, 100))
   |                 ^
error[E004]: result.map() expects 2 argument(s) but got 3
  --> /tmp/dojo-result-pipeline-2.almd:12:48
  in call to result.map()
  hint: Check the number of arguments
  try:
      // result.map() takes 2 arg(s) — you passed 3
      result.map(<r: Result[A, E]>, <f: fn(A) -> B>)
   |
12 |   |> result.map(r, (n) => validate_range(n, 1, 100))
   |                                                ^^^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-result-pipeline-2.almd:13:17
  in variable r
  hint: Check the variable name
   |
13 |   |> result.map(r, (result) => if result.is_ok() then "valid: " + int.to_string(result.unwrap_or(0)) else result.unwrap_or(""))
   |                 ^
error[E004]: result.is_ok() expects 1 argument(s) but got 0
  --> /tmp/dojo-result-pipeline-2.almd:13:47
  in call to result.is_ok()
  hint: Check the number of arguments
  try:
      // result.is_ok() takes 1 arg(s) — you passed 0
      result.is_ok(<r: Result[A, E]>)
   |
13 |   |> result.map(r, (result) => if result.is_ok() then "valid: " + int.to_string(result.unwrap_or(0)) else result.unwrap_or(""))
   |                                               ^
error[E004]: result.unwrap_or() expects 2 argument(s) but got 1
  --> /tmp/dojo-result-pipeline-2.almd:13:98
  in call to result.unwrap_or()
  hint: Check the number of arguments
  try:
      // result.unwrap_or() takes 2 arg(s) — you passed 1
      result.unwrap_or(<r: Result[A, E]>, <default: A>)
   |
13 |   |> result.map(r, (result) => if result.is_ok() then "valid: " + int.to_string(result.unwrap_or(0)) else result.unwrap_or(""))
   |                                                                                                  ^
error[E005]: argument 'r' expects Result[A, E] but got Int
  --> /tmp/dojo-result-pipeline-2.almd:13:98
  in call to result.unwrap_or()
  hint: Fix the argument type
   |
13 |   |> result.map(r, (result) => if result.is_ok() then "valid: " + int.to_string(result.unwrap_or(0)) else result.unwrap_or(""))
   |                                                                                                  ^
error[E004]: result.unwrap_or() expects 2 argument(s) but got 1
  --> /tmp/dojo-result-pipeline-2.almd:13:124
  in call to result.unwrap_or()
  hint: Check the number of arguments
  try:
      // result.unwrap_or() takes 2 arg(s) — you passed 1
      result.unwrap_or(<r: Result[A, E]>, <default: A>)
   |
13 |   |> result.map(r, (result) => if result.is_ok() then "valid: " + int.to_string(result.unwrap_or(0)) else result.unwrap_or(""))
   |                                                                                                                            ^^
error[E005]: argument 'r' expects Result[A, E] but got String
  --> /tmp/dojo-result-pipeline-2.almd:13:124
  in call to result.unwrap_or()
  hint: Fix the argument type
   |
13 |   |> result.map(r, (result) => if result.is_ok() then "valid: " + int.to_string(result.unwrap_or(0)) else result.unwrap_or(""))
   |                                                                                                                            ^^
error[E004]: result.map() expects 2 argument(s) but got 3
  --> /tmp/dojo-result-pipeline-2.almd:13:124
  in call to result.map()
  hint: Check the number of arguments
  try:
      // result.map() takes 2 arg(s) — you passed 3
      result.map(<r: Result[A, E]>, <f: fn(A) -> B>)
   |
13 |   |> result.map(r, (result) => if result.is_ok() then "valid: " + int.to_string(result.unwrap_or(0)) else result.unwrap_or(""))
   |                                                                                                                            ^^
error[E001]: type mismatch in call to result.unwrap_or(): expected Result[A, E] but got Int
  --> /tmp/dojo-result-pipeline-2.almd:13:98
  in call to result.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
13 |   |> result.map(r, (result) => if result.is_ok() then "valid: " + int.to_string(result.unwrap_or(0)) else result.unwrap_or(""))
   |                                                                                                  ^
error[E001]: type mismatch in call to result.unwrap_or(): expected Result[A, E] but got String
  --> /tmp/dojo-result-pipeline-2.almd:13:124
  in call to result.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
13 |   |> result.map(r, (result) => if result.is_ok() then "valid: " + int.to_string(result.unwrap_or(0)) else result.unwrap_or(""))
   |                                                                                                                            ^^

14 error(s) found
Compile error for /tmp/dojo-result-pipeline-2.almd:
compile failed
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
  |> result.flat_map(r, fn(x) => 
    match x {
      ok(n) => validate_positive(n)
      err(e) => err(e)
    })
  |> result.flat_map(r, fn(x) => 
    match x {
      ok(n) => validate_range(n, 1, 100)
      err(e) => err(e)
    })
  |> result.map(r, fn(x) => 
    match x {
      ok(n) => "valid: " + int.to_string(n)
      err(e) => e
    })

fn main() = 
  process("42")
  |> result.map(r
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: Expected expression at line 11:25 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:11:25
   |
11 |   |> result.flat_map(r, fn(x) =>
   |                         ^
error: Expected function name at line 11:27 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:11:27
   |
11 |   |> result.flat_map(r, fn(x) =>
   |                           ^
error: Expected function name at line 16:27 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:16:27
   |
16 |   |> result.flat_map(r, fn(x) =>
   |                           ^
error: Expected function name at line 21:22 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:21:22
   |
21 |   |> result.map(r, fn(x) =>
   |                      ^
error: Expected Arrow at line 27:11 (got Eq '=')
  --> /tmp/dojo-result-pipeline-3.almd:27:11
  hint: Use '->' for return type, not '='. Write: fn name() -> Type = body
   |
27 | fn main() =
   |           ^

5 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
