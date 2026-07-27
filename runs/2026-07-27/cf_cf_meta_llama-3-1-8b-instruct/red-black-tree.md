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

fn insert(t: Tree, v: Int) -> Tree
  = match t {
      Leaf => Node(Black, Leaf, v, Leaf)
      | Node(c, l, x, r) =>
        if v < x then balance(Node(Red, l, v, Leaf), x, r)
        else if v > x then balance(Node(Red, Node(Black, Leaf, x, Leaf), v, r), x, r)
        else Node(c, l, x, r)
    }

fn balance(t: Tree, x: Int, r: Tree) -> Tree
  = match t {
      Node(Red, l, v, Leaf) =>
        Node(Black, Node(Red, l, v, Leaf), x, r)
      | Node(Red, l, v, Node(Red, r_l, x, r_r)) =>
        Node(Red, Node(Black, l, v, Node(Red, r_l, x, r_r)), x, r)
      | Node(Red, l, v, Node(Black, r_l, x
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-0.almd:8:3
  |
8 |   = match t {
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 17:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-0.almd:17:3
   |
17 |   = match t {
   |   ^
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
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:37:21
  in call to inorder()
  hint: Check the function name
   |
37 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:38:17
  in call to height()
  hint: Check the function name
   |
38 |   assert(height(t) < 11)
   |                 ^
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

fn insert(t: Tree, v: Int) -> Tree
  = match t {
      Leaf => Node(Black, Leaf, v, Leaf)
      | Node(c, l, x, r) =>
        if v < x then balance(Node(Red, l, v, Leaf), x, r)
        else if v > x then balance(Node(Red, Node(Black, Leaf, x, Leaf), v, r), x, r)
        else Node(c, l, x, r)
    }

fn balance(t: Tree, x: Int, r: Tree) -> Tree
  = match t {
      Node(Red, l, v, Leaf) =>
        Node(Black, Node(Red, l, v, Leaf), x, r)
      | Node(Red, l, v, Node(Red, r_l, x, r_r)) =>
        Node(Red, Node(Black, l, v, Node(Red, r_l, x, r_r)), x, r)
      | Node(Red, l, v, Node(Black, r_l, x
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-1.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-1.almd:8:3
  |
8 |   = match t {
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 17:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-1.almd:17:3
   |
17 |   = match t {
   |   ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:24:78
  in call to inorder()
  hint: Check the function name
   |
24 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:25:45
  in call to height()
  hint: Check the function name
   |
25 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:26:59
  in call to height()
  hint: Check the function name
   |
26 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:29:21
  in call to inorder()
  hint: Check the function name
   |
29 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:33:21
  in call to inorder()
  hint: Check the function name
   |
33 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:37:21
  in call to inorder()
  hint: Check the function name
   |
37 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:38:17
  in call to height()
  hint: Check the function name
   |
38 |   assert(height(t) < 11)
   |                 ^
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

11 error(s) found
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

fn insert(t: Tree, v: Int) -> Tree
  = match t {
      Leaf => Node(Black, Leaf, v, Leaf)
      | Node(c, l, x, r) =>
        if v < x then balance(Node(Red, l, v, Leaf), x, r)
        else if v > x then balance(Node(Red, Node(Black, Leaf, x, Leaf), v, r), x, r)
        else Node(c, l, x, r)
    }

fn balance(t: Tree, x: Int, r: Tree) -> Tree
  = match t {
      Node(Red, l, v, Leaf) =>
        Node(Black, Node(Red, l, v, Leaf), x, r)
      | Node(Red, l, v, Node(Red, r_l, x, r_r)) =>
        Node(Red, Node(Black, l, v, Node(Red, r_l, x, r_r)), x, r)
      | Node(Red, l, v, Node(Black, r_l, x
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-2.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-2.almd:8:3
  |
8 |   = match t {
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 17:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-2.almd:17:3
   |
17 |   = match t {
   |   ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:24:78
  in call to inorder()
  hint: Check the function name
   |
24 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:25:45
  in call to height()
  hint: Check the function name
   |
25 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:26:59
  in call to height()
  hint: Check the function name
   |
26 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:29:21
  in call to inorder()
  hint: Check the function name
   |
29 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:33:21
  in call to inorder()
  hint: Check the function name
   |
33 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:37:21
  in call to inorder()
  hint: Check the function name
   |
37 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:38:17
  in call to height()
  hint: Check the function name
   |
38 |   assert(height(t) < 11)
   |                 ^
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

fn insert(t: Tree, v: Int) -> Tree
  = match t {
      Leaf => Node(Black, Leaf, v, Leaf)
      | Node(c, l, x, r) =>
        if v < x then balance(Node(Red, l, v, Leaf), x, r)
        else if v > x then balance(Node(Red, Node(Black, Leaf, x, Leaf), v, r), x, r)
        else Node(c, l, x, r)
    }

fn balance(t: Tree, x: Int, r: Tree) -> Tree
  = match t {
      Node(Red, l, v, Leaf) =>
        Node(Black, Node(Red, l, v, Leaf), x, r)
      | Node(Red, l, v, Node(Red, r_l, x, r_r)) =>
        Node(Red, Node(Black, l, v, Node(Red, r_l, x, r_r)), x, r)
      | Node(Red, l, v, Node(Black, r_l, x
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-3.almd:8:3
  |
8 |   = match t {
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 17:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-3.almd:17:3
   |
17 |   = match t {
   |   ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:24:78
  in call to inorder()
  hint: Check the function name
   |
24 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:25:45
  in call to height()
  hint: Check the function name
   |
25 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:26:59
  in call to height()
  hint: Check the function name
   |
26 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:29:21
  in call to inorder()
  hint: Check the function name
   |
29 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:33:21
  in call to inorder()
  hint: Check the function name
   |
33 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:37:21
  in call to inorder()
  hint: Check the function name
   |
37 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:38:17
  in call to height()
  hint: Check the function name
   |
38 |   assert(height(t) < 11)
   |                 ^
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

11 error(s) found
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-3.almd

1/1 test file(s) failed

```
