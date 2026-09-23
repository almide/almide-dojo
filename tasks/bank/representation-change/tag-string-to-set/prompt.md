Modify the program below. Return the whole file.

Requested change:

- Store tags as a set: change `Item.tags: String` to `Item.tags: Set[String]`
  holding the lowercase, trimmed, non-empty tags. `item(name, raw)` keeps its
  signature. Drop the comma-joined string representation.

Preserve (the hidden oracle checks these):

- `tag_line` prints the tags sorted alphabetically and joined by `,`, whatever order
  they were given in: `item("lamp", ["Light", "home"])` prints `lamp [home,light]`;
  no tags prints `lamp []`.
- Tags are case-insensitive and trimmed; a blank tag (`""` or `"  "`) is ignored.
- `same_tags` ignores order and duplicates.
- `add_tag` of a tag already present changes nothing (the item stays equal).
- `groups` keys each group by its tag SET (same tags in any order are one group),
  prints the key sorted like `tag_line`, keeps groups in first-seen order and names
  in list order.
