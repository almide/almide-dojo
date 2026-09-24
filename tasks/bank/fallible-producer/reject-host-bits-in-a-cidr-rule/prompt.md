Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A rule whose address has any bit set beyond its prefix (a host bit) is
  invalid. `parse_rule` (and so `parse_rules` and `decide`) must fail with
  `host bits set in <address>/<prefix>` as written in the rule
  (for example `host bits set in 10.0.0.5/24`).

Preserve (the hidden oracle checks these on untouched inputs):

- Host bits are the `32 - prefix` low bits of the address, wherever they fall:
  `10.0.0.128/25` and `1.2.3.4/32` are valid networks; `10.1.0.0/8` is not.
  `0.0.0.0/0` is valid.
- Every existing error message stays byte-identical, and the new check runs
  after the address and the prefix have been parsed and range-checked.
- Rules are checked in list order and the first bad rule wins; `decide`
  results are unchanged for valid rules.
