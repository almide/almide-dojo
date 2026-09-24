Modify the program below. Return the whole file.

Requested change:

- Add a marginal-rate adapter `type Brackets: TaxRule = { bands: List[(Int, Int)], top_bps: Int }`.
  `bands` lists `(upper, bps)` pairs in increasing `upper` order: the part of the
  income up to the first `upper` is taxed at the first rate, the part between the
  first and second `upper` at the second rate, and so on; the part above the last
  `upper` is taxed at `top_bps`. The exact total is rounded down ONCE, at the end.
- Add `type Regime = | Simple(FlatTax) | Progressive(Brackets)` and
  `fn payslips_under(r: Regime, incomes: List[Int]) -> List[String]`.

Preserve (the hidden oracle checks these):

- `FlatTax`, `net`, `payslips` and the protocol keep their exact behaviour.
- Each rate applies only to its own slice of the income, never to the whole income.
- Rounding happens once on the total: slices that are each worth half a cent add up
  to a whole cent.
- Zero or negative income pays no tax under every regime; an income exactly at a
  band's upper bound has nothing in the next band.
