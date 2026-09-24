Modify the program below. Return the whole file.

Requested change:

- Builds can be release candidates: add a field `rc: Int?` to `Build` (`some(2)` is
  the second candidate, `none` is the final release) and a constructor
  `fn candidate(major: Int, minor: Int, patch: Int, rc: Int) -> Build`; `build(...)`
  keeps its signature and makes a final release.
- `label` prints a candidate as `1.4.0-rc2` and a final release as before.

Preserve (the hidden oracle checks these):

- A candidate comes BEFORE the final release of the same version
  (`1.4.0-rc1` < `1.4.0-rc2` < `1.4.0` < `1.4.1-rc1`), in `ordered`, `is_after` and `newest`.
- Candidates compare by their number (`rc10` after `rc9`).
- `ordered` keeps list order for equal builds; `newest` keeps the first listed among
  equals and answers `none` for an empty list.
