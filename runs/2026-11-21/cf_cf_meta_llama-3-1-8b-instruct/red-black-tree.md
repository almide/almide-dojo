# red-black-tree

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E010`

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
      else if v < x then balance(Node(c, l, v, r), v)
      else balance(Node(c, Node(Black, Leaf, v, Leaf), x, r), v)
  }

fn balance(t: Tree, v: Int) -> Tree =
  match t {
    Node(Red, Node(Red, l1, x1, l2), x, r) =>
      if v < x1 then Node(Red, Node(Black, l1, x1, l2), x, r)
      else Node(Red, Node(Black, l1, x1, l2), x, Node(Red, l2, v, r))
    Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      if v > x1 then Node(Red, Node(Black, l, x, r1), x1, Node(Black, r2, v, r))
      else Node(Red, Node(Black, l, x, r1), x1, Node(Red, r2, v, r))
    Node(c, l, x, r) => Node(Black, l, x, r)
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
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
error[E010]: non-exhaustive match: missing Leaf
  --> /tmp/dojo-red-black-tree-0.almd:17:9
  in match
  here: match t {
  hint: add arms for Leaf:
  Leaf => _
Or use `_ => todo()` to compile incrementally.
   |
17 |   match t {
   |         ^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-0.almd:22:78
  in variable r
  here: if v > x1 then Node(Red, Node(Black, l, x, r1), x1, Node(Black, r2, v, r))
  hint: Did you mean `t`?
  try:
      t
   |
22 |       if v > x1 then Node(Red, Node(Black, l, x, r1), x1, Node(Black, r2, v, r))
   |                                                                              ^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-0.almd:23:66
  in variable r
  here: else Node(Red, Node(Black, l, x, r1), x1, Node(Red, r2, v, r))
  hint: Did you mean `t`?
  try:
      t
   |
23 |       else Node(Red, Node(Black, l, x, r1), x1, Node(Red, r2, v, r))
   |                                                                  ^
error[E002]: undefined function 'max'
  --> /tmp/dojo-red-black-tree-0.almd:36:29
  in call to max()
  here: Node(_, l, _, r) => 1 + max(height(l), height(r))
  hint: Check the function name
   |
36 |     Node(_, l, _, r) => 1 + max(height(l), height(r))
   |                             ^^^

4 error(s) found
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
      else if v < x then balance(Node(c, l, v, r), v)
      else balance(Node(c, Node(Black, Leaf, v, Leaf), x, r), v)
  }

fn balance(t: Tree, v: Int) -> Tree =
  match t {
    Node(Red, Node(Red, l1, x1, l2), x, r) =>
      if v < x1 then Node(Red, Node(Black, l1, x1, l2), x, r)
      else Node(Red, Node(Black, l1, x1, l2), x, Node(Red, l2, v, r))
    Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      if v > x1 then Node(Red, Node(Black, l, x, r1), x1, Node(Black, r2, v, r))
      else Node(Red, Node(Black, l, x, r1), x1, Node(Red, r2, v, r))
    Node(c, l, x, r) => Node(Black, l, x, r)
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + int.max(height(l), height(r))
  }

fn max(a: Int, b: Int) -> Int =
  if a > b then a else b
```

**Diagnostic:**

