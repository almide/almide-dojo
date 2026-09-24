Modify the program below. Return the whole file.

Requested change:

- Extract `fn overlap(s1: Int, e1: Int, s2: Int, e2: Int) -> Bool` and make
  both `conflicts` and `clashes_with` use it.

Preserve (the hidden oracle checks these):

- `conflicts` and `clashes_with` stay the same functions of their input:
  ranges are HALF-OPEN, so back-to-back bookings do not overlap.
- A pure refactor: the helper allocates nothing the inline test did not.
