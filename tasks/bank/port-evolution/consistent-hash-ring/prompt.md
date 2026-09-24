Modify the program below. Return the whole file.

Requested change:

- Add a hash ring `type Ring: Placement = { points: List[(Int, String)] }`: each point is a
  position 0..999 and the node that owns it (the list may be in any order). A key goes to
  the node of the first point, in increasing position order, whose position is `>=`
  `hash(key)`; when no position is that large it WRAPS AROUND to the point with the
  smallest position. A ring without points places nothing.
- Add `type Strategy = | Spread(Modulo) | Consistent(Ring)` and
  `fn place_with(s: Strategy, keys: List[String]) -> List[String]`.

Preserve (the hidden oracle checks these):

- `hash`, `Modulo`, `place_all` and the protocol keep their behaviour.
- A key hashing past the last position goes to the smallest-position point.
- A position equal to the hash owns the key; the order of `points` in the list does not
  matter.
