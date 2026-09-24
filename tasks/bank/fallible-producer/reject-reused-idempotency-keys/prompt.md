Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- Idempotency keys: a request whose key was already used by an EARLIER request
  with a different account or amount is invalid. `run` (and so `receipt`) must
  fail with `key <key> reused for a different request`.
- A request that repeats an earlier one exactly (same key, account and amount)
  is a client retry: it is not an error and it is NOT charged again.

Preserve (the hidden oracle checks these on untouched inputs):

- A repeat may come any number of times, anywhere later in the batch.
- Each line is parsed first with its existing checks and messages; the first
  failing line wins.
- Charges keep their order; totals count each charged request once.
