Modify the program below. Return the whole file.

Requested change:

- Add `fn dot(a: String, b: String) -> String` returning `dot=<n>`, the dot
  product of the two sparse vectors, or `error=<message>` when either does not
  parse (`a` is checked first).

Preserve (the hidden oracle checks these):

- `parse_pair`, `parse_sparse` and `norm1` keep their exact behaviour.
- Repeated indices ADD UP within a vector before multiplying: "1:2 1:3" is
  the value 5 at index 1. Indices present in only one vector contribute 0.
- The per-vector index tables are temporaries of `dot`: return only the string.
