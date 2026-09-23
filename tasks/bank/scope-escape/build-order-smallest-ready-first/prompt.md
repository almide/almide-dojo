Modify the program below. Return the whole file.

Requested change:

- Add `fn build_order(lines: List[String]) -> String` returning the nodes in a
  valid build order, comma-separated; `cycle` when no order exists; the
  `parse_edges` error message when a line is bad; the empty string for no edges.

Preserve (the hidden oracle checks these):

- `parse_edge`, `parse_edges`, `nodes` and `describe` keep their exact behaviour.
- Deterministic order: at EVERY step, build the alphabetically smallest node
  among all nodes whose prerequisites are already built. A node that becomes
  ready later still goes before an earlier-ready node that is larger.
- The in-degree table and ready set are temporaries of `build_order`: return
  only the string.
