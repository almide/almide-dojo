Modify the program below. Return the whole file.

Requested change:

- Add `fn rightmost(ls: List[String]) -> String` returning `col=<n>` for the
  rightmost column among the labels (its number), `bad label: <l>` for the
  first label that is not `is_label`, or `col=0` for no labels.

Preserve (the hidden oracle checks these):

- `letter_value`, `is_label` and `labels_ok` keep their exact behaviour.
- Labels are bijective base 26: "Z" is 26, "AA" is 27, "BA" is 53.
- The column numbers are temporaries of `rightmost`: return only the string.
