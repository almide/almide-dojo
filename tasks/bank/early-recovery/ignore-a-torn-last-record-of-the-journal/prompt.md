Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A crash can tear the record being written. If the LAST non-blank line of the
  journal is `Truncated`, `replay` ignores it and appends the note
  `ignored torn record at line <n>`; everything before it is replayed as usual.
- `apply` is unchanged.

Preserve (the hidden oracle checks these on untouched inputs):

- Only the last non-blank line is forgiven, and only for `Truncated`: a
  truncated record followed by any other record (blank lines do not count) is
  still fatal, and an `UnknownOp` or `BadKey` in the last line is still fatal.
- Line numbers count blank lines; `applied` counts the records actually applied.
- Everything else about replay (value text with spaces, `del`) is unchanged.
