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

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf =>
      Node(Black, Leaf, v, Leaf)
    | Node(color, left, value, right) =>
      if value == v then
        Node(color, left, value, right)
      else if value < v then
        let right = insert(right, v)
        balance right
      else
        let left = insert(left, v)
        balance left
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    | Leaf => List()
    | Node(_, left, value, right) =>
      inorder left + [value] + inorder right
  }

fn height(t: Tree) -> Int =
  match t {
    | Leaf => 0
    | Node(_, left, _, right) =>
      max (height left) (height right) + 1
  }

fn balance(t: Tree) -> Tree =
  match t {
    | Node(color, left, value, right) =>
      let left_height = height left
      let right_height = height
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-0.almd
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:9:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Leaf =>
  |     ^
error: Expected pattern at line 24:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:24:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
24 |     | Leaf => List()
   |     ^
error: Expected pattern at line 31:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:31:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
31 |     | Leaf => 0
   |     ^
error: Expected pattern at line 38:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:38:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
38 |     | Node(color, left, value, right) =>
   |     ^

4 error(s) found
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

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf =>
      Node(Black, Leaf, v, Leaf)
    | Node(color, left, value, right) =>
      if value == v then
        Node(color, left, value, right)
      else if value < v then
        let right = insert(right, v)
        balance right
      else
        let left = insert(left, v)
        balance left
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    | Leaf => List()
    | Node(_, left, value, right) =>
      inorder left + [value] + inorder right
  }

fn height(t: Tree) -> Int =
  match t {
    | Leaf => 0
    | Node(_, left, _, right) =>
      max (height left) (height right) + 1
  }

fn balance(t: Tree) -> Tree =
  match t {
    | Node(color, left, value, right) =>
      let left_height = height left
      let right_height = height
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-1.almd
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:9:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Leaf =>
  |     ^
error: Expected pattern at line 24:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:24:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
24 |     | Leaf => List()
   |     ^
error: Expected pattern at line 31:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:31:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
31 |     | Leaf => 0
   |     ^
error: Expected pattern at line 38:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:38:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
38 |     | Node(color, left, value, right) =>
   |     ^

4 error(s) found
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

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf =>
      Node(Black, Leaf, v, Leaf)
    | Node(color, left, value, right) =>
      if value == v then
        Node(color, left, value, right)
      else if value < v then
        let right = insert(right, v)
        balance(right)
      else
        let left = insert(left, v)
        balance(left)
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    | Leaf => List()
    | Node(_, left, value, right) =>
      inorder(left) + [value] + inorder(right)
  }

fn height(t: Tree) -> Int =
  match t {
    | Leaf => 0
    | Node(_, left, _, right) =>
      max(height(left), height(right)) + 1
  }

fn balance(t: Tree) -> Tree =
  match t {
    | Node(color, left, value, right) =>
      let left_height = height(left)
      let right_height = height(right
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-2.almd
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:9:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Leaf =>
  |     ^
error: Expected pattern at line 24:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:24:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
24 |     | Leaf => List()
   |     ^
error: Expected pattern at line 31:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:31:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
31 |     | Leaf => 0
   |     ^
error: Expected pattern at line 38:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:38:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
38 |     | Node(color, left, value, right) =>
   |     ^

4 error(s) found
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
    | Node(color, left, value, right) =>
      let left_height = height(left)
      let right_height = height(right)
      if left_height == right_height + 1 then
        let Node(_, left_left, value_left, left_right) = left
        if height(left_left) >= height(left_right) then
          let Node(new_color, new_left, new_value, new_right) = balance(right)
          Node(new_color, Node(Black, left, value, left_right), new_value, new_left)
        else
          let Node(new_color, new_left, new_value, new_right) = balance(left)
          Node(new_color, new_left, value, Node(Black, right, new_value, left_right))
      else if right_height == left_height + 1 then
        let Node(_, right_left, value_right, right_right) = right
        if height(right_right) >= height(right_left) then
          let Node(new_color, new_left, new_value, new_right) = balance(left)
          Node
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-3.almd
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:9:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Node(color, left, value, right) =>
  |     ^
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

18 error(s) found
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-3.almd

1/1 test file(s) failed

```
