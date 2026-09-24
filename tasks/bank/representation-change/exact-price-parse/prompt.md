Modify the program below. Return the whole file.

Requested change:

- Prices become exact cents: change `Item.price: Float` to `Item.cents: Int`. No
  floating point may remain in the program.
- `item(name, text)` reads the text EXACTLY, without going through a Float: after
  trimming, it must be digits, optionally followed by `.` and one or two digits
  (`12`, `12.5`, `12.50`, `0.29`). Anything else is `bad price: <text>` (for
  example `.5`, `12.`, `1.234`, `1e2`, `abc`, ``); a leading `-` followed by a
  valid price is `negative price: <text>`.
- `total` returns cents (`Int`) and `affordable` takes the budget in cents.

Preserve (the hidden oracle checks these):

- Every valid text converts to exactly the right cents: `0.29` is 29 cents, `8.2`
  is 820, `1.15` is 115, `2.3` is 230.
- `render` keeps `name $D.CC` with two cent digits (`$0.05`, `$8.20`).
- `affordable` is inclusive and keeps list order.
- `load` still reports the FIRST bad line in order, with the messages above
  (`bad line: <line>` for a line without `=`).
