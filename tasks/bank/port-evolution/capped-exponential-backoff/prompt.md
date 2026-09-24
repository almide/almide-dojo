Modify the program below. Return the whole file.

Requested change:

- Add `type Doubling: Backoff = { base: Int, cap: Int, attempts: Int }` (base >= 1,
  cap >= base): the delay before retry `n` is `base * 2^(n-1)`, but never more than
  `cap`; after `attempts` retries (and for n < 1) it gives up.
- Add `type Policy = | Flat(Steady) | Grow(Doubling)` and
  `fn schedule(p: Policy) -> List[Int]` and `fn waited(p: Policy) -> Int` that run the
  generic `plan` / `total_wait`.

Preserve (the hidden oracle checks these):

- `Steady`, `plan`, `collect`, `total_wait` and the protocol keep their behaviour.
- The delays never decrease and stay at `cap` once reached, for ANY number of
  attempts up to 200: the doubling must not overflow (Int arithmetic wraps).
- Exactly `attempts` delays are planned; `attempts = 0` plans none.
