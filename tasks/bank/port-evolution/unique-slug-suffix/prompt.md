Modify the program below. Return the whole file.

Requested change:

- Add a decorator `type Unique: Slugger = { inner: Basic }`: it takes `inner`'s slug and,
  when that slug is already taken, appends `-2`, `-3`, ... choosing the SMALLEST number
  whose result is not taken.
- Add `type Mode = | Loose(Basic) | Strict(Unique)` and
  `fn slugs_with(m: Mode, titles: List[String], taken: List[String]) -> List[String]`.

Preserve (the hidden oracle checks these):

- `Basic`, `slugs_for` and the protocol keep their behaviour.
- The suffix is the smallest free one, checked against the actual taken slugs: other
  slugs that merely START with the base (`hello-world`) do not count, and a suffix that
  is itself taken (`hello-2`) is skipped.
- A slug that is not taken is used as is.
