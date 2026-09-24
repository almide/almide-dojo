Modify the program below. Return the whole file.

Requested change:

- The port needs the basket value: change the protocol method to
  `fn cost(s: Self, grams: Int, subtotal: Int) -> Int?` and `quote` to
  `quote(s, grams, subtotal)`. `ByWeight` and `FlatRate` ignore `subtotal`.
- Add a decorator `type FreeOver: Shipping = { inner: ByWeight, threshold: Int }`:
  shipping is free (cost 0) when `subtotal` is at least `threshold`; otherwise it
  costs what `inner` says.
- Add `type Carrier = | Weight(ByWeight) | Flat(FlatRate) | Promo(FreeOver)` and
  `fn quote_with(c: Carrier, grams: Int, subtotal: Int) -> String`.

Preserve (the hidden oracle checks these):

- `ByWeight`, `FlatRate` and `quote` keep their results (per started kilogram,
  `cannot ship` over the limit, `free shipping` for a zero cost).
- A parcel the inner carrier cannot take stays `cannot ship` under `FreeOver`, even
  when the basket is over the threshold.
- The threshold is inclusive: a subtotal equal to it ships free, one cent below does not.
