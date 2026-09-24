Modify the program below. Return the whole file.

Requested change:

- Add `fn ink_boxes(sketches: List[String]) -> List[String]` returning, for
  each sketch in order, `<w>x<h>`: the width and height of the smallest box
  holding all its ink, or `empty` when there is none.

Preserve (the hidden oracle checks these):

- `rows`, `ink` and `blank` keep their exact behaviour.
- The box spans from the leftmost to the RIGHTMOST ink in any row (a row may
  hold several separate marks), and from the top to the bottom inked row.
- Each sketch's rows are a temporary of that sketch's step.
