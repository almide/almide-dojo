Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- The two-digit check number of an account id must equal the id's digits taken
  as one decimal number, modulo 97 (written with two digits, e.g. `05`).
  Otherwise `check_id` must fail with `check number mismatch in <id>`
  (for example `123456-72` is valid and `123456-01` is not).

Preserve (the hidden oracle checks these on untouched inputs):

- Ids may have up to 24 digits; the check must be exact for every valid length
  (24 digits do not fit in an `Int`).
- `bad id format <id>` still comes first and is unchanged; a check number is
  compared only for a well-formed id.
- Within a transfer the from id is checked before the to id, and both before
  `transfer to itself` and the amount; every other message is unchanged and
  the first failing line wins.
