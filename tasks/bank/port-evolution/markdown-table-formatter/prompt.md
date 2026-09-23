Modify the program below. Return the whole file.

Requested change:

- Add a Markdown adapter `type Markdown: Format = {}`. A Markdown line looks like
  `| a | b |`; a `|` inside a cell is written `\|`; right after the header comes a
  rule line with one `---` per header column: `| --- | --- |`.
- To support it, the protocol gains two methods that EVERY adapter implements:
  `fn wrap(f: Self, line: String) -> String` (applied to each joined line) and
  `fn rule(f: Self, columns: Int) -> String?` (the line to put after the header, if any).
  `row` and `table` use them.
- Add `type Style = | AsCsv | AsTsv | AsMarkdown` and
  `fn render_table(s: Style, header: List[String], rows: List[List[String]]) -> String`.

Preserve (the hidden oracle checks these):

- CSV and TSV output is byte-for-byte what it is today: no rule line, no blank
  line after the header, same quoting and tab handling.
- The Markdown rule has one `---` per HEADER column, also when there are no rows.
- An empty cell is kept (`| a |  |` for cells `a` and ``), and an empty CSV cell is
  still the empty string between separators.
