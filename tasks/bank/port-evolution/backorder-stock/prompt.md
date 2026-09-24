Modify the program below. Return the whole file.

Requested change:

- Add an adapter `type Backorder: Stock = { inner: Warehouse, allowance: Int }` that
  lets a known sku go NEGATIVE, down to `-allowance`. Its `level` is the inner level;
  its `reserve` stores the new (possibly negative) level in `inner`.
- Add `type Store = | Strict(Warehouse) | Lenient(Backorder)` and
  `fn reserve_with(s: Store, lines: List[(String, Int)]) -> String!` that runs the
  generic `reserve_all` and, on success, returns the `level_line`s of the reserved
  skus in line order (a repeated sku once, at its first position), joined by `, `.

Preserve (the hidden oracle checks these):

- `Warehouse`, `reserve_all`, `level_line` and the protocol keep their exact behaviour.
- `Backorder` checks in the same order with the same messages: `bad quantity: <n>`
  first, then `unknown sku: <sku>` (an unknown sku is NEVER created), then
  `insufficient <sku>: have <level>, want <n>` when the result would go below
  `-allowance` (`<level>` is the current, possibly negative, level).
- Reaching exactly `-allowance` is allowed; all-or-nothing still holds.
