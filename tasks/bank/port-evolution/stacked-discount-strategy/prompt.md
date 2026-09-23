Modify the program below. Return the whole file.

Requested change:

- Add a third strategy `type Stacked: Discount = { pct: Percent, flat: Fixed }`.
  It applies `pct` to the subtotal, then applies `flat` to what is LEFT after
  `pct`; its `off` is the sum of the two reductions. Its `name` is the two names
  joined by ` then `, e.g. `10% off then 500c off`.
- Add `type Promo = | NoPromo | Pct(Percent) | Flat(Fixed) | Combo(Stacked)` and
  `fn total_for(p: Promo, items: List[Item]) -> Int` that returns the `checkout`
  total for the selected strategy (`NoPromo` pays the plain subtotal).

Preserve (the hidden oracle checks these):

- `Percent`, `Fixed`, `checkout`, `receipt` and the protocol keep their behaviour
  and signatures (percent rounds down to the cent; fixed never exceeds the subtotal).
- A total never goes below zero: the fixed part of `Stacked` is capped by what is
  left after the percentage, not by the original subtotal.
- The order is percentage first, then fixed; with `20% then 300c` on 1001 cents the
  percentage takes 200 (rounded down) and the fixed part 300, total 501.
- An empty basket totals 0 under every promo.
