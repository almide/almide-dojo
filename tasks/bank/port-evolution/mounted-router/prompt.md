Modify the program below. Return the whole file.

Requested change:

- Add a decorator `type Mount: Router = { prefix: String, inner: Table }` that serves
  `inner` below `prefix` (a prefix such as `/api`, never ending in `/`): a request for
  `prefix + rest` is routed by `inner` as `rest`, where the bare prefix and the prefix
  followed by `/` both mean `/` for `inner`.
- Add `type App = | Plain(Table) | Mounted(Mount)` and
  `fn dispatch_app(a: App, paths: List[String]) -> List[String]` and
  `fn served_app(a: App, paths: List[String]) -> Int`.

Preserve (the hidden oracle checks these):

- `Table`, `dispatch`, `served` and the protocol keep their behaviour.
- The mount works on whole path segments: `/api/users` is under `/api`, `/api` and
  `/api/` are its root, but `/apix` and `/apiary/users` are NOT under it (404).
- A path under the mount that `inner` does not know is a 404, like any other miss.
