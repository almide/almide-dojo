# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
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
  if n > 0 then ok(n) else err(format("must be positive: {}", n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n && n <= hi then ok(n) else err(format("out of range: {}", n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn r => validate_positive(r))
  |> result.flat_map(fn r => validate_range(r, 1, 100))
  |> result.map(fn n => format("valid: {}", int.to_string(n)))
```

**Diagnostic:**

```
error: '&&' is not valid in Almide at line 11:14
  --> /tmp/dojo-result-pipeline-0.almd:11:14
  here: if lo <= n && n <= hi then ok(n) else err(format("out of range: {}", n))
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
11 |   if lo <= n && n <= hi then ok(n) else err(format("out of range: {}", n))
   |              ^
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:15:22
  here: |> result.flat_map(fn r => validate_positive(r))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn r => validate_positive(r))
   |                      ^
error: Expected LParen at line 15:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:15:27
  here: |> result.flat_map(fn r => validate_positive(r))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn r => validate_positive(r))
   |                           ^
error: Expected LParen at line 16:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:16:27
  here: |> result.flat_map(fn r => validate_range(r, 1, 100))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |   |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                           ^
error: Expected LParen at line 17:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:17:22
  here: |> result.map(fn n => format("valid: {}", int.to_string(n)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   |> result.map(fn n => format("valid: {}", int.to_string(n)))
   |                      ^
error[E002]: undefined function 'format'
  --> /tmp/dojo-result-pipeline-0.almd:8:32
  in call to format()
  here: if n > 0 then ok(n) else err(format("must be positive: {}", n))
  hint: Check the function name
  |
8 |   if n > 0 then ok(n) else err(format("must be positive: {}", n))
  |                                ^^^^^^

6 error(s) found
FAILED: /tmp/dojo-result-pipeline-0.almd
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  match int.parse(s) {
    ok(n) => ok(n)
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err(string.format("must be positive: {}", n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err(string.format("out of range: {}", n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn r => validate_positive(r))
  |> result.flat_map(fn r => validate_range(r, 1, 100))
  |> result.map(fn n => string.format("valid: {}", int.to_string(n)))
```

**Diagnostic:**

```
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:15:22
  here: |> result.flat_map(fn r => validate_positive(r))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn r => validate_positive(r))
   |                      ^
error: Expected LParen at line 15:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:15:27
  here: |> result.flat_map(fn r => validate_positive(r))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn r => validate_positive(r))
   |                           ^
error: Expected LParen at line 16:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:16:27
  here: |> result.flat_map(fn r => validate_range(r, 1, 100))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |   |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                           ^
error: Expected LParen at line 17:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:17:22
  here: |> result.map(fn n => string.format("valid: {}", int.to_string(n)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   |> result.map(fn n => string.format("valid: {}", int.to_string(n)))
   |                      ^
error[E002]: undefined function 'string.format'
  --> /tmp/dojo-result-pipeline-1.almd:8:32
  in call to string.format()
  here: if n > 0 then ok(n) else err(string.format("must be positive: {}", n))
  hint: No function 'format' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
8 |   if n > 0 then ok(n) else err(string.format("must be positive: {}", n))
  |                                ^^^^^^^^^^^^^
error[E002]: undefined function 'string.format'
  --> /tmp/dojo-result-pipeline-1.almd:11:46
  in call to string.format()
  here: if lo <= n and n <= hi then ok(n) else err(string.format("out of range: {}", n))
  hint: No function 'format' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
11 |   if lo <= n and n <= hi then ok(n) else err(string.format("out of range: {}", n))
   |                                              ^^^^^^^^^^^^^

6 error(s) found
FAILED: /tmp/dojo-result-pipeline-1.almd
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  match int.parse(s) {
    ok(n) => ok(n)
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err(string.format("must be positive: {}", n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err(string.format("out of range: {}", n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn r => validate_positive(r))
  |> result.flat_map(fn r => validate_range(r, 1, 100))
  |> result.map(fn n => string.to_upper(string.format("valid: {}", int.to_string(n))))

fn string.to_upper(s: String) -> String = 
  string.chars(s)
  |> list.map(fn c => if c >= 'a' and c <= 'z' then char_to_upper(c) else c)
  |> string.from_chars()

fn char_to_upper(c: String) -> String = 
  match c {
    some(x) => if x >= 'a' and x <= 'z' then string.from_codepoint(x - 32) else x
    none => ""
  }
```

**Diagnostic:**

```
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:15:22
  here: |> result.flat_map(fn r => validate_positive(r))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn r => validate_positive(r))
   |                      ^
error: Expected LParen at line 15:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:15:27
  here: |> result.flat_map(fn r => validate_positive(r))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn r => validate_positive(r))
   |                           ^
error: Expected LParen at line 16:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:16:27
  here: |> result.flat_map(fn r => validate_range(r, 1, 100))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |   |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                           ^
error: Expected LParen at line 17:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:17:22
  here: |> result.map(fn n => string.to_upper(string.format("valid: {}", int.to_string(n))))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   |> result.map(fn n => string.to_upper(string.format("valid: {}", int.to_string(n))))
   |                      ^
error: Expected LParen at line 19:10 (got Dot '.')
  --> /tmp/dojo-result-pipeline-2.almd:19:10
  here: fn string.to_upper(s: String) -> String =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
19 | fn string.to_upper(s: String) -> String =
   |          ^
error: Expected LParen at line 21:20 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:21:20
  here: |> list.map(fn c => if c >= 'a' and c <= 'z' then char_to_upper(c) else c)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   |> list.map(fn c => if c >= 'a' and c <= 'z' then char_to_upper(c) else c)
   |                    ^
error[E002]: undefined function 'string.format'
  --> /tmp/dojo-result-pipeline-2.almd:8:32
  in call to string.format()
  here: if n > 0 then ok(n) else err(string.format("must be positive: {}", n))
  hint: No function 'format' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
8 |   if n > 0 then ok(n) else err(string.format("must be positive: {}", n))
  |                                ^^^^^^^^^^^^^
error[E002]: undefined function 'string.format'
  --> /tmp/dojo-result-pipeline-2.almd:11:46
  in call to string.format()
  here: if lo <= n and n <= hi then ok(n) else err(string.format("out of range: {}", n))
  hint: No function 'format' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
11 |   if lo <= n and n <= hi then ok(n) else err(string.format("out of range: {}", n))
   |                                              ^^^^^^^^^^^^^
error: pattern `some(..)` cannot match String — the subject is not an Option
  --> /tmp/dojo-result-pipeline-2.almd:25:9
  in match pattern
  here: match c {
  hint: the value is already a plain String. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
25 |   match c {
   |         ^
error: pattern `none` cannot match String — the subject is not an Option
  --> /tmp/dojo-result-pipeline-2.almd:26:81
  in match pattern
  here: some(x) => if x >= 'a' and x <= 'z' then string.from_codepoint(x - 32) else x
  hint: the value is already a plain String. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
26 |     some(x) => if x >= 'a' and x <= 'z' then string.from_codepoint(x - 32) else x
   |                                                                                 ^

10 error(s) found
FAILED: /tmp/dojo-result-pipeline-2.almd
Compile error for /tmp/dojo-result-pipeline-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  match int.parse(s) {
    ok(n) => ok(n)
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err(string.format("must be positive: {}", n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err(string.format("out of range: {}", n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn r => validate_positive(r))
  |> result.flat_map(fn r => validate_range(r, 1, 100))
  |> result.map(fn n => string.to_upper(string.format("valid: {}", int.to_string(n))))

fn string.to_upper(s: String) -> String = 
  string.chars(s)
  |> list.map(fn c => if c >= 'a' and c <= 'z' then string.from_codepoint(c - 32) else c)
  |> string.from_chars()

fn char_to_upper(c: String) -> String = 
  c

fn string.format(s: String, args: List[String]) -> String = 
  string.from_chars(s)
  |> list.map(fn c => if c == '{' then args.first() else c)
  |> string.from_chars()

fn string.from_chars(s: String) -> List[String] = 
  string.chars(s)
```

**Diagnostic:**

```
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:15:22
  here: |> result.flat_map(fn r => validate_positive(r))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn r => validate_positive(r))
   |                      ^
error: Expected LParen at line 15:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:15:27
  here: |> result.flat_map(fn r => validate_positive(r))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn r => validate_positive(r))
   |                           ^
error: Expected LParen at line 16:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:16:27
  here: |> result.flat_map(fn r => validate_range(r, 1, 100))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |   |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                           ^
error: Expected LParen at line 17:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:17:22
  here: |> result.map(fn n => string.to_upper(string.format("valid: {}", int.to_string(n))))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   |> result.map(fn n => string.to_upper(string.format("valid: {}", int.to_string(n))))
   |                      ^
error: Expected LParen at line 19:10 (got Dot '.')
  --> /tmp/dojo-result-pipeline-3.almd:19:10
  here: fn string.to_upper(s: String) -> String =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
19 | fn string.to_upper(s: String) -> String =
   |          ^
error: Expected LParen at line 21:20 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:21:20
  here: |> list.map(fn c => if c >= 'a' and c <= 'z' then string.from_codepoint(c - 32) else c)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   |> list.map(fn c => if c >= 'a' and c <= 'z' then string.from_codepoint(c - 32) else c)
   |                    ^
error: Expected LParen at line 27:10 (got Dot '.')
  --> /tmp/dojo-result-pipeline-3.almd:27:10
  here: fn string.format(s: String, args: List[String]) -> String =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
27 | fn string.format(s: String, args: List[String]) -> String =
   |          ^
error: Expected LParen at line 29:20 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:29:20
  here: |> list.map(fn c => if c == '{' then args.first() else c)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
29 |   |> list.map(fn c => if c == '{' then args.first() else c)
   |                    ^
error: Expected LParen at line 32:10 (got Dot '.')
  --> /tmp/dojo-result-pipeline-3.almd:32:10
  here: fn string.from_chars(s: String) -> List[String] =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
32 | fn string.from_chars(s: String) -> List[String] =
   |          ^
error[E002]: undefined function 'string.format'
  --> /tmp/dojo-result-pipeline-3.almd:8:32
  in call to string.format()
  here: if n > 0 then ok(n) else err(string.format("must be positive: {}", n))
  hint: No function 'format' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
8 |   if n > 0 then ok(n) else err(string.format("must be positive: {}", n))
  |                                ^^^^^^^^^^^^^
error[E002]: undefined function 'string.format'
  --> /tmp/dojo-result-pipeline-3.almd:11:46
  in call to string.format()
  here: if lo <= n and n <= hi then ok(n) else err(string.format("out of range: {}", n))
  hint: No function 'format' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
11 |   if lo <= n and n <= hi then ok(n) else err(string.format("out of range: {}", n))
   |                                              ^^^^^^^^^^^^^

11 error(s) found
FAILED: /tmp/dojo-result-pipeline-3.almd
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
