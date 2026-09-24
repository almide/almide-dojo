Modify the program below. Return the whole file.

Requested change:

- Add an adapter `type Plural: Catalog = { forms: Map[String, (String, String)] }`
  holding a (singular, plural) pair of templates per key. Its `template(key, n)`
  answers the singular when `n` is exactly 1 or -1, and the plural for every other
  count; `none` for an unknown key.
- Add `type Messages = | Simple(Flat) | Counted(Plural)` and
  `fn render_all(m: Messages, items: List[(String, Int)]) -> List[String]` that runs
  the generic `say_all` with the selected catalog.

Preserve (the hidden oracle checks these):

- `Flat`, `say`, `say_all` and the protocol keep their behaviour; an unknown key is
  still `[key]` through every catalog.
- Zero is plural (`0 files`), and so are negative counts other than -1
  (`-2 files`, but `-1 file`).
- Every `{n}` in the template is replaced, and a template without `{n}` is used as is.
