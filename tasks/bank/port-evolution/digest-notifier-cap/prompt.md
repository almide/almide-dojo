Modify the program below. Return the whole file.

Requested change:

- Add a decorator `type Digest: Notifier = { inner: Direct, max: Int }` (max >= 1) that
  never delivers more than `max` lines to one recipient per batch: a batch of at most
  `max` messages goes through `inner` unchanged; a larger batch delivers its first
  `max - 1` messages through `inner` and then ONE summary line
  `<channel>:<to>: (+<k> more)` counting the messages not delivered.
- Add `type Mode = | Each(Direct) | Capped(Digest)` and
  `fn flush_with(m: Mode, queue: List[(String, String)]) -> List[String]`.

Preserve (the hidden oracle checks these):

- `Direct`, `flush` and the protocol keep their behaviour.
- A batch of exactly `max` messages is delivered in full, with no summary line.
- A capped batch is exactly `max` lines: `max - 1` messages plus the summary, and the
  summary counts every message left out (`max = 1` gives only the summary).
- Recipients are capped independently and keep first-seen order.
