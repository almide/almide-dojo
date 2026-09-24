Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A heading that goes more than one level deeper than the previous heading is
  no longer fatal: `outline` uses the level just below the previous heading
  (previous + 1, so level 1 for a first heading) and adds the warning
  `line <n>: level <written> after <previous>, using <used>`.
- `parse_heading` is unchanged: it still returns `Jump(n, prev, level)`.

Preserve (the hidden oracle checks these on untouched inputs):

- "Previous" is the level a heading was actually USED at: after a clamped
  heading, the next heading is compared with the clamped level.
- `NotHeading`, `EmptyTitle` and `TooDeep` stay fatal with their payloads,
  before or after a clamp. Going up any number of levels is still fine.
- Numbering follows the used levels; warnings are in line order; blank lines are
  skipped as before.
