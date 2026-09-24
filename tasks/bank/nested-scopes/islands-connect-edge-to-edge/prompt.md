Modify the program below. Return the whole file.

Requested change:

- Add `fn islands(maps: List[String]) -> List[Int]` returning, for each map in
  order, its number of islands.

Preserve (the hidden oracle checks these):

- `grid`, `land` and `is_land` keep their exact behaviour (rows may have
  different lengths).
- Cells touching only DIAGONALLY are separate islands.
- Each map's visited set is a temporary of that map's step.
