Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- Tiers must join: the first tier starts at 0 and every later tier starts
  right after the previous tier's `hi` (at `hi + 1`). Otherwise `tiers` (and
  so `price`) must fail with `tiers do not join at <lo>`, `<lo>` being the start
  of the tier that does not join (for example `tiers do not join at 90` for `0-99` then `90-499`).

Preserve (the hidden oracle checks these on untouched inputs):

- Gaps AND overlaps both break the join.
- A tier may cover a single quantity (`1-1`); a lone open tier `0+` is fine.
- Each tier is parsed first (its own errors win), then `open tier must be last`
  is checked, then the join; tiers are checked in order and the first problem
  wins. `no tier for <q>` is unchanged.
