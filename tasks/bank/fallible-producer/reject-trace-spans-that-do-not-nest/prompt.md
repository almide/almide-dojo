Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- Spans must nest: a span may only end when every span that began inside it
  has already ended. Ending a span while a later-begun span is still open
  fails with `end <span> while <inner> is open inside it`, `<inner>` the most
  recently begun span that is still open (for example
  `end a while b is open inside it`).

Preserve (the hidden oracle checks these on untouched inputs):

- Sibling spans, and a span that begins again after it ended, stay valid;
  totals are unchanged.
- Lines are processed in order and the first problem wins; within an `end`
  line, `end without begin` comes first. `unterminated span <name>` at the end
  is unchanged.
