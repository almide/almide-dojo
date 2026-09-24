Modify the program below. Return the whole file.

Requested change:

- Add `fn vocab_report(files: List[(String, String)]) -> List[String]` taking
  `(name, text)` pairs and returning one `describe` line per file, in order,
  followed by a final line `all:<n>` where `n` is the number of distinct words
  over ALL the files together.

Preserve (the hidden oracle checks these):

- `words`, `distinct` and `describe` keep their exact behaviour (case-insensitive,
  runs of spaces are one separator).
- Each file's line counts that file's words only: a word already seen in an
  earlier file still counts for the later file.
- `all:<n>` counts every distinct word once, even if it occurs in many files.
  No files: just `all:0`.
- Each file's word set is a temporary of that file's step; only the overall
  vocabulary is carried across files.
