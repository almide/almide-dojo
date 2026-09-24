Modify the program below. Return the whole file.

Requested change:

- Store each link once: change `Graph` to `type Graph: Eq, Repr = { edges: Set[(String, String)] }`
  where a link between a and b is the pair with the SMALLER name first. Remove the
  adjacency map and its helpers.
- Every function keeps its signature and result.

Preserve (the hidden oracle checks these):

- A link is undirected: `link(g, "b", "a")` and `link(g, "a", "b")` are the same link,
  so linking both ways (or twice) counts once, and the resulting graphs are EQUAL.
- Linking a person to themself changes nothing.
- `friends` is sorted; `degree`, `link_count` and `links` count each link once.