```
error[E010]: non-exhaustive match: missing Leaf
  --> /tmp/dojo-red-black-tree-1.almd:17:9
  in match
  here: match t {
  hint: add arms for Leaf:
  Leaf => _
Or use `_ => todo()` to compile incrementally.
   |
17 |   match t {
   |         ^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-1.almd:22:78
  in variable r
  here: if v > x1 then Node(Red, Node(Black, l, x, r1), x1, Node(Black, r2, v, r))
  hint: Did you mean `t`?
  try:
      t
   |
22 |       if v > x1 then Node(Red, Node(Black, l, x, r1), x1, Node(Black, r2, v, r))
   |                                                                              ^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-1.almd:23:66
  in variable r
  here: else Node(Red, Node(Black, l, x, r1), x1, Node(Red, r2, v, r))
  hint: Did you mean `t`?
  try:
      t
   |
23 |       else Node(Red, Node(Black, l, x, r1), x1, Node(Red, r2, v, r))
   |                                                                  ^

3 error(s) found
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
      if v == x then Node(Black, Leaf, v, Leaf)
      else if v < x then balance(Node(c, l, v, r), v)
      else balance(Node(c, Node(Black, Leaf, v, Leaf), x, r), v)
  }

fn balance(t: Tree, v: Int) -> Tree =
  match t {
    Node(Red, Node(Red, l1, x1, l2), x, r) =>
      if v < x1 then Node(Red, Node(Black, l1, x1, l2), x, r)
      else Node(Red, Node(Black, l1, x1, l2), x, Node(Red, l2, v, r))
    Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      if v > x1 then Node(Red, Node(Black, l, x, r1), x1, Node(Black, r2, v, r))
      else Node(Red, Node(Black, l, x, r1), x1, Node(Red, r2, v, r))
    Node(c, l, x, r) => Node(Black, l, x, r)
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + int.max(height(l), height(r))
  }

fn max(a: Int, b: Int) -> Int =
  if a > b then a else b
```

**Diagnostic:**

```
error[E010]: non-exhaustive match: missing Leaf
  --> /tmp/dojo-red-black-tree-2.almd:17:9
  in match
  here: match t {
  hint: add arms for Leaf:
  Leaf => _
Or use `_ => todo()` to compile incrementally.
   |
17 |   match t {
   |         ^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-2.almd:22:78
  in variable r
  here: if v > x1 then Node(Red, Node(Black, l, x, r1), x1, Node(Black, r2, v, r))
  hint: Did you mean `t`?
  try:
      t
   |
22 |       if v > x1 then Node(Red, Node(Black, l, x, r1), x1, Node(Black, r2, v, r))
   |                                                                              ^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-2.almd:23:66
  in variable r
  here: else Node(Red, Node(Black, l, x, r1), x1, Node(Red, r2, v, r))
  hint: Did you mean `t`?
  try:
      t
   |
23 |       else Node(Red, Node(Black, l, x, r1), x1, Node(Red, r2, v, r))
   |                                                                  ^

3 error(s) found
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
      if v == x then Node(Black, Leaf, v, Leaf)
      else if v < x then balance(Node(c, l, v, r), v)
      else balance(Node(c, Node(Black, Leaf, v, Leaf), x, r), v)
  }

fn balance(t: Tree, v: Int) -> Tree =
  match t {
    Node(Red, Node(Red, l1, x1, l2), x, r) =>
      if v < x1 then Node(Red, Node(Black, l1, x1, l2), x, r)
      else Node(Red, Node(Black, l1, x1, l2), x, Node(Red, l2, v, r))
    Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      if v > x1 then Node(Red, Node(Black, l, x, r1), x1, Node(Black, r2, v, r))
      else Node(Red, Node(Black, l, x, r1), x1, Node(Red, r2, v, r))
    Node(c, l, x, r) => Node(Black, l, x, r)
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + int.max(height(l), height(r))
  }

fn max(a: Int, b: Int) -> Int =
  if a > b then a else b
```

**Diagnostic:**

```
error[E010]: non-exhaustive match: missing Leaf
  --> /tmp/dojo-red-black-tree-3.almd:17:9
  in match
  here: match t {
  hint: add arms for Leaf:
  Leaf => _
Or use `_ => todo()` to compile incrementally.
   |
17 |   match t {
   |         ^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-3.almd:22:78
  in variable r
  here: if v > x1 then Node(Red, Node(Black, l, x, r1), x1, Node(Black, r2, v, r))
  hint: Did you mean `t`?
  try:
      t
   |
22 |       if v > x1 then Node(Red, Node(Black, l, x, r1), x1, Node(Black, r2, v, r))
   |                                                                              ^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-3.almd:23:66
  in variable r
  here: else Node(Red, Node(Black, l, x, r1), x1, Node(Red, r2, v, r))
  hint: Did you mean `t`?
  try:
      t
   |
23 |       else Node(Red, Node(Black, l, x, r1), x1, Node(Red, r2, v, r))
   |                                                                  ^

3 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
