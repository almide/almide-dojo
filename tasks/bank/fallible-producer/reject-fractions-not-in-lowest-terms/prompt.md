Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A fraction must be written in lowest terms. For a fraction whose numerator and
  denominator share a common factor, `parse_qty` (and so `parse_item` and
  `scale`) must fail with `<qty> is not in lowest terms (use <reduced>)`, where
  `<reduced>` is written like `show_qty` writes it (for example
  `2/4 is not in lowest terms (use 1/2)`, `4/2 ... (use 2)`).

Preserve (the hidden oracle checks these on untouched inputs):

- Any common factor counts, not only 2 (`3/9`, `10/15`).
- Improper fractions in lowest terms (`5/3`) and `n/1` stay valid; whole
  numbers are unaffected.
- The existing checks come first (`bad quantity`, `zero denominator`,
  `quantity must be positive`); the first failing line wins; scaling output is
  unchanged.
