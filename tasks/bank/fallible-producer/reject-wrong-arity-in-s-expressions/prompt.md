Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- Operators now have an arity: `+` and `*` need at least 2 arguments, `-` needs
  1 or 2, `max` needs at least 1. Add the case `Arity(Int, String, Int)` to
  `ParseErr`; parsing a form with a wrong number of arguments must fail with
  `Arity(<offset of the form's "(">, <op>, <argument count>)`.
- This is a PARSE error: `parse` rejects such a form, and so does `evaluate`.

Preserve (the hidden oracle checks these on untouched inputs):

- A form's arity is checked when the form closes, after its arguments have been
  parsed: an error inside an argument (an inner form with a wrong arity, a bad
  token) wins, and a problem after the form's `)` (a stray `)`, an unclosed outer
  form) loses to it. A form that never closes is still `Unclosed`.
- Every existing error case keeps its payload; results of valid expressions are
  unchanged.
