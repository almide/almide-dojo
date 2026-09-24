Modify the program below. Return the whole file.

Requested change:

- Extract `fn retryable(status: Int) -> Bool` and make both `should_retry`
  and `retry_count` use it.

Preserve (the hidden oracle checks these):

- `should_retry` and `retry_count` stay the same functions of their input:
  exactly 408, 429, 502, 503 and 504 are retryable; 500 and 501 are not.
- A pure refactor: the helper allocates nothing the inline test did not.
