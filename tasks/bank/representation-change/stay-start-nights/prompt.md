Modify the program below. Return the whole file.

Requested change:

- Store a stay as its check-in day and length: change `Stay` to
  `type Stay: Eq, Repr = { guest: String, start: Int, nights: Int }` (nights >= 1; the
  guest checks out on day `start + nights`). `stay(guest, start, nights)` replaces
  `stay(guest, first, last)`.

Preserve (the hidden oracle checks these):

- `render` still prints the first and the LAST night: `stay("ann", 3, 3)` renders
  `ann 3-5`, a one-night stay `stay("bo", 7, 1)` renders `bo 7-7`.
- Back-to-back stays do NOT overlap: a guest checking out on day 6 and another
  checking in on day 6 are compatible. Stays sharing at least one night overlap.
- `conflicts` keeps its format and order; `occupancy(stays, day)` counts the stays
  whose nights include `day` (the check-out day is not a night of the stay).
- `nights` and `extend` keep their meaning.
