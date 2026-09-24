Modify the program below. Return the whole file.

Requested change:

- Add `fn survivor(names: List[String], k: Int) -> String` returning
  `survivor=<name>` for the last person left, or `error=<message>` with the
  `validate` message.

Preserve (the hidden oracle checks these):

- `validate` and `first_out` keep their exact behaviour.
- After someone leaves, counting continues with the NEXT person in the circle
  (it does not restart at the head of the list); counting wraps around.
- The shrinking circle is a temporary of `survivor`: return only the string.
