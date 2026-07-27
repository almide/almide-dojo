# red-black-tree

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
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
  balance(insert_rec(t, v))

fn insert_rec(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Red, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if v < x then
        Node(c, insert_rec(l, v), x, r)
      else if v > x then
        Node(c, l, x, insert_rec(r, v))
      else
        t
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Black, Node(Red, Node(Red, a, x, b), y, c), z, d) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    Node(Black, Node(Red, a, x, Node(Red, b, y, c)), z, d) =>
      Node(Red, Node(Black, a, x, b), y
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-0.almd
error: Expected ')' to close constructor call opened at line 27:11
  --> /tmp/dojo-red-black-tree-0.almd:29:1
  hint: Add ')' or check for a missing delimiter inside the constructor call
   |
27 |       Node(Red, Node(Black, a, x, b), y
   |           --------------- '(' opened here
...
29 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   | ^^^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:29:78
  in call to inorder()
  hint: Check the function name
   |
29 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:30:45
  in call to height()
  hint: Check the function name
   |
30 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:31:59
  in call to height()
  hint: Check the function name
   |
31 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:34:21
  in call to inorder()
  hint: Check the function name
   |
34 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:38:21
  in call to inorder()
  hint: Check the function name
   |
38 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:42:21
  in call to inorder()
  hint: Check the function name
   |
42 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:43:17
  in call to height()
  hint: Check the function name
   |
43 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:47:21
  in call to inorder()
  hint: Check the function name
   |
47 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:48:17
  in call to height()
  hint: Check the function name
   |
48 |   assert(height(t) < 11)
   |                 ^

10 error(s) found
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

fn insert(t: Tree, v: Int) -> Tree =
  balance(insert_rec(t, v))

fn insert_rec(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Red, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if v < x then
        Node(c, insert_rec(l, v), x, r)
      else if v > x then
        Node(c, l, x, insert_rec(r, v))
      else
        t
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Black, Node(Red, Node(Red, a, x, b), y, c), z, d) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    Node(Black, Node(Red, a, x, Node(Red, b, y, c)), z, d) =>
      Node(Red, Node(Black, a, x, b), y
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-1.almd
error: Expected ')' to close constructor call opened at line 27:11
  --> /tmp/dojo-red-black-tree-1.almd:29:1
  hint: Add ')' or check for a missing delimiter inside the constructor call
   |
27 |       Node(Red, Node(Black, a, x, b), y
   |           --------------- '(' opened here
...
29 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   | ^^^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:29:78
  in call to inorder()
  hint: Check the function name
   |
29 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:30:45
  in call to height()
  hint: Check the function name
   |
30 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:31:59
  in call to height()
  hint: Check the function name
   |
31 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:34:21
  in call to inorder()
  hint: Check the function name
   |
34 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:38:21
  in call to inorder()
  hint: Check the function name
   |
38 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:42:21
  in call to inorder()
  hint: Check the function name
   |
42 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:43:17
  in call to height()
  hint: Check the function name
   |
43 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:47:21
  in call to inorder()
  hint: Check the function name
   |
47 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:48:17
  in call to height()
  hint: Check the function name
   |
48 |   assert(height(t) < 11)
   |                 ^

10 error(s) found
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

fn insert(t: Tree, v: Int) -> Tree =
  balance(insert_rec(t, v))

fn insert_rec(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Red, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if v < x then
        Node(c, insert_rec(l, v), x, r)
      else if v > x then
        Node(c, l, x, insert_rec(r, v))
      else
        t
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Black, Node(Red, Node(Red, a, x, b), y, c), z, d) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    Node(Black, Node(Red, a, x, Node(Red, b, y, c)), z, d) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-2.almd
error: Expected ')' to close constructor call opened at line 27:46
  --> /tmp/dojo-red-black-tree-2.almd:29:1
  hint: Add ')' or check for a missing delimiter inside the constructor call
   |
27 |       Node(Red, Node(Black, a, x, b), y, Node(Black
   |                                              --------------- '(' opened here
...
29 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   | ^^^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:29:78
  in call to inorder()
  hint: Check the function name
   |
29 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:30:45
  in call to height()
  hint: Check the function name
   |
30 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:31:59
  in call to height()
  hint: Check the function name
   |
31 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:34:21
  in call to inorder()
  hint: Check the function name
   |
34 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:38:21
  in call to inorder()
  hint: Check the function name
   |
38 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:42:21
  in call to inorder()
  hint: Check the function name
   |
42 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:43:17
  in call to height()
  hint: Check the function name
   |
43 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:47:21
  in call to inorder()
  hint: Check the function name
   |
47 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:48:17
  in call to height()
  hint: Check the function name
   |
48 |   assert(height(t) < 11)
   |                 ^

10 error(s) found
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

fn insert(t: Tree, v: Int) -> Tree =
  balance(insert_rec(t, v))

fn insert_rec(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Red, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if v < x then
        Node(c, insert_rec(l, v), x, r)
      else if v > x then
        Node(c, l, x, insert_rec(r, v))
      else
        t
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Black, Node(Red, Node(Red, a, x, b), y, c), z, d) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    Node(Black, Node(Red, a, x, Node(Red, b, y, c)), z, d) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-3.almd
error: Expected ')' to close constructor call opened at line 27:46
  --> /tmp/dojo-red-black-tree-3.almd:29:1
  hint: Add ')' or check for a missing delimiter inside the constructor call
   |
27 |       Node(Red, Node(Black, a, x, b), y, Node(Black
   |                                              --------------- '(' opened here
...
29 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   | ^^^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:29:78
  in call to inorder()
  hint: Check the function name
   |
29 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:30:45
  in call to height()
  hint: Check the function name
   |
30 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:31:59
  in call to height()
  hint: Check the function name
   |
31 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:34:21
  in call to inorder()
  hint: Check the function name
   |
34 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:38:21
  in call to inorder()
  hint: Check the function name
   |
38 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:42:21
  in call to inorder()
  hint: Check the function name
   |
42 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:43:17
  in call to height()
  hint: Check the function name
   |
43 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:47:21
  in call to inorder()
  hint: Check the function name
   |
47 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:48:17
  in call to height()
  hint: Check the function name
   |
48 |   assert(height(t) < 11)
   |                 ^

10 error(s) found
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-3.almd

1/1 test file(s) failed

```
