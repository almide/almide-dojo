Modify the program below. Return the whole file.

Requested change:

- Add `fn components_batch(universe: List[String], graphs: List[List[(String, String)]]) -> List[Int]`
  returning, for each graph in order, its number of connected components.
  Every graph is over the SAME node set: all of `universe`, plus any node that
  appears in that graph's edges.

Preserve (the hidden oracle checks these):

- `neighbours`, `reach` and `components` keep their exact behaviour.
- A universe node with no edge in a graph is still a component of that graph
  (an isolated node counts 1).
- `universe` is shared outer data read by every graph; each graph's
  reachability lists are temporaries of that graph's step.
