# red-black-tree

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
type Color = 
  | Red 
  | Black

type Tree = 
  | Leaf 
  | Node(Color, Tree, Int, Tree)

fn balance(color, left, value, right) -> Tree = 
  match (color, left, right) {
    (Black, Node(Red, Node(Red, a, x, b), y, c), d) => 
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, d))
    (Black, Node(Red, a, x, Node(Red, b, y, c)), d) => 
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, d))
    (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) => 
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    (Black, a, x, Node(Red, b, y, Node(Red, c, z, d))) => 
      Node(Red, Node(Black
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-0.almd
error: Expected Colon at line 9:17 (got Comma ',')
  --> /tmp/dojo-red-black-tree-0.almd:9:17
  |
9 | fn balance(color, left, value, right) -> Tree =
  |                 ^
error: Expected ')' to close function call opened at line 32:20
  --> /tmp/dojo-red-black-tree-0.almd:32:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
32 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
32 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 33:12
  --> /tmp/dojo-red-black-tree-0.almd:33:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
33 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
33 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 37:20
  --> /tmp/dojo-red-black-tree-0.almd:37:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
37 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
37 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 38:12
  --> /tmp/dojo-red-black-tree-0.almd:38:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
38 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
38 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:20:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
20 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:20:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
20 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:20:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
20 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:20:78
  in call to inorder()
  hint: Check the function name
   |
20 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:21:45
  in call to height()
  hint: Check the function name
   |
21 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:22:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
22 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:22:59
  in call to height()
  hint: Check the function name
   |
22 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:24:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
24 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:25:21
  in call to inorder()
  hint: Check the function name
   |
25 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:28:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
28 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:29:21
  in call to inorder()
  hint: Check the function name
   |
29 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-0.almd:34:17
  in variable t
  hint: Check the variable name
   |
34 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:34:17
  in call to height()
  hint: Check the function name
   |
34 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-0.almd:39:17
  in variable t
  hint: Check the variable name
   |
39 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:39:17
  in call to height()
  hint: Check the function name
   |
39 |   assert(height(t) < 11)
   |                 ^

20 error(s) found
Compile error for /tmp/dojo-red-black-tree-0.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
type Color = 
  | Red 
  | Black

type Tree = 
  | Leaf 
  | Node(Color, Tree, Int, Tree)

fn balance(color, left, value, right) -> Tree = 
  match (color, left, right) {
    (Black, Node(Red, Node(Red, a, x, b), y, c), d) => 
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, d))
    (Black, Node(Red, a, x, Node(Red, b, y, c)), d) => 
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, d))
    (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) => 
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    (Black, a, x, Node(Red, b, y, Node(Red, c, z, d))) => 
      Node(Red, Node(Black
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-1.almd
error: Expected Colon at line 9:17 (got Comma ',')
  --> /tmp/dojo-red-black-tree-1.almd:9:17
  |
9 | fn balance(color, left, value, right) -> Tree =
  |                 ^
error: Expected ')' to close function call opened at line 32:20
  --> /tmp/dojo-red-black-tree-1.almd:32:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
32 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
32 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 33:12
  --> /tmp/dojo-red-black-tree-1.almd:33:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
33 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
33 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 37:20
  --> /tmp/dojo-red-black-tree-1.almd:37:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
37 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
37 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 38:12
  --> /tmp/dojo-red-black-tree-1.almd:38:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
38 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
38 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:20:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
20 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:20:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
20 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:20:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
20 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:20:78
  in call to inorder()
  hint: Check the function name
   |
20 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:21:45
  in call to height()
  hint: Check the function name
   |
21 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:22:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
22 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:22:59
  in call to height()
  hint: Check the function name
   |
22 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:24:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
24 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:25:21
  in call to inorder()
  hint: Check the function name
   |
25 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:28:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
28 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:29:21
  in call to inorder()
  hint: Check the function name
   |
29 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-1.almd:34:17
  in variable t
  hint: Check the variable name
   |
34 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:34:17
  in call to height()
  hint: Check the function name
   |
34 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-1.almd:39:17
  in variable t
  hint: Check the variable name
   |
39 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:39:17
  in call to height()
  hint: Check the function name
   |
39 |   assert(height(t) < 11)
   |                 ^

20 error(s) found
Compile error for /tmp/dojo-red-black-tree-1.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
type Color = 
  | Red 
  | Black

type Tree = 
  | Leaf 
  | Node(Color, Tree, Int, Tree)

fn balance(color, left, value, right) -> Tree = 
  match (color, left, right) {
    (Black, Node(Red, Node(Red, a, x, b), y, c), d) => 
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, d))
    (Black, Node(Red, a, x, Node(Red, b, y, c)), d) => 
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, d))
    (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) => 
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    (Black, a, x, Node(Red, b, y, Node(Red, c, z, d))) => 
      Node(Red, Node(Black
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-2.almd
error: Expected Colon at line 9:17 (got Comma ',')
  --> /tmp/dojo-red-black-tree-2.almd:9:17
  |
9 | fn balance(color, left, value, right) -> Tree =
  |                 ^
error: Expected ')' to close function call opened at line 32:20
  --> /tmp/dojo-red-black-tree-2.almd:32:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
32 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
32 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 33:12
  --> /tmp/dojo-red-black-tree-2.almd:33:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
33 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
33 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 37:20
  --> /tmp/dojo-red-black-tree-2.almd:37:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
37 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
37 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 38:12
  --> /tmp/dojo-red-black-tree-2.almd:38:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
38 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
38 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:20:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
20 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:20:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
20 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:20:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
20 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:20:78
  in call to inorder()
  hint: Check the function name
   |
20 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:21:45
  in call to height()
  hint: Check the function name
   |
21 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:22:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
22 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:22:59
  in call to height()
  hint: Check the function name
   |
22 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:24:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
24 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:25:21
  in call to inorder()
  hint: Check the function name
   |
25 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:28:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
28 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:29:21
  in call to inorder()
  hint: Check the function name
   |
29 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-2.almd:34:17
  in variable t
  hint: Check the variable name
   |
34 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:34:17
  in call to height()
  hint: Check the function name
   |
34 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-2.almd:39:17
  in variable t
  hint: Check the variable name
   |
39 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:39:17
  in call to height()
  hint: Check the function name
   |
39 |   assert(height(t) < 11)
   |                 ^

20 error(s) found
Compile error for /tmp/dojo-red-black-tree-2.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
type Color = 
  | Red 
  | Black

type Tree = 
  | Leaf 
  | Node(Color, Tree, Int, Tree)

fn balance(color, left, value, right) -> Tree = 
  match (color, left, right) {
    (Black, Node(Red, Node(Red, a, x, b), y, c), d) => 
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, d))
    (Black, Node(Red, a, x, Node(Red, b, y, c)), d) => 
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, d))
    (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) => 
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    (Black, a, x, Node(Red, b, y, Node(Red, c, z, d))) => 
      Node(Red, Node(Black
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-3.almd
error: Expected Colon at line 9:17 (got Comma ',')
  --> /tmp/dojo-red-black-tree-3.almd:9:17
  |
9 | fn balance(color, left, value, right) -> Tree =
  |                 ^
error: Expected ')' to close function call opened at line 32:20
  --> /tmp/dojo-red-black-tree-3.almd:32:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
32 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
32 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 33:12
  --> /tmp/dojo-red-black-tree-3.almd:33:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
33 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
33 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 37:20
  --> /tmp/dojo-red-black-tree-3.almd:37:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
37 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
37 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 38:12
  --> /tmp/dojo-red-black-tree-3.almd:38:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
38 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
38 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:20:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
20 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:20:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
20 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:20:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
20 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:20:78
  in call to inorder()
  hint: Check the function name
   |
20 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:21:45
  in call to height()
  hint: Check the function name
   |
21 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:22:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
22 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:22:59
  in call to height()
  hint: Check the function name
   |
22 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:24:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
24 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:25:21
  in call to inorder()
  hint: Check the function name
   |
25 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:28:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
28 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:29:21
  in call to inorder()
  hint: Check the function name
   |
29 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-3.almd:34:17
  in variable t
  hint: Check the variable name
   |
34 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:34:17
  in call to height()
  hint: Check the function name
   |
34 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-3.almd:39:17
  in variable t
  hint: Check the variable name
   |
39 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:39:17
  in call to height()
  hint: Check the function name
   |
39 |   assert(height(t) < 11)
   |                 ^

20 error(s) found
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-3.almd

1/1 test file(s) failed

```
