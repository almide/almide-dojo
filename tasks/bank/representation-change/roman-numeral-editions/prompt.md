Modify the program below. Return the whole file.

Requested change:

- Store the edition number as an integer: change `Edition.numeral: String` to
  `Edition.number: Int` (1 .. 3999); `edition(title, n)` takes the number. Keep
  `number(numeral)` as the parser of Roman text.
- `render` still prints the title and the edition in standard Roman numerals.
- Add `fn next_edition(e: Edition, title: String) -> Edition`, the edition after `e`.

Preserve (the hidden oracle checks these):

- `render` writes STANDARD numerals, using the subtractive forms IV, IX, XL, XC, CD and
  CM: 4 is `IV`, 9 is `IX`, 14 is `XIV`, 40 is `XL`, 90 is `XC`, 400 is `CD`, 1994 is
  `MCMXCIV`, 3999 is `MMMCMXCIX` (never `IIII` or `VIIII`).
- `number(render-text)` round-trips: parsing what `render` prints gives the number back.
- `chronological` orders by number and keeps list order for equal numbers.
