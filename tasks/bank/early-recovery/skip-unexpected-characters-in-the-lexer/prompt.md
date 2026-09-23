Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- An unexpected character is no longer fatal: `lex` skips that one character,
  keeps lexing right after it, and appends the warning `skipped <c> at <i>`
  (for example `skipped @ at 6`).
- `next_token` is unchanged: it still returns `Unexpected(i, c)`.

Preserve (the hidden oracle checks these on untouched inputs):

- `Unterminated` and `BadNumber` stay fatal with their exact payloads, whether
  or not something was skipped before them.
- Positions are offsets in the ORIGINAL source: skipping never shifts the
  position reported by a later warning or error. Each skipped character gets
  its own warning, in source order, even when several are adjacent.
- Characters inside a string literal are part of the string and are never
  skipped. Tokens keep their order.
