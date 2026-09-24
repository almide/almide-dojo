Modify the program below. Return the whole file.

Requested change:

- Add `fn with_coupon(cart: List[String], category: String) -> String`
  returning `total=<cents>` after the coupon.

Preserve (the hidden oracle checks these):

- `parse_item`, `items` and `subtotal` keep their exact behaviour.
- The coupon applies to the CHEAPEST item of the category (not the first one
  in the cart), and only once; with no item of that category nothing changes.
- The item list is a temporary of `with_coupon`: return only the string.
