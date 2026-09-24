Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A transfer that fails with `Insufficient` is no longer fatal right away:
  `settle` sets it aside and goes on. After the last line, the set-aside
  transfers are retried ONCE, in their original order, against the balances at
  that point. `deferred` counts the transfers that were set aside.
- If a retried transfer still fails, that retry's error is fatal (for
  `Insufficient`, with the balance at retry time).
- `transfer` is unchanged.

Preserve (the hidden oracle checks these on untouched inputs):

- `Unknown` and `BadAmount` stay fatal and stop the run as soon as they occur
  in the main pass, even when transfers are waiting to be retried.
- A retry that succeeds changes the balances seen by the retries after it.
- With nothing set aside, results are unchanged.
