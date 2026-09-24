Modify the program below. Return the whole file.

Requested change:

- Add `fn top_failure(codes: List[Int]) -> (String) -> String` returning a
  closure that, given a service name, answers `<service>: <code> x<n>` for the
  most frequent NON-success code (ties: the smaller code), or
  `<service>: all good`.

Preserve (the hidden oracle checks these):

- `is_success` and `success_rate` keep their exact behaviour.
- Every 2xx is a success and never reported: 204 and 201 are as good as 200.
- The closure captures only the code and its count, never `codes`.
