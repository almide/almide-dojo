Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A ticket whose category is unknown is no longer fatal: `import_board` skips
  the line and adds the warning `skipped <line>: unknown category <cat>`.
- `parse_ticket` is unchanged.

Preserve (the hidden oracle checks these on untouched inputs):

- Ticket numbers count imported tickets only: a skipped line takes no number,
  so numbers stay consecutive (#1, #2, ...).
- Within a line the checks keep their order (category, then priority, then
  title): a line with an unknown category is skipped even if its priority is
  bad as well.
- `BadPriority` and `NoTitle` stay fatal; blank lines are ignored as before;
  warnings are in line order.
