Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A code with exactly ONE unreadable character "?" is no longer rejected: the
  missing character is the single value that makes the checksum valid.
  `import_catalog` uses the restored code and adds the note
  `restored position <i> of <raw> as <c>`, where `<i>` is the 0-based position
  among the 10 code characters and `<c>` the restored character.
- If no value can make the code valid, it is `BadChecksum(raw)`.
- `read_isbn` is unchanged.

Preserve (the hidden oracle checks these on untouched inputs):

- The restored character follows the same rules as a written one: a digit, or
  `X` (ten) in the last position only.
- A code with two or more "?" is still rejected exactly as before, with `BadChar(raw, <position of the first ?>)`.
- `BadLength`, other `BadChar`s and `BadChecksum` stay fatal; notes are in line
  order.
