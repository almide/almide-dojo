Modify the program below. Return the whole file.

Requested change:

- Add `type Bearer: Authenticator = { tokens: Map[String, String] }` for headers of the
  form `<scheme> <token>`. Checks, in this order: an empty (or all-space) header is
  `missing credentials`; a scheme other than `Bearer` is `unsupported scheme: <scheme as
  written>` (a header without a space has the whole text as its scheme); a token not in
  `tokens` is `invalid token`.
- The scheme is case-INSENSITIVE (`bearer`, `BEARER` are fine); the token is
  case-SENSITIVE.
- Add `type Scheme = | Keys(ApiKeys) | Tokens(Bearer)` and
  `fn audit_with(s: Scheme, headers: List[String]) -> List[String]`.

Preserve (the hidden oracle checks these):

- `ApiKeys`, `audit` and the protocol keep their behaviour.
- A token differing only in case is `invalid token`.
- The error order above holds, and the unsupported scheme is reported exactly as written.
