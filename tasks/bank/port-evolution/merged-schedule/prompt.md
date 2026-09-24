Modify the program below. Return the whole file.

Requested change:

- Add a composite `type Merged: Schedule = { repeat: Every, extra: Once }` that fires
  whenever either part fires: its `next_after(t)` is the earlier of the two parts'
  next times.
- Add `type Plan = | Repeat(Every) | Single(Once) | Both(Merged)` and
  `fn upcoming_for(p: Plan, t: Int, n: Int) -> List[Int]` that runs the generic
  `upcoming` with the selected schedule.

Preserve (the hidden oracle checks these):

- `Every`, `Once`, `upcoming` and the protocol keep their exact behaviour.
- A part that has run out does not stop the other: once `extra` has fired, `Merged`
  keeps firing on `repeat`.
- When both parts fire at the same time, that time appears ONCE.
- Times may be negative; `next_after` is always strictly after `t`.
