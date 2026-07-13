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
    Leaf =>
      Node(Black, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if x == v then
        Node(c, l, x, r)
      else if v < x then
        match insert(l, v) {
          Leaf => Node(c, l, x, r)
          Node(c1, l1, v1, r1) =>
            balance(c, l1, v1, r1, r, x)
        }
      else
        match insert(r, v) {
          Leaf => Node(c, l, x, r)
          Node(c1, l1, v1, r1) =>
            balance(c, l, x, l1, r1, v1)
        }
  }

fn balance(c: Color, l: Tree, v: Int, r: Tree, x: Int) -> Tree =
  match l {
    Leaf => Node(Red, l, v, r)
    Node(c1, l1,
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-0.almd
error: Expected pattern at line 31:17 (got Newline '')
  --> /tmp/dojo-red-black-tree-0.almd:31:17
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
31 |     Node(c1, l1,
   |                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:33:78
  in call to inorder()
  hint: Check the function name
   |
33 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:34:45
  in call to height()
  hint: Check the function name
   |
34 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:35:59
  in call to height()
  hint: Check the function name
   |
35 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:38:21
  in call to inorder()
  hint: Check the function name
   |
38 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:42:21
  in call to inorder()
  hint: Check the function name
   |
42 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:46:21
  in call to inorder()
  hint: Check the function name
   |
46 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:47:17
  in call to height()
  hint: Check the function name
   |
47 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:51:21
  in call to inorder()
  hint: Check the function name
   |
51 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:52:17
  in call to height()
  hint: Check the function name
   |
52 |   assert(height(t) < 11)
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
  match t {
    Leaf =>
      Node(Black, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if x == v then
        Node(c, l, x, r)
      else if v < x then
        match insert(l, v) {
          Leaf => Node(c, l, x, r)
          Node(c1, l1, v1, r1) =>
            balance(c, l1, v1, r1, r, x)
        }
      else
        match insert(r, v) {
          Leaf => Node(c, l, x, r)
          Node(c1, l1, v1, r1) =>
            balance(c, l, x, l1, r1, v1)
        }
  }

fn balance(c: Color, l: Tree, v: Int, r: Tree, x: Int) -> Tree =
  match l {
    Leaf => Node(Red, l, v, r)
    Node(c1, l1,
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-1.almd
error: Expected pattern at line 31:17 (got Newline '')
  --> /tmp/dojo-red-black-tree-1.almd:31:17
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
31 |     Node(c1, l1,
   |                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:33:78
  in call to inorder()
  hint: Check the function name
   |
33 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:34:45
  in call to height()
  hint: Check the function name
   |
34 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:35:59
  in call to height()
  hint: Check the function name
   |
35 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:38:21
  in call to inorder()
  hint: Check the function name
   |
38 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:42:21
  in call to inorder()
  hint: Check the function name
   |
42 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:46:21
  in call to inorder()
  hint: Check the function name
   |
46 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:47:17
  in call to height()
  hint: Check the function name
   |
47 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:51:21
  in call to inorder()
  hint: Check the function name
   |
51 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:52:17
  in call to height()
  hint: Check the function name
   |
52 |   assert(height(t) < 11)
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
  match t {
    Leaf =>
      Node(Black, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if x == v then
        Node(c, l, x, r)
      else if v < x then
        match insert(l, v) {
          Leaf => Node(c, l, x, r)
          Node(c1, l1, v1, r1) =>
            balance(c, l1, v1, r1, r, x)
        }
      else
        match insert(r, v) {
          Leaf => Node(c, l, x, r)
          Node(c1, l1, v1, r1) =>
            balance(c, l, x, l1, r1, v1)
        }
  }

fn balance(c: Color, l: Tree, v: Int, r: Tree, x: Int) -> Tree =
  match l {
    Leaf => Node(Red, l, v, r)
    Node(c1, l1,
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-2.almd
error: Expected pattern at line 31:17 (got Newline '')
  --> /tmp/dojo-red-black-tree-2.almd:31:17
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
31 |     Node(c1, l1,
   |                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:33:78
  in call to inorder()
  hint: Check the function name
   |
33 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:34:45
  in call to height()
  hint: Check the function name
   |
34 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:35:59
  in call to height()
  hint: Check the function name
   |
35 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:38:21
  in call to inorder()
  hint: Check the function name
   |
38 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:42:21
  in call to inorder()
  hint: Check the function name
   |
42 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:46:21
  in call to inorder()
  hint: Check the function name
   |
46 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:47:17
  in call to height()
  hint: Check the function name
   |
47 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:51:21
  in call to inorder()
  hint: Check the function name
   |
51 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:52:17
  in call to height()
  hint: Check the function name
   |
52 |   assert(height(t) < 11)
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
  match t {
    Leaf =>
      Node(Black, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if x == v then
        Node(c, l, x, r)
      else if v < x then
        match insert(l, v) {
          Leaf => Node(c, l, x, r)
          Node(c1, l1, v1, r1) =>
            balance(c, l1, v1, r1, r, x)
        }
      else
        match insert(r, v) {
          Leaf => Node(c, l, x, r)
          Node(c1, l1, v1, r1) =>
            balance(c, l, x, l1, r1, v1)
        }
  }

fn balance(c: Color, l: Tree, v: Int, r: Tree, x: Int) -> Tree =
  match l {
    Leaf => Node(Red, l, v, r)
    Node(c1, l1,
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-3.almd
error: Expected pattern at line 31:17 (got Newline '')
  --> /tmp/dojo-red-black-tree-3.almd:31:17
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
31 |     Node(c1, l1,
   |                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:33:78
  in call to inorder()
  hint: Check the function name
   |
33 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:34:45
  in call to height()
  hint: Check the function name
   |
34 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:35:59
  in call to height()
  hint: Check the function name
   |
35 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:38:21
  in call to inorder()
  hint: Check the function name
   |
38 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:42:21
  in call to inorder()
  hint: Check the function name
   |
42 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:46:21
  in call to inorder()
  hint: Check the function name
   |
46 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:47:17
  in call to height()
  hint: Check the function name
   |
47 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:51:21
  in call to inorder()
  hint: Check the function name
   |
51 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:52:17
  in call to height()
  hint: Check the function name
   |
52 |   assert(height(t) < 11)
   |                 ^

10 error(s) found
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-3.almd

1/1 test file(s) failed

```
