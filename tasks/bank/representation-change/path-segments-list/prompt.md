Modify the program below. Return the whole file.

Requested change:

- Store paths as segment lists: change `Entry.path: String` to
  `Entry.path: List[String]` (the root is `[]`).
- `entry(path, bytes)` keeps taking TEXT and now accepts sloppy input: split on
  `/` and drop empty segments, so `"a//b/"` and `"/a/b"` are `["a", "b"]` and `""` or
  `"/"` is the root.
- `usage(es, dir)` keeps taking the directory as text, read the same way.
- `parent` returns `List[String]?` (the parent's segments).

Preserve (the hidden oracle checks these):

- The root has depth 0 and no parent; every entry, the root included, is within
  the root (`usage(es, "")` is the grand total).
- `within` works on whole segments: `a/bc` is NOT within `a/b`, while `a/b` itself
  and `a/b/c` are.
- `render` prints the path joined with `/`, or `.` for the root, then the bytes.
