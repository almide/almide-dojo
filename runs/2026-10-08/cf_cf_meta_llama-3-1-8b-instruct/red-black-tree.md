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
    Node(Red, l, x, Node(Red, r, y, _)) if x < v && v < y => rotate_left(Node(Black, Node(Black, l, x, r), v, Node(Red, Leaf, y, _)))
    Node(Red, l, x, Node(Red, r, y, _)) if x > v && v > y => rotate_right(Node(Black, Node(Black, l, x, r), v, Node(Red, Node(Red, Leaf, y, _), _, _)))
    Node(Red, l, x, r) if x < v && v > x => rotate_right(Node(Black, l, x, Node(Red, Node(Black, Leaf, v, Leaf), _, r)))
    Node(Red, l, x, r) if x > v && v < x => rotate_left(Node(Black, Node(Red, l, x, Node(Black, Leaf, v, Leaf)), _, r))
    _ => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, _, _, r) => 1 + height(r)
  }
```

**Diagnostic:**

```
error: '&&' is not valid in Almide at line 18:50
  --> /tmp/dojo-red-black-tree-0.almd:18:50
  here: Node(Red, l, x, Node(Red, r, y, _)) if x < v && v < y => rotate_left(Node(Black, Node(Black, l, x, r), v, Node(Red, Leaf, y, _)))
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
18 |     Node(Red, l, x, Node(Red, r, y, _)) if x < v && v < y => rotate_left(Node(Black, Node(Black, l, x, r), v, Node(Red, Leaf, y, _)))
   |                                                  ^

1 error(s) found
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
      else if v < x then balance(Node(c, l, v, r), x)
      else balance(Node(c, Node(Black, Leaf, v, Leaf), x, r), v)
  }

fn balance(t: Tree, v: Int) -> Tree =
  match t {
    Node(Red, l, x, Node(Red, r, y, _)) if x < v and v < y => rotate_left(Node(Black, Node(Black, l, x, r), v, Node(Red, Leaf, y, _)))
    Node(Red, l, x, Node(Red, r, y, _)) if x > v and v > y => rotate_right(Node(Black, Node(Black, l, x, r), v, Node(Red, Node(Red, Leaf, y, _), _, _)))
    Node(Red, l, x, r) if x < v and v > x => rotate_right(Node(Black, l, x, Node(Red, Node(Black, Leaf, v, Leaf), _, r)))
    Node(Red, l, x, r) if x > v and v < x => rotate_left(Node(Black, Node(Red, l, x, Node(Black, Leaf, v, Leaf)), _, r))
    _ => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, _, _, r) => 1 + height(r)
  }
