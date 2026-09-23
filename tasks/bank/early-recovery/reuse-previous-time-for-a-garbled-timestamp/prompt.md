Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A line whose timestamp is malformed is no longer fatal when an earlier ENTRY
  exists: `load` keeps the line, gives it the time of the previous entry, and
  appends the warning `line <n>: bad time <tok>, reusing <HH:MM:SS>`.
- If there is no earlier entry (the first non-blank line has a malformed time),
  there is nothing to reuse and the `BadTime` error stays fatal.
- `parse_line` and `parse_time` are unchanged: they still return `BadTime(n, tok)`.

Preserve (the hidden oracle checks these on untouched inputs):

- Every other error still propagates unchanged: `Truncated`, `BadLevel`,
  `OutOfOrder`. Within one line the checks keep their order (field count, then
  time, then level), so a line whose time is recovered is still rejected for an
  unknown level, and a line with too few fields is `Truncated` whatever its time.
- Blank lines are skipped with their existing warning and are not entries.
- Warnings appear in line order, blank-line and bad-time warnings interleaved.
- A recovered line counts as the previous entry for the next line, and the
  order check runs against it exactly as for any other entry.
