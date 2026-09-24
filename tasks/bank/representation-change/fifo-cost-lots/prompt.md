Modify the program below. Return the whole file.

Requested change:

- Value stock first-in first-out: change `Stock` to
  `type Stock: Eq, Repr = { sku: String, lots: List[Lot] }` with
  `type Lot: Eq, Repr = { qty: Int, cost: Int }`, oldest lot first. `receive` appends a
  lot; `ship` takes units from the OLDEST lots first and returns the exact cost of the
  units taken; `value` is the cost of every unit left.
- Every function keeps its signature.

Preserve (the hidden oracle checks these):

- FIFO holds across shipments: what is left of a partly used lot is still the oldest
  and is used first by the next shipment.
- A lot used up completely disappears (no zero-quantity lots are kept).
- Shipping more than is in stock fails with `short: have <qty>, want <n>` and nothing
  changes; `report` keeps its format.
