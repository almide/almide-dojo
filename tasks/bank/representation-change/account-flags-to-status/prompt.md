Modify the program below. Return the whole file.

Requested change:

- Replace the two flags with one status:
  `type Status: Eq, Repr = | Active | Suspended | Deleted(Bool)`, where the payload of
  `Deleted` records whether the account was active. Change `Account` to
  `{ name: String, status: Status }`.
- `account(name, active, deleted)` keeps its signature and builds the status.

Preserve (the hidden oracle checks these):

- Every operation keeps its meaning on every status. In particular `suspend` and
  `activate` on a DELETED account keep it deleted (they only change what a later
  `restore` brings back), and `delete` of a deleted account changes nothing.
- `restore` brings an account back as it was: active if it was active when deleted
  (or activated since), suspended otherwise; `restore` of a live account changes
  nothing.
- `listing` and `counts` keep their formats and counts.
