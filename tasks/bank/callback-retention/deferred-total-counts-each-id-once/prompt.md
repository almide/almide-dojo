Modify the program below. Return the whole file.

Requested change:

- Add `fn deferred_total(events: List[(String, Int)], fmt: (Int) -> String) -> () -> String`
  returning a closure that answers `fmt(total)` for the total of the payments,
  each id counted once.

Preserve (the hidden oracle checks these):

- `ids`, `deliveries` and `retried` keep their exact behaviour.
- Each id counts once with the amount of its FIRST delivery, even when a
  retry carries a different amount.
- The closure may capture `fmt` (the caller's formatter) and the total, but
  never `events`.
