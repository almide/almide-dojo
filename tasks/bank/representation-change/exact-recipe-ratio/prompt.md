Modify the program below. Return the whole file.

Requested change:

- Quantities become exact fractions. Introduce `type Ratio: Eq, Repr = { num: Int, den: Int }`
  and `fn ratio(num: Int, den: Int) -> Ratio` (den is never 0) that always returns the
  normal form: `den > 0`, no common factor, zero is `0/1`. So `ratio(2, 4) == ratio(1, 2)`
  and `ratio(1, -2) == ratio(-1, 2)`.
- Change `Ingredient.cups: Int` to `Ingredient.cups: Ratio`; `ingredient(name, cups)`
  now takes a `Ratio`, `scale` takes `factor: Ratio`, `total` returns a `Ratio`.
- `render_qty` takes a `Ratio` and prints a whole number as `3`, a proper fraction
  as `1/2`, and an improper one as a mixed number `1 1/2`.

Preserve (the hidden oracle checks these):

- A negative quantity renders with ONE leading minus and a positive fraction part:
  `ratio(-3, 2)` is `-1 1/2`, `ratio(-1, 2)` is `-1/2`, `ratio(-4, 2)` is `-2`, and
  zero is `0`. Integer `/` and `%` truncate toward zero in Almide.
- `changes` keeps its format (`name +q` / `name -q`, the magnitude after the sign),
  compares exact values (`2/4` equals `1/2`, so no change), and treats a missing
  ingredient as zero.
- `scale` and `total` return normalized ratios.
