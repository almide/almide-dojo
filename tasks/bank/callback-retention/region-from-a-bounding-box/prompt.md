Modify the program below. Return the whole file.

Requested change:

- Add `fn region(lines: List[String]) -> Result[((Int, Int)) -> Bool, String]`.
  On success it returns a closure answering whether a point lies inside the
  bounding box of the parsed points (edges included). A bad line is the same
  error `parse_points` returns.

Preserve (the hidden oracle checks these):

- `parse_point`, `parse_points` and `count_points` keep their exact behaviour.
- The bounding box is exactly the smallest box holding every parsed point; it
  does not contain the origin unless the points span it. With no points the
  closure answers `false` for every point.
- The closure captures only the box (four numbers), never the points or lines.
