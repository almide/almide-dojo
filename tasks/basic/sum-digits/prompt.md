Write a function with this exact signature:

    fn sum_digits(n: Int) -> Int

Behavior:

- Return the sum of the decimal digits of `n`
- `sum_digits(0)` must return `0`
- `sum_digits(123)` must return `6`
- Negative inputs should be treated as their absolute value: `sum_digits(-42)` returns `6`

Notes:

- You can use `int.abs(n)` for the absolute value.
- Use `%` for modulo and `/` for integer division.
