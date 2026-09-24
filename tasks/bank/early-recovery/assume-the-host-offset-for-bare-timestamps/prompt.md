Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A timestamp with no offset is no longer fatal when its host has a default
  offset in `defaults` (for example `"web": "+02:00"`): `merge` reads it as
  if that offset had been written after the time.
- `parse_stamp` and `parse_entry` are unchanged.

Preserve (the hidden oracle checks these on untouched inputs):

- A host with no entry in `defaults` still fails with `NoOffset(host, stamp)`;
  there is no global fallback such as UTC.
- A written offset always wins over the host default.
- The default is read exactly like a written offset, so a malformed default
  fails as `BadStamp(<stamp with the default appended>)`.
- Ordering is unchanged: by UTC time, ties in input order. `BadLine` and
  `BadStamp` stay fatal.
