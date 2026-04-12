# result-pipeline

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 1

## Final code

```almide
fn parse_int(s: String) -> Result[Int, String] =
  result.map_err(int.parse(s), (e) => "not a number: " + s)

fn validate_positive(n: Int) -> Result[Int, String] =
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] =
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] =
  result.map(
    result.flat_map(
      result.flat_map(
        parse_int(input),
        (n) => validate_positive(n)
      ),
      (n) => validate_range(n, 1, 100)
    ),
    (n) => "valid: " + int.to_string(n)
  )
```
