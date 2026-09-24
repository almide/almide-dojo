Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- An `add` that conflicts is no longer fatal: `replay` applies it once more on
  the key's current version, so the amount is added to the current value, and
  adds the note `retried add <key> at version <current>`.
- `apply` is unchanged: it still returns `Conflict(key, read, current)`.

Preserve (the hidden oracle checks these on untouched inputs):

- Only an `add` is retried. A `set` that conflicts stays fatal as
  `Conflict(key, read, current)`: overwriting a value the client never saw is
  what the version check is for.
- The retried add is a write like any other: it bumps the version, so a later
  operation that read the old version conflicts.
- `NoKey` and `BadOp` stay fatal. Notes come in line order.
