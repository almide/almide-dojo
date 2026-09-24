Modify the program below. Return the whole file.

Requested change:

- Extract the raw lookup into `fn setting(cfg: Map[String, String], key: String) -> String?`
  and make both `get_int` and `get_bool` use it.

Preserve (the hidden oracle checks these):

- `get_int` and `get_bool` stay the same functions of their input: a MISSING
  key gives the default, a present-but-bad value is the error, and a present
  EMPTY value is a bad value (not a missing key).
- A pure refactor: the helper allocates nothing the inline lookup did not.
