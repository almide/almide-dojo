Modify the program below. Return the whole file.

Requested change:

- Add a decorator `type Breaker: Service = { inner: Backend, threshold: Int, failures: Int }`
  and `fn breaker(b: Backend, threshold: Int) -> Breaker` (no failures yet).
  `failures` counts CONSECUTIVE failed calls. Once it has reached `threshold`, the
  breaker is open: every further call fails with `circuit open` WITHOUT reaching
  `inner`. While closed, a call goes to `inner`; a success resets the count to 0,
  a failure adds one and returns the inner error unchanged.
- Add `fn run_guarded(b: Backend, threshold: Int, reqs: List[String]) -> (List[String], Int)`
  returning the lines of the generic `run_all` through a fresh breaker and the number
  of calls that reached the backend.

Preserve (the hidden oracle checks these):

- `Backend`, `run_all` and the protocol keep their exact behaviour.
- Only consecutive failures open the breaker: failures separated by a success do
  not add up.
- The failure that reaches the threshold still reports its own error; only the calls
  AFTER it say `circuit open`, and they do not reach the backend.
