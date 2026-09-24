Modify the program below. Return the whole file.

Requested change:

- Add `fn decile_counter(scores: List[Int]) -> (Int) -> String` returning a
  closure that, given a score, answers `<label>: <n>` — the label of that
  score's decile and how many of `scores` fall in the same decile.

Preserve (the hidden oracle checks these):

- `clamp_score`, `decile_label` and `in_range` keep their exact behaviour.
- A score of 100 is in the 90-100 decile (there is no eleventh decile);
  out-of-range values — in `scores` and in the argument — are clamped first.
- The closure captures only the ten counts, never `scores`.
