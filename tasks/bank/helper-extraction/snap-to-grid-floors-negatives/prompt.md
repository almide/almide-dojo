Modify the program below. Return the whole file.

Requested change:

- Extract `fn snap(x: Int, step: Int) -> Int` (one value) and make `snap_all`
  use it.

Preserve (the hidden oracle checks these):

- `snap_all` and `moved` stay the same functions of their input, for negative
  values too (-8 snaps to -10 with step 5; halves go up: -5 with step 10
  snaps to 0).
- A pure refactor: the helper allocates nothing the inline arithmetic did not.
