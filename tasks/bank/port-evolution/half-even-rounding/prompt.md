Modify the program below. Return the whole file.

Requested change:

- Add banker's rounding `type HalfEven: Rounding = {}`: an amount exactly halfway
  between two cents goes to the EVEN cent (25 mills -> 2, 35 -> 4, 45 -> 4); every
  other amount goes to the nearest cent. Negative amounts are the mirror image
  (-25 -> -2, -35 -> -4, -26 -> -3).
- Add `type Policy = | Commercial(HalfUp) | Bankers(HalfEven)` and
  `fn statement_with(p: Policy, lines: List[Int]) -> String`.

Preserve (the hidden oracle checks these):

- `HalfUp`, `settle`, `statement` and the protocol keep their behaviour.
- `HalfEven` is exact for every sign: only an exact half (a last digit of 5) goes to
  the even neighbour; -24 -> -2, -26 -> -3, -5 -> 0, 5 -> 0, 15 -> 2.
- Zero stays zero.
