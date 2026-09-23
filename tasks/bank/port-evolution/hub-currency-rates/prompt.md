Modify the program below. Return the whole file.

Requested change:

- Add an adapter `type ViaHub: Rates = { table: Table, hub: String }`. Its `rate` is
  the table's own answer when the table has one; otherwise it goes through the hub:
  the `from -> hub` rate times the `hub -> to` rate (both as the table answers them),
  divided by 1_000_000 and truncated toward zero. When either leg is missing it
  answers `none`.
- Add `type Pricing = | Quoted(Table) | Hub(ViaHub)` and
  `fn quote_with(p: Pricing, cents: Int, from: String, to: String) -> String` that runs
  the generic `quote_line` with the selected adapter.

Preserve (the hidden oracle checks these):

- `Table`, `convert`, `quote_line` and the protocol keep their exact behaviour: a
  currency converts to itself at exactly 1.0, and no inverse rate is derived.
- The table's answer always wins over the hub, including the identity: converting
  EUR to EUR through `ViaHub` gives back the same cents.
- A leg that starts or ends at the hub itself is the identity leg (`from == hub` or
  `to == hub` still converts when the other leg is quoted).
- Negative amounts (refunds) truncate toward zero; a missing leg is `no rate to <to>`.
