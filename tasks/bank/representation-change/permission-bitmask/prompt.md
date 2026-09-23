Modify the program below. Return the whole file.

Requested change:

- Store permissions as a bitmask: change `User.perms: List[String]` to
  `User.perms: Int` with read = 1, write = 2, exec = 4, admin = 8.
  `user(name, perms)` keeps taking a list of names (unknown names are ignored).
- `common(a, b)` keeps returning the names, in the order read, write, exec, admin.

Preserve (the hidden oracle checks these):

- `grant` of a permission already held changes nothing; `revoke` of a permission
  NOT held changes nothing (it must never add it); revoking `admin` leaves the
  other bits alone.
- `can` still treats admin as every permission, but `render` and `common` show only
  what is held explicitly.
- `render` keeps its four-character form (`rw--`, `---a`, `----`).
- Unknown permission names are ignored by `user`, `grant` and `revoke`.
