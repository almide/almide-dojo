Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- An expired coupon is no longer fatal: `checkout` ignores it and adds the note
  `<code> expired` at its place in the notes (for example `OLD expired`).
- `apply_coupon` is unchanged: it still returns `Expired(code, expires)`.

Preserve (the hidden oracle checks these on untouched inputs):

- A coupon is still valid ON its expiry date; it is expired only after it.
- An ignored coupon is not applied: it takes no slot of the two-coupon limit, and
  it can be given again (each time it is ignored and noted again).
- `Unknown`, `LimitReached` and `BelowMinimum` stay fatal with their payloads,
  before or after an ignored coupon. Within one coupon the checks keep their
  order (known, then expiry, then limit, then minimum): an expired coupon given
  when the limit is already reached is ignored, not `LimitReached`.
- Notes keep the order in which the codes were given.