```

**Diagnostic:**

```
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-1.almd:18:131
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) if x < v and v < y => rotate_left(Node(Black, Node(Black, l, x, r), v, Node(Red, Leaf, y, _)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
18 |     Node(Red, l, x, Node(Red, r, y, _)) if x < v and v < y => rotate_left(Node(Black, Node(Black, l, x, r), v, Node(Red, Leaf, y, _)))
   |                                                                                                                                   ^
error[E002]: undefined function 'rotate_left'
  --> /tmp/dojo-red-black-tree-1.almd:18:63
  in call to rotate_left()
  here: Node(Red, l, x, Node(Red, r, y, _)) if x < v and v < y => rotate_left(Node(Black, Node(Black, l, x, r), v, Node(Red, Leaf, y, _)))
  hint: Did you mean `int.rotate_left`?
  try:
      int.rotate_left
   |
18 |     Node(Red, l, x, Node(Red, r, y, _)) if x < v and v < y => rotate_left(Node(Black, Node(Black, l, x, r), v, Node(Red, Leaf, y, _)))
   |                                                               ^^^^^^^^^^^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-1.almd:19:146
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) if x > v and v > y => rotate_right(Node(Black, Node(Black, l, x, r), v, Node(Red, Node(Red, Leaf, y, _), _, _)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
19 |     Node(Red, l, x, Node(Red, r, y, _)) if x > v and v > y => rotate_right(Node(Black, Node(Black, l, x, r), v, Node(Red, Node(Red, Leaf, y, _), _, _)))
   |                                                                                                                                                  ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-1.almd:19:149
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) if x > v and v > y => rotate_right(Node(Black, Node(Black, l, x, r), v, Node(Red, Node(Red, Leaf, y, _), _, _)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
19 |     Node(Red, l, x, Node(Red, r, y, _)) if x > v and v > y => rotate_right(Node(Black, Node(Black, l, x, r), v, Node(Red, Node(Red, Leaf, y, _), _, _)))
   |                                                                                                                                                     ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-1.almd:19:142
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) if x > v and v > y => rotate_right(Node(Black, Node(Black, l, x, r), v, Node(Red, Node(Red, Leaf, y, _), _, _)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
19 |     Node(Red, l, x, Node(Red, r, y, _)) if x > v and v > y => rotate_right(Node(Black, Node(Black, l, x, r), v, Node(Red, Node(Red, Leaf, y, _), _, _)))
   |                                                                                                                                              ^
error[E002]: undefined function 'rotate_right'
  --> /tmp/dojo-red-black-tree-1.almd:19:63
  in call to rotate_right()
  here: Node(Red, l, x, Node(Red, r, y, _)) if x > v and v > y => rotate_right(Node(Black, Node(Black, l, x, r), v, Node(Red, Node(Red, Leaf, y, _), _, _)))
  hint: Did you mean `int.rotate_right`?
  try:
      int.rotate_right
   |
19 |     Node(Red, l, x, Node(Red, r, y, _)) if x > v and v > y => rotate_right(Node(Black, Node(Black, l, x, r), v, Node(Red, Node(Red, Leaf, y, _), _, _)))
   |                                                               ^^^^^^^^^^^^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-1.almd:20:115
  in call argument
  here: Node(Red, l, x, r) if x < v and v > x => rotate_right(Node(Black, l, x, Node(Red, Node(Black, Leaf, v, Leaf), _, r)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
20 |     Node(Red, l, x, r) if x < v and v > x => rotate_right(Node(Black, l, x, Node(Red, Node(Black, Leaf, v, Leaf), _, r)))
   |                                                                                                                   ^
error[E002]: undefined function 'rotate_right'
  --> /tmp/dojo-red-black-tree-1.almd:20:46
  in call to rotate_right()
  here: Node(Red, l, x, r) if x < v and v > x => rotate_right(Node(Black, l, x, Node(Red, Node(Black, Leaf, v, Leaf), _, r)))
  hint: Did you mean `int.rotate_right`?
  try:
      int.rotate_right
   |
20 |     Node(Red, l, x, r) if x < v and v > x => rotate_right(Node(Black, l, x, Node(Red, Node(Black, Leaf, v, Leaf), _, r)))
   |                                              ^^^^^^^^^^^^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-1.almd:21:115
  in call argument
  here: Node(Red, l, x, r) if x > v and v < x => rotate_left(Node(Black, Node(Red, l, x, Node(Black, Leaf, v, Leaf)), _, r))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
21 |     Node(Red, l, x, r) if x > v and v < x => rotate_left(Node(Black, Node(Red, l, x, Node(Black, Leaf, v, Leaf)), _, r))
   |                                                                                                                   ^
error[E002]: undefined function 'rotate_left'
  --> /tmp/dojo-red-black-tree-1.almd:21:46
  in call to rotate_left()
  here: Node(Red, l, x, r) if x > v and v < x => rotate_left(Node(Black, Node(Red, l, x, Node(Black, Leaf, v, Leaf)), _, r))
  hint: Did you mean `int.rotate_left`?
  try:
      int.rotate_left
   |
21 |     Node(Red, l, x, r) if x > v and v < x => rotate_left(Node(Black, Node(Red, l, x, Node(Black, Leaf, v, Leaf)), _, r))
   |                                              ^^^^^^^^^^^

10 error(s) found
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

fn rotate_left(t: Tree) -> Tree =
  match t {
    Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Black, l, x, r), y, Node(Red, Leaf, x, _))
    Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Black, l, x, r), y, Node(Red, Node(Red, Leaf, x, _), _, _))
    Node(Red, l, x, r) => Node(Black, l, x, Node(Red, Node(Black, Leaf, x, _), _, r))
    _ => t
  }

fn rotate_right(t: Tree) -> Tree =
  match t {
    Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, Node(Black, l, y, _), _, _), x, r)
    Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, l, y, Node(Black, Leaf, x, _)), _, r)
    Node(Red, l, x, r) => Node(Black, Node(Red, l, x, Node(Black, Leaf, _, r)), _, r)
    _ => t
  }

