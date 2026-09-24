Modify the program below. Return the whole file.

Requested change:

- Add `type Regional: Prices = { own: Card, parents: Map[String, String], fallback: Card }`.
  Its price for a region is the `own` price of the region itself; if there is none,
  the `own` price of its parent (`parents` maps a region to its parent), then of the
  parent's parent, and so on up the chain; only when no region in the chain is priced
  by `own` does it answer `fallback`'s price for the ORIGINAL region.
- Add `type Pricing = | Flat(Card) | Tiered(Regional)` and
  `fn quote_with(p: Pricing, regions: List[String]) -> List[String]`.

Preserve (the hidden oracle checks these):

- `Card`, `quote_all` and the protocol keep their behaviour.
- The chain is followed all the way up (a grandparent's own price counts), and the
  nearest priced region wins.
- A own price of 0 is a real price (free), not a miss.
- The parents map has no cycles.
