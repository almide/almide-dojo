Modify the program below. Return the whole file.

Requested change:

- Extract the lookup into `fn header_value(hs: List[(String, String)], name: String) -> String`
  (the first matching header's value, `""` when there is none) and use it in
  `content_length`, and in `get_header`/`has_header` wherever it gives the same
  answer.

Preserve (the hidden oracle checks these):

- `get_header`, `has_header` and `content_length` stay the same functions of
  their input. A header that is present with an EMPTY value is still present:
  `get_header` returns `some("")` and `has_header` returns true.
- Names still match case-insensitively; the first match still wins.
- A pure refactor: a lookup allocates no more than the inline search did.
