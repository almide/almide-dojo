Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A route that can never be reached, because an EARLIER route matches every
  request it would match, is invalid. `table` (and so `dispatch`) must fail with
  `route <k> is shadowed by route <j>`, routes numbered from 1 and `<j>` the first
  such earlier route (for example `route 2 is shadowed by route 1`).

Preserve (the hidden oracle checks these on untouched inputs):

- "Matches every request" uses the existing matching rules: the earlier method is
  `*` or the same method, and every path of the later pattern is matched by the
  earlier pattern. A prefix covers whole path segments only (`/api/*` does not
  cover `/apiv2/x`, but it does cover `/api` and `/api/*`). An exact route never
  shadows a prefix route; `* /q` after `GET /q` is reachable.
- Lines are checked in order and each line is fully parsed before its shadow
  check, so the first failing line wins; existing messages are unchanged.
- `dispatch` results are unchanged for valid tables.
