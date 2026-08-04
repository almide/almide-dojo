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
  match (color, left, value, right) with
    | (Black, Node(Red, Node(Red, a, x, b), y, c), z, d) => Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    | (Black, Node(Red, a, x, Node(Red, b, y, c)), z, d) => Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    | (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) => Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    | (Black, a, x, Node(Red, b, y, Node(Red, c, z, d))) => Node(R
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-0.almd
error: Expected LBrace at line 8:37 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-0.almd:8:37
  |
8 |   match (color, left, value, right) with
  |                                     ^
error: Expected ')' to close function call opened at line 26:20
  --> /tmp/dojo-red-black-tree-0.almd:26:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
26 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
26 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 27:12
  --> /tmp/dojo-red-black-tree-0.almd:27:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
27 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
27 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 31:20
  --> /tmp/dojo-red-black-tree-0.almd:31:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
31 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
31 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 32:12
  --> /tmp/dojo-red-black-tree-0.almd:32:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
32 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
32 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:14:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
14 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:14:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
14 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:14:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
14 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:14:78
  in call to inorder()
  hint: Check the function name
   |
14 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:15:45
  in call to height()
  hint: Check the function name
   |
15 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:16:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
16 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:16:59
  in call to height()
  hint: Check the function name
   |
16 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:18:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
18 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:19:21
  in call to inorder()
  hint: Check the function name
   |
19 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:22:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
22 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:23:21
  in call to inorder()
  hint: Check the function name
   |
23 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-0.almd:28:17
  in variable t
  hint: Check the variable name
   |
28 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:28:17
  in call to height()
  hint: Check the function name
   |
28 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-0.almd:33:17
  in variable t
  hint: Check the variable name
   |
33 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:33:17
  in call to height()
  hint: Check the function name
   |
33 |   assert(height(t) < 11)
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
  match (color, left, value, right) with
    | (Black, Node(Red, Node(Red, a, x, b), y, c), z, d) => Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    | (Black, Node(Red, a, x, Node(Red, b, y, c)), z, d) => Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    | (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) => Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    | (Black, a, x, Node(Red, b, y, Node(Red, c, z, d))) => Node(R
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-1.almd
error: Expected LBrace at line 8:37 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-1.almd:8:37
  |
8 |   match (color, left, value, right) with
  |                                     ^
error: Expected ')' to close function call opened at line 26:20
  --> /tmp/dojo-red-black-tree-1.almd:26:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
26 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
26 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 27:12
  --> /tmp/dojo-red-black-tree-1.almd:27:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
27 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
27 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 31:20
  --> /tmp/dojo-red-black-tree-1.almd:31:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
31 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
31 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 32:12
  --> /tmp/dojo-red-black-tree-1.almd:32:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
32 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
32 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:14:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
14 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:14:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
14 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:14:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
14 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:14:78
  in call to inorder()
  hint: Check the function name
   |
14 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:15:45
  in call to height()
  hint: Check the function name
   |
15 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:16:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
16 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:16:59
  in call to height()
  hint: Check the function name
   |
16 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:18:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
18 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:19:21
  in call to inorder()
  hint: Check the function name
   |
19 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:22:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
22 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:23:21
  in call to inorder()
  hint: Check the function name
   |
23 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-1.almd:28:17
  in variable t
  hint: Check the variable name
   |
28 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:28:17
  in call to height()
  hint: Check the function name
   |
28 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-1.almd:33:17
  in variable t
  hint: Check the variable name
   |
33 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:33:17
  in call to height()
  hint: Check the function name
   |
33 |   assert(height(t) < 11)
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
  match (color, left, value, right) with
    | (Black, Node(Red, Node(Red, a, x, b), y, c), z, d) => Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    | (Black, Node(Red, a, x, Node(Red, b, y, c)), z, d) => Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    | (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) => Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    | (Black, a, x, Node(Red, b, y, Node(Red, c, z, d))) => Node(R
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-2.almd
error: Expected LBrace at line 8:37 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-2.almd:8:37
  |
8 |   match (color, left, value, right) with
  |                                     ^
error: Expected ')' to close function call opened at line 26:20
  --> /tmp/dojo-red-black-tree-2.almd:26:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
26 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
26 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 27:12
  --> /tmp/dojo-red-black-tree-2.almd:27:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
27 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
27 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 31:20
  --> /tmp/dojo-red-black-tree-2.almd:31:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
31 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
31 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 32:12
  --> /tmp/dojo-red-black-tree-2.almd:32:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
32 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
32 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:14:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
14 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:14:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
14 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:14:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
14 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:14:78
  in call to inorder()
  hint: Check the function name
   |
14 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:15:45
  in call to height()
  hint: Check the function name
   |
15 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:16:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
16 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:16:59
  in call to height()
  hint: Check the function name
   |
16 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:18:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
18 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:19:21
  in call to inorder()
  hint: Check the function name
   |
19 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:22:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
22 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:23:21
  in call to inorder()
  hint: Check the function name
   |
23 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-2.almd:28:17
  in variable t
  hint: Check the variable name
   |
28 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:28:17
  in call to height()
  hint: Check the function name
   |
28 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-2.almd:33:17
  in variable t
  hint: Check the variable name
   |
33 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:33:17
  in call to height()
  hint: Check the function name
   |
33 |   assert(height(t) < 11)
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
  match (color, left, value, right) with
    | (Black, Node(Red, Node(Red, a, x, b), y, c), z, d) => Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    | (Black, Node(Red, a, x, Node(Red, b, y, c)), z, d) => Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    | (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) => Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    | (Black, a, x, Node(Red, b, y, Node(Red, c, z, d))) => Node(R
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-3.almd
error: Expected LBrace at line 8:37 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-3.almd:8:37
  |
8 |   match (color, left, value, right) with
  |                                     ^
error: Expected ')' to close function call opened at line 26:20
  --> /tmp/dojo-red-black-tree-3.almd:26:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
26 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
26 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 27:12
  --> /tmp/dojo-red-black-tree-3.almd:27:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
27 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
27 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 31:20
  --> /tmp/dojo-red-black-tree-3.almd:31:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
31 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
31 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 32:12
  --> /tmp/dojo-red-black-tree-3.almd:32:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
32 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
32 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:14:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
14 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:14:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
14 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:14:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
14 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:14:78
  in call to inorder()
  hint: Check the function name
   |
14 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:15:45
  in call to height()
  hint: Check the function name
   |
15 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:16:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
16 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:16:59
  in call to height()
  hint: Check the function name
   |
16 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:18:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
18 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:19:21
  in call to inorder()
  hint: Check the function name
   |
19 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:22:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
22 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:23:21
  in call to inorder()
  hint: Check the function name
   |
23 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-3.almd:28:17
  in variable t
  hint: Check the variable name
   |
28 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:28:17
  in call to height()
  hint: Check the function name
   |
28 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-3.almd:33:17
  in variable t
  hint: Check the variable name
   |
33 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:33:17
  in call to height()
  hint: Check the function name
   |
33 |   assert(height(t) < 11)
   |                 ^

20 error(s) found
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-3.almd

1/1 test file(s) failed

```
