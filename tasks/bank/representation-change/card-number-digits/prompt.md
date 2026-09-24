Modify the program below. Return the whole file.

Requested change:

- Cards may now have 12 to 19 digits. Store only the digits: change `Card.number: String`
  to `Card.digits: String`; `card(holder, text)` keeps its signature and drops every space
  from the text. Remove the old `digits` helper if you no longer need it.
- Add `fn grouped(c: Card) -> String`: the digits in groups of four from the LEFT,
  separated by single spaces, the last group possibly shorter (`1234 5678 90`).

Preserve (the hidden oracle checks these):

- `masked` hides every digit except the LAST FOUR, whatever the length, keeping the
  grouping of `grouped`: 15 digits `378282246310005` are `**** **** ***0 005`, 16 digits
  are `**** **** **** 3456`.
- `last4`, `label` and `ending_in` keep their meaning.
