Modify the program below. Return the whole file.

Requested change:

- Add a second adapter `type SlidingLog: Limiter = { window: Int, max: Int, stamps: List[Int] }`
  and a constructor `fn sliding(window: Int, max: Int) -> SlidingLog` (empty log).
  A request at `now` is admitted when fewer than `max` ADMITTED requests have a
  stamp `s` with `now - s < window`; an admitted request records its stamp.
- Add `type Policy = | Fixed(FixedWindow) | Sliding(SlidingLog)` and
  `fn admit_with(p: Policy, times: List[Int]) -> List[Bool]` that runs the generic
  `admit` with the selected limiter.

Preserve (the hidden oracle checks these):

- `FixedWindow`, `fixed`, `admit`, `admitted` and the protocol keep their exact
  behaviour and signatures.
- A REJECTED request is not recorded: it never counts against later requests.
- A stamp exactly `window` old no longer counts (`now - s == window` has expired).
- Requests at the same instant each count; `max = 0` admits nothing.
