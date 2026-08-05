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
    Leaf =>
      Node(Black, Leaf, v, Leaf)
    Node(c, l, k, r) =>
      if v == k then t
      else if v < k then balance(Node(Red, l, v, Leaf), k, r)
      else balance(Node(Red, Leaf, v, r), k, l)
  }

fn balance(t: Tree, k: Int, r: Tree) -> Tree
  = match t {
    Node(Red, l, v, Leaf) =>
      Node(Black, l, v, Node(Red, Leaf, k, r))
    Node(Red, l, v, Node(Red, r_l, k, r_r)) =>
      Node(Black, l, v, Node(Red, r_l, k, r_r))
    Node(Red, l, v, r) =>
      Node(Red, Node(Black, l, v, Leaf), k, r)
    Node(Black, l, v, r)
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-0.almd:8:3
  |
8 |   = match t {
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 18:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-0.almd:18:3
   |
18 |   = match t {
   |   ^
error: Expected ')' to close function call opened at line 39:20
  --> /tmp/dojo-red-black-tree-0.almd:39:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
39 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
39 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 40:12
  --> /tmp/dojo-red-black-tree-0.almd:40:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
40 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
40 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 44:20
  --> /tmp/dojo-red-black-tree-0.almd:44:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
44 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
44 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 45:12
  --> /tmp/dojo-red-black-tree-0.almd:45:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
45 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
45 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:27:78
  in call to inorder()
  hint: Check the function name
   |
27 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:28:45
  in call to height()
  hint: Check the function name
   |
28 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:29:59
  in call to height()
  hint: Check the function name
   |
29 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:32:21
  in call to inorder()
  hint: Check the function name
   |
32 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:36:21
  in call to inorder()
  hint: Check the function name
   |
36 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-0.almd:41:17
  in variable t
  hint: Check the variable name
   |
41 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:41:17
  in call to height()
  hint: Check the function name
   |
41 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-0.almd:46:17
  in variable t
  hint: Check the variable name
   |
46 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:46:17
  in call to height()
  hint: Check the function name
   |
46 |   assert(height(t) < 11)
   |                 ^

15 error(s) found
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

fn inorder(t: Tree) -> List[Int]
  = match t {
    Leaf => []
    Node(c, l, k, r) => inorder(l) + [k] + inorder(r)
  }

fn height(t: Tree) -> Int
  = match t {
    Leaf => 0
    Node(_, l, _, _) => 1 + max(height(l), height(t))
  }

fn balance(t: Tree, k: Int, r: Tree) -> Tree
  = match t {
    Node(Red, l, v, Leaf) =>
      Node(Black, l, v, Node(Red, Leaf, k, r))
    Node(Red, l, v, Node(Red, r_l, k, r_r)) =>
      Node(Black, l, v, Node(Red, r_l, k, r_r))
    Node(Red, l, v, r) =>
      Node(Red, Node(Black, l, v, Leaf), k, r)
    Node(Black, l, v, r) =>
      Node(Black, l, v
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-1.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-1.almd:8:3
  |
8 |   = match t {
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 14:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-1.almd:14:3
   |
14 |   = match t {
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 20:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-1.almd:20:3
   |
20 |   = match t {
   |   ^
error: Expected ')' to close function call opened at line 42:20
  --> /tmp/dojo-red-black-tree-1.almd:42:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
42 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
42 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 43:12
  --> /tmp/dojo-red-black-tree-1.almd:43:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
43 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
43 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 47:20
  --> /tmp/dojo-red-black-tree-1.almd:47:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
47 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
47 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 48:12
  --> /tmp/dojo-red-black-tree-1.almd:48:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
48 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
48 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:30:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
30 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:30:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
30 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:30:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
30 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:32:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
32 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:34:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
34 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:38:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
38 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-1.almd:44:17
  in variable t
  hint: Check the variable name
   |
44 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-1.almd:49:17
  in variable t
  hint: Check the variable name
   |
49 |   assert(height(t) < 11)
   |                 ^

15 error(s) found
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

fn inorder(t: Tree) -> List[Int]
  = match t {
    Leaf => []
    Node(c, l, k, r) => inorder(l) + [k] + inorder(r)
  }

fn height(t: Tree) -> Int
  = match t {
    Leaf => 0
    Node(_, l, _, _) => 1 + max(height(l), height(r))
  }

fn balance(t: Tree, k: Int, r: Tree) -> Tree
  = match t {
    Node(Red, l, v, Leaf) =>
      Node(Black, l, v, Node(Red, Leaf, k, r))
    Node(Red, l, v, Node(Red, r_l, k, r_r)) =>
      Node(Black, l, v, Node(Red, r_l, k, r_r))
    Node(Red, l, v, r) =>
      Node(Red, Node(Black, l, v, Leaf), k, r)
    Node(Black, l, v, r) =>
      Node(Black, l, v
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-2.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-2.almd:8:3
  |
8 |   = match t {
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 14:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-2.almd:14:3
   |
14 |   = match t {
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 20:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-2.almd:20:3
   |
20 |   = match t {
   |   ^
error: Expected ')' to close function call opened at line 42:20
  --> /tmp/dojo-red-black-tree-2.almd:42:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
42 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
42 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 43:12
  --> /tmp/dojo-red-black-tree-2.almd:43:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
43 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
43 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 47:20
  --> /tmp/dojo-red-black-tree-2.almd:47:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
47 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
47 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
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
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:30:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
30 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:30:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
30 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:30:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
30 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:32:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
32 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:34:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
34 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:38:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
38 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-2.almd:44:17
  in variable t
  hint: Check the variable name
   |
44 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-2.almd:49:17
  in variable t
  hint: Check the variable name
   |
49 |   assert(height(t) < 11)
   |                 ^

15 error(s) found
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

fn inorder(t: Tree) -> List[Int]
  = match t {
    Leaf => []
    Node(c, l, k, r) => inorder(l) + [k] + inorder(r)
  }

fn height(t: Tree) -> Int
  = match t {
    Leaf => 0
    Node(_, l, _, _) => 1 + max(height(l), height(r))
  }

fn balance(t: Tree, k: Int, r: Tree) -> Tree
  = match t {
    Node(Red, l, v, Leaf) =>
      Node(Black, l, v, Node(Red, Leaf, k, r))
    Node(Red, l, v, Node(Red, r_l, k, r_r)) =>
      Node(Black, l, v, Node(Red, r_l, k, r_r))
    Node(Red, l, v, r) =>
      Node(Red, Node(Black, l, v, Leaf), k, r)
    Node(Black, l, v, r) =>
      Node(Black, l, v
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-3.almd:8:3
  |
8 |   = match t {
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 14:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-3.almd:14:3
   |
14 |   = match t {
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 20:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-3.almd:20:3
   |
20 |   = match t {
   |   ^
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

15 error(s) found
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-3.almd

1/1 test file(s) failed

```
