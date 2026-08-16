# result-pipeline

- **model**: `cli:claude`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] =
  result.map_err(int.parse(s), (_e) => "not a number: " + s)

fn validate_positive(n: Int) -> Result[Int, String] =
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] =
  if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] =
  parse_int(input)
    |> (r) => result.flat_map(r, (n) => validate_positive(n))
    |> (r) => result.flat_map(r, (n) => validate_range(n, 1, 100))
    |> (r) => result.map(r, (n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
error: '&&' is not valid in Almide at line 8:14
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-result-pipeline-0.almd:8:14
  here: if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
8 |   if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |              ^
error[E025]: cannot infer a concrete type for this expression (type Result[Int, ?25])
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-result-pipeline-0.almd:22:64
  in this expression with an unconstrained type
  here: test "validate_range in" { assert_eq(validate_range(5, 1, 10), ok(5)) }
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Result[Int, String] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
22 | test "validate_range in" { assert_eq(validate_range(5, 1, 10), ok(5)) }
   |                                                                ^^
error[E025]: cannot infer a concrete type for this expression (type Result[?26, String])
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-result-pipeline-0.almd:23:66
  in this expression with an unconstrained type
  here: test "validate_range out" { assert_eq(validate_range(15, 1, 10), err("out of range: 15")) }
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Result[Int, String] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
23 | test "validate_range out" { assert_eq(validate_range(15, 1, 10), err("out of range: 15")) }
   |                                                                  ^^^
error[E025]: cannot infer a concrete type for this expression (type Result[?27, String])
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-result-pipeline-0.almd:24:65
  in this expression with an unconstrained type
  here: test "validate_range low" { assert_eq(validate_range(0, 1, 10), err("out of range: 0")) }
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Result[Int, String] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
24 | test "validate_range low" { assert_eq(validate_range(0, 1, 10), err("out of range: 0")) }
   |                                                                 ^^^

4 error(s) found
FAILED: /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-result-pipeline-0.almd
Compile error for /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-result-pipeline-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn parse_int(s: String) -> Result[Int, String] =
  result.map_err(int.parse(s), (_e) => "not a number: " + s)

fn validate_positive(n: Int) -> Result[Int, String] =
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] =
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] =
  result.map(
    result.flat_map(
      result.flat_map(parse_int(input), (n) => validate_positive(n)),
      (n) => validate_range(n, 1, 100)
    ),
    (n) => "valid: " + int.to_string(n)
  )
```
