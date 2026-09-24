Modify the program below. Return the whole file.

Requested change:

- Add `fn above_mean(xs: List[Int]) -> (Int) -> Bool` returning a checker: the
  closure answers whether a value is STRICTLY greater than the exact
  arithmetic mean of `xs`. With no readings it answers `false` for every value.

Preserve (the hidden oracle checks these):

- `total`, `mean` and `report` keep their exact behaviour (the displayed mean
  still rounds toward zero).
- The checker compares against the EXACT mean, not the rounded display value:
  for readings `[-1, -2]` (mean -1.5) the value -1 is above the mean.
- The checker may be called any number of times and answers the same way.
- The closure captures only a fixed-size summary of `xs`, never `xs` itself.
