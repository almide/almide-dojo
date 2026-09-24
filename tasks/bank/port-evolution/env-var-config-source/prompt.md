Modify the program below. Return the whole file.

Requested change:

- Add `type EnvConfig: Config = { prefix: String, vars: Map[String, String] }` reading
  environment variables. The variable for a key is `prefix + "_" + key` in UPPER case
  with EVERY `.` and `-` replaced by `_`: with prefix `APP`, `db.pool-size` is
  `APP_DB_POOL_SIZE`. A variable set to the empty string counts as NOT set.
- Add `type Source = | File(FileConfig) | Env(EnvConfig)` and
  `fn summary_from(s: Source, keys: List[String]) -> String!`.

Preserve (the hidden oracle checks these):

- `FileConfig`, `get_int`, `summary` and the protocol keep their behaviour.
- An empty variable falls back like a missing one (it is never `bad int`); a variable
  with other unreadable text is still `bad int for <key>: <text>`, the key written as
  asked (not as the variable name).
- Every separator in the key is replaced, however many there are.
