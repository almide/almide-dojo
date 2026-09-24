Modify the program below. Return the whole file.

Requested change:

- Add `fn total_climbs(routes: List[String]) -> List[Int]` returning, for each
  route in order, the total ascent: the sum of every rise between consecutive
  points (descents do not subtract).

Preserve (the hidden oracle checks these):

- `heights`, `highest` and `net_change` keep their exact behaviour.
- Every rise counts, even when the route ends lower than it started: up 300,
  down 300 has a climb of 300 (its net change is 0).
- Each route's height list is a temporary of that route's step.
