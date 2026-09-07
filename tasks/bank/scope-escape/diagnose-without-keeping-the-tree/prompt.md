Modify the program below. Return the whole file.

Requested change:

- Add `fn diagnose(xs: List[Int]) -> String` returning `n=<size>,depth=<depth>`
  for the tree built from `xs` (for example `n=3,depth=2`).

Preserve (the hidden oracle checks these):

- `build`, `size`, `depth` keep their exact behaviour.
- The tree is a temporary of `diagnose`: nothing reachable from it may be
  returned, stored, or captured. Return only the summary string.