fn balance(t: Tree, v: Int) -> Tree =
  match t {
    Node(Red, l, x, Node(Red, r, y, _)) if x < v and v < y => rotate_left(Node(Black, Node(Black, l, x, r), v, Node(Red, Leaf, y, _)))
    Node(Red, l, x, Node(Red, r, y, _)) if x > v and v > y => rotate_right(Node(Black, Node(Black, l, x, r), v, Node(Red, Node(Red, Leaf, y, _), _, _)))
    Node(Red, l, x, r) if x < v and v > x => rotate_right(Node(Black, l, x, Node(Red, Node(Black, Leaf, v, Leaf), _, r)))
    Node(Red, l, x, r) if x > v and v < x => rotate_left(Node(Black, Node(Red, l, x, Node(Black, Leaf, v, Leaf)), _, r))
    _ => t
  }

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Black, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if v == x then t
      else if v < x then balance(Node(c, l, v, r), x)
      else balance(Node(c, Node(Black, Leaf, v, Leaf), x, r), v)
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, _, _, r) => 1 + height(r)
  }
```

**Diagnostic:**

```
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-2.almd:10:44
  in match
  here: Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Black, l, x, r), y, Node(Red, Node(Red, Leaf, x, _), _, _))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
10 |     Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Black, l, x, r), y, Node(Red, Node(Red, Leaf, x, _), _, _))
   |                                            ^^^^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:9:100
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Black, l, x, r), y, Node(Red, Leaf, x, _))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
  |
9 |     Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Black, l, x, r), y, Node(Red, Leaf, x, _))
  |                                                                                                    ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:10:114
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Black, l, x, r), y, Node(Red, Node(Red, Leaf, x, _), _, _))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
10 |     Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Black, l, x, r), y, Node(Red, Node(Red, Leaf, x, _), _, _))
   |                                                                                                                  ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:10:117
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Black, l, x, r), y, Node(Red, Node(Red, Leaf, x, _), _, _))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
10 |     Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Black, l, x, r), y, Node(Red, Node(Red, Leaf, x, _), _, _))
   |                                                                                                                     ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:10:110
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Black, l, x, r), y, Node(Red, Node(Red, Leaf, x, _), _, _))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
10 |     Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Black, l, x, r), y, Node(Red, Node(Red, Leaf, x, _), _, _))
   |                                                                                                              ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:11:80
  in call argument
  here: Node(Red, l, x, r) => Node(Black, l, x, Node(Red, Node(Black, Leaf, x, _), _, r))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
11 |     Node(Red, l, x, r) => Node(Black, l, x, Node(Red, Node(Black, Leaf, x, _), _, r))
   |                                                                                ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:11:76
  in call argument
  here: Node(Red, l, x, r) => Node(Black, l, x, Node(Red, Node(Black, Leaf, x, _), _, r))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
