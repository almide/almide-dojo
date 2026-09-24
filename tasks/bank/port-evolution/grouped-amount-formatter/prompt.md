Modify the program below. Return the whole file.

Requested change:

- Add an adapter `type Grouped: AmountFormat = { group: String, decimal: String }`
  that writes the whole part in groups of three digits from the right, separated by
  `group`, then `decimal`, then two cent digits: with `group = ","`, `decimal = "."`,
  123456789 cents is `1,234,567.89`; with `"."` and `","` it is `1.234.567,89`.
- Add `type Locale = | Raw(PlainFormat) | Local(Grouped)` and
  `fn invoice_in(l: Locale, lines: List[(String, Int)]) -> List[String]`.

Preserve (the hidden oracle checks these):

- `PlainFormat`, `invoice` and the protocol keep their exact behaviour.
- A negative amount has ONE minus in front and never a separator right after it:
  -12345 cents is `-123.45`, -123456 is `-1,234.56`, -50 is `-0.50`.
- Groups are exactly three digits (`999.00`, `1,000.00`, `100,000.00`), and zero is `0.00`.
