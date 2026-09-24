Modify the program below. Return the whole file.

Requested change:

- Track edits per node with a version vector: change `Note.rev: Int` to
  `Note.rev: Map[String, Int]` (edits made on each node; a node that is not in the map
  has made 0 edits). `note(title, entries: List[(String, Int)])` builds it.
- `edit(n, node)` adds one edit for `node`.
- `relation(a, b)` compares node by node: `same` when every node has the same count,
  `before` when no node of `a` is ahead of `b` and some node is behind, `after` the
  other way round, and the new answer `concurrent` when each is ahead somewhere.
- `reconcile(a, b)` keeps `a`'s title and takes, for every node, the larger count.
- `stamp` prints `title@node:count,...` with the nodes in name order, e.g.
  `plan@a:2,b:1`, and `title@-` when no node has made an edit.

Preserve (the hidden oracle checks these):

- A node listed with count 0 is the same as a node that is absent: `note("x", [("a", 0)])`
  and `note("x", [])` are `same`, stamp as `x@-`, and zero counts never appear in a stamp.
- `stale` keeps its meaning: every pair that is not `same` (concurrent included), in
  list order.
