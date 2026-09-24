Modify the program below. Return the whole file.

Requested change:

- Add `type Scoped: Vars = { inner: MapVars, outer: MapVars }`: a name is looked up in
  `inner` first and in `outer` only when `inner` does not define it.
- Add `type Env = | Flat(MapVars) | Nested(Scoped)` and
  `fn render(e: Env, tpl: String) -> String!` that runs the generic `fill`.

Preserve (the hidden oracle checks these):

- `MapVars`, `fill` and the protocol keep their behaviour (`{{`, unknown variable and
  unclosed errors with the same messages).
- An `inner` value SHADOWS `outer` even when it is the empty string: defining a name
  as "" in `inner` blanks it out.
- A name defined in neither scope is still `unknown variable: <name>`.
