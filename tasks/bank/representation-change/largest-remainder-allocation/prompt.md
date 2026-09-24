Modify the program below. Return the whole file.

Requested change:

- Pay exact cents: change `Payout.total: Float` to `Payout.cents: Int` (>= 0), make
  `payout(cents, partners)` take an `Int`, and make `shares` return `List[(String, Int)]`.
  No floating point may remain.
- Shares use the largest-remainder rule: everybody first gets their exact share rounded
  DOWN; the cents left over go one each to the partners whose exact shares had the
  LARGEST fractional parts; among equal fractional parts, the partner listed first wins.
- `statement` prints `name: D.CC`.

Preserve (the hidden oracle checks these):

- The shares always add up to the total exactly.
- Left-over cents follow the largest fractional part, not list order: 101 cents with
  weights 1, 1, 2 is 25, 25, 51 (the exact shares are 25.25, 25.25, 50.5).
- A weight of 0 gets 0; ties in the fractional part go to the partner listed first.
