Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- An album with no tracks is invalid. `load` (and so `overview`) must fail with
  `album <name> has no tracks` (for example `album Blue has no tracks`).

Preserve (the hidden oracle checks these on untouched inputs):

- Every album counts, the LAST one included (an album header at the end of
  the input with nothing after it, or only blank lines, is empty).
- The error is reported as soon as the album is known to be empty, when the
  next album header is read or at the end of the input. So an empty album wins
  over a problem in a later album, and a problem that comes earlier in the input
  wins over it.
- An empty input is a valid, empty playlist. Two albums may share a name.
- Every existing error message stays byte-identical.