11 |     Node(Red, l, x, r) => Node(Black, l, x, Node(Red, Node(Black, Leaf, x, _), _, r))
   |                                                                            ^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-2.almd:18:44
  in match
  here: Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, l, y, Node(Black, Leaf, x, _)), _, r)
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
18 |     Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, l, y, Node(Black, Leaf, x, _)), _, r)
   |                                            ^^^^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:17:88
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, Node(Black, l, y, _), _, _), x, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
17 |     Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, Node(Black, l, y, _), _, _), x, r)
   |                                                                                        ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:17:91
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, Node(Black, l, y, _), _, _), x, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
17 |     Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, Node(Black, l, y, _), _, _), x, r)
   |                                                                                           ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:17:84
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, Node(Black, l, y, _), _, _), x, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
17 |     Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, Node(Black, l, y, _), _, _), x, r)
   |                                                                                    ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:18:98
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, l, y, Node(Black, Leaf, x, _)), _, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
18 |     Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, l, y, Node(Black, Leaf, x, _)), _, r)
   |                                                                                                  ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:18:93
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, l, y, Node(Black, Leaf, x, _)), _, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
18 |     Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, l, y, Node(Black, Leaf, x, _)), _, r)
   |                                                                                             ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:19:81
  in call argument
  here: Node(Red, l, x, r) => Node(Black, Node(Red, l, x, Node(Black, Leaf, _, r)), _, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
19 |     Node(Red, l, x, r) => Node(Black, Node(Red, l, x, Node(Black, Leaf, _, r)), _, r)
   |                                                                                 ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:19:73
  in call argument
  here: Node(Red, l, x, r) => Node(Black, Node(Red, l, x, Node(Black, Leaf, _, r)), _, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
19 |     Node(Red, l, x, r) => Node(Black, Node(Red, l, x, Node(Black, Leaf, _, r)), _, r)
   |                                                                         ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:25:131
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) if x < v and v < y => rotate_left(Node(Black, Node(Black, l, x, r), v, Node(Red, Leaf, y, _)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
25 |     Node(Red, l, x, Node(Red, r, y, _)) if x < v and v < y => rotate_left(Node(Black, Node(Black, l, x, r), v, Node(Red, Leaf, y, _)))
   |                                                                                                                                   ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:26:146
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) if x > v and v > y => rotate_right(Node(Black, Node(Black, l, x, r), v, Node(Red, Node(Red, Leaf, y, _), _, _)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
26 |     Node(Red, l, x, Node(Red, r, y, _)) if x > v and v > y => rotate_right(Node(Black, Node(Black, l, x, r), v, Node(Red, Node(Red, Leaf, y, _), _, _)))
   |                                                                                                                                                  ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:26:149
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) if x > v and v > y => rotate_right(Node(Black, Node(Black, l, x, r), v, Node(Red, Node(Red, Leaf, y, _), _, _)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
26 |     Node(Red, l, x, Node(Red, r, y, _)) if x > v and v > y => rotate_right(Node(Black, Node(Black, l, x, r), v, Node(Red, Node(Red, Leaf, y, _), _, _)))
   |                                                                                                                                                     ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:26:142
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) if x > v and v > y => rotate_right(Node(Black, Node(Black, l, x, r), v, Node(Red, Node(Red, Leaf, y, _), _, _)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
26 |     Node(Red, l, x, Node(Red, r, y, _)) if x > v and v > y => rotate_right(Node(Black, Node(Black, l, x, r), v, Node(Red, Node(Red, Leaf, y, _), _, _)))
   |                                                                                                                                              ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:27:115
  in call argument
  here: Node(Red, l, x, r) if x < v and v > x => rotate_right(Node(Black, l, x, Node(Red, Node(Black, Leaf, v, Leaf), _, r)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
27 |     Node(Red, l, x, r) if x < v and v > x => rotate_right(Node(Black, l, x, Node(Red, Node(Black, Leaf, v, Leaf), _, r)))
   |                                                                                                                   ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-2.almd:28:115
  in call argument
  here: Node(Red, l, x, r) if x > v and v < x => rotate_left(Node(Black, Node(Red, l, x, Node(Black, Leaf, v, Leaf)), _, r))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
28 |     Node(Red, l, x, r) if x > v and v < x => rotate_left(Node(Black, Node(Red, l, x, Node(Black, Leaf, v, Leaf)), _, r))
   |                                                                                                                   ^

21 error(s) found
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

fn rotate_left(t: Tree) -> Tree =
  match t {
    Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Black, l, x, r), y, Node(Red, Leaf, x, _))
    Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Black, l, x, r), y, Node(Red, Node(Red, Leaf, x, _), _, _))
    Node(Red, l, x, r) => Node(Black, l, x, Node(Red, Node(Black, Leaf, x, _), _, r))
    _ => t
  }

fn rotate_right(t: Tree) -> Tree =
  match t {
    Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, Node(Black, l, y, _), _, _), x, r)
    Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, l, y, Node(Black, Leaf, x, _)), _, r)
    Node(Red, l, x, r) => Node(Black, Node(Red, l, x, Node(Black, Leaf, _, r)), _, r)
    _ => t
  }

