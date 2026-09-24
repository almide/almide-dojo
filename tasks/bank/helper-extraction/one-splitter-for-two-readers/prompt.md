Modify the program below. Return the whole file.

Requested change:

- Extract the shared line splitting into
  `fn split_kv(line: String) -> (String, String)?` (the trimmed key and the raw
  value, or `none` for a line without "=") and make BOTH readers use it.

Preserve (the hidden oracle checks these):

- `load_settings` and `load_env` stay the same functions of their input:
  settings keys are lowercased, environment keys keep their case; keys are
  trimmed, values are kept exactly (spaces and later "=" included).
- `split_kv` does not change the key's case.
- A pure refactor: the helper allocates nothing the inline code did not.
