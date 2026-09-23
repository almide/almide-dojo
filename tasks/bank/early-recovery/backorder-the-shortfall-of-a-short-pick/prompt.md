Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A `Pick` asking for more units than are in stock is no longer fatal:
  `replay` takes every unit that is there (the sku's stock becomes 0) and
  appends `<sku> x<missing>` to `backorders`, where `<missing>` is the number
  of units that could not be picked (for example `apple x2`).
- `apply` itself is unchanged: it still returns `Short { sku, have, want }`.

Preserve (the hidden oracle checks these on untouched inputs):

- Every other error still propagates unchanged: `UnknownSku`, `BadQty`
  (a pick of 0 or fewer units, a receive of 0 or fewer, a negative count),
  including when it comes after a backorder.
- A pick of exactly the units in stock is an ordinary pick, not a backorder.
- Later moves see the stock left by the backorder (0 for that sku) and every
  earlier move; backorders are listed in move order; `moves` counts every move.
