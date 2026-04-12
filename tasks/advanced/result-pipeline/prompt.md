Write a data validation pipeline using `Result[T, String]` for error handling.

Write functions with these exact signatures:

    fn parse_int(s: String) -> Result[Int, String]
    fn validate_positive(n: Int) -> Result[Int, String]
    fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String]
    fn process(input: String) -> Result[String, String]

Behavior:

**`parse_int`**: Parse a string as an integer.
- `parse_int("42")` returns `ok(42)`
- `parse_int("abc")` returns `err("not a number: abc")`

**`validate_positive`**: Check that a number is positive (> 0).
- `validate_positive(5)` returns `ok(5)`
- `validate_positive(-1)` returns `err("must be positive: -1")`
- `validate_positive(0)` returns `err("must be positive: 0")`

**`validate_range`**: Check that a number is within [lo, hi] inclusive.
- `validate_range(5, 1, 10)` returns `ok(5)`
- `validate_range(15, 1, 10)` returns `err("out of range: 15")`

**`process`**: Chain the above: parse → validate positive → validate range [1, 100] → on success return `"valid: <n>"`.
- `process("42")` returns `ok("valid: 42")`
- `process("abc")` returns `err("not a number: abc")`
- `process("-5")` returns `err("must be positive: -5")`
- `process("200")` returns `err("out of range: 200")`

Notes:

- Use `int.parse(s)` which returns `Result[Int, String]`.
- Use `result.flat_map(r, fn)` to chain Result operations.
- Use `result.map(r, fn)` to transform the success value.
- Use `int.to_string(n)` for number-to-string conversion.
