Modify the program below. Return the whole file.

Requested change:

- Store an address as one packed number: change `Addr` to
  `type Addr: Eq, Repr = { bits: Int }` where `bits = a*16777216 + b*65536 + c*256 + d`
  (0 .. 4294967295). `addr(a, b, c, d)` keeps its signature and packs.
- Add `fn size(lo: Addr, hi: Addr) -> Int`: how many addresses lie in `lo..hi`
  inclusive, 0 when `hi` is below `lo`.

Preserve (the hidden oracle checks these):

- `render` still prints the four octets, `10.0.1.0`, `255.255.255.255`, `0.0.0.0`.
- `compare` keeps its -1 / 0 / 1 contract; `in_range` is inclusive at both ends.
- `next` carries across octets (`10.0.0.255` is followed by `10.0.1.0`) and answers
  `none` after `255.255.255.255`; `block` therefore stops at the end of the space.
- The signatures of `addr`, `render`, `compare`, `next`, `in_range` and `block` do not change.
