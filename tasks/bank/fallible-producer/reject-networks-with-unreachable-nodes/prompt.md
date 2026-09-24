Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A network must be connected: every node must be reachable over links from
  the FIRST declared node. `build` (and so `latency`) must fail with
  `node <x> is not connected to <first>` naming the first unreachable node in
  declaration order (for example `node c is not connected to a`).

Preserve (the hidden oracle checks these on untouched inputs):

- Reachable means through any chain of links, in either direction; having a
  link is not enough (two linked islands are not connected to each other).
- A single node, or an empty description, is valid.
- Every line is processed first, with its existing checks and messages (first
  failing line wins); connectivity is checked after the last line.
- Latencies are unchanged.
