Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- Employee ids are company-wide: an id already used in ANOTHER department is
  invalid. `roster` (and so `headcounts`) must fail with
  `id <id> used in <first dept> and <this dept>`, where `<first dept>` is the
  department that listed the id first (for example `id 7 used in ops and sales`).

Preserve (the hidden oracle checks these on untouched inputs):

- A repeat inside the same department keeps its existing message,
  `duplicate id <id> in <dept>`.
- Departments are separate entries even when two share a name: an id repeated
  across two `[ops]` sections is `id <id> used in ops and ops`.
- Every other message is unchanged, a line is fully parsed before any id check,
  and the first failing line wins.
