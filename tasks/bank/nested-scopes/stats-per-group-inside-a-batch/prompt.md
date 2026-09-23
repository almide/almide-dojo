Modify the program below. Return the whole file.

Requested change:

- Add `fn stats_batch(groups: List[List[Int]]) -> List[(Int, Int)]` returning
  `stats` of every group, in order.

Preserve (the hidden oracle checks these):

- `stats` keeps its exact behaviour, including `(0, 0)` for an empty group.
- Each group's temporary (the sorted copy inside `stats`) belongs to that inner
  call; the batch retains only the pairs. Do not build one big sorted list.
