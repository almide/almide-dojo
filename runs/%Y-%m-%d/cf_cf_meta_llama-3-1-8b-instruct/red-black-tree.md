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
      else if x > v then balance(Node(c, l, v, Leaf), r)
      else balance(Node(c, Leaf, v, r), l)
  }

fn balance(tl: Tree, tr: Tree) -> Tree =
  match tl, tr {
    Leaf, Leaf => tl
    Leaf, Node(c, l, x, r) => Node(Black, tl, x, balance(l, r))
    Node(Red, tl, x, Leaf), Node(Red, l2, y, r) => Node(Black, Node(Red, tl, x, l2), y, r)
    Node(Red, tl, x, Leaf), Node(Black, l2, y, r) => rotate_right(Node(Red, Node(Black, tl, x, l2), y, r))
    Node(Red, tl,
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-0.almd
error: Expected LBrace at line 17:11 (got Comma ',')
  --> /tmp/dojo-red-black-tree-0.almd:17:11
   |
17 |   match tl, tr {
   |           ^
error: Expected ')' to close function call opened at line 36:20
  --> /tmp/dojo-red-black-tree-0.almd:36:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
36 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
36 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 37:12
  --> /tmp/dojo-red-black-tree-0.almd:37:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
37 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
37 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 41:20
  --> /tmp/dojo-red-black-tree-0.almd:41:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
41 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
41 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 42:12
  --> /tmp/dojo-red-black-tree-0.almd:42:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
42 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
42 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:24:78
  in call to inorder()
  hint: Check the function name
   |
24 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:25:45
  in call to height()
  hint: Check the function name
   |
25 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:26:59
  in call to height()
  hint: Check the function name
   |
26 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:29:21
  in call to inorder()
  hint: Check the function name
   |
29 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:33:21
  in call to inorder()
  hint: Check the function name
   |
33 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-0.almd:38:17
  in variable t
  hint: Check the variable name
   |
38 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:38:17
  in call to height()
  hint: Check the function name
   |
38 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-0.almd:43:17
  in variable t
  hint: Check the variable name
   |
43 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:43:17
  in call to height()
  hint: Check the function name
   |
43 |   assert(height(t) < 11)
   |                 ^

14 error(s) found
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
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(c, l, _, r) => 1 + max(height(l), height(r))
  }

fn balance(tl: Tree, tr: Tree) -> Tree =
  match tl, tr {
    Leaf, Leaf => tl
    Leaf, Node(c, l, x, r) => Node(Black, tl, x, balance(l, r))
    Node(Red, tl, x, Leaf), Node(Red, l2, y, r) => Node(Black, Node(Red, tl, x, l2), y, r)
    Node(Red, tl, x, Leaf), Node(Black, l2, y, r) => rotate_right(Node(Red, Node(Black, tl, x, l2), y, r))
    Node(Red, tl,
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-1.almd
error: Expected LBrace at line 20:11 (got Comma ',')
  --> /tmp/dojo-red-black-tree-1.almd:20:11
   |
20 |   match tl, tr {
   |           ^
error: Expected ')' to close function call opened at line 39:20
  --> /tmp/dojo-red-black-tree-1.almd:39:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
39 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
39 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 40:12
  --> /tmp/dojo-red-black-tree-1.almd:40:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
40 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
40 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 44:20
  --> /tmp/dojo-red-black-tree-1.almd:44:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
44 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
44 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 45:12
  --> /tmp/dojo-red-black-tree-1.almd:45:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
45 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
45 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error[E002]: undefined function 'max'
  --> /tmp/dojo-red-black-tree-1.almd:16:51
  in call to max()
  hint: Check the function name
   |
16 |     Node(c, l, _, r) => 1 + max(height(l), height(r))
   |                                                   ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:27:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
27 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:27:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
27 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:27:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
27 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:29:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
29 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:31:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
31 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:35:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
35 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-1.almd:41:17
  in variable t
  hint: Check the variable name
   |
41 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-1.almd:46:17
  in variable t
  hint: Check the variable name
   |
46 |   assert(height(t) < 11)
   |                 ^

14 error(s) found
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
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(c, l, _, r) => 1 + max(height(l), height(r))
  }

fn max(a: Int, b: Int) -> Int =
  if a > b then a else b

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Red, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if v < x then balance(insert(l, v), Node(c, l, x, r))
      else if v > x then balance(Node(c, l, x, insert(r, v)))
      else Node(c, l, x, r)
  }

fn balance(tl: Tree, tr: Tree) -> Tree =
  match tl, tr {
    Leaf, Leaf => tl
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-2.almd
error: Expected LBrace at line 32:11 (got Comma ',')
  --> /tmp/dojo-red-black-tree-2.almd:32:11
   |
32 |   match tl, tr {
   |           ^
error: Expected ')' to close function call opened at line 47:20
  --> /tmp/dojo-red-black-tree-2.almd:47:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
47 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
47 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 48:12
  --> /tmp/dojo-red-black-tree-2.almd:48:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
48 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
48 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 52:20
  --> /tmp/dojo-red-black-tree-2.almd:52:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
52 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
52 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 53:12
  --> /tmp/dojo-red-black-tree-2.almd:53:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
53 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
53 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-2.almd:49:17
  in variable t
  hint: Check the variable name
   |
49 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-2.almd:54:17
  in variable t
  hint: Check the variable name
   |
54 |   assert(height(t) < 11)
   |                 ^

7 error(s) found
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

fn max(a: Int, b: Int) -> Int =
  if a > b then a else b

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

fn balance(tl: Tree, tr: Tree) -> Tree =
  match tl, tr {
    Leaf, Leaf => tl
    Leaf, Node(c, l, x, r) => Node(Black, tl, x, r)
    Node(c1, tl1, x1, rl1), Node(c2, tl2, x2, rl2) =>
      if c1 == Red && c2 == Red && tl1 == tl2 && rl1 == rl2 && x1 == x2 then
        Node(Black, Node(Black, tl1, x1
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-3.almd
error: Expected LBrace at line 23:11 (got Comma ',')
  --> /tmp/dojo-red-black-tree-3.almd:23:11
   |
23 |   match tl, tr {
   |           ^
error: Expected ')' to close function call opened at line 42:20
  --> /tmp/dojo-red-black-tree-3.almd:42:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
42 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
42 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 43:12
  --> /tmp/dojo-red-black-tree-3.almd:43:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
43 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
43 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 47:20
  --> /tmp/dojo-red-black-tree-3.almd:47:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
47 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
47 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 48:12
  --> /tmp/dojo-red-black-tree-3.almd:48:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
48 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
48 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:30:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
30 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:30:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
30 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:30:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
30 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:32:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
32 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:34:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
34 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:38:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
38 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-3.almd:44:17
  in variable t
  hint: Check the variable name
   |
44 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-3.almd:49:17
  in variable t
  hint: Check the variable name
   |
49 |   assert(height(t) < 11)
   |                 ^

13 error(s) found
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-3.almd

1/1 test file(s) failed

```
