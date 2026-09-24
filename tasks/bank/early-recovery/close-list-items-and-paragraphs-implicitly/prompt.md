Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- When a closing tag `</x>` arrives while the innermost open elements are `li`
  or `p` elements and an element `x` is open further out, those `li`/`p`
  elements are closed implicitly (innermost first, each adding the warning
  `implicitly closed <tag>`), and then `x` closes as usual.

Preserve (the hidden oracle checks these on untouched inputs):

- Only `li` and `p` close implicitly: if any element between the innermost one
  and `x` is something else, it is still `Mismatch(innermost, x)`.
- A closing tag with no open element of that name is still
  `Mismatch(innermost, name)` (or `StrayClose` at the top level).
- Elements still open at the end of the input are still `Unclosed`, `li` and `p`
  included.
- Warnings are in the order the elements were closed.
