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
      else if v < x then balance(Node(Red, l, v, Node(Black, Leaf, x, r)))
      else balance(Node(Red, Node(Black, Leaf, x, r), v, l))

  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, l, x, Node(Red, r, y, _)) =>
      Node(Black, Node(Red, l, x, r), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
    Node(Red, l, x, Node(Red, r, y, Node(Red, _, _, _))) =>
      Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
    Node(Red, l, x, Node(Red, r, y, Node(Black, _, _, _))) =>
      Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
    Node(Red, l, x, Node(Red, r, y, Node(Black, _, _, _))) =>
      Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
    t => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + max(height(l), height(r))
  }
```

**Diagnostic:**

```
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-0.almd:22:7
  in match
  here: Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
22 |       Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
   |       ^^^^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-0.almd:24:7
  in match
  here: Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
24 |       Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
   |       ^^^^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-0.almd:26:7
  in match
  here: Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
26 |       Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
   |       ^^^^
error[E046]: placeholder `_` is not valid in a call argument (argument 2 of Node())
  --> /tmp/dojo-red-black-tree-0.almd:22:63
  in call argument
  here: Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
22 |       Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
   |                                                               ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-0.almd:22:66
  in call argument
  here: Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
22 |       Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
   |                                                                  ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-0.almd:22:69
  in call argument
  here: Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
22 |       Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
   |                                                                     ^
error[E046]: placeholder `_` is not valid in a call argument (argument 2 of Node())
  --> /tmp/dojo-red-black-tree-0.almd:24:69
  in call argument
  here: Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
24 |       Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
   |                                                                     ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-0.almd:24:72
  in call argument
  here: Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
24 |       Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
   |                                                                        ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-0.almd:24:75
  in call argument
  here: Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
24 |       Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
   |                                                                           ^
error[E046]: placeholder `_` is not valid in a call argument (argument 2 of Node())
  --> /tmp/dojo-red-black-tree-0.almd:26:69
  in call argument
  here: Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
26 |       Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
   |                                                                     ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-0.almd:26:72
  in call argument
  here: Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
26 |       Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
   |                                                                        ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-0.almd:26:75
  in call argument
  here: Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
26 |       Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
   |                                                                           ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-0.almd:32:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
32 |     Leaf => List()
   |             ^^^^
error[E002]: undefined function 'max'
  --> /tmp/dojo-red-black-tree-0.almd:39:29
  in call to max()
  here: Node(_, l, _, r) => 1 + max(height(l), height(r))
  hint: Check the function name
   |
39 |     Node(_, l, _, r) => 1 + max(height(l), height(r))
   |                             ^^^
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-0.almd:33:52
  in match arm
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
33 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-0.almd:33:52
  in fn 'inorder'
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Fix the expression type or change the expected type
   |
33 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^

16 error(s) found
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
      if v == x then t
      else if v < x then balance(Node(Red, l, v, Node(Black, Leaf, x, r)))
      else balance(Node(Red, Node(Black, Leaf, x, r), v, l))

  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, l, x, Node(Red, r, y, _)) =>
      Node(Black, Node(Red, l, x, r), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
    Node(Red, l, x, Node(Red, r, y, Node(Red, _, _, _))) =>
      Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
    Node(Red, l, x, Node(Red, r, y, Node(Black, _, _, _))) =>
      Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
    t => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + max(height(l), height(r))
  }

fn max(a: Int, b: Int) -> Int =
  if a > b then a else b
```

**Diagnostic:**

```
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-1.almd:22:7
  in match
  here: Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
22 |       Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
   |       ^^^^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-1.almd:24:7
  in match
  here: Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
24 |       Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
   |       ^^^^
error[E046]: placeholder `_` is not valid in a call argument (argument 2 of Node())
  --> /tmp/dojo-red-black-tree-1.almd:22:63
  in call argument
  here: Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
22 |       Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
   |                                                               ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-1.almd:22:66
  in call argument
  here: Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
22 |       Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
   |                                                                  ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-1.almd:22:69
  in call argument
  here: Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
22 |       Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
   |                                                                     ^
error[E046]: placeholder `_` is not valid in a call argument (argument 2 of Node())
  --> /tmp/dojo-red-black-tree-1.almd:24:69
  in call argument
  here: Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
24 |       Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
   |                                                                     ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-1.almd:24:72
  in call argument
  here: Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
24 |       Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
   |                                                                        ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-1.almd:24:75
  in call argument
  here: Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
24 |       Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
   |                                                                           ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-1.almd:30:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
