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

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, a, x, b), y, c) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, y, Leaf))
    Node(Red, a, x, Node(Red, b, y, c)) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, y, Leaf))
    Node(Red, Node(Red, a, x, b), y, c) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, y, Leaf))
    Node(Red, a, x, Node(Red, b, y, c)) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, y, Leaf))
    _ => t
  }

fn insert(t: Tree, v: Int) -> Tree =
  let ins = (t
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-0.almd
error: Expected ')' to close parenthesized expression opened at line 21:13
  --> /tmp/dojo-red-black-tree-0.almd:21:15
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
   |
21 |   let ins = (t
   |             --------------- '(' opened here
   |
21 |   let ins = (t
   |               ^
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
error[E001]: type mismatch in fn 'insert': expected Tree but got Unit
  --> /tmp/dojo-red-black-tree-0.almd:21:3
  in fn 'insert'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Tree:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Tree
   |
21 |   let ins = (t
   |   ^^^

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

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, a, x, b), y, c) =>
      Node(Black, Node(Red, a, x, b), y, Node(Red, c, y, Leaf))
    Node(Red, a, x, Node(Red, b, y, c)) =>
      Node(Black, Node(Red, a, x, b), y, Node(Red, c, y, Leaf))
    Node(Red, Node(Red, a, x, b), y, c) =>
      Node(Black, Node(Red, a, x, b), y, Node(Red, c, y, Leaf))
    Node(Red, a, x, Node(Red, b, y, c)) =>
      Node(Black, Node(Red, a, x, b), y, Node(Red, c, y, Leaf))
    _ => t
  }

fn insert(t: Tree, v: Int) -> Tree =
  let ins = insert_helper(t, v
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-1.almd
error: Expected ')' to close function call opened at line 21:26
  --> /tmp/dojo-red-black-tree-1.almd:23:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
21 |   let ins = insert_helper(t, v
   |                          --------------- '(' opened here
...
23 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   | ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:24:45
  in call to height()
  hint: Check the function name
   |
24 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:25:59
  in call to height()
  hint: Check the function name
   |
25 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:28:21
  in call to inorder()
  hint: Check the function name
   |
28 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:32:21
  in call to inorder()
  hint: Check the function name
   |
32 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:36:21
  in call to inorder()
  hint: Check the function name
   |
36 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:37:17
  in call to height()
  hint: Check the function name
   |
37 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:41:21
  in call to inorder()
  hint: Check the function name
   |
41 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:42:17
  in call to height()
  hint: Check the function name
   |
42 |   assert(height(t) < 11)
   |                 ^
error[E001]: type mismatch in fn 'insert': expected Tree but got Unit
  --> /tmp/dojo-red-black-tree-1.almd:21:3
  in fn 'insert'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Tree:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Tree
   |
21 |   let ins = insert_helper(t, v
   |   ^^^

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

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, a, x, b), y, c) =>
      Node(Black, Node(Red, a, x, b), y, Node(Red, c, y, Leaf))
    Node(Red, a, x, Node(Red, b, y, c)) =>
      Node(Black, Node(Red, a, x, b), y, Node(Red, c, y, Leaf))
    Node(Red, Node(Red, a, x, b), y, c) =>
      Node(Black, Node(Red, a, x, b), y, Node(Red, c, y, Leaf))
    Node(Red, a, x, Node(Red, b, y, c)) =>
      Node(Black, Node(Red, a, x, b), y, Node(Red, c, y, Leaf))
    _ => t
  }

fn insert_helper(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-2.almd
error: Expected pattern at line 24:1 (got Test 'test')
  --> /tmp/dojo-red-black-tree-2.almd:24:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
24 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   | ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:24:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
24 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:24:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
24 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:24:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
24 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
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
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:26:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
26 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:26:59
  in call to height()
  hint: Check the function name
   |
26 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:28:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
28 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:29:21
  in call to inorder()
  hint: Check the function name
   |
29 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:32:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
32 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:33:21
  in call to inorder()
  hint: Check the function name
   |
33 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:36:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
36 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, v))
   |                                                           ^
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
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:41:64
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
41 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                                                                ^
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

18 error(s) found
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

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, a, x, b), y, c) =>
      Node(Black, Node(Red, a, x, b), y, Node(Red, c, y, Leaf))
    Node(Red, a, x, Node(Red, b, y, c)) =>
      Node(Black, Node(Red, a, x, b), y, Node(Red, c, y, Leaf))
    Node(Red, Node(Red, a, x, b), y, c) =>
      Node(Black, Node(Red, a, x, b), y, Node(Red, c, y, Leaf))
    Node(Red, a, x, Node(Red, b, y, c)) =>
      Node(Black, Node(Red, a, x, b), y, Node(Red, c, y, Leaf))
    _ => t
  }

fn insert_helper(t: Tree, v: Int) -> Tree =
  match t {
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-3.almd
error: Expected pattern at line 23:1 (got Test 'test')
  --> /tmp/dojo-red-black-tree-3.almd:23:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
23 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   | ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:23:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
23 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:23:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
23 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:23:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
23 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:23:78
  in call to inorder()
  hint: Check the function name
   |
23 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:24:45
  in call to height()
  hint: Check the function name
   |
24 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:25:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
25 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:25:59
  in call to height()
  hint: Check the function name
   |
25 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:27:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
27 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:28:21
  in call to inorder()
  hint: Check the function name
   |
28 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:31:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
31 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:32:21
  in call to inorder()
  hint: Check the function name
   |
32 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:35:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
35 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, v))
   |                                                           ^
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
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:40:64
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
40 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                                                                ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:41:21
  in call to inorder()
  hint: Check the function name
   |
41 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:42:17
  in call to height()
  hint: Check the function name
   |
42 |   assert(height(t) < 11)
   |                 ^

18 error(s) found
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-3.almd

1/1 test file(s) failed

```