fn balance(t: Tree, v: Int) -> Tree =
  match t {
    Node(Red, l, x, Node(Red, r, y, _)) if x < v and v < y => rotate_left(Node(Black, Node(Black, l, x, r), v, Node(Red, Leaf, y, _)))
    Node(Red, l, x, Node(Red, r, y, _)) if x > v and v > y => rotate_right(Node(Black, Node(Black, l, x, r), v, Node(Red, Node(Red, Leaf, y, _), _, _)))
    Node(Red, l, x, r) if x < v and v > x => rotate_right(Node(Black, l, x, Node(Red, Node(Black, Leaf, v, Leaf), _, r)))
    Node(Red, l, x, r) if x > v and v < x => rotate_left(Node(Black, Node(Red, l, x, Node(Black, Leaf, v, Leaf)), _, r))
    _ => t
  }

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Black, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if v == x then Node(c, l, x, r)
      else if v < x then balance(Node(c, l, v, r), x)
      else balance(Node(c, Node(Black, Leaf, v, Leaf), x, r), v)
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, _, _, r) => 1 + height(r)
  }
```

**Diagnostic:**

```
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-3.almd:10:44
  in match
  here: Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Black, l, x, r), y, Node(Red, Node(Red, Leaf, x, _), _, _))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
10 |     Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Black, l, x, r), y, Node(Red, Node(Red, Leaf, x, _), _, _))
   |                                            ^^^^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:9:100
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Black, l, x, r), y, Node(Red, Leaf, x, _))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
  |
9 |     Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Black, l, x, r), y, Node(Red, Leaf, x, _))
  |                                                                                                    ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:10:114
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Black, l, x, r), y, Node(Red, Node(Red, Leaf, x, _), _, _))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
10 |     Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Black, l, x, r), y, Node(Red, Node(Red, Leaf, x, _), _, _))
   |                                                                                                                  ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:10:117
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Black, l, x, r), y, Node(Red, Node(Red, Leaf, x, _), _, _))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
10 |     Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Black, l, x, r), y, Node(Red, Node(Red, Leaf, x, _), _, _))
   |                                                                                                                     ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:10:110
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Black, l, x, r), y, Node(Red, Node(Red, Leaf, x, _), _, _))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
10 |     Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Black, l, x, r), y, Node(Red, Node(Red, Leaf, x, _), _, _))
   |                                                                                                              ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:11:80
  in call argument
  here: Node(Red, l, x, r) => Node(Black, l, x, Node(Red, Node(Black, Leaf, x, _), _, r))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
11 |     Node(Red, l, x, r) => Node(Black, l, x, Node(Red, Node(Black, Leaf, x, _), _, r))
   |                                                                                ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:11:76
  in call argument
  here: Node(Red, l, x, r) => Node(Black, l, x, Node(Red, Node(Black, Leaf, x, _), _, r))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
