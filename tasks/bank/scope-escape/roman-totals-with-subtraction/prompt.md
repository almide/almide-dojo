Modify the program below. Return the whole file.

Requested change:

- Add `fn roman_total(rs: List[String]) -> String` returning `total=<n>`, the
  sum of the numerals, or `bad: <numeral>` for the first one that is not
  `well_formed`.

Preserve (the hidden oracle checks these):

- `symbol_value`, `well_formed` and `valid_count` keep their exact behaviour.
- Subtractive notation: a symbol followed by a LARGER one counts negative
  (IV = 4, IX = 9, XL = 40, MCMXC = 1990).
- The digit values are temporaries of `roman_total`: return only the string.
