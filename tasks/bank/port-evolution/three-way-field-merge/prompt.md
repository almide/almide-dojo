Modify the program below. Return the whole file.

Requested change:

- Add a three-way strategy `type ThreeWay: Merge = {}`: when only one side changed
  the value (compared with `base`), take that side; when neither changed, keep the
  value; when both sides changed it, refuse with `conflict: <ours> vs <theirs>`.
- Add `type Strategy = | Ours(KeepOurs) | Three(ThreeWay)` and
  `fn merge_with(s: Strategy, fields: List[Field]) -> List[String]!` that runs the
  generic `merge_all` with the selected strategy.

Preserve (the hidden oracle checks these):

- `KeepOurs`, `merge_all` and the protocol keep their exact behaviour.
- Both sides making the SAME change is not a conflict: the common value is taken.
- `merge_all` stops at the first conflicting field in order and reports it as
  `<name>: conflict: <ours> vs <theirs>`.
- Empty strings are ordinary values (changing `a` to `` is a change).
