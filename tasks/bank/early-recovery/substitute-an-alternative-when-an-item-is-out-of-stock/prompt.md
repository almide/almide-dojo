Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A line whose sku is out of stock is no longer fatal when one of the sku's
  alternatives can cover the whole quantity: the first such alternative, in the
  order they are listed, is picked instead (its pick is written with its own
  sku), and `fulfil` adds the note `line <n>: <sku> replaced by <alternative>`.
- When no alternative can cover it (or the sku has none), the line fails with
  the original `OutOfStock(n, sku, available)`.
- `take` is unchanged.

Preserve (the hidden oracle checks these on untouched inputs):

- "Can cover" means with the stock left at that moment: earlier lines,
  including earlier substitutions, have already used some of it. A substitute
  is taken out of the stock like any other pick.
- Only a sku's own alternatives stand in for it (an alternative's alternatives
  do not). A quantity is never split between items.
- `UnknownSku` and `BadQty` stay fatal. Notes come in line order.
