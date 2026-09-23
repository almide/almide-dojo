Modify the program below. Return the whole file.

Requested change:

- Add `fn deferred(xs: List[Int]) -> () -> String` that returns a closure
  reporting `sum=<analyse(xs)>` when called (for example `sum=14`).

Preserve (the hidden oracle checks these):

- `analyse` keeps its exact behaviour.
- The summary is computed when `deferred` is called, not when the closure runs,
  and the closure captures only the summary. It must not capture `xs`.
