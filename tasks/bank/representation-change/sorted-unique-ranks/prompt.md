Modify the program below. Return the whole file.

Requested change:

- Keep the numbers sorted and unique: change `Seats` to
  `type Seats: Eq, Repr = { sorted: List[Int] }` (strictly increasing). `seats(xs)` and
  `add` keep their signatures and keep the list sorted and unique.
- `rank(s, x)` becomes a position lookup: the index of the first stored number that is
  `>= x` (so it counts the numbers below `x`). `between(lo, hi)` is
  `rank(hi + 1) - rank(lo)`. Remove `distinct`.

Preserve (the hidden oracle checks these):

- Adding a number already present changes nothing; `count` counts distinct numbers.
- `rank` works for every `x`: below all numbers it is 0, ABOVE all numbers it is the
  total count, and between numbers it counts those below.
- `between` is inclusive at both ends and 0 for an empty range; `render` lists the
  numbers in increasing order.
