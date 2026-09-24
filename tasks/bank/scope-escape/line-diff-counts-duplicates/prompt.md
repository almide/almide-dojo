Modify the program below. Return the whole file.

Requested change:

- Add `fn diffstat(old: List[String], new_lines: List[String]) -> String`
  returning `added=<a>,removed=<r>`: how many lines would have to be added and
  removed to turn `old` into `new_lines`, ignoring order.

Preserve (the hidden oracle checks these):

- `changed`, `line_count_delta` and `describe` keep their exact behaviour.
- Lines are counted as a MULTISET: if a line appears twice in `old` and once
  in `new_lines`, one copy is removed. Order does not matter (a reordered file
  is `added=0,removed=0`).
- The per-line count tables are temporaries of `diffstat`: return only the
  string.
