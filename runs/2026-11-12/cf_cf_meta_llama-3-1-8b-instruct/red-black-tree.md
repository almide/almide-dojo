# red-black-tree

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
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
    | Leaf => Node(Black, Leaf, v, Leaf)
    | Node(c, l, x, r) =>
      if v == x then t
      else if v < x then balance(Node(c, l, v, r))
      else balance(Node(c, Node(Black, Leaf, v, Leaf), x, r))
  }

fn balance(t: Tree) -> Tree =
  match t {
    | Node(Red, Node(Red, l1, x1, l2), y, r) =>
      Node(Black, Node(Black, l1, x1, l2), y, r)
    | Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      Node(Black, l, x, Node(Black, r1, x1, r2))
    | Node(Red, l, x, Node(Black, r1, y, r2)) =>
      Node(Black, l, x, Node(Red, r1, y, Node(Black, Leaf, x, r2)))
    | Node(Red, l, x, r) =>
      Node(Black, Node(Red, l, x, Leaf), x, r)
    | Node(c, l, x, r) => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    | Leaf => List()
    | Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    | Leaf => 0
    | Node(_, l, _, r) => 1 + max(height(l), height(r))
  }
```

**Diagnostic:**

```
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:9:5
  here: | Leaf => Node(Black, Leaf, v, Leaf)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Leaf => Node(Black, Leaf, v, Leaf)
  |     ^
error: Expected pattern at line 18:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:18:5
  here: | Node(Red, Node(Red, l1, x1, l2), y, r) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
18 |     | Node(Red, Node(Red, l1, x1, l2), y, r) =>
   |     ^
error: Expected pattern at line 31:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:31:5
  here: | Leaf => List()
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
31 |     | Leaf => List()
   |     ^
error: Expected pattern at line 37:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:37:5
  here: | Leaf => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
37 |     | Leaf => 0
   |     ^

4 error(s) found
FAILED: /tmp/dojo-red-black-tree-0.almd
  parse error: Expected pattern at line 9:5 (got Pipe '|')
  parse error: Expected pattern at line 18:5 (got Pipe '|')
  parse error: Expected pattern at line 31:5 (got Pipe '|')
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

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf => Node(Black, Leaf, v, Leaf)
    | Node(c, l, x, r) =>
      if v == x then t
      else if v < x then balance(Node(c, l, v, r))
      else balance(Node(c, Node(Black, Leaf, v, Leaf), x, r))
  }

fn balance(t: Tree) -> Tree =
  match t {
    | Node(Red, Node(Red, l1, x1, l2), y, r) =>
      Node(Black, Node(Black, l1, x1, l2), y, r)
    | Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      Node(Black, l, x, Node(Black, r1, x1, r2))
    | Node(Red, l, x, Node(Black, r1, y, r2)) =>
      Node(Black, l, x, Node(Red, r1, y, Node(Black, Leaf, x, r2)))
    | Node(Red, l, x, r) =>
      Node(Black, Node(Red, l, x, Leaf), x, r)
    | Node(c, l, x, r) => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    | Leaf => List()
    | Node(_, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    | Leaf => 0
    | Node(_, l, _, r) => 1 + max(height(l), height(r))
  }
```

**Diagnostic:**

```
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:9:5
  here: | Leaf => Node(Black, Leaf, v, Leaf)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Leaf => Node(Black, Leaf, v, Leaf)
  |     ^
error: Expected pattern at line 18:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:18:5
  here: | Node(Red, Node(Red, l1, x1, l2), y, r) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
18 |     | Node(Red, Node(Red, l1, x1, l2), y, r) =>
   |     ^
error: Expected pattern at line 31:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:31:5
  here: | Leaf => List()
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
31 |     | Leaf => List()
   |     ^
error: Expected pattern at line 37:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:37:5
  here: | Leaf => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
37 |     | Leaf => 0
   |     ^

4 error(s) found
FAILED: /tmp/dojo-red-black-tree-1.almd
  parse error: Expected pattern at line 9:5 (got Pipe '|')
  parse error: Expected pattern at line 18:5 (got Pipe '|')
  parse error: Expected pattern at line 31:5 (got Pipe '|')
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

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf => Node(Black, Leaf, v, Leaf)
    | Node(c, l, x, r) =>
      if v == x then t
      else if v < x then balance(Node(c, l, v, r))
      else balance(Node(c, Node(Black, Leaf, v, Leaf), x, r))
  }

