# red-black-tree

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

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
      if x == v then t
      else if v < x then balance(Node(Red, l, v, Leaf), x, r)
      else balance(Node(Red, Leaf, v, r), x, l)
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

fn balance(t: Tree, x: Int, r: Tree) -> Tree =
  match t {
    Leaf => Node(Black, Leaf, x, r)
    Node(Red, l, y, Node(Red, _, _, r')) =>
      Node(Black, Node
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-0.almd
error: Expected RParen at line 31:38 (got String ')) =>
      Node(Black, Node

test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
test "empty tree height" { assert_eq(height(Leaf), 0) }
test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
test "duplicates keep one node" {
  let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
  assert_eq(inorder(t), [1, 2, 3])
}
test "mixed insert order" {
  let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
  assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
}
test "ascending 1..=31 stays balanced" {
  let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, v))
  assert_eq(inorder(t), 1..=31)
  assert(height(t) < 11)
}
test "descending 31..1 stays balanced" {
  let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, 32 - v))
  assert_eq(inorder(t), 1..=31)
  assert(height(t) < 11)
}
')
  --> /tmp/dojo-red-black-tree-0.almd:31:38
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
   |
31 |     Node(Red, l, y, Node(Red, _, _, r')) =>
   |                                      ^
error[E002]: undefined function 'max'
  --> /tmp/dojo-red-black-tree-0.almd:25:51
  in call to max()
  hint: Check the function name
   |
25 |     Node(_, l, _, r) => 1 + max(height(l), height(r))
   |                                                   ^

2 error(s) found
Compile error for /tmp/dojo-red-black-tree-0.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
type Color = | Red | Black

type Tree =
  | Leaf
  | Node(Color, Tree, Int, Tree)

fn max(a: Int, b: Int) -> Int = if a > b then a else b

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Black, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if x == v then t
      else if v < x then balance(Node(Red, l, v, Leaf), x, r)
      else balance(Node(Red, Leaf, v, r), x, l)
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

fn balance(t: Tree, x: Int, r: Tree) -> Tree =
  match t {
    Leaf => Node(Black, Leaf, x, r)
    Node
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-1.almd
error: Expected FatArrow at line 33:9 (got Newline '')
  --> /tmp/dojo-red-black-tree-1.almd:33:9
   |
33 |     Node
   |         ^

1 error(s) found
Compile error for /tmp/dojo-red-black-tree-1.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
type Color = | Red | Black

type Tree =
  | Leaf
  | Node(Color, Tree, Int, Tree)

fn max(a: Int, b: Int) -> Int = if a > b then a else b

fn balance(t: Tree, x: Int, r: Tree) -> Tree =
  match t {
    Leaf => Node(Black, Leaf, x, r)
    Node(Red, l, y, r) when y > x => rotate_left(Node(Black, l, y, r), x)
    Node(Red, l, y, r) when x > y => rotate_right(Node(Black, l, y, r), x)
    Node(Black, l, y, r) when y == x && l == Red => rotate_left(Node(Black, l, y, r), x)
    Node(Black, l, y, r) when y == x && r == Red => rotate_right(Node(Black, l, y, r), x)
    Node(c, l, y, r) => Node(Red, balance(l, x, r), y, balance(r, x, l))
  }

fn insert(t: Tree, v: Int) -> Tree =
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-2.almd
error: Expected FatArrow at line 12:24 (got Ident 'when')
  --> /tmp/dojo-red-black-tree-2.almd:12:24
   |
12 |     Node(Red, l, y, r) when y > x => rotate_left(Node(Black, l, y, r), x)
   |                        ^
error: Expected expression at line 21:1 (got Test 'test')
  --> /tmp/dojo-red-black-tree-2.almd:21:1
   |
21 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   | ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:21:78
  in call to inorder()
  hint: Check the function name
   |
21 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:22:45
  in call to height()
  hint: Check the function name
   |
22 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:23:59
  in call to height()
  hint: Check the function name
   |
23 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:26:21
  in call to inorder()
  hint: Check the function name
   |
26 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:30:21
  in call to inorder()
  hint: Check the function name
   |
30 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:34:21
  in call to inorder()
  hint: Check the function name
   |
34 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:35:17
  in call to height()
  hint: Check the function name
   |
35 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:39:21
  in call to inorder()
  hint: Check the function name
   |
39 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:40:17
  in call to height()
  hint: Check the function name
   |
40 |   assert(height(t) < 11)
   |                 ^

11 error(s) found
Compile error for /tmp/dojo-red-black-tree-2.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
type Color = | Red | Black

type Tree =
  | Leaf
  | Node(Color, Tree, Int, Tree)

fn max(a: Int, b: Int) -> Int = if a > b then a else b

fn rotate_left(t: Tree, x: Int) -> Tree =
  match t {
    Node(Red, Node(Red, l, y, r), z, Node(Red, Node(Red, ll, yy, rl), y, rr)) =>
      Node(Red, Node(Red, l, y, Node(Red, r, z, ll)), yy, Node(Red, rl, z, rr))
    Node(Red, l, y, Node(Red, r, z, Node(Red, Node(Red, ll, yy, rl), y, rr))) =>
      Node(Red, Node(Red, l, y, Node(Red, r, z, Node(Red, ll, yy, rl))), y, rr)
    Node(Red, l, y, Node(Red, r, z, Node(Red, Node(Red, ll, yy, rl), y, rr))) =>
      Node(Red, Node(Red, l, y
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-3.almd
error: Expected ')' to close constructor call opened at line 16:21
  --> /tmp/dojo-red-black-tree-3.almd:18:1
  hint: Add ')' or check for a missing delimiter inside the constructor call
   |
16 |       Node(Red, Node(Red, l, y
   |                     --------------- '(' opened here
...
18 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   | ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:18:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
18 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:18:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
18 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:18:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
18 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:18:78
  in call to inorder()
  hint: Check the function name
   |
18 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:19:45
  in call to height()
  hint: Check the function name
   |
19 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:20:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
20 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:20:59
  in call to height()
  hint: Check the function name
   |
20 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:22:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
22 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:23:21
  in call to inorder()
  hint: Check the function name
   |
23 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:26:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
26 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:27:21
  in call to inorder()
  hint: Check the function name
   |
27 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:30:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
30 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, v))
   |                                                           ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:31:21
  in call to inorder()
  hint: Check the function name
   |
31 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:32:17
  in call to height()
  hint: Check the function name
   |
32 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:35:64
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
35 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                                                                ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:36:21
  in call to inorder()
  hint: Check the function name
   |
36 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:37:17
  in call to height()
  hint: Check the function name
   |
37 |   assert(height(t) < 11)
   |                 ^

18 error(s) found
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-3.almd

1/1 test file(s) failed

```
