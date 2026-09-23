Modify the program below. Return the whole file.

Requested change:

- Extract the per-line computation into `fn line_total(qty: Int, unit: Int) -> Int`
  and make `order_total` use it.

Preserve (the hidden oracle checks these):

- `order_total` and `invoice` stay the same functions of their input.
- The discount tiers are unchanged (10% from 100 units, 5% from 10 units,
  thresholds inclusive), and a line is rounded down ONCE, after the discount
  is applied to the whole line — never per unit.
- A pure refactor: the helper allocates nothing the inline computation did not.