fn balance(t: Tree) -> Tree =
  match t {
    | Node(Red, Node(Red, l1, x1, l2), y, r) =>
      Node(Black, Node(Black, l1, x1, l2), y, r)
    | Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      Node(Black, l, x, Node(Black, r1, x1, r2))
    | Node(Red, l, x, Node(Black, r1, y, r2)) =>
      Node(Black, l, x, Node(Red, r1, y, Node(Black, Leaf, x, r2)))
    | Node(Red, l, x, r) =>
      Node(Black, Node(Red, l, x, Leaf), x, r)
    | Node(c, l, x, r) => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    | Leaf => List()
    | Node(_, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    | Leaf => 0
    | Node(_, l, _, r) => 1 + max(height(l), height(r))
  }
```

**Diagnostic:**

```
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:9:5
  here: | Leaf => Node(Black, Leaf, v, Leaf)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Leaf => Node(Black, Leaf, v, Leaf)
  |     ^
error: Expected pattern at line 18:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:18:5
  here: | Node(Red, Node(Red, l1, x1, l2), y, r) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
18 |     | Node(Red, Node(Red, l1, x1, l2), y, r) =>
   |     ^
error: Expected pattern at line 31:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:31:5
  here: | Leaf => List()
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
31 |     | Leaf => List()
   |     ^
error: Expected pattern at line 37:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:37:5
  here: | Leaf => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
37 |     | Leaf => 0
   |     ^

4 error(s) found
FAILED: /tmp/dojo-red-black-tree-2.almd
  parse error: Expected pattern at line 9:5 (got Pipe '|')
  parse error: Expected pattern at line 18:5 (got Pipe '|')
  parse error: Expected pattern at line 31:5 (got Pipe '|')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
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

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf => Node(Black, Leaf, v, Leaf)
    | Node(c, l, x, r) =>
      if v == x then t
      else if v < x then balance(Node(c, l, v, r))
      else balance(Node(c, Node(Black, Leaf, v, Leaf), x, r))
  }

fn balance(t: Tree) -> Tree =
  match t {
    | Node(Red, Node(Red, l1, x1, l2), y, r) =>
      Node(Black, Node(Black, l1, x1, l2), y, r)
    | Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      Node(Black, l, x, Node(Black, r1, x1, r2))
    | Node(Red, l, x, Node(Black, r1, y, r2)) =>
      Node(Black, l, x, Node(Red, r1, y, Node(Black, Leaf, x, r2)))
    | Node(Red, l, x, r) =>
      Node(Black, Node(Red, l, x, Leaf), x, r)
    | Node(c, l, x, r) => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    | Leaf => List()
    | Node(_, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    | Leaf => 0
    | Node(_, l, _, r) => 1 + max(height(l), height(r))
  }
```

**Diagnostic:**

```
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:9:5
  here: | Leaf => Node(Black, Leaf, v, Leaf)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Leaf => Node(Black, Leaf, v, Leaf)
  |     ^
error: Expected pattern at line 18:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:18:5
  here: | Node(Red, Node(Red, l1, x1, l2), y, r) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
18 |     | Node(Red, Node(Red, l1, x1, l2), y, r) =>
   |     ^
error: Expected pattern at line 31:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:31:5
  here: | Leaf => List()
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
31 |     | Leaf => List()
   |     ^
error: Expected pattern at line 37:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:37:5
  here: | Leaf => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
37 |     | Leaf => 0
   |     ^

4 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
  parse error: Expected pattern at line 9:5 (got Pipe '|')
  parse error: Expected pattern at line 18:5 (got Pipe '|')
  parse error: Expected pattern at line 31:5 (got Pipe '|')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-red-black-tree-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
