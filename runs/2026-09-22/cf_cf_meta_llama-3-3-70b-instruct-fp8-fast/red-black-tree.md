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
  | (Black, Node(Red, a, x, b), y, Node(Red, c, z, d)) =>
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, d))
  | (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) =>
    Node(Red,
```

**Diagnostic:**

```
error: Expected LBrace at line 8:30 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-0.almd:8:30
  here: match (color, left, right) with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   match (color, left, right) with
  |                              ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:18:70
  in call to insert()
  here: test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
  hint: Did you mean `assert`?
  try:
      assert
   |
18 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:18:74
  in call to insert()
  here: test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
  hint: Did you mean `assert`?
  try:
      assert
   |
18 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:18:78
  in call to insert()
  here: test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
  hint: Did you mean `assert`?
  try:
      assert
   |
18 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:18:78
  in call to inorder()
  here: test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
  hint: Check the function name
   |
18 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:19:45
  in call to height()
  here: test "empty tree height" { assert_eq(height(Leaf), 0) }
  hint: Check the function name
   |
19 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:20:59
  in call to insert()
  here: test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
  hint: Did you mean `assert`?
  try:
      assert
   |
20 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:20:59
  in call to height()
  here: test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
  hint: Check the function name
   |
20 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:22:68
  in call to insert()
  here: let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
  hint: Did you mean `assert`?
  try:
      assert
   |
22 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:23:21
  in call to inorder()
  here: assert_eq(inorder(t), [1, 2, 3])
  hint: Check the function name
   |
23 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:26:81
  in call to insert()
  here: let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
  hint: Did you mean `assert`?
  try:
      assert
   |
26 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:27:21
  in call to inorder()
  here: assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
  hint: Check the function name
   |
27 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:30:59
  in call to insert()
  here: let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
  hint: Did you mean `assert`?
  try:
      assert
   |
30 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                                                           ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:31:21
  in call to inorder()
  here: assert_eq(inorder(t), 1...31)
  hint: Check the function name
   |
31 |   assert_eq(inorder(t), 1...31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:32:17
  in call to height()
  here: assert(height(t) < 11)
  hint: Check the function name
   |
32 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:35:64
  in call to insert()
  here: let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
  hint: Did you mean `assert`?
  try:
      assert
   |
35 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                                                                ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:36:21
  in call to inorder()
  here: assert_eq(inorder(t), 1...31)
  hint: Check the function name
   |
36 |   assert_eq(inorder(t), 1...31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:37:17
  in call to height()
  here: assert(height(t) < 11)
  hint: Check the function name
   |
37 |   assert(height(t) < 11)
   |                 ^

18 error(s) found
FAILED: /tmp/dojo-red-black-tree-0.almd
Compile error for /tmp/dojo-red-black-tree-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

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
  | (Black, Node(Red, a, x, b), y, Node(Red, c, z, d)) =>
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, d))
  | (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) =>
    Node(Red,
```

**Diagnostic:**

```
error: Expected LBrace at line 8:30 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-1.almd:8:30
  here: match (color, left, right) with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   match (color, left, right) with
  |                              ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:18:70
  in call to insert()
  here: test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
  hint: Did you mean `assert`?
  try:
      assert
   |
18 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:18:74
  in call to insert()
  here: test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
  hint: Did you mean `assert`?
  try:
      assert
   |
18 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:18:78
  in call to insert()
  here: test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
  hint: Did you mean `assert`?
  try:
      assert
   |
18 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:18:78
  in call to inorder()
  here: test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
  hint: Check the function name
   |
18 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:19:45
  in call to height()
  here: test "empty tree height" { assert_eq(height(Leaf), 0) }
  hint: Check the function name
   |
19 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:20:59
  in call to insert()
  here: test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
  hint: Did you mean `assert`?
  try:
      assert
   |
20 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:20:59
  in call to height()
  here: test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
  hint: Check the function name
   |
20 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:22:68
  in call to insert()
  here: let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
  hint: Did you mean `assert`?
  try:
      assert
   |
22 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:23:21
  in call to inorder()
  here: assert_eq(inorder(t), [1, 2, 3])
  hint: Check the function name
   |
23 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:26:81
  in call to insert()
  here: let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
  hint: Did you mean `assert`?
  try:
      assert
   |
26 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:27:21
  in call to inorder()
  here: assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
  hint: Check the function name
   |
27 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:30:59
  in call to insert()
  here: let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
  hint: Did you mean `assert`?
  try:
      assert
   |
30 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                                                           ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:31:21
  in call to inorder()
  here: assert_eq(inorder(t), 1...31)
  hint: Check the function name
   |
31 |   assert_eq(inorder(t), 1...31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:32:17
  in call to height()
  here: assert(height(t) < 11)
  hint: Check the function name
   |
32 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:35:64
  in call to insert()
  here: let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
  hint: Did you mean `assert`?
  try:
      assert
   |
35 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                                                                ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:36:21
  in call to inorder()
  here: assert_eq(inorder(t), 1...31)
  hint: Check the function name
   |
36 |   assert_eq(inorder(t), 1...31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:37:17
  in call to height()
  here: assert(height(t) < 11)
  hint: Check the function name
   |
37 |   assert(height(t) < 11)
   |                 ^

18 error(s) found
FAILED: /tmp/dojo-red-black-tree-1.almd
Compile error for /tmp/dojo-red-black-tree-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

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
  | (Black, Node(Red, a, x, b), y, Node(Red, c, z, d)) =>
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, d))
  | (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) =>
    Node(Red,
```

**Diagnostic:**

```
error: Expected LBrace at line 8:30 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-2.almd:8:30
  here: match (color, left, right) with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   match (color, left, right) with
  |                              ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:18:70
  in call to insert()
  here: test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
  hint: Did you mean `assert`?
  try:
      assert
   |
18 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:18:74
  in call to insert()
  here: test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
  hint: Did you mean `assert`?
  try:
      assert
   |
18 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:18:78
  in call to insert()
  here: test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
  hint: Did you mean `assert`?
  try:
      assert
   |
18 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:18:78
  in call to inorder()
  here: test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
  hint: Check the function name
   |
18 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:19:45
  in call to height()
  here: test "empty tree height" { assert_eq(height(Leaf), 0) }
  hint: Check the function name
   |
19 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:20:59
  in call to insert()
  here: test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
  hint: Did you mean `assert`?
  try:
      assert
   |
20 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:20:59
  in call to height()
  here: test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
  hint: Check the function name
   |
20 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:22:68
  in call to insert()
  here: let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
  hint: Did you mean `assert`?
  try:
      assert
   |
22 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:23:21
  in call to inorder()
  here: assert_eq(inorder(t), [1, 2, 3])
  hint: Check the function name
   |
23 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:26:81
  in call to insert()
  here: let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
  hint: Did you mean `assert`?
  try:
      assert
   |
26 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:27:21
  in call to inorder()
  here: assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
  hint: Check the function name
   |
27 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:30:59
  in call to insert()
  here: let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
  hint: Did you mean `assert`?
  try:
      assert
   |
30 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                                                           ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:31:21
  in call to inorder()
  here: assert_eq(inorder(t), 1...31)
  hint: Check the function name
   |
31 |   assert_eq(inorder(t), 1...31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:32:17
  in call to height()
  here: assert(height(t) < 11)
  hint: Check the function name
   |
32 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:35:64
  in call to insert()
  here: let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
  hint: Did you mean `assert`?
  try:
      assert
   |
35 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                                                                ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:36:21
  in call to inorder()
  here: assert_eq(inorder(t), 1...31)
  hint: Check the function name
   |
36 |   assert_eq(inorder(t), 1...31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:37:17
  in call to height()
  here: assert(height(t) < 11)
  hint: Check the function name
   |
37 |   assert(height(t) < 11)
   |                 ^

18 error(s) found
FAILED: /tmp/dojo-red-black-tree-2.almd
Compile error for /tmp/dojo-red-black-tree-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

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
  | (Black, Node(Red, a, x, b), y, Node(Red, c, z, d)) =>
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, d))
  | (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) =>
    Node(Red,
```

**Diagnostic:**

```
error: Expected LBrace at line 8:30 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-3.almd:8:30
  here: match (color, left, right) with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   match (color, left, right) with
  |                              ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:18:70
  in call to insert()
  here: test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
  hint: Did you mean `assert`?
  try:
      assert
   |
18 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:18:74
  in call to insert()
  here: test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
  hint: Did you mean `assert`?
  try:
      assert
   |
18 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:18:78
  in call to insert()
  here: test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
  hint: Did you mean `assert`?
  try:
      assert
   |
18 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:18:78
  in call to inorder()
  here: test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
  hint: Check the function name
   |
18 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:19:45
  in call to height()
  here: test "empty tree height" { assert_eq(height(Leaf), 0) }
  hint: Check the function name
   |
19 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:20:59
  in call to insert()
  here: test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
  hint: Did you mean `assert`?
  try:
      assert
   |
20 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:20:59
  in call to height()
  here: test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
  hint: Check the function name
   |
20 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:22:68
  in call to insert()
  here: let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
  hint: Did you mean `assert`?
  try:
      assert
   |
22 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:23:21
  in call to inorder()
  here: assert_eq(inorder(t), [1, 2, 3])
  hint: Check the function name
   |
23 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:26:81
  in call to insert()
  here: let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
  hint: Did you mean `assert`?
  try:
      assert
   |
26 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:27:21
  in call to inorder()
  here: assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
  hint: Check the function name
   |
27 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:30:59
  in call to insert()
  here: let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
  hint: Did you mean `assert`?
  try:
      assert
   |
30 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                                                           ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:31:21
  in call to inorder()
  here: assert_eq(inorder(t), 1...31)
  hint: Check the function name
   |
31 |   assert_eq(inorder(t), 1...31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:32:17
  in call to height()
  here: assert(height(t) < 11)
  hint: Check the function name
   |
32 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:35:64
  in call to insert()
  here: let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
  hint: Did you mean `assert`?
  try:
      assert
   |
35 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                                                                ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:36:21
  in call to inorder()
  here: assert_eq(inorder(t), 1...31)
  hint: Check the function name
   |
36 |   assert_eq(inorder(t), 1...31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:37:17
  in call to height()
  here: assert(height(t) < 11)
  hint: Check the function name
   |
37 |   assert(height(t) < 11)
   |                 ^

18 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
