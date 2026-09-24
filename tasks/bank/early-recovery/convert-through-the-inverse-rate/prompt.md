Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- When there is no rate `<from>><to>` but there is the inverse rate
  `<to>><from>`, `convert` uses it: the amount is divided by that rate instead
  of multiplied (for example with `USD>EUR` = 0.5, 1.00 EUR is 2.00 USD).

Preserve (the hidden oracle checks these on untouched inputs):

- Every conversion rounds to the nearest cent with halves going up, the
  inverse conversion included.
- A direct rate, when present, is always used.
- With neither rate the error stays `no rate <from>><to>`, naming the direct pair.
- Same-currency amounts need no rate; `bad line` / `bad amount` are unchanged
  and the first failing line of `total` wins.
