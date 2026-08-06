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
    Node(color, left, val, right) =>
      if v < val then
        Node(color, insert_rec(left, v), val, right)
      else if v > val then
        Node(color, left, val, insert_rec(right, v))
      else
        t
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, left, val1, right1), val2, right2) =>
      Node(Red, Node(Black, left, val1, right1), val2, Node(Black, right2, val2, right2))
    Node(Red, left, val1, Node(Red, left2, val2, right2)) =>
      Node(Red, Node(Black, left, val1, left2), val
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-0.almd
error: Expected ')' to close constructor call opened at line 27:11
  --> /tmp/dojo-red-black-tree-0.almd:29:1
  hint: Add ')' or check for a missing delimiter inside the constructor call
   |
27 |       Node(Red, Node(Black, left, val1, left2), val
   |           --------------- '(' opened here
...
29 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   | ^^^^
error: Expected ')' to close function call opened at line 41:20
  --> /tmp/dojo-red-black-tree-0.almd:41:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
41 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
41 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
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
error: Expected ')' to close function call opened at line 46:20
  --> /tmp/dojo-red-black-tree-0.almd:46:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
46 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
46 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 47:12
  --> /tmp/dojo-red-black-tree-0.almd:47:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
47 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
47 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
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
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-0.almd:48:17
  in variable t
  hint: Check the variable name
   |
48 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:48:17
  in call to height()
  hint: Check the function name
   |
48 |   assert(height(t) < 11)
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

fn insert(t: Tree, v: Int) -> Tree =
  balance(insert_rec(t, v))

fn insert_rec(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Red, Leaf, v, Leaf)
    Node(color, left, val, right) =>
      if v < val then
        Node(color, insert_rec(left, v), val, right)
      else if v > val then
        Node(color, left, val, insert_rec(right, v))
      else
        t
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, left, val1, right1), val2, right2) =>
      Node(Black, Node(Red, left, val1, right1), val2, Node(Red, right2, val2, right2))
    Node(Red, left, val1, Node(Red, left2, val2, right2)) =>
      Node(Black, Node(Red, left, val1, left2), val2, Node(R
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-1.almd
error: Expected ')' to close constructor call opened at line 27:59
  --> /tmp/dojo-red-black-tree-1.almd:29:1
  hint: Add ')' or check for a missing delimiter inside the constructor call
   |
27 |       Node(Black, Node(Red, left, val1, left2), val2, Node(R
   |                                                           --------------- '(' opened here
...
29 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   | ^^^^
error: Expected ')' to close function call opened at line 41:20
  --> /tmp/dojo-red-black-tree-1.almd:41:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
41 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
41 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 42:12
  --> /tmp/dojo-red-black-tree-1.almd:42:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
42 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
42 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 46:20
  --> /tmp/dojo-red-black-tree-1.almd:46:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
46 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
46 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 47:12
  --> /tmp/dojo-red-black-tree-1.almd:47:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
47 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
47 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
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
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-1.almd:43:17
  in variable t
  hint: Check the variable name
   |
43 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:43:17
  in call to height()
  hint: Check the function name
   |
43 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-1.almd:48:17
  in variable t
  hint: Check the variable name
   |
48 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:48:17
  in call to height()
  hint: Check the function name
   |
48 |   assert(height(t) < 11)
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

fn insert(t: Tree, v: Int) -> Tree =
  balance(insert_rec(t, v))

fn insert_rec(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Red, Leaf, v, Leaf)
    Node(color, left, val, right) =>
      if v < val then
        Node(color, insert_rec(left, v), val, right)
      else if v > val then
        Node(color, left, val, insert_rec(right, v))
      else
        t
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, left, val1, right1), val2, right2) =>
      Node(Black, Node(Red, left, val1, right1), val2, Node(Red, right2, val2, right2))
    Node(Red, left, val1, Node(Red, left2, val2, right2)) =>
      Node(Black, Node(Red, left, val1, left2), val2, Node(R
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-2.almd
error: Expected ')' to close constructor call opened at line 27:59
  --> /tmp/dojo-red-black-tree-2.almd:29:1
  hint: Add ')' or check for a missing delimiter inside the constructor call
   |
27 |       Node(Black, Node(Red, left, val1, left2), val2, Node(R
   |                                                           --------------- '(' opened here
...
29 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   | ^^^^
error: Expected ')' to close function call opened at line 41:20
  --> /tmp/dojo-red-black-tree-2.almd:41:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
41 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
41 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 42:12
  --> /tmp/dojo-red-black-tree-2.almd:42:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
42 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
42 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 46:20
  --> /tmp/dojo-red-black-tree-2.almd:46:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
46 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
46 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 47:12
  --> /tmp/dojo-red-black-tree-2.almd:47:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
47 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
47 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
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
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-2.almd:43:17
  in variable t
  hint: Check the variable name
   |
43 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:43:17
  in call to height()
  hint: Check the function name
   |
43 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-2.almd:48:17
  in variable t
  hint: Check the variable name
   |
48 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:48:17
  in call to height()
  hint: Check the function name
   |
48 |   assert(height(t) < 11)
   |                 ^

14 error(s) found
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
    Node(color, left, val, right) =>
      if v < val then
        Node(color, insert_rec(left, v), val, right)
      else if v > val then
        Node(color, left, val, insert_rec(right, v))
      else
        t
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, left, val1, right1), val2, right2) =>
      Node(Black, Node(Red, left, val1, right1), val2, Node(Red, right2, val2, right2))
    Node(Red, left, val1, Node(Red, left2, val2, right2)) =>
      Node(Black, Node(Red, left, val1, left2), val
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-3.almd
error: Expected ')' to close constructor call opened at line 27:11
  --> /tmp/dojo-red-black-tree-3.almd:29:1
  hint: Add ')' or check for a missing delimiter inside the constructor call
   |
27 |       Node(Black, Node(Red, left, val1, left2), val
   |           --------------- '(' opened here
...
29 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   | ^^^^
error: Expected ')' to close function call opened at line 41:20
  --> /tmp/dojo-red-black-tree-3.almd:41:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
41 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
41 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 42:12
  --> /tmp/dojo-red-black-tree-3.almd:42:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
42 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
42 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 46:20
  --> /tmp/dojo-red-black-tree-3.almd:46:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
46 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
46 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 47:12
  --> /tmp/dojo-red-black-tree-3.almd:47:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
47 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
47 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
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
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-3.almd:43:17
  in variable t
  hint: Check the variable name
   |
43 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:43:17
  in call to height()
  hint: Check the function name
   |
43 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-3.almd:48:17
  in variable t
  hint: Check the variable name
   |
48 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:48:17
  in call to height()
  hint: Check the function name
   |
48 |   assert(height(t) < 11)
   |                 ^

14 error(s) found
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-3.almd

1/1 test file(s) failed

```
