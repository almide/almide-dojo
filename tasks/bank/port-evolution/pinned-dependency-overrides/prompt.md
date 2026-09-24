Modify the program below. Return the whole file.

Requested change:

- Add `type Pinned: Registry = { base: Index, overrides: Map[String, List[String]] }`: a
  package listed in `overrides` has EXACTLY the dependencies given there (replacing the
  base list, even when the base knows the package); other packages are answered by `base`.
  A package listed only in `overrides` is known.
- Add `type Source = | Plain(Index) | Locked(Pinned)` and
  `fn plan(s: Source, root: String) -> String!` returning the install order joined by
  ` > ` (e.g. `c > b > a`).

Preserve (the hidden oracle checks these):

- `Index`, `visit`, `install_order` and the protocol keep their behaviour (dependencies
  first in listed order, each package once, `unknown package: <p>`, `cycle at <p>`).
- An override wins over the base, including an override of `[]` (no dependencies).
- An override can remove a cycle that the base has, or introduce one.
