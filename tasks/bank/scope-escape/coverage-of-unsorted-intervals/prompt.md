Modify the program below. Return the whole file.

Requested change:

- Add `fn coverage(ivs: List[(Int, Int)]) -> String` returning
  `covered=<total length covered>,pieces=<number of disjoint pieces>` for
  any list of intervals, for example `covered=5,pieces=2`.

Preserve (the hidden oracle checks these):

- `clean`, `merge`, `render` and `show_schedule` keep their exact behaviour
  (`merge` still requires sorted input; do not change its contract).
- `coverage` accepts intervals in ANY order, overlapping or not. Empty
  intervals (end <= start) cover nothing. Touching intervals ([1,3) and [3,5))
  form one piece. No intervals: `covered=0,pieces=0`.
- The merged list is a temporary of `coverage`: return only the string.
