Modify the program below. Return the whole file.

Requested change:

- Store each layer as a map: change `Layer` to `type Layer: Eq, Repr = { values: Map[String, String] }`.
  `layer(pairs)` keeps its signature and builds the map (a later pair for the same
  key wins).
- Add `fn flatten(layers: List[Layer]) -> Map[String, String]`: every key with its
  winning value, keys in first-seen order (layer by layer). `effective` may use it.

Preserve (the hidden oracle checks these):

- Precedence: a LATER layer overrides an earlier one, and within one layer a later
  pair overrides an earlier pair; an empty string is an ordinary value that overrides.
- `effective` keeps first-seen key order: a key first set by the defaults stays
  where the defaults put it even when the environment overrides it.
- `lookup` and `decided_by` keep their answers (`none` for a key nobody sets).