11 |     Node(Red, l, x, r) => Node(Black, l, x, Node(Red, Node(Black, Leaf, x, _), _, r))
   |                                                                            ^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-3.almd:18:44
  in match
  here: Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, l, y, Node(Black, Leaf, x, _)), _, r)
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
18 |     Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, l, y, Node(Black, Leaf, x, _)), _, r)
   |                                            ^^^^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:17:88
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, Node(Black, l, y, _), _, _), x, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
17 |     Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, Node(Black, l, y, _), _, _), x, r)
   |                                                                                        ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:17:91
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, Node(Black, l, y, _), _, _), x, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
17 |     Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, Node(Black, l, y, _), _, _), x, r)
   |                                                                                           ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:17:84
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, Node(Black, l, y, _), _, _), x, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
17 |     Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, Node(Black, l, y, _), _, _), x, r)
   |                                                                                    ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:18:98
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, l, y, Node(Black, Leaf, x, _)), _, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
18 |     Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, l, y, Node(Black, Leaf, x, _)), _, r)
   |                                                                                                  ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:18:93
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, l, y, Node(Black, Leaf, x, _)), _, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
18 |     Node(Red, l, x, Node(Red, r, y, _)) => Node(Black, Node(Red, l, y, Node(Black, Leaf, x, _)), _, r)
   |                                                                                             ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:19:81
  in call argument
  here: Node(Red, l, x, r) => Node(Black, Node(Red, l, x, Node(Black, Leaf, _, r)), _, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
19 |     Node(Red, l, x, r) => Node(Black, Node(Red, l, x, Node(Black, Leaf, _, r)), _, r)
   |                                                                                 ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:19:73
  in call argument
  here: Node(Red, l, x, r) => Node(Black, Node(Red, l, x, Node(Black, Leaf, _, r)), _, r)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
19 |     Node(Red, l, x, r) => Node(Black, Node(Red, l, x, Node(Black, Leaf, _, r)), _, r)
   |                                                                         ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:25:131
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) if x < v and v < y => rotate_left(Node(Black, Node(Black, l, x, r), v, Node(Red, Leaf, y, _)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
25 |     Node(Red, l, x, Node(Red, r, y, _)) if x < v and v < y => rotate_left(Node(Black, Node(Black, l, x, r), v, Node(Red, Leaf, y, _)))
   |                                                                                                                                   ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:26:146
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) if x > v and v > y => rotate_right(Node(Black, Node(Black, l, x, r), v, Node(Red, Node(Red, Leaf, y, _), _, _)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
26 |     Node(Red, l, x, Node(Red, r, y, _)) if x > v and v > y => rotate_right(Node(Black, Node(Black, l, x, r), v, Node(Red, Node(Red, Leaf, y, _), _, _)))
   |                                                                                                                                                  ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:26:149
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) if x > v and v > y => rotate_right(Node(Black, Node(Black, l, x, r), v, Node(Red, Node(Red, Leaf, y, _), _, _)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
26 |     Node(Red, l, x, Node(Red, r, y, _)) if x > v and v > y => rotate_right(Node(Black, Node(Black, l, x, r), v, Node(Red, Node(Red, Leaf, y, _), _, _)))
   |                                                                                                                                                     ^
error[E046]: placeholder `_` is not valid in a call argument (argument 4 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:26:142
  in call argument
  here: Node(Red, l, x, Node(Red, r, y, _)) if x > v and v > y => rotate_right(Node(Black, Node(Black, l, x, r), v, Node(Red, Node(Red, Leaf, y, _), _, _)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
26 |     Node(Red, l, x, Node(Red, r, y, _)) if x > v and v > y => rotate_right(Node(Black, Node(Black, l, x, r), v, Node(Red, Node(Red, Leaf, y, _), _, _)))
   |                                                                                                                                              ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:27:115
  in call argument
  here: Node(Red, l, x, r) if x < v and v > x => rotate_right(Node(Black, l, x, Node(Red, Node(Black, Leaf, v, Leaf), _, r)))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
27 |     Node(Red, l, x, r) if x < v and v > x => rotate_right(Node(Black, l, x, Node(Red, Node(Black, Leaf, v, Leaf), _, r)))
   |                                                                                                                   ^
error[E046]: placeholder `_` is not valid in a call argument (argument 3 of Node())
  --> /tmp/dojo-red-black-tree-3.almd:28:115
  in call argument
  here: Node(Red, l, x, r) if x > v and v < x => rotate_left(Node(Black, Node(Red, l, x, Node(Black, Leaf, v, Leaf)), _, r))
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Node(x, /* the other arguments */)
   |
28 |     Node(Red, l, x, r) if x > v and v < x => rotate_left(Node(Black, Node(Red, l, x, Node(Black, Leaf, v, Leaf)), _, r))
   |                                                                                                                   ^

21 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