30 |     Leaf => List()
   |             ^^^^
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-1.almd:31:52
  in match arm
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
31 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-1.almd:31:52
  in fn 'inorder'
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Fix the expression type or change the expected type
   |
31 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^

11 error(s) found
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
      if v == x then t
      else if v < x then balance(Node(Red, l, v, Node(Black, Leaf, x, r)))
      else balance(Node(Red, Node(Black, Leaf, x, r), v, l))
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, l, x, Node(Red, r, y, _)) =>
      Node(Black, Node(Red, l, x, r), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
    Node(Red, l, x, Node(Red, r, y, Node(Red, _, _, _))) =>
      Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
    Node(Red, l, x, Node(Red, r, y, Node(Black, _, _, _))) =>
      Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
    t => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(_, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + max(height(l), height(r))
  }

fn max(a: Int, b: Int) -> Int =
  if a > b then a else b
```

**Diagnostic:**

```
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-2.almd:21:7
  in match
  here: Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
21 |       Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
   |       ^^^^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-2.almd:23:7
  in match
  here: Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
23 |       Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
   |       ^^^^
error[E046]: placeholder `_` is not valid in a call argument (argument 2 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:21:63
  in call argument
  here: Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
21 |       Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
   |                                                               ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:21:66
  in call argument
  here: Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
21 |       Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
   |                                                                  ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:21:69
  in call argument
  here: Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
21 |       Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
   |                                                                     ^
error[E046]: placeholder `_` is not valid in a call argument (argument 2 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:23:69
  in call argument
  here: Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
23 |       Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
   |                                                                     ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:23:72
  in call argument
  here: Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
23 |       Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
   |                                                                        ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:23:75
  in call argument
  here: Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
23 |       Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
   |                                                                           ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-2.almd:29:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
29 |     Leaf => List()
   |             ^^^^
error: operator '++' has been removed. Use '+' for concatenation
  --> /tmp/dojo-red-black-tree-2.almd:30:40
  in operator ++
  here: Node(_, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
  hint: Replace ++ with +
   |
30 |     Node(_, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
   |                                        ^
error: operator '++' has been removed. Use '+' for concatenation
  --> /tmp/dojo-red-black-tree-2.almd:30:54
  in operator ++
  here: Node(_, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
  hint: Replace ++ with +
   |
30 |     Node(_, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
   |                                                      ^
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-2.almd:30:54
  in match arm
  here: Node(_, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
30 |     Node(_, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
   |                                                      ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-2.almd:30:54
  in fn 'inorder'
  here: Node(_, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
  hint: Fix the expression type or change the expected type
   |
30 |     Node(_, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
   |                                                      ^

13 error(s) found
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
      if v == x then t
      else if v < x then balance(Node(Red, l, v, Node(Black, Leaf, x, r)))
      else balance(Node(Red, Node(Black, Leaf, x, r), v, l))
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, l, x, Node(Red, r, y, _)) =>
      Node(Black, Node(Red, l, x, r), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
    Node(Red, l, x, Node(Red, r, y, Node(Red, _, _, _))) =>
      Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
    Node(Red, l, x, Node(Red, r, y, Node(Black, _, _, _))) =>
      Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
    t => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + max(height(l), height(r))
  }

fn max(a: Int, b: Int) -> Int =
  if a > b then a else b
```

**Diagnostic:**

```
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-3.almd:21:7
  in match
  here: Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
21 |       Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
   |       ^^^^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-3.almd:23:7
  in match
  here: Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
23 |       Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
   |       ^^^^
error[E046]: placeholder `_` is not valid in a call argument (argument 2 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:21:63
  in call argument
  here: Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
21 |       Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
   |                                                               ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:21:66
  in call argument
  here: Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
21 |       Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
   |                                                                  ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:21:69
  in call argument
  here: Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
21 |       Node(Black, Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _))), y, balance(Node(Red, Node(Black, Leaf, y, r), x, l)))
   |                                                                     ^
error[E046]: placeholder `_` is not valid in a call argument (argument 2 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:23:69
  in call argument
  here: Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
23 |       Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
   |                                                                     ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:23:72
  in call argument
  here: Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
23 |       Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
   |                                                                        ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:23:75
  in call argument
  here: Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
23 |       Node(Red, balance(Node(Red, l, x, Node(Black, r, y, Node(Red, _, _, _)))), y, r)
   |                                                                           ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-3.almd:29:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
29 |     Leaf => List()
   |             ^^^^
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-3.almd:30:52
  in match arm
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
30 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-3.almd:30:52
  in fn 'inorder'
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Fix the expression type or change the expected type
   |
30 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^

11 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
