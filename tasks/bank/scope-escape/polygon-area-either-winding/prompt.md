Modify the program below. Return the whole file.

Requested change:

- Add `fn area2(s: String) -> String` returning `area2=<n>` where `n` is TWICE
  the polygon's area (shoelace formula, so it stays an integer), or the
  `parse_polygon` error message.

Preserve (the hidden oracle checks these):

- `parse_vertex`, `parse_polygon` and `perimeter` keep their exact behaviour.
- The area is the same for either winding: a clockwise listing is not a
  negative area. Fewer than three vertices: `area2=0`.
- The closing edge (last vertex back to the first) is part of the formula.
- The vertex list is a temporary of `area2`: return only the string.
