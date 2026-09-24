Modify the program below. Return the whole file.

Requested change:

- Add `fn cheapest(grid: List[List[Int]]) -> String` returning `cost=<n>` for
  the cheapest right/down path, or `malformed` when `well_formed` fails.

Preserve (the hidden oracle checks these):

- `well_formed`, `at` and `edge_path_cost` keep their exact behaviour.
- A cell in the top row can only be entered from the left and a cell in the
  left column only from above: there is no free "zero" neighbour outside the
  grid. Negative costs are allowed.
- The cost table is a temporary of `cheapest`: return only the string.
