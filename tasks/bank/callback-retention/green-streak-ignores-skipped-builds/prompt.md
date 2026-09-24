Modify the program below. Return the whole file.

Requested change:

- Add `fn streak(builds: List[String]) -> (String) -> String` returning a
  closure that, given a repository name, answers `<repo>: <n> green in a row`
  where `n` counts the passing builds at the END of the history.

Preserve (the hidden oracle checks these):

- `passes`, `fails` and `health` keep their exact behaviour.
- Skipped builds neither count nor break the streak: "pass skip pass" is 2
  green in a row. Only a "fail" ends it.
- The closure captures only the number, never `builds`.
