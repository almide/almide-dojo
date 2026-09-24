Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A message whose Content-Length headers disagree is invalid. When two
  Content-Length headers (name in any case) have different values,
  `content_length` (and so `parse_message`) must fail with
  `conflicting content-length: <first> vs <other>`, where `<first>` is the value of
  the first such header and `<other>` the first value, in header order, that
  differs from it (for example `conflicting content-length: 3 vs 4`).

Preserve (the hidden oracle checks these on untouched inputs):

- Values are compared as the trimmed text, exactly: repeating the same value is
  allowed (`3` and `3 `), while `02` and `2` differ.
- The conflict check runs BEFORE the value is read as a number, so two different
  values conflict even when one of them is not a number; when all values agree,
  the existing `bad content-length: <v>` check applies as today.
- Every header line is parsed first (`malformed header line: <line>`,
  `empty header name: <line>`); `body shorter than content-length` and the body
  cut are unchanged.
