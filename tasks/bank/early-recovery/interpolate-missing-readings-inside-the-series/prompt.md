Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A lost reading that has a known reading somewhere before it AND somewhere
  after it is no longer fatal: `series` fills it by linear interpolation in
  time between the nearest known readings on each side, rounded to the
  nearest integer with halves rounded up, and adds the note
  `interpolated <t> as <v>`.
- A lost reading with no known reading on one side is still `Missing(t)`.
- `readings` and `parse_reading` are unchanged.

Preserve (the hidden oracle checks these on untouched inputs):

- Interpolation uses times, not positions: with uneven spacing or several lost
  readings in a row, each value lies on the straight line between the two
  known neighbours.
- `BadLine` and `NotIncreasing` stay fatal; notes are in time order.
