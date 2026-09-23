Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A `Timeout` is retried: `fetch_all` makes up to THREE attempts per url in
  total (attempt numbers 0, 1, 2), stopping at the first attempt that is not a
  timeout. If all three time out, it fails with the last one, `Timeout(url, 2)`.
- `attempts` counts every attempt made, retries included.
- `fetch_once` is unchanged.

Preserve (the hidden oracle checks these on untouched inputs):

- `Status` and `NoRoute` errors are never retried and propagate unchanged, also
  when they come after a timeout of the same url.
- Every url (and every repeat of a url in the list) starts again at attempt 0
  with its own three attempts.
- Bodies keep the order of `urls`; the first failing url stops the batch.
