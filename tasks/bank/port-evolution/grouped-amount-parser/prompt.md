Modify the program below. Return the whole file.

Requested change:

- Add `type Grouped: AmountParser = { group: String, decimal: String }` for amounts with
  thousands separators, e.g. `1,234,567.89` (group `,`, decimal `.`) or `1.234.567,89`
  (group `.`, decimal `,`). The whole part is either plain digits, or 1 to 3 digits
  followed by groups of EXACTLY three digits, each preceded by `group`. An optional
  fraction is `decimal` and exactly two digits. Anything else is `bad amount: <text>`.
- Add `type Locale = | Simple(Plain) | Local(Grouped)` and
  `fn total_in(l: Locale, texts: List[String]) -> Int!`.

Preserve (the hidden oracle checks these):

- `Plain`, `sum_all` and the protocol keep their behaviour.
- Separators must sit on real thousands boundaries: `1,23,4.00`, `1234,567`, `,123`,
  `1,2345` and `12,34.5` are all `bad amount`, while `1234567` (no separators) and
  `999` are fine.
- `total_in` reports the FIRST bad text in order.
