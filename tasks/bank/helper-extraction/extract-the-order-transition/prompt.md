Modify the program below. Return the whole file.

Requested change:

- Extract the transition table into `fn transition(state: String, event: String) -> String?`
  (`some(next)` for an allowed event, `none` for a rejected one) and make
  `replay` use it.

Preserve (the hidden oracle checks these):

- `replay` stays the same function of its input.
- The table is exactly today's: "cancel" only from new or paid; delivered and
  cancelled accept nothing; an unknown event or state is rejected.
- A pure refactor: the helper allocates nothing the inline table did not.
