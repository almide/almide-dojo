Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A booking that overlaps a booking already accepted for the SAME room is
  invalid. `book_all` must fail with `overlap in <room>: <who> clashes with <other>`,
  where `<other>` is the earliest-listed accepted booking it overlaps
  (for example `overlap in A: bob clashes with ann`).
- Bookings arrive in any time order, not sorted.

Preserve (the hidden oracle checks these on untouched inputs):

- Two bookings overlap only if they share at least one minute: a booking that
  ends at 10:00 and one that starts at 10:00 do not overlap. Bookings in
  different rooms never overlap.
- Every existing error message stays byte-identical (`bad time <s>`,
  `bad line: <line>`, `bad span in: <line>`, `empty booking for <who>`,
  `outside opening hours: <who>`), and those checks of a line run before the
  new overlap check.
- Across the list the first failing line wins, whatever the kind of error.
- `agenda` output is unchanged.
