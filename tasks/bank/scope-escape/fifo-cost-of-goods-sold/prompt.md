Modify the program below. Return the whole file.

Requested change:

- Add `fn cogs(ss: List[String]) -> String` returning `cogs=<c>,left=<u>`: the
  total cost of every unit sold (priced by the purchase it came from, FIFO)
  and the units left; `short` when a sale needs more units than are in stock;
  or the `parse_ledger` error.

Preserve (the hidden oracle checks these):

- `parse_line`, `parse_ledger` and `units_on_hand` keep their exact behaviour.
- FIFO: a sale consumes the OLDEST remaining units first and may span several
  purchases.
- The lot queue is a temporary of `cogs`: return only the string.
