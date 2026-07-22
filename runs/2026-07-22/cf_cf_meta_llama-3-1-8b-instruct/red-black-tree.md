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
      if v == x then t
      else if v < x then balance(Node(Red, l, v, Node(c, Leaf, x, r)))
      else balance(Node(Red, Node(c, l, x, Leaf), v, r))

  fn balance(t: Tree) -> Tree =
    match t {
      Node(Red, Node(Red, l1, x1, l2), x, r) =>
        Node(Black, Node(Red, l1, x1, l2), x, Node(Red, Node(Black, Leaf, x, Leaf), r))
      Node(Red, l, x, Node(Red, r1, x1, r2)) =>
        Node(Black, Node(Red, l, x, Node(Black, Leaf, x1, Leaf)), Node(Red, r1, x1, r2))
      _ =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-0.almd
error: Expected pattern at line 15:3 (got Fn 'fn')
  --> /tmp/dojo-red-black-tree-0.almd:15:3
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
15 |   fn balance(t: Tree) -> Tree =
   |   ^
error: Expected expression at line 23:1 (got Test 'test')
  --> /tmp/dojo-red-black-tree-0.almd:23:1
   |
23 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   | ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:23:78
  in call to inorder()
  hint: Check the function name
   |
23 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:24:45
  in call to height()
  hint: Check the function name
   |
24 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:25:59
  in call to height()
  hint: Check the function name
   |
25 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:28:21
  in call to inorder()
  hint: Check the function name
   |
28 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:32:21
  in call to inorder()
  hint: Check the function name
   |
32 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:36:21
  in call to inorder()
  hint: Check the function name
   |
36 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:37:17
  in call to height()
  hint: Check the function name
   |
37 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:41:21
  in call to inorder()
  hint: Check the function name
   |
41 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:42:17
  in call to height()
  hint: Check the function name
   |
42 |   assert(height(t) < 11)
   |                 ^

11 error(s) found
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

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(c, l, x, r) => inorder(l) + [x] + inorder(r)

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + max(height(l), height(r))

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Black, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if v == x then t
      else if v < x then balance(Node(Red, l, v, Node(c, Leaf, x, r)))
      else balance(Node(Red, Node(c, l, x, Leaf), v, r))

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, l1, x1, l2), x, r) =>
      Node(Black, Node(Red, l1, x1, l2), x, Node
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-1.almd
error: Expected pattern at line 12:1 (got Fn 'fn')
  --> /tmp/dojo-red-black-tree-1.almd:12:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
12 | fn height(t: Tree) -> Int =
   | ^
error: Expected pattern at line 17:1 (got Fn 'fn')
  --> /tmp/dojo-red-black-tree-1.almd:17:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
17 | fn insert(t: Tree, v: Int) -> Tree =
   | ^
error: Expected pattern at line 25:1 (got Fn 'fn')
  --> /tmp/dojo-red-black-tree-1.almd:25:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
25 | fn balance(t: Tree) -> Tree =
   | ^
error: Expected ')' to close constructor call opened at line 28:11
  --> /tmp/dojo-red-black-tree-1.almd:30:1
  hint: Add ')' or check for a missing delimiter inside the constructor call
   |
28 |       Node(Black, Node(Red, l1, x1, l2), x, Node
   |           --------------- '(' opened here
...
30 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   | ^^^^

4 error(s) found
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

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(c, l, x, r) => inorder(l) + [x] + inorder(r)

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + max(height(l), height(r))

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Black, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if v == x then Node(Black, Leaf, v, Leaf)
      else if v < x then balance(Node(Red, l, v, Node(c, Leaf, x, r)))
      else balance(Node(Red, Node(c, l, x, Leaf), v, r))

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, l1, x1, l2), x, r) =>
      Node(Black, Node(Red, l1, x
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-2.almd
error: Expected pattern at line 12:1 (got Fn 'fn')
  --> /tmp/dojo-red-black-tree-2.almd:12:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
12 | fn height(t: Tree) -> Int =
   | ^
error: Expected pattern at line 17:1 (got Fn 'fn')
  --> /tmp/dojo-red-black-tree-2.almd:17:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
17 | fn insert(t: Tree, v: Int) -> Tree =
   | ^
error: Expected pattern at line 25:1 (got Fn 'fn')
  --> /tmp/dojo-red-black-tree-2.almd:25:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
25 | fn balance(t: Tree) -> Tree =
   | ^
error: Expected ')' to close constructor call opened at line 28:23
  --> /tmp/dojo-red-black-tree-2.almd:30:1
  hint: Add ')' or check for a missing delimiter inside the constructor call
   |
28 |       Node(Black, Node(Red, l1, x
   |                       --------------- '(' opened here
...
30 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   | ^^^^

4 error(s) found
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

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(c, l, x, r) => inorder(l) + [x] + inorder(r)

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + max(height(l), height(r))

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Black, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if v == x then Node(Black, Leaf, v, Leaf)
      else if v < x then balance(Node(Red, l, v, Node(c, Leaf, x, r)))
      else balance(Node(Red, Node(c, l, x, Leaf), v, r))

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, l1, x1, l2), x, r) =>
      Node(Black, Node(Red, l1, x
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-3.almd
error: Expected pattern at line 12:1 (got Fn 'fn')
  --> /tmp/dojo-red-black-tree-3.almd:12:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
12 | fn height(t: Tree) -> Int =
   | ^
error: Expected pattern at line 17:1 (got Fn 'fn')
  --> /tmp/dojo-red-black-tree-3.almd:17:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
17 | fn insert(t: Tree, v: Int) -> Tree =
   | ^
error: Expected pattern at line 25:1 (got Fn 'fn')
  --> /tmp/dojo-red-black-tree-3.almd:25:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
25 | fn balance(t: Tree) -> Tree =
   | ^
error: Expected ')' to close constructor call opened at line 28:23
  --> /tmp/dojo-red-black-tree-3.almd:30:1
  hint: Add ')' or check for a missing delimiter inside the constructor call
   |
28 |       Node(Black, Node(Red, l1, x
   |                       --------------- '(' opened here
...
30 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   | ^^^^

4 error(s) found
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-3.almd

1/1 test file(s) failed

```
