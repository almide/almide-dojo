Modify the program below. Return the whole file.

Requested change:

- Add a salted scheme `type Salted: Hasher = { salt: String }` (salts never contain
  `$`). `hash` produces `s1$<salt>$<digest(salt + pw)>` with the adapter's salt.
  `verify` accepts:
  - a salted record `s1$<salt>$<d>`: true when `digest(<that record's salt> + pw) == d`;
  - any other stored string: it is an old `Plain` hash, verified exactly as `Plain` does.
- Add `type Scheme = | Old(Plain) | New(Salted)` and
  `fn login_with(s: Scheme, users: List[User], name: String, pw: String) -> String`.

Preserve (the hidden oracle checks these):

- `Plain`, `digest`, `login` and the protocol keep their exact behaviour.
- Salt rotation: a record hashed under an OLD salt still verifies after the adapter's
  salt changes (verification uses the salt stored in the record).
- Users still holding `Plain` hashes can log in through `Salted`; a wrong password
  is `bad password` in every case, an unknown name is `no such user`.
