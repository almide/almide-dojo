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
      else if v < x then balance(Node(c, l, v, r), x)
      else balance(Node(c, Node(Black, Leaf, v, Leaf), x, r), v)
  }

fn balance(t: Tree, v: Int) -> Tree =
  match t {
    Node(Red, Node(Red, l, x, r), y, Node(Red, Leaf, v, Leaf)) =>
      Node(Black, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf))
    Node(Red, Node(Red, l, x, r), y, Node(Red, Leaf, v, Leaf)) =>
      Node(Black, Node(Red, l, x, Node(Black, Leaf, v, Leaf)), y, r)
    Node(Red, Node(Red, l, x, r), y, Node(Red, Leaf, v, Leaf)) =>
      Node(Black, Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf)), v)
    Node(Red, Node(Red, l, x, r), y, Node(Red, Leaf, v, Leaf)) =>
      Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf))
    _ => t
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
  --> /tmp/dojo-red-black-tree-0.almd:21:7
  in match
  here: Node(Black, Node(Red, l, x, Node(Black, Leaf, v, Leaf)), y, r)
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
21 |       Node(Black, Node(Red, l, x, Node(Black, Leaf, v, Leaf)), y, r)
   |       ^^^^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-0.almd:23:7
  in match
  here: Node(Black, Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf)), v)
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
23 |       Node(Black, Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf)), v)
   |       ^^^^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-0.almd:25:7
  in match
  here: Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
25 |       Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf))
   |       ^^^^
error[E004]: Node() expects 4 argument(s) but got 3
  --> /tmp/dojo-red-black-tree-0.almd:23:83
  in constructor Node()
  here: Node(Black, Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf)), v)
  hint: Check the number of arguments
   |
23 |       Node(Black, Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf)), v)
   |                                                                                   ^
error[E002]: undefined function 'max'
  --> /tmp/dojo-red-black-tree-0.almd:38:29
  in call to max()
  here: Node(c, l, _, r) => 1 + max(height(l), height(r))
  hint: Check the function name
   |
38 |     Node(c, l, _, r) => 1 + max(height(l), height(r))
   |                             ^^^

5 error(s) found
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
      if v == x then Node(Black, Leaf, x, r)
      else if v < x then balance(Node(c, l, v, r), x)
      else balance(Node(c, Node(Black, Leaf, v, Leaf), x, r), v)
  }

fn balance(t: Tree, v: Int) -> Tree =
  match t {
    Node(Red, Node(Red, l, x, r), y, Node(Red, Leaf, v, Leaf)) =>
      Node(Black, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf))
    Node(Red, Node(Red, l, x, r), y, Node(Red, Leaf, v, Leaf)) =>
      Node(Black, Node(Red, l, x, Node(Black, Leaf, v, Leaf)), y, r)
    Node(Red, Node(Red, l, x, r), y, Node(Red, Leaf, v, Leaf)) =>
      Node(Black, Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf)), v)
    Node(Red, Node(Red, l, x, r), y, Node(Red, Leaf, v, Leaf)) =>
      Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf))
    _ => t
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

fn max(a: Int, b: Int) -> Int =
  if a > b then a else b
```

**Diagnostic:**

```
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-1.almd:21:7
  in match
  here: Node(Black, Node(Red, l, x, Node(Black, Leaf, v, Leaf)), y, r)
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
21 |       Node(Black, Node(Red, l, x, Node(Black, Leaf, v, Leaf)), y, r)
   |       ^^^^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-1.almd:23:7
  in match
  here: Node(Black, Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf)), v)
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
23 |       Node(Black, Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf)), v)
   |       ^^^^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-1.almd:25:7
  in match
  here: Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
25 |       Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf))
   |       ^^^^
error[E004]: Node() expects 4 argument(s) but got 3
  --> /tmp/dojo-red-black-tree-1.almd:23:83
  in constructor Node()
  here: Node(Black, Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf)), v)
  hint: Check the number of arguments
   |
23 |       Node(Black, Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf)), v)
   |                                                                                   ^

4 error(s) found
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
      if v == x then Node(Black, Leaf, x, r)
      else if v < x then balance(Node(c, l, v, r), x)
      else balance(Node(c, Node(Black, Leaf, v, Leaf), x, r), v)
  }

