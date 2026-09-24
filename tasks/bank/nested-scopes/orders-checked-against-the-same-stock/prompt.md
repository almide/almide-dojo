Modify the program below. Return the whole file.

Requested change:

- Add `fn check_orders(stock: Map[String, Int], orders: List[Order]) -> List[String]`
  returning one line per order, in order: `<id>: ok` when the stock covers
  every SKU of the order, otherwise `<id>: short <sku>` naming the first SKU
  (in the order's own line order) that is not covered.

Preserve (the hidden oracle checks these):

- `wanted`, `stock_of`, `total_units` and `skus` keep their exact behaviour.
- Each order is checked INDEPENDENTLY against the full `stock`: checking an
  order does not use up stock for the next one (this is a feasibility check,
  not a fulfilment run).
- Repeated lines of one SKU add up before comparing; an unknown SKU has stock 0.
- `stock` is shared outer data; each order's `wanted` table is a temporary of
  that order's step.
