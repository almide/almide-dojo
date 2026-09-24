Modify the program below. Return the whole file.

Requested change:

- Add `fn converter(xs: List[(String, Int)], rates: Map[String, Int]) -> (String) -> String`
  returning a closure that, given a target currency code, answers
  `<total> <code>`: the total converted with `rates` (cents), or `missing rate`
  when some expense's currency has no rate.

Preserve (the hidden oracle checks these):

- `currencies`, `in_currency` and `largest_expense` keep their exact behaviour.
- Convert per CURRENCY total, rounding down ONCE per currency:
  floor(sum of that currency's cents * rate / 1000). Do not round every
  expense separately.
- The closure may capture `rates`-derived numbers and the total, never `xs`.
