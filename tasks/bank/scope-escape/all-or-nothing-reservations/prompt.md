Modify the program below. Return the whole file.

Requested change:

- Add `fn reserve(stock: Map[String, Int], rs: List[String]) -> String`
  returning `filled=<f>,refused=<r>` after processing the requests in order.

Preserve (the hidden oracle checks these):

- `parse_request` and `requested_units` keep their exact behaviour.
- All or nothing: a refused request takes NOTHING from the stock, even for
  the lines it could have served; a filled request takes all its lines.
  Repeated lines of one SKU in a request add up.
- The remaining-stock table is a temporary of `reserve`: return only the
  string.
