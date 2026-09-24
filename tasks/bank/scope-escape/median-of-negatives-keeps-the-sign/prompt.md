Modify the program below. Return the whole file.

Requested change:

- Add `fn median_text(xs: List[Int]) -> String` returning `median=<m>` written
  exactly (`median=2`, `median=2.5`, `median=-0.5`), or `median=none` for no
  samples.

Preserve (the hidden oracle checks these):

- `sorted_copy`, `middle_pair` and `range_text` keep their exact behaviour.
- The median of an even count is the exact midpoint of the two middle values,
  SIGN INCLUDED: the median of [-1, 0] is `-0.5`, of [-3, 0] is `-1.5`.
- The sorted copy is a temporary of `median_text`: return only the string.
