# red-black-tree

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E012`

## Attempts

### Attempt 1 (FAIL)

```almide
type Color = | Red | Black

type Tree =
  | Leaf
  | Node(Color, Tree, Int, Tree)

fn balance(color, left, value, right) =
  match (color, left, value, right) {
    (Black, Node(Red, Node(Red, a, x, b), y, c), z, d) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    (Black, Node(Red, a, x, Node(Red, b, y, c)), z, d) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    (Black, a, x, Node(Red, b, y, Node(Red, c, z, d))) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    _ => Node(color, left, value, right)
  }

fn insert(t, v) =
  let ins = (t, v) =>
    match t {
      Leaf => Node(Red, Leaf, v, Leaf)
      Node(color, left, value, right) =>
        if v < value then
          balance(color, ins(left, v), value, right)
        else if v > value then
          balance(color, left, value, ins(right, v))
        else
          t
    }
  in
  match ins(t, v) {
    Node(_, left, value, right) => Node(Black, left, value, right)
    Leaf => Leaf
  }

fn inorder(t) =
  match t {
    Leaf => []
    Node(_, left, value, right) =>
      inorder(left) + [value] + inorder(right)
  }

fn height(t) =
  match t {
    Leaf => 0
    Node(_, left, _, right) =>
      1 + int.max(height(left), height(right))
  }
```

**Diagnostic:**

```
error: Expected Colon at line 7:17 (got Comma ',')
  --> /tmp/dojo-red-black-tree-0.almd:7:17
  here: fn balance(color, left, value, right) =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 | fn balance(color, left, value, right) =
  |                 ^
error: Expected Colon at line 20:12 (got Comma ',')
  --> /tmp/dojo-red-black-tree-0.almd:20:12
  here: fn insert(t, v) =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 | fn insert(t, v) =
   |            ^
error: Expected Colon at line 38:13 (got RParen ')')
  --> /tmp/dojo-red-black-tree-0.almd:38:13
  here: fn inorder(t) =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
38 | fn inorder(t) =
   |             ^
error: Expected Colon at line 45:12 (got RParen ')')
  --> /tmp/dojo-red-black-tree-0.almd:45:12
  here: fn height(t) =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
45 | fn height(t) =
   |            ^

4 error(s) found
FAILED: /tmp/dojo-red-black-tree-0.almd
  parse error: Expected Colon at line 7:17 (got Comma ',')
  parse error: Expected Colon at line 20:12 (got Comma ',')
  parse error: Expected Colon at line 38:13 (got RParen ')')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
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
  match (color, left, value, right) {
    (Black, Node(Red, Node(Red, a, x, b), y, c), z, d) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    (Black, Node(Red, a, x, Node(Red, b, y, c)), z, d) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    (Black, a, x, Node(Red, b, y, Node(Red, c, z, d))) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    _ => Node(color, left, value, right)
  }

fn insert(t: Tree, v: Int) -> Tree =
  let ins = (t: Tree, v: Int) -> Tree =
    match t {
      Leaf => Node(Red, Leaf, v, Leaf)
      Node(color, left, value, right) =>
        if v < value then
          balance(color, ins(left, v), value, right)
        else if v > value then
          balance(color, left, value, ins(right, v))
        else
          t
    }
  in
  match ins(t, v) {
    Node(_, left, value, right) => Node(Black, left, value, right)
    Leaf => Leaf
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(_, left, value, right) =>
      inorder(left) + [value] + inorder(right)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, left, _, right) =>
      1 + int.max(height(left), height(right))
  }
```

**Diagnostic:**

```
error: Expected ')' to close type-ascribed expression opened at line 21:13
  --> /tmp/dojo-red-black-tree-1.almd:21:21
  here: let ins = (t: Tree, v: Int) -> Tree =
  hint: Add ')' or check for a missing delimiter inside the type-ascribed expression
   |
21 |   let ins = (t: Tree, v: Int) -> Tree =
   |             --------------- '(' opened here
   |
21 |   let ins = (t: Tree, v: Int) -> Tree =
   |                     ^
error: Expected expression at line 32:3 (got In 'in')
  --> /tmp/dojo-red-black-tree-1.almd:32:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
32 |   in
   |   ^
error[E002]: undefined function 'ins'
  --> /tmp/dojo-red-black-tree-1.almd:26:26
  in call to ins()
  here: balance(color, ins(left, v), value, right)
  hint: Did you mean `insert`?
  try:
      insert
   |
