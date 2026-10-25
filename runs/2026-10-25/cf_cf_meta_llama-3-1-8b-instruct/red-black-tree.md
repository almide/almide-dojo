# red-black-tree

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E014`

## Attempts

### Attempt 1 (FAIL)

```almide
type Color = | Red | Black

type Tree =
  | Leaf
  | Node(Color, Tree, Int, Tree)

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Black, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if v == x then t
      else if v < x then balance(Node(Red, l, v, Node(c, Leaf, x, r)))
      else balance(Node(Red, Node(c, Leaf, x, r), v, Leaf))
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, l, x, r), y, Leaf) =>
      Node(Black, Node(Black, l, x, r), y, Leaf)
    Node(Red, Node(Red, l, x, r), y, Node(Red, a, z, b)) =>
      Node(Red, Node(Black, l, x, Node(Red, a, z, b)), y, Leaf)
    Node(Red, Node(Red, l, x, Node(Red, a, z, b)), y, r) =>
      Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, r)
    Node(Red, Node(Red, l, x, Node(Red, a, z, b)), y, Node(Red, c, w, d)) =>
      Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, Node(Red, c, w, d))
    t => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(c, l, _, r) => 1 + max(height(l), height(r))
  }
```

**Diagnostic:**

```
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-0.almd:25:7
  in match
  here: Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, Node(Red, c, w, d))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
25 |       Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, Node(Red, c, w, d))
   |       ^^^^
error[E002]: undefined function 'max'
  --> /tmp/dojo-red-black-tree-0.almd:38:29
  in call to max()
  here: Node(c, l, _, r) => 1 + max(height(l), height(r))
  hint: Check the function name
   |
38 |     Node(c, l, _, r) => 1 + max(height(l), height(r))
   |                             ^^^

2 error(s) found
FAILED: /tmp/dojo-red-black-tree-0.almd
Compile error for /tmp/dojo-red-black-tree-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
type Color = | Red | Black

type Tree =
  | Leaf
  | Node(Color, Tree, Int, Tree)

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Black, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if v == x then Node(Black, Leaf, x, Leaf) + [Node(Red, Leaf, v, Leaf)]
      else if v < x then balance(Node(Red, l, v, Node(c, Leaf, x, r)))
      else balance(Node(Red, Node(c, Leaf, x, r), v, Leaf))
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, l, x, r), y, Leaf) =>
      Node(Black, Node(Black, l, x, r), y, Leaf)
    Node(Red, Node(Red, l, x, r), y, Node(Red, a, z, b)) =>
      Node(Red, Node(Black, l, x, Node(Red, a, z, b)), y, Leaf)
    Node(Red, Node(Red, l, x, Node(Red, a, z, b)), y, r) =>
      Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, r)
    Node(Red, Node(Red, l, x, Node(Red, a, z, b)), y, Node(Red, c, w, d)) =>
      Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, Node(Red, c, w, d))
    t => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(c, l, _, r) => 1 + int.max(height(l), height(r))
  }
```

**Diagnostic:**

```
error: operator '+' requires numeric, String, or List types but got Tree and List[Tree]
  --> /tmp/dojo-red-black-tree-1.almd:11:71
  in operator +
  here: if v == x then Node(Black, Leaf, x, Leaf) + [Node(Red, Leaf, v, Leaf)]
  hint: Use + with numeric types, String, or List
   |
11 |       if v == x then Node(Black, Leaf, x, Leaf) + [Node(Red, Leaf, v, Leaf)]
   |                                                                       ^^^^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-1.almd:25:7
  in match
  here: Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, Node(Red, c, w, d))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
25 |       Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, Node(Red, c, w, d))
   |       ^^^^

2 error(s) found
FAILED: /tmp/dojo-red-black-tree-1.almd
Compile error for /tmp/dojo-red-black-tree-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
type Color = | Red | Black

type Tree =
  | Leaf
  | Node(Color, Tree, Int, Tree)

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Black, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if v == x then Node(Black, Leaf, x, Leaf) + [Node(Red, Leaf, v, Leaf)]
      else if v < x then balance(Node(Red, l, v, Node(c, Leaf, x, r)))
      else balance(Node(Red, Node(c, Leaf, x, r), v, Leaf))
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, l, x, r), y, Leaf) =>
      Node(Black, Node(Black, l, x, r), y, Leaf)
    Node(Red, Node(Red, l, x, r), y, Node(Red, a, z, b)) =>
      Node(Red, Node(Black, l, x, Node(Red, a, z, b)), y, Leaf)
    Node(Red, Node(Red, l, x, Node(Red, a, z, b)), y, r) =>
      Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, r)
    Node(Red, Node(Red, l, x, Node(Red, a, z, b)), y, Node(Red, c, w, d)) =>
      Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, Node(Red, c, w, d))
    t => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(c, l, _, r) => 1 + int.max(height(l), height(r))
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, l, x, r), y, Leaf) =>
      Node(Black, Node(Black, l, x, r), y, Leaf)
    Node(Red, Node(Red, l, x, r), y, Node(Red, a, z, b)) =>
      Node(Red, Node(Black, l, x, Node(Red, a, z, b)), y, Leaf)
    Node(Red, Node(Red, l, x, Node(Red, a, z, b)), y, r) =>
      Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, r)
    Node(Red, Node(Red, l, x, Node(Red, a, z, b)), y, Node(Red, c, w, d)) =>
      Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, Node(Red, c, w, d))
    Node(Red, Node(Red, l, x, r), y, Leaf) =>
      Node(Red, Node(Black, l, x, r), y, Leaf)
    Node(Red, Node(Red, l, x, Node(Red, a, z, b)), y, Node(Red, c, w, d)) =>
      Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, Node(Red, c, w, d))
    t => t
  }
