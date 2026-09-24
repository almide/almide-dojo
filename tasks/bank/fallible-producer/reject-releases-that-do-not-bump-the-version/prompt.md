Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- Every release must have a higher version than the release before it.
  `history` (and so `latest`) must fail with
  `version <v> is not newer than <previous>` otherwise
  (for example `version 1.1.9 is not newer than 1.2.0`).

Preserve (the hidden oracle checks these on untouched inputs):

- Versions are ordered numerically, major first, then minor, then patch:
  `1.10.0` is newer than `1.9.0`, and `10.0.0` is newer than `9.9.9`. A repeated
  version is not newer.
- Within one line the existing checks come first (the line is parsed, then the
  date order is checked); the version order is checked last.
- Every existing message is unchanged; the first failing line wins.
