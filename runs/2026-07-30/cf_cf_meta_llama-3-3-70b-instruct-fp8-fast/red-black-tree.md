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

fn balance(color: Color, left: Tree, value: Int, right: Tree) -> Tree =
  match (color, left, right) with
  | (Black, Node(Red, Node(Red, a, x, b), y, c), d) => 
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, d))
  | (Black, Node(Red, a, x, Node(Red, b, y, c)), z) => 
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, z))
  | (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) => 
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
  | (Black, a, x, Node(Red, b, y, Node(Red, c, z, d))) =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-0.almd
error: Expected LBrace at line 8:30 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-0.almd:8:30
  |
8 |   match (color, left, right) with
  |                              ^
error: Expected ')' to close function call opened at line 29:20
  --> /tmp/dojo-red-black-tree-0.almd:29:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
29 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
29 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 30:12
  --> /tmp/dojo-red-black-tree-0.almd:30:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
30 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
30 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 34:20
  --> /tmp/dojo-red-black-tree-0.almd:34:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
34 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
34 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 35:12
  --> /tmp/dojo-red-black-tree-0.almd:35:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
35 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
35 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:17:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
17 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:17:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
17 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:17:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
17 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:17:78
  in call to inorder()
  hint: Check the function name
   |
17 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:18:45
  in call to height()
  hint: Check the function name
   |
18 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:19:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
19 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:19:59
  in call to height()
  hint: Check the function name
   |
19 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:21:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
21 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:22:21
  in call to inorder()
  hint: Check the function name
   |
22 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:25:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
25 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:26:21
  in call to inorder()
  hint: Check the function name
   |
26 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-0.almd:31:17
  in variable t
  hint: Check the variable name
   |
31 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:31:17
  in call to height()
  hint: Check the function name
   |
31 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-0.almd:36:17
  in variable t
  hint: Check the variable name
   |
36 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:36:17
  in call to height()
  hint: Check the function name
   |
36 |   assert(height(t) < 11)
   |                 ^

20 error(s) found
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

fn balance(color: Color, left: Tree, value: Int, right: Tree) -> Tree =
  match (color, left, right) with
  | (Black, Node(Red, Node(Red, a, x, b), y, c), d) => 
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, d))
  | (Black, Node(Red, a, x, Node(Red, b, y, c)), z) => 
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, z))
  | (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) => 
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
  | (Black, a, x, Node(Red, b, y, Node(Red, c, z, d))) =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-1.almd
error: Expected LBrace at line 8:30 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-1.almd:8:30
  |
8 |   match (color, left, right) with
  |                              ^
error: Expected ')' to close function call opened at line 29:20
  --> /tmp/dojo-red-black-tree-1.almd:29:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
29 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
29 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 30:12
  --> /tmp/dojo-red-black-tree-1.almd:30:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
30 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
30 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 34:20
  --> /tmp/dojo-red-black-tree-1.almd:34:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
34 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
34 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 35:12
  --> /tmp/dojo-red-black-tree-1.almd:35:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
35 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
35 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:17:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
17 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:17:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
17 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:17:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
17 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:17:78
  in call to inorder()
  hint: Check the function name
   |
17 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:18:45
  in call to height()
  hint: Check the function name
   |
18 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:19:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
19 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:19:59
  in call to height()
  hint: Check the function name
   |
19 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:21:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
21 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:22:21
  in call to inorder()
  hint: Check the function name
   |
22 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:25:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
25 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:26:21
  in call to inorder()
  hint: Check the function name
   |
26 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-1.almd:31:17
  in variable t
  hint: Check the variable name
   |
31 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:31:17
  in call to height()
  hint: Check the function name
   |
31 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-1.almd:36:17
  in variable t
  hint: Check the variable name
   |
36 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:36:17
  in call to height()
  hint: Check the function name
   |
36 |   assert(height(t) < 11)
   |                 ^

20 error(s) found
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

fn balance(color: Color, left: Tree, value: Int, right: Tree) -> Tree =
  match (color, left, right) with
  | (Black, Node(Red, Node(Red, a, x, b), y, c), d) => 
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, d))
  | (Black, Node(Red, a, x, Node(Red, b, y, c)), z) => 
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, z))
  | (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) => 
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
  | (Black, a, x, Node(Red, b, y, Node(Red, c, z, d))) =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-2.almd
error: Expected LBrace at line 8:30 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-2.almd:8:30
  |
8 |   match (color, left, right) with
  |                              ^
error: Expected ')' to close function call opened at line 29:20
  --> /tmp/dojo-red-black-tree-2.almd:29:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
29 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
29 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 30:12
  --> /tmp/dojo-red-black-tree-2.almd:30:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
30 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
30 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 34:20
  --> /tmp/dojo-red-black-tree-2.almd:34:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
34 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
34 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 35:12
  --> /tmp/dojo-red-black-tree-2.almd:35:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
35 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
35 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:17:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
17 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:17:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
17 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:17:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
17 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:17:78
  in call to inorder()
  hint: Check the function name
   |
17 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:18:45
  in call to height()
  hint: Check the function name
   |
18 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:19:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
19 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:19:59
  in call to height()
  hint: Check the function name
   |
19 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:21:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
21 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:22:21
  in call to inorder()
  hint: Check the function name
   |
22 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:25:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
25 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:26:21
  in call to inorder()
  hint: Check the function name
   |
26 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-2.almd:31:17
  in variable t
  hint: Check the variable name
   |
31 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:31:17
  in call to height()
  hint: Check the function name
   |
31 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-2.almd:36:17
  in variable t
  hint: Check the variable name
   |
36 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:36:17
  in call to height()
  hint: Check the function name
   |
36 |   assert(height(t) < 11)
   |                 ^

20 error(s) found
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

fn balance(color: Color, left: Tree, value: Int, right: Tree) -> Tree =
  match (color, left, right) with
  | (Black, Node(Red, Node(Red, a, x, b), y, c), d) => 
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, d))
  | (Black, Node(Red, a, x, Node(Red, b, y, c)), z) => 
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, z))
  | (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) => 
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
  | (Black, a, x, Node(Red, b, y, Node(Red, c, z, d))) =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-3.almd
error: Expected LBrace at line 8:30 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-3.almd:8:30
  |
8 |   match (color, left, right) with
  |                              ^
error: Expected ')' to close function call opened at line 29:20
  --> /tmp/dojo-red-black-tree-3.almd:29:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
29 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
29 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 30:12
  --> /tmp/dojo-red-black-tree-3.almd:30:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
30 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
30 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 34:20
  --> /tmp/dojo-red-black-tree-3.almd:34:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
34 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
34 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 35:12
  --> /tmp/dojo-red-black-tree-3.almd:35:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
35 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
35 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:17:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
17 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:17:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
17 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:17:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
17 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:17:78
  in call to inorder()
  hint: Check the function name
   |
17 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:18:45
  in call to height()
  hint: Check the function name
   |
18 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:19:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
19 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:19:59
  in call to height()
  hint: Check the function name
   |
19 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:21:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
21 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:22:21
  in call to inorder()
  hint: Check the function name
   |
22 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:25:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
25 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:26:21
  in call to inorder()
  hint: Check the function name
   |
26 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-3.almd:31:17
  in variable t
  hint: Check the variable name
   |
31 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:31:17
  in call to height()
  hint: Check the function name
   |
31 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-3.almd:36:17
  in variable t
  hint: Check the variable name
   |
36 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:36:17
  in call to height()
  hint: Check the function name
   |
36 |   assert(height(t) < 11)
   |                 ^

20 error(s) found
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-3.almd

1/1 test file(s) failed

```
