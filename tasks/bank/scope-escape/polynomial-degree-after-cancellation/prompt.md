Modify the program below. Return the whole file.

Requested change:

- Add `fn leading(terms: List[String]) -> String` returning `deg=<d>,lead=<c>`
  for the polynomial the terms add up to (d = its degree, c = the coefficient
  of that power), `zero` when everything cancels (or there are no terms), or
  the `parse_poly` error message.

Preserve (the hidden oracle checks these):

- `parse_coeff`, `parse_term`, `parse_poly` and `at_one` keep their exact
  behaviour.
- Like powers are combined first: "3x^2" and "-3x^2" cancel, so the degree is
  the highest power whose COMBINED coefficient is non-zero. A zero coefficient
  written as a term ("0x^5") does not raise the degree.
- The combined-coefficient table is a temporary of `leading`: return only the
  string.
