Modify the program below. Return the whole file.

Requested change:

- Add `fn charges(orders: List[String]) -> List[Int]` returning what each order
  is charged, in order.

Preserve (the hidden oracle checks these):

- `lines`, `subtotal` and `qualifies` keep their exact behaviour.
- The threshold applies to each ORDER's total (many small lines can
  qualify), and the discount is taken once from that total.
- Each order's line list is a temporary of that order's step.
