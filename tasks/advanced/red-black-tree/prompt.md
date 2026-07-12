Implement a red-black tree storing unique integers.

Define these exact types:

    type Color = | Red | Black

    type Tree =
      | Leaf
      | Node(Color, Tree, Int, Tree)

Write functions with these exact signatures:

    fn insert(t: Tree, v: Int) -> Tree
    fn inorder(t: Tree) -> List[Int]
    fn height(t: Tree) -> Int

Behavior:

- `insert` adds `v` keeping the red-black invariants; inserting an existing value returns an equivalent tree (one node per value)
- `inorder` returns all stored values in ascending order
- `height` counts nodes on the longest root-to-leaf path: `height(Leaf)` is `0`, a single node is `1`
- The tree must stay balanced: inserting `1..=31` in ascending or descending order must end with `height(t) <= 10`

Notes:

- Use functional (Okasaki-style) insertion: a `balance` step that recolors/rotates the red-red cases, and blacken the root after every insert.
- Build `inorder` and `height` recursively with `match`.
