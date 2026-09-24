Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A key stays usable for a grace hour after it is retired: a message whose
  time is less than 3600 seconds after the key's retirement is accepted, and
  `inbox` adds the note `line <n>: accepted retired key <id>`.
- `verify` is unchanged: it still returns `RetiredKey(n, id)` for such a
  message.

Preserve (the hidden oracle checks these on untouched inputs):

- A message accepted during the grace hour must still carry a valid signature
  for that key; otherwise it is `BadSignature(n)`, as for any other message.
- Exactly 3600 seconds after retirement (or later) the key is refused with
  `RetiredKey(n, id)`.
- `UnknownKey` and `BadLine` stay fatal. Lines are handled in order and the
  first failing line wins; notes come in line order.
