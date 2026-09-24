Modify the program below. Return the whole file.

Requested change:

- Add `fn largest_dir(lines: List[String]) -> String` returning `<dir>=<size>`
  for the non-root directory with the largest total size, `none` when every
  file is at the top level, or the `parse_listing` error message.

Preserve (the hidden oracle checks these):

- `parse_line`, `parse_listing`, `dir_of` and `total_size` keep their exact
  behaviour.
- A directory's size includes EVERY file below it, in subdirectories too: with
  "a/b/x 5" and "a/y 1", "a" has size 6 and "a/b" has 5. A directory with no
  direct files still counts ("a" above would count with only "a/b/x").
- Ties go to the alphabetically first directory.
- The per-directory table is a temporary of `largest_dir`: return only the
  string.
