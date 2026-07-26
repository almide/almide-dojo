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
    Node(c, l, k, r)
      | if k == v then Node(c, l, k, r)
      | else if k < v then balance(Node(Red, l, k, r), v)
      | else balance(Node(Red, l, k, r), v)
  }

fn balance(t: Tree, v: Int) -> Tree
  = match t {
    Node(Red, Node(Red, l1, k1, l2), k, r)
      | if k < v then Node(Black, Node(Red, l1, k1, Node(Black, l2, k, r)), k, r)
      | else Node(Black, Node(Red, Node(Black, l1, k1, l2), k, r), k, r)
    Node(Red, l, k, Node(Red, r1, k1, r2))
      | if k
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

fn balance(t: Tree, v: Int) -> Tree
  = match t {
    Node(Red, Node(Red, l1, k1, l2), k, r)
      | if k < v then Node(Black, Node(Red, l1, k1, Node(Black, l2, k, r)), k, r)
      | else Node(Black, Node(Red, Node(Black, l1, k1, l2), k, r), k, r)
    Node(Red, l, k, Node(Red, r1, k1, r2))
      | if k < v then Node(Black, Node(Red, l, k, Node(Black, r1, k1, r2)), k, r2)
      | else Node(Black, Node(Red, Node(Black, l, k, r1), k1, r2), k, r2)
    Node(Red, l, k, r)
      | if k < v then Node(Red, l, k, r)
      |
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-1.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-1.almd:8:3
  |
8 |   = match t {
  |   ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:19:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
19 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:19:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
19 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:19:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
19 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:19:78
  in call to inorder()
  hint: Check the function name
   |
19 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:20:45
  in call to height()
  hint: Check the function name
   |
20 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:21:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
21 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:21:59
  in call to height()
  hint: Check the function name
   |
21 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:23:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
23 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:24:21
  in call to inorder()
  hint: Check the function name
   |
24 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:27:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
27 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:28:21
  in call to inorder()
  hint: Check the function name
   |
28 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:31:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
31 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, v))
   |                                                           ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:32:21
  in call to inorder()
  hint: Check the function name
   |
32 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:33:17
  in call to height()
  hint: Check the function name
   |
33 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:36:64
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
36 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                                                                ^
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

18 error(s) found
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
    Leaf => Node(Red, Leaf, v, Leaf)
    Node(c, l, k, r) =>
      if v < k then
        let t = insert(r, v)
        match t {
          Node(Red, l1, k1, l2) => Node(Black, Node(Red, l, k, l1), k1, l2)
          Node(Black, l1, k1, l2) => Node(Black, Node(Red, l, k, l1), k1, l2)
          Node(Red, l1, k1, l2) => Node(Black, Node(Red, l, k, l1), k1, l2)
          Leaf => Node(Red, l, k, Node(Red, l1, k1, l2))
        }
      else if v > k then
        let t = insert(l, v)
        match t {
          Node(Red, l1, k1, l2
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-2.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-2.almd:8:3
  |
8 |   = match t {
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

fn insert(t: Tree, v: Int) -> Tree
  = match t {
    Leaf => Node(Red, Leaf, v, Leaf)
    Node(c, l, k, r) =>
      if v < k then
        let t = insert(r, v)
        match t {
          Node(Red, l1, k1, l2) => Node(Black, Node(Red, l, k, l1), k1, l2)
          Node(Black, l1, k1, l2) => Node(Black, Node(Red, l, k, l1), k1, l2)
          Node(Red, l1, k1, l2) => Node(Black, Node(Red, l, k, l1), k1, l2)
          Leaf => Node(Red, l, k, Node(Red, l1, k1, l2))
        }
      else if v > k then
        let t = insert(l, v)
        match t {
          Node(Red, l1, k1, l2
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-3.almd:8:3
  |
8 |   = match t {
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

10 error(s) found
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-3.almd

1/1 test file(s) failed

```
