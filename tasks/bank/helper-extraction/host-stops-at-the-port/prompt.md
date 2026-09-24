Modify the program below. Return the whole file.

Requested change:

- Extract `fn host(url: String) -> String` and make `same_site` use it.

Preserve (the hidden oracle checks these):

- `same_site` and `is_secure` stay the same functions of their input: the
  host ends at the first "/", ":" (a port) or "?"; "a.com:8080" and
  "a.com" are the same site; case does not matter.
- A pure refactor: the helper allocates no more than the inline code did.
