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

fn balance(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf => Node(Red, Leaf, v, Leaf)
    | Node(color, left, value, right) =>
      if value < v then
        match left {
          | Leaf => Node(color, Leaf, value, right)
          | Node(_, l, _, r) => match r {
            | Leaf => Node(color, Node(Red, l, value, Leaf), v, r)
            | Node(_, _, _, _) => Node(Red, Node(Red, l, value, r), v, right)
          }
        }
      else if value > v then
        match right {
          | Leaf => Node(color, left, value, Leaf)
          | Node(_, _, _, _) => match l {
            | Leaf => Node(color, left, value, Node(Red, Leaf, v, r))
            | Node(_, l2, _, _) => Node(Red, Node(Red, l2, value, left), v, r)
          }
        }
      else
        match color {
          |
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-0.almd
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:9:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Leaf => Node(Red, Leaf, v, Leaf)
  |     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:31:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
31 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:31:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
31 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:31:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
31 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:31:78
  in call to inorder()
  hint: Check the function name
   |
31 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:32:45
  in call to height()
  hint: Check the function name
   |
32 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:33:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
33 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:33:59
  in call to height()
  hint: Check the function name
   |
33 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:35:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
35 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:36:21
  in call to inorder()
  hint: Check the function name
   |
36 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:39:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
39 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:40:21
  in call to inorder()
  hint: Check the function name
   |
40 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:43:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
43 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, v))
   |                                                           ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:44:21
  in call to inorder()
  hint: Check the function name
   |
44 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:45:17
  in call to height()
  hint: Check the function name
   |
45 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:48:64
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
48 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                                                                ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:49:21
  in call to inorder()
  hint: Check the function name
   |
49 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:50:17
  in call to height()
  hint: Check the function name
   |
50 |   assert(height(t) < 11)
   |                 ^

18 error(s) found
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

fn balance(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf => Node(Red, Leaf, v, Leaf)
    | Node(color, left, value, right) =>
      if value < v then
        match left {
          | Leaf => Node(color, Leaf, value, right)
          | Node(_, l, _, r) =>
            match r {
              | Leaf => Node(color, Node(Red, l, value, Leaf), v, r)
              | Node(_, _, _, _) => Node(Red, Node(Red, l, value, r), v, right)
            }
        }
      else if value > v then
        match right {
          | Leaf => Node(color, left, value, Leaf)
          | Node(_, _, _, _) =>
            match l {
              | Leaf => Node(color, left, value, Node(Red, Leaf, v, r))
              | Node(_, l2, _, _) => Node(Red, Node(Red, l2, value, left), v, r)
            }
        }
      else
        match color {
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-1.almd
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:9:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Leaf => Node(Red, Leaf, v, Leaf)
  |     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:32:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
32 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:32:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
32 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:32:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
32 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:32:78
  in call to inorder()
  hint: Check the function name
   |
32 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:33:45
  in call to height()
  hint: Check the function name
   |
33 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:34:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
34 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:34:59
  in call to height()
  hint: Check the function name
   |
34 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:36:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
36 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:37:21
  in call to inorder()
  hint: Check the function name
   |
37 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:40:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
40 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:41:21
  in call to inorder()
  hint: Check the function name
   |
41 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:44:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
44 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, v))
   |                                                           ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:45:21
  in call to inorder()
  hint: Check the function name
   |
45 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:46:17
  in call to height()
  hint: Check the function name
   |
46 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:49:64
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
49 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                                                                ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:50:21
  in call to inorder()
  hint: Check the function name
   |
50 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:51:17
  in call to height()
  hint: Check the function name
   |
51 |   assert(height(t) < 11)
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

fn balance(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf => Node(Red, Leaf, v, Leaf)
    | Node(color, left, value, right) =>
      if value < v then
        match left {
          | Leaf => Node(color, Leaf, value, right)
          | Node(_, l, _, r) =>
            match r {
              | Leaf => Node(color, Node(Red, l, value, Leaf), v, r)
              | Node(_, _, _, _) => Node(Red, Node(Red, l, value, r), v, right)
            }
        }
      else if value > v then
        match right {
          | Leaf => Node(color, left, value, Leaf)
          | Node(_, _, _, _) =>
            match l {
              | Leaf => Node(color, left, value, Node(Red, Leaf, v, r))
              | Node(_, l2, _, _) => Node(Red, Node(Red, l2, value, left), v, r)
            }
        }
      else
        match color {
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-2.almd
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:9:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Leaf => Node(Red, Leaf, v, Leaf)
  |     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:32:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
32 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:32:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
32 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:32:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
32 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:32:78
  in call to inorder()
  hint: Check the function name
   |
32 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:33:45
  in call to height()
  hint: Check the function name
   |
33 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:34:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
34 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:34:59
  in call to height()
  hint: Check the function name
   |
34 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:36:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
36 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:37:21
  in call to inorder()
  hint: Check the function name
   |
37 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:40:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
40 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:41:21
  in call to inorder()
  hint: Check the function name
   |
41 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:44:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
44 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, v))
   |                                                           ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:45:21
  in call to inorder()
  hint: Check the function name
   |
45 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:46:17
  in call to height()
  hint: Check the function name
   |
46 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:49:64
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
49 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                                                                ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:50:21
  in call to inorder()
  hint: Check the function name
   |
50 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:51:17
  in call to height()
  hint: Check the function name
   |
51 |   assert(height(t) < 11)
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

fn balance(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf => Node(Red, Leaf, v, Leaf)
    | Node(color, left, value, right) =>
      if value < v then
        match left {
          | Leaf => Node(color, Leaf, value, right)
          | Node(_, l, _, r) =>
            match r {
              | Leaf => Node(color, Node(Red, l, value, Leaf), v, r)
              | Node(_, _, _, _) => Node(Red, Node(Red, l, value, r), v, right)
            }
        }
      else if value > v then
        match right {
          | Leaf => Node(color, left, value, Leaf)
          | Node(_, _, _, _) =>
            match l {
              | Leaf => Node(color, left, value, Node(Red, Leaf, v, r))
              | Node(_, l2, _, _) => Node(Red, Node(Red, l2, value, left), v, r)
            }
        }
      else
        match color {
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-3.almd
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:9:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Leaf => Node(Red, Leaf, v, Leaf)
  |     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:32:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
32 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:32:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
32 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:32:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
32 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:32:78
  in call to inorder()
  hint: Check the function name
   |
32 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:33:45
  in call to height()
  hint: Check the function name
   |
33 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:34:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
34 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:34:59
  in call to height()
  hint: Check the function name
   |
34 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:36:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
36 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:37:21
  in call to inorder()
  hint: Check the function name
   |
37 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:40:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
40 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:41:21
  in call to inorder()
  hint: Check the function name
   |
41 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:44:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
44 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, v))
   |                                                           ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:45:21
  in call to inorder()
  hint: Check the function name
   |
45 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:46:17
  in call to height()
  hint: Check the function name
   |
46 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:49:64
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
49 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                                                                ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:50:21
  in call to inorder()
  hint: Check the function name
   |
50 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:51:17
  in call to height()
  hint: Check the function name
   |
51 |   assert(height(t) < 11)
   |                 ^

18 error(s) found
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-3.almd

1/1 test file(s) failed

```
