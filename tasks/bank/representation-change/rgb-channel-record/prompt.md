Modify the program below. Return the whole file.

Requested change:

- Store the channels as numbers: introduce `type Rgb: Eq, Repr = { r: Int, g: Int, b: Int }`
  (each 0..255) and change `Swatch.hex: String` to `Swatch.color: Rgb`. `swatch(name, text)`
  keeps accepting `#RGB` and `#RRGGBB` in any case.
- Add `fn mix(a: Swatch, b: Swatch, name: String) -> Swatch`: each channel is the
  average of the two, rounded down.

Preserve (the hidden oracle checks these):

- `render` still prints `#` and exactly six lowercase hex digits: a channel below 16
  keeps its leading zero (`#0a00ff`, `#000000`).
- `#abc` still means `#aabbcc`; `#ABCDEF` and `#abcdef` are the same color.
- `brightness` keeps its integer formula; `palette` keeps first-seen order by color.
