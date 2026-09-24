Modify the program below. Return the whole file.

Requested change:

- Add `fn diffs(pairs: List[(String, String)]) -> List[String]` returning, for
  each (before, after) pair in order, the changes separated by spaces: `+item`
  for an item only in after, `-item` for an item only in before, `~item` for
  an item in both whose quantity changed; `same` when nothing changed.
  Order: after's items in their order, then items that disappeared in
  before's order.

Preserve (the hidden oracle checks these):

- `parse_snapshot`, `items` and `quantity` keep their exact behaviour.
- An item present on both sides with a DIFFERENT quantity is a change (`~`);
  with the same quantity it is not reported.
- Each pair's parsed snapshots are temporaries of that pair's step.
