Modify the program below. Return the whole file.

Requested change:

- Add `type WordWrap: Breaker = { width: Int }` (width >= 1) that breaks between words:
  words are separated by one or more spaces; each line takes as many whole words as
  fit, joined by single spaces, with the line length AT MOST `width`; a word longer
  than `width` is cut into `width`-sized pieces, each on its own line (the last piece
  may share its line with the following words). Text with no words has no lines.
- Add `type Wrap = | Hard(HardCut) | Words(WordWrap)` and
  `fn layout_with(w: Wrap, paragraphs: List[String]) -> String`.

Preserve (the hidden oracle checks these):

- `HardCut`, `layout`, `line_count` and the protocol keep their behaviour.
- A line may be exactly `width` long: `"ab cd"` with width 5 is one line.
- Lines never start or end with a space; runs of spaces in the input do not create
  empty words.