26 |           balance(color, ins(left, v), value, right)
   |                          ^^^
error[E002]: undefined function 'ins'
  --> /tmp/dojo-red-black-tree-1.almd:28:39
  in call to ins()
  here: balance(color, left, value, ins(right, v))
  hint: Did you mean `insert`?
  try:
      insert
   |
28 |           balance(color, left, value, ins(right, v))
   |                                       ^^^
error[E002]: undefined function 'ins'
  --> /tmp/dojo-red-black-tree-1.almd:33:9
  in call to ins()
  here: match ins(t, v) {
  hint: Did you mean `insert`?
  try:
      insert
   |
33 |   match ins(t, v) {
   |         ^^^

5 error(s) found
FAILED: /tmp/dojo-red-black-tree-1.almd
  parse error: Expected ')' to close type-ascribed expression opened at line 21:13
  parse error: Expected expression at line 32:3 (got In 'in')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
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
  match (color, left, value, right) {
    (Black, Node(Red, Node(Red, a, x, b), y, c), z, d) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    (Black, Node(Red, a, x, Node(Red, b, y, c)), z, d) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    (Black, a, x, Node(Red, b, y, Node(Red, c, z, d))) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    _ => Node(color, left, value, right)
  }

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Red, Leaf, v, Leaf)
    Node(color, left, value, right) =>
      if v < value then
        balance(color, insert(left, v), value, right)
      else if v > value then
        balance(color, left, value, insert(right, v))
      else
        t
  }

fn insert_final(t: Tree) -> Tree =
  match t {
    Node(_, left, value, right) => Node(Black, left, value, right)
    Leaf => Leaf
  }

fn final_insert(t: Tree, v: Int) -> Tree =
  insert_final(insert(t, v))

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(_, left, value, right) =>
      inorder(left) + [value] + inorder(right)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, left, _, right) =>
      1 + int.max(height(left), height(right))
  }
```

**Diagnostic:**

```
FAILED: /tmp/dojo-red-black-tree-2.almd
  test: ascending 1...31 stays balanced
  at:   /tmp/dojo-red-black-tree-2.almd:69
  error: assertion failed
  test: descending 31..1 stays balanced
  at:   /tmp/dojo-red-black-tree-2.almd:74
  error: assertion failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
type Color = | Red | Black

type Tree =
  | Leaf
  | Node(Color, Tree, Int, Tree)

fn balance(color: Color, left: Tree, value: Int, right: Tree) -> Tree =
  match (color, left, value, right) {
    (Black, Node(Red, Node(Red, a, x, b), y, c), z, d) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    (Black, Node(Red, a, x, Node(Red, b, y, c)), z, d) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    (Black, a, x, Node(Red, b, y, Node(Red, c, z, d))) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    _ => Node(color, left, value, right)
  }

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Red, Leaf, v, Leaf)
    Node(color, left, value, right) =>
      if v < value then
        balance(color, insert(left, v), value, right)
      else if v > value then
        balance(color, left, value, insert(right, v))
      else
        t
  }

fn insert_final(t: Tree) -> Tree =
  match t {
    Node(_, left, value, right) => Node(Black, left, value, right)
    Leaf => Leaf
  }

fn final_insert(t: Tree, v: Int) -> Tree =
  insert_final(insert(t, v))

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(_, left, value, right) =>
      inorder(left) + [value] + inorder(right)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, left, _, right) =>
      1 + int.max(height(left), height(right))
  }

fn insert(t: Tree, v: Int) -> Tree =
  insert_final(insert(t, v))

fn main() -> Unit =
  let t = list.fold(list.range(1, 31), Leaf, (acc, x) => insert(acc, x)) in
  assert(height(t) <= 10)

fn main2() -> Unit =
  let t = list.fold(list.range(31, 1), Leaf, (acc, x) => insert(acc, x)) in
  assert(height(t) <= 10)
```

**Diagnostic:**

```
error[E012]: duplicate function 'insert'
  at line 55
  in fn insert
  here: fn insert(t: Tree, v: Int) -> Tree =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
20 | fn insert(t: Tree, v: Int) -> Tree =
   | --------------------------------- first definition of 'insert' here
...
55 | fn insert(t: Tree, v: Int) -> Tree =
   | ^

1 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