```

**Diagnostic:**

```
error[E012]: duplicate function 'balance'
  at line 41
  in fn balance
  here: fn balance(t: Tree) -> Tree =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
16 | fn balance(t: Tree) -> Tree =
   | ---------------------------------- first definition of 'balance' here
...
41 | fn balance(t: Tree) -> Tree =
   | ^
error: operator '+' requires numeric, String, or List types but got Tree and List[Tree]
  --> /tmp/dojo-red-black-tree-2.almd:11:71
  in operator +
  here: if v == x then Node(Black, Leaf, x, Leaf) + [Node(Red, Leaf, v, Leaf)]
  hint: Use + with numeric types, String, or List
   |
11 |       if v == x then Node(Black, Leaf, x, Leaf) + [Node(Red, Leaf, v, Leaf)]
   |                                                                       ^^^^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-2.almd:25:7
  in match
  here: Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, Node(Red, c, w, d))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
25 |       Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, Node(Red, c, w, d))
   |       ^^^^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-2.almd:50:7
  in match
  here: Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, Node(Red, c, w, d))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
50 |       Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, Node(Red, c, w, d))
   |       ^^^^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-2.almd:52:7
  in match
  here: Node(Red, Node(Black, l, x, r), y, Leaf)
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
52 |       Node(Red, Node(Black, l, x, r), y, Leaf)
   |       ^^^^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-2.almd:54:7
  in match
  here: Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, Node(Red, c, w, d))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
54 |       Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, Node(Red, c, w, d))
   |       ^^^^

6 error(s) found
FAILED: /tmp/dojo-red-black-tree-2.almd
Compile error for /tmp/dojo-red-black-tree-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
type Color = | Red | Black

type Tree =
  | Leaf
  | Node(Color, Tree, Int, Tree)

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Black, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if v == x then Node(Black, Leaf, x, Leaf) + [Node(Red, Leaf, v, Leaf)]
      else if v < x then balance(Node(Red, l, v, Node(c, Leaf, x, r)))
      else balance(Node(Red, Node(c, Leaf, x, r), v, Leaf))
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, l, x, r), y, Leaf) =>
      Node(Black, Node(Black, l, x, r), y, Leaf)
    Node(Red, Node(Red, l, x, r), y, Node(Red, a, z, b)) =>
      Node(Red, Node(Black, l, x, Node(Red, a, z, b)), y, Leaf)
    Node(Red, Node(Red, l, x, Node(Red, a, z, b)), y, r) =>
      Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, r)
    Node(Red, Node(Red, l, x, Node(Red, a, z, b)), y, Node(Red, c, w, d)) =>
      Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, Node(Red, c, w, d))
    Node(Red, Node(Red, l, x, r), y, Leaf) =>
      Node(Red, Node(Black, l, x, r), y, Leaf)
    Node(Red, Node(Red, l, x, Node(Red, a, z, b)), y, Node(Red, c, w, d)) =>
      Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, Node(Red, c, w, d))
    t => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(c, l, _, r) => 1 + int.max(height(l), height(r))
  }
```

**Diagnostic:**

```
error: operator '+' requires numeric, String, or List types but got Tree and List[Tree]
  --> /tmp/dojo-red-black-tree-3.almd:11:71
  in operator +
  here: if v == x then Node(Black, Leaf, x, Leaf) + [Node(Red, Leaf, v, Leaf)]
  hint: Use + with numeric types, String, or List
   |
11 |       if v == x then Node(Black, Leaf, x, Leaf) + [Node(Red, Leaf, v, Leaf)]
   |                                                                       ^^^^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-3.almd:25:7
  in match
  here: Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, Node(Red, c, w, d))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
25 |       Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, Node(Red, c, w, d))
   |       ^^^^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-3.almd:27:7
  in match
  here: Node(Red, Node(Black, l, x, r), y, Leaf)
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
27 |       Node(Red, Node(Black, l, x, r), y, Leaf)
   |       ^^^^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-3.almd:29:7
  in match
  here: Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, Node(Red, c, w, d))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
29 |       Node(Red, Node(Black, Node(Red, l, x, a), z, b), y, Node(Red, c, w, d))
   |       ^^^^

4 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
