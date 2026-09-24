Modify the program below. Return the whole file.

Requested change:

- Add `fn best_window(xs: List[Int], k: Int) -> String` returning
  `best=<sum>` for the k-day window with the largest sum, `none` when there
  are fewer than k days, or the `validate_k` message for a bad k.

Preserve (the hidden oracle checks these):

- `validate_k`, `window_sums` and `total` keep their exact behaviour.
- Only FULL windows count: with fewer than k days the answer is `none`, not
  a sum. Sums may be negative (the best of [-5, -3] with k = 1 is -3).
- The window sums are a temporary of `best_window`: return only the string.
