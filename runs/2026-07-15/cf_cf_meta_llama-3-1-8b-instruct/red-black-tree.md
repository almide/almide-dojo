# red-black-tree

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
type Color = | Red | Black

type Tree =
  | Leaf
  | Node(Color, Tree, Int, Tree)

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Black, Leaf, v, Leaf)
    Node(c, l, k, r) =>
      if v == k then t
      else
        let (l1, k1, r1) = split(t, k, v)
        let (l2, k2, r2) = split(t, k1, v)
        balance(l1, k1, l2, k2, r2)
  }

fn split(t: Tree, k: Int, v: Int) =
  match t {
    Leaf => (Leaf, k, Leaf)
    Node(c, l, k1, r) =>
      if k == k1 then (l, k, r)
      else
        let (l1, k2, r1) = split(r, k, v)
        if k2 < k then (Node(c, l, k1, l1), k1, r1)
        else (l1, k2, Node(c, r1,
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-red-black-tree-0.almd:13:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |         let (l1, k1, r1) = split(t, k, v)
   |         ^^^
error: Expected Arrow at line 18:35 (got Eq '=')
  --> /tmp/dojo-red-black-tree-0.almd:18:35
  hint: Use '->' for return type, not '='. Write: fn name() -> Type = body
   |
18 | fn split(t: Tree, k: Int, v: Int) =
   |                                   ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:28:78
  in call to inorder()
  hint: Check the function name
   |
28 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:29:45
  in call to height()
  hint: Check the function name
   |
29 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:30:59
  in call to height()
  hint: Check the function name
   |
30 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:33:21
  in call to inorder()
  hint: Check the function name
   |
33 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:37:21
  in call to inorder()
  hint: Check the function name
   |
37 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
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

fn split(t: Tree, k: Int, v: Int) -> (Tree, Int, Tree) =
  match t {
    Leaf => (Leaf, k, Leaf)
    Node(c, l, k1, r) =>
      if k == k1 then (l, k, r)
      else
        let (l1, k2, r1) = split(r, k, v)
        if k2 < k then (Node(c, l, k1, l1), k1, r1)
        else (l1, k2, Node(c, r1, k, Leaf))
  }

fn balance(l: Tree, k: Int, x: Int, r: Tree) -> Tree =
  match (l, k, r) {
    (Leaf, _, Leaf) => Node(Black, Leaf, x, Leaf)
    (Leaf, _, _) => Node(Red, Leaf, x, r)
    (_, _, Leaf) => Node(Red, l, k, Leaf)
    (_, _, _) =>
      let (l1, k1, r1
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-red-black-tree-1.almd:13:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |         let (l1, k2, r1) = split(r, k, v)
   |         ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-red-black-tree-1.almd:24:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
24 |       let (l1, k1, r1
   |       ^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:26:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
26 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:26:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
26 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:26:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
26 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:26:78
  in call to inorder()
  hint: Check the function name
   |
26 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:27:45
  in call to height()
  hint: Check the function name
   |
27 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:28:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
28 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:28:59
  in call to height()
  hint: Check the function name
   |
28 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:30:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
30 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:31:21
  in call to inorder()
  hint: Check the function name
   |
31 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:34:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
34 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:35:21
  in call to inorder()
  hint: Check the function name
   |
35 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:38:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
38 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, v))
   |                                                           ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:39:21
  in call to inorder()
  hint: Check the function name
   |
39 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:40:17
  in call to height()
  hint: Check the function name
   |
40 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:43:64
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
43 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                                                                ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:44:21
  in call to inorder()
  hint: Check the function name
   |
44 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:45:17
  in call to height()
  hint: Check the function name
   |
45 |   assert(height(t) < 11)
   |                 ^

19 error(s) found
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

fn split(t: Tree, k: Int, v: Int) -> (Tree, Int, Tree) =
  match t {
    Leaf => (Leaf, k, Leaf)
    Node(c, l, k1, r) =>
      if k == k1 then (l, k, r)
      else
        let (l1, k2, r1) = split(r, k, v)
        if k2 < k then (Node(c, l, k1, l1), k1, r1)
        else (l1, k2, Node(c, r1, k, Leaf))
  }

fn balance(l: Tree, k: Int, x: Int, r: Tree) -> Tree =
  match (l, k, r) {
    (Leaf, _, Leaf) => Node(Black, Leaf, x, Leaf)
    (Leaf, _, _) => Node(Red, Leaf, x, r)
    (_, _, Leaf) => Node(Red, l, k, Leaf)
    (_, _, _) =>
      let (l1, k1, r1
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-red-black-tree-2.almd:13:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |         let (l1, k2, r1) = split(r, k, v)
   |         ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-red-black-tree-2.almd:24:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
24 |       let (l1, k1, r1
   |       ^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:26:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
26 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:26:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
26 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:26:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
26 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:26:78
  in call to inorder()
  hint: Check the function name
   |
26 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:27:45
  in call to height()
  hint: Check the function name
   |
27 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:28:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
28 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:28:59
  in call to height()
  hint: Check the function name
   |
28 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:30:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
30 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:31:21
  in call to inorder()
  hint: Check the function name
   |
31 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:34:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
34 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:35:21
  in call to inorder()
  hint: Check the function name
   |
35 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:38:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
38 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, v))
   |                                                           ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:39:21
  in call to inorder()
  hint: Check the function name
   |
39 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:40:17
  in call to height()
  hint: Check the function name
   |
40 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:43:64
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
43 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                                                                ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:44:21
  in call to inorder()
  hint: Check the function name
   |
44 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:45:17
  in call to height()
  hint: Check the function name
   |
45 |   assert(height(t) < 11)
   |                 ^

19 error(s) found
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

fn split(t: Tree, k: Int, v: Int) -> (Tree, Int, Tree) =
  match t {
    Leaf => (Leaf, k, Leaf)
    Node(c, l, k1, r) =>
      if k == k1 then (l, k, r)
      else
        let (l1, k2, r1) = split(r, k, v)
        if k2 < k then (Node(c, l, k1, l1), k1, r1)
        else (l1, k2, Node(c, r1, k, Leaf))
  }

fn balance(l: Tree, k: Int, x: Int, r: Tree) -> Tree =
  match (l, k, r) {
    (Leaf, _, Leaf) => Node(Black, Leaf, x, Leaf)
    (Leaf, _, _) => Node(Red, Leaf, x, r)
    (_, _, Leaf) => Node(Red, l, k, Leaf)
    (_, _, _) =>
      let (l1, k1, r1
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-red-black-tree-3.almd:13:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |         let (l1, k2, r1) = split(r, k, v)
   |         ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-red-black-tree-3.almd:24:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
24 |       let (l1, k1, r1
   |       ^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:26:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
26 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:26:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
26 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:26:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
26 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:26:78
  in call to inorder()
  hint: Check the function name
   |
26 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:27:45
  in call to height()
  hint: Check the function name
   |
27 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:28:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
28 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:28:59
  in call to height()
  hint: Check the function name
   |
28 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:30:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
30 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:31:21
  in call to inorder()
  hint: Check the function name
   |
31 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:34:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
34 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:35:21
  in call to inorder()
  hint: Check the function name
   |
35 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:38:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
38 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, v))
   |                                                           ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:39:21
  in call to inorder()
  hint: Check the function name
   |
39 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:40:17
  in call to height()
  hint: Check the function name
   |
40 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:43:64
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
43 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                                                                ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:44:21
  in call to inorder()
  hint: Check the function name
   |
44 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:45:17
  in call to height()
  hint: Check the function name
   |
45 |   assert(height(t) < 11)
   |                 ^

19 error(s) found
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-3.almd

1/1 test file(s) failed

```