fn balance(t: Tree, v: Int) -> Tree =
  match t {
    Node(Red, Node(Red, l, x, r), y, Node(Red, Leaf, v, Leaf)) =>
      Node(Black, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf))
    Node(Red, Node(Red, l, x, r), y, Node(Red, Leaf, v, Leaf)) =>
      Node(Black, Node(Red, l, x, Node(Black, Leaf, v, Leaf)), y, r)
    Node(Red, Node(Red, l, x, r), y, Node(Red, Leaf, v, Leaf)) =>
      Node(Black, Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf)), v)
    Node(Red, Node(Red, l, x, r), y, Node(Red, Leaf, v, Leaf)) =>
      Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf))
    Node(Red, l, x, r) =>
      Node(Black, Node(Red, l, x, r), v, Leaf)
    Node(Black, l, x, r) =>
      Node(Red, Node(Black, l, x, r), v, Leaf)
    _ => t
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

fn max(a: Int, b: Int) -> Int =
  if a > b then a else b
```

**Diagnostic:**

```
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-2.almd:21:7
  in match
  here: Node(Black, Node(Red, l, x, Node(Black, Leaf, v, Leaf)), y, r)
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
21 |       Node(Black, Node(Red, l, x, Node(Black, Leaf, v, Leaf)), y, r)
   |       ^^^^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-2.almd:23:7
  in match
  here: Node(Black, Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf)), v)
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
23 |       Node(Black, Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf)), v)
   |       ^^^^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-2.almd:25:7
  in match
  here: Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
25 |       Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf))
   |       ^^^^
error[E004]: Node() expects 4 argument(s) but got 3
  --> /tmp/dojo-red-black-tree-2.almd:23:83
  in constructor Node()
  here: Node(Black, Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf)), v)
  hint: Check the number of arguments
   |
23 |       Node(Black, Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf)), v)
   |                                                                                   ^

4 error(s) found
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
      if v == x then Node(Black, Leaf, x, r)
      else if v < x then balance(Node(c, l, v, r), x)
      else balance(Node(c, Node(Black, Leaf, v, Leaf), x, r), v)
  }

fn balance(t: Tree, v: Int) -> Tree =
  match t {
    Node(Red, Node(Red, l, x, r), y, Node(Red, Leaf, v, Leaf)) =>
      Node(Black, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf))
    Node(Red, Node(Red, l, x, r), y, Node(Red, Leaf, v, Leaf)) =>
      Node(Black, Node(Red, l, x, Node(Black, Leaf, v, Leaf)), y, r)
    Node(Red, Node(Red, l, x, r), y, Node(Red, Leaf, v, Leaf)) =>
      Node(Black, Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf)), v)
    Node(Red, Node(Red, l, x, r), y, Node(Red, Leaf, v, Leaf)) =>
      Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf))
    Node(Red, l, x, r) =>
      Node(Black, Node(Red, l, x, r), v, Leaf)
    Node(Black, l, x, r) =>
      Node(Red, Node(Black, l, x, r), v, Leaf)
    _ => t
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

fn max(a: Int, b: Int) -> Int =
  if a > b then a else b
```

**Diagnostic:**

```
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-3.almd:21:7
  in match
  here: Node(Black, Node(Red, l, x, Node(Black, Leaf, v, Leaf)), y, r)
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
21 |       Node(Black, Node(Red, l, x, Node(Black, Leaf, v, Leaf)), y, r)
   |       ^^^^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-3.almd:23:7
  in match
  here: Node(Black, Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf)), v)
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
23 |       Node(Black, Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf)), v)
   |       ^^^^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-3.almd:25:7
  in match
  here: Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
25 |       Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf))
   |       ^^^^
error[E004]: Node() expects 4 argument(s) but got 3
  --> /tmp/dojo-red-black-tree-3.almd:23:83
  in constructor Node()
  here: Node(Black, Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf)), v)
  hint: Check the number of arguments
   |
23 |       Node(Black, Node(Red, Node(Black, l, x, r), y, Node(Black, Leaf, v, Leaf)), v)
   |                                                                                   ^

4 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
