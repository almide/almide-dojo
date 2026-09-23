Modify the program below. Return the whole file.

Requested change:

- Add a decorator `type Retrying: Fetcher = { inner: Scripted, max: Int }`. Its
  `fetch(url, attempt)` asks `inner` with that attempt number; on a `Transient`
  error it tries again with the next attempt number, as long as the attempt just
  made is below `max`. `max` is the TOTAL number of attempts: with `max = 3`, attempts
  1, 2 and 3 are made and no more.
- Add `type Client = | Direct(Scripted) | Retry(Retrying)` and
  `fn get_all_with(c: Client, urls: List[String]) -> List[String]!FetchError` that runs
  the generic `get_all` with the selected fetcher.

Preserve (the hidden oracle checks these):

- `Scripted`, `get_all` and the protocol keep their exact behaviour and signatures.
- Only `Transient` is retried; `Missing` is returned at once, unchanged, even when
  it comes after some timeouts.
- When every attempt times out, the error is the LAST timeout, unchanged
  (`Transient("timeout <url> #<last attempt>")`).
- `max = 1` means a single attempt (no retry); `get_all_with` stops at the first
  failing url in url order.
