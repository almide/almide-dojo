Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A leap second is accepted: the second 60 is valid at 23:59:60 on June 30
  and on December 31. It is the second after 23:59:59, so it counts as one
  second in the gaps, and `timing` adds the note `leap second at <timestamp>`.

Preserve (the hidden oracle checks these on untouched inputs):

- Any other second 60 (another time, or 23:59:60 on another date) is still
  `BadField(<timestamp>, "second")`. Seconds above 60 are too.
- The event right after a leap second at 00:00:00 the next day is one second
  later (also across the new year), and times still may not go backwards.
- Every line is read before gaps are computed: the first bad line wins, with
  its existing error. Notes come in line order.
