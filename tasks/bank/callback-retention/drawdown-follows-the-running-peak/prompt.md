Modify the program below. Return the whole file.

Requested change:

- Add `fn drawdown_note(prices: List[Int]) -> (String) -> String` returning a
  closure that, given a fund name, answers `<fund>: max drawdown <d>`: the
  largest fall from a price to a LATER lower price (0 when prices never fall).

Preserve (the hidden oracle checks these):

- `change` and `range_of` keep their exact behaviour.
- A drawdown is measured from a running peak to a LATER trough; a low that
  comes BEFORE the high is not a drawdown ([1, 9] has drawdown 0).
- The closure captures only the number, never `prices`.
