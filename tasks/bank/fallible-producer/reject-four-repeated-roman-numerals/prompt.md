Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A numeral with the same letter more than three times IN A ROW is invalid.
  `roman` must fail with `more than three <letter> in a row in <numeral>`
  (for example `more than three I in a row in IIII`).

Preserve (the hidden oracle checks these on untouched inputs):

- Only consecutive repeats count: a letter may appear four or more times in
  total when no run of it is longer than three (`XXXIX` is 39, `MMMCMXCIX` is 3999).
- Every existing error message stays byte-identical, and the checks of a
  numeral keep their order with the new check LAST: bad character, then bad
  subtractive pair, then repeated V/L/D, then the new run check.
- `index` keeps first-error semantics in list order, with the duplicate-chapter
  check of a line after that line's numeral is parsed.
- Errors propagate explicitly (`!`).
