Modify the program below. Return the whole file.

Requested change:

- Add `fn latest_lookup(feed: List[String]) -> (String) -> String` returning a
  closure that, given a package name, answers its newest version as written
  (e.g. `1.10.0`), or `unknown`.

Preserve (the hidden oracle checks these):

- `parse_release`, `packages` and `newer` keep their exact behaviour.
- Versions compare NUMERICALLY with `newer` ("1.10.0" beats "1.9.0"); the feed
  order does not matter.
- The closure captures only one version per package, never `feed`.
