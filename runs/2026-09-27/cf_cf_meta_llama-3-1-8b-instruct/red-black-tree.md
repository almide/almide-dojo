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
      else if v < x then balance(Node(Red, l, v, r), x)
      else balance(Node(Red, Node(c, l, x, Leaf), v, r), x)
  }

fn balance(t: Tree, x: Int) -> Tree =
  match t {
    | Node(Red, Node(Red, l, a, m), b, r) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, t)
    | Node(Red, Node(Red, l, a, m), b, r) =>
      Node(Black, Node(Red, Node(Black, l, a, m), b, r), x, t)
    | Node(Red, l, a, Node(Red, m, b, r)) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, t)
    | Node(Red, l, a, Node(Red, m, b, r)) =>
      Node(Black, Node(Red, Node(Black, l, a, m), b, r), x, t)
    | _ => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    | Leaf => []
    | Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    | Leaf => 0
    | Node(c, l, _, r) => 1 + max(height(l), height(r))
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
  here: | Node(Red, Node(Red, l, a, m), b, r) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
18 |     | Node(Red, Node(Red, l, a, m), b, r) =>
   |     ^
error: Expected pattern at line 31:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:31:5
  here: | Leaf => []
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
31 |     | Leaf => []
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
      if v == x then Node(Black, Leaf, x, r)
      else if v < x then balance(Node(Red, l, v, r), x)
      else balance(Node(Red, Node(c, l, x, Leaf), v, r), x)
  }

fn balance(t: Tree, x: Int) -> Tree =
  match t {
    | Node(Red, Node(Red, l, a, m), b, r) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, t)
    | Node(Red, Node(Red, l, a, m), b, r) =>
      Node(Black, Node(Red, Node(Black, l, a, m), b, r), x, t)
    | Node(Red, l, a, Node(Red, m, b, r)) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, t)
    | Node(Red, l, a, Node(Red, m, b, r)) =>
      Node(Black, Node(Red, Node(Black, l, a, m), b, r), x, t)
    | _ => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    | Leaf => []
    | Node(c, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    | Leaf => 0
    | Node(c, l, _, r) => 1 + max(height(l), height(r))
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
  here: | Node(Red, Node(Red, l, a, m), b, r) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
18 |     | Node(Red, Node(Red, l, a, m), b, r) =>
   |     ^
error: Expected pattern at line 31:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:31:5
  here: | Leaf => []
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
31 |     | Leaf => []
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
      if v == x then Node(Black, Leaf, x, r)
      else if v < x then balance(Node(Red, l, v, r), x)
      else balance(Node(Red, Node(c, l, x, Leaf), v, r), x)
  }

fn balance(t: Tree, x: Int) -> Tree =
  match t {
    | Node(Red, Node(Red, l, a, m), b, r) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, t)
    | Node(Red, Node(Red, l, a, m), b, r) =>
      Node(Black, Node(Red, Node(Black, l, a, m), b, r), x, t)
    | Node(Red, l, a, Node(Red, m, b, r)) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, t)
    | Node(Red, l, a, Node(Red, m, b, r)) =>
      Node(Black, Node(Red, Node(Black, l, a, m), b, r), x, t)
    | _ => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    | Leaf => []
    | Node(c, l, x, r) => list.concat(list.map(l, (x) => x), [x], list.map(r, (x) => x))
  }

fn height(t: Tree) -> Int =
  match t {
    | Leaf => 0
    | Node(c, l, _, r) => 1 + list.max(list.map([height(l), height(r)], (x) => x))
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
  here: | Node(Red, Node(Red, l, a, m), b, r) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
18 |     | Node(Red, Node(Red, l, a, m), b, r) =>
   |     ^
error: Expected pattern at line 31:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:31:5
  here: | Leaf => []
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
31 |     | Leaf => []
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
      if v == x then Node(Black, Leaf, x, r)
      else if v < x then balance(Node(Red, l, v, r), x)
      else balance(Node(Red, Node(c, l, x, Leaf), v, r), x)
  }

fn balance(t: Tree, x: Int) -> Tree =
  match t {
    | Node(Red, Node(Red, l, a, m), b, r) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, t)
    | Node(Red, Node(Red, l, a, m), b, r) =>
      Node(Black, Node(Red, Node(Black, l, a, m), b, r), x, t)
    | Node(Red, l, a, Node(Red, m, b, r)) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, t)
    | Node(Red, l, a, Node(Red, m, b, r)) =>
      Node(Black, Node(Red, Node(Black, l, a, m), b, r), x, t)
    | _ => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    | Leaf => []
    | Node(c, l, x, r) => list.concat(list.map(l, (x) => x), [x], list.map(r, (x) => x))
  }

fn height(t: Tree) -> Int =
  match t {
    | Leaf => 0
    | Node(c, l, _, r) => 1 + list.max(list.map([height(l), height(r)], (x) => x))
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
  here: | Node(Red, Node(Red, l, a, m), b, r) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
18 |     | Node(Red, Node(Red, l, a, m), b, r) =>
   |     ^
error: Expected pattern at line 31:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:31:5
  here: | Leaf => []
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
31 |     | Leaf => []
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
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
