Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A seat holds one passenger at a time. Booking or moving onto a seat that
  another passenger holds fails with `line <n>: seat <seat> is taken by <passenger>`.
  This applies to `board` and so to `seat_map`.

Preserve (the hidden oracle checks these on untouched inputs):

- Only the seats held at that moment count: a seat left by a move or a cancel
  can be booked or moved onto by later events. Moving onto the seat you already
  hold is allowed and changes nothing.
- Each event is checked with its existing checks first, in their existing
  order (bad seat, bad event, "already booked", "no booking"); the taken-seat
  check comes after them. Events are applied in line order and the first
  failing line wins.
- `seat_map` output is unchanged.
