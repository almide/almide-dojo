# red-black-tree

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: wrong-output

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
  match t {
    Leaf => Node(Red, Leaf, v, Leaf)
    Node(color, left, value, right) =>
      if v < value then
        balance(color, insert(left, v), value, right)
      else if v > value then
        balance(color, left, value, insert(right, v))
      else t
  }
  |> (x) =>
    match x {
      Node(_, left, value, right) => Node(Black, left, value, right)
      _ => x
    }

fn inorder(t) =
  match t {
    Leaf => []
    Node(_, left, value, right) => inorder(left) + [value] + inorder(right)
  }

fn height(t) =
  match t {
    Leaf => 0
    Node(_, left, _, right) => 1 + int.max(height(left), height(right))
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
error: Expected Colon at line 36:13 (got RParen ')')
  --> /tmp/dojo-red-black-tree-0.almd:36:13
  here: fn inorder(t) =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
36 | fn inorder(t) =
   |             ^
error: Expected Colon at line 42:12 (got RParen ')')
  --> /tmp/dojo-red-black-tree-0.almd:42:12
  here: fn height(t) =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
42 | fn height(t) =
   |            ^

4 error(s) found
FAILED: /tmp/dojo-red-black-tree-0.almd
  parse error: Expected Colon at line 7:17 (got Comma ',')
  parse error: Expected Colon at line 20:12 (got Comma ',')
  parse error: Expected Colon at line 36:13 (got RParen ')')
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
  match t {
    Leaf => Node(Red, Leaf, v, Leaf)
    Node(color, left, value, right) =>
      if v < value then
        balance(color, insert(left, v), value, right)
      else if v > value then
        balance(color, left, value, insert(right, v))
      else t
  }
  |> (x) =>
    match x {
      Node(_, left, value, right) => Node(Black, left, value, right)
      _ => x
    }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(_, left, value, right) => inorder(left) + [value] + inorder(right)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, left, _, right) => 1 + int.max(height(left), height(right))
  }
```

**Diagnostic:**

```
FAILED: /tmp/dojo-red-black-tree-1.almd
  test: ascending 1...31 stays balanced
  at:   /tmp/dojo-red-black-tree-1.almd:62
  error: assertion failed
  test: descending 31..1 stays balanced
  at:   /tmp/dojo-red-black-tree-1.almd:67
  error: assertion failed

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
  let ins = 
    match t {
      Leaf => Node(Red, Leaf, v, Leaf)
      Node(color, left, value, right) =>
        if v < value then
          balance(color, insert(left, v), value, right)
        else if v > value then
          balance(color, left, value, insert(right, v))
        else t
    }
  in
  match ins {
    Node(_, left, value, right) => Node(Black, left, value, right)
    _ => ins
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(_, left, value, right) => inorder(left) + [value] + inorder(right)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, left, _, right) => 1 + int.max(height(left), height(right))
  }
```

**Diagnostic:**

```
FAILED: /tmp/dojo-red-black-tree-2.almd
  test: ascending 1...31 stays balanced
  at:   /tmp/dojo-red-black-tree-2.almd:63
  error: assertion failed
  test: descending 31..1 stays balanced
  at:   /tmp/dojo-red-black-tree-2.almd:68
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
  let ins = 
    match t {
      Leaf => Node(Red, Leaf, v, Leaf)
      Node(color, left, value, right) =>
        if v < value then
          balance(color, insert(left, v), value, right)
        else if v > value then
          balance(color, left, value, insert(right, v))
        else t
    }
  in
  match ins {
    Node(_, left, value, right) => Node(Black, left, value, right)
    _ => ins
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(_, left, value, right) => inorder(left) + [value] + inorder(right)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, left, _, right) => 1 + int.max(height(left), height(right))
  }
```

**Diagnostic:**

```
FAILED: /tmp/dojo-red-black-tree-3.almd
  test: ascending 1...31 stays balanced
  at:   /tmp/dojo-red-black-tree-3.almd:63
  error: assertion failed
  test: descending 31..1 stays balanced
  at:   /tmp/dojo-red-black-tree-3.almd:68
  error: assertion failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
