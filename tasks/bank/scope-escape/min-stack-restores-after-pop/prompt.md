Modify the program below. Return the whole file.

Requested change:

- Add `fn run(ss: List[String]) -> String` returning the answers of every
  "min" in order, joined by `,` ("empty" when the stack is empty at that
  point), or the `parse_program` error. A "pop" on an empty stack does nothing.

Preserve (the hidden oracle checks these):

- `parse_op`, `parse_program` and `pushes` keep their exact behaviour.
- After a pop, the minimum is recomputed from what is left: push 5, push 1,
  pop, min is 5.
- The stack is a temporary of `run`: return only the string.
