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
      else if v < x then balance(Node(Red, insert(l, v), x, r), c)
      else balance(Node(Red, l, x, insert(r, v)), c)
  }

fn balance(t: Tree, c: Color) -> Tree =
  match t {
    | Leaf => t
    | Node(Red, l, x, r) =>
      match (l, r) {
        | (Leaf, Leaf) => t
        | (Leaf, Node(Red, ll, y, rl)) => Node(Red, Node(Black, ll, y, rl), x, r)
        | (Node(Red, ll, y, rl), Leaf) => Node(Red, Node(Black, ll, y, rl), x, r)
        | (Node(Red, ll, y, Node(Red, lll, z, lllr)), Node(Red, rr, w, rrr)) =>
          Node(Black, Node(Red, Node(Black, ll, y, rr), z, lllr), x, Node(Red, rr, w, rrr))
      }
    | Node(Black, l, x, r) => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    | Leaf => List()
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
  here: | Leaf => t
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
18 |     | Leaf => t
   |     ^
error: Expected pattern at line 32:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:32:5
  here: | Leaf => List()
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     | Leaf => List()
   |     ^
error: Expected pattern at line 38:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:38:5
  here: | Leaf => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
38 |     | Leaf => 0
   |     ^

4 error(s) found
FAILED: /tmp/dojo-red-black-tree-0.almd
  parse error: Expected pattern at line 9:5 (got Pipe '|')
  parse error: Expected pattern at line 18:5 (got Pipe '|')
  parse error: Expected pattern at line 32:5 (got Pipe '|')
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
      else if v < x then balance(Node(Red, insert(l, v), x, r), c)
      else balance(Node(Red, l, x, insert(r, v)), c)
  }

fn balance(t: Tree, c: Color) -> Tree =
  match t {
    | Leaf => t
    | Node(Red, l, x, r) =>
      match (l, r) {
        | (Leaf, Leaf) => t
        | (Leaf, Node(Red, ll, y, rl)) => Node(Red, Node(Black, ll, y, rl), x, r)
        | (Node(Red, ll, y, Leaf), rl) => Node(Red, Node(Black, ll, y, rl), x, r)
        | (Node(Red, ll, y, Node(Red, lll, z, lllr)), Node(Red, rr, w, rrr)) =>
          Node(Black, Node(Red, Node(Black, ll, y, rr), z, lllr), x, Node(Red, rr, w, rrr))
      }
    | Node(Black, l, x, r) => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    | Leaf => List()
    | Node(c, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    | Leaf => 0
    | Node(c, l, _, r) => 1 + max(height(l), height(r))
  }

fn balance(t: Tree, c: Color) -> Tree =
  match t {
    | Leaf => t
    | Node(Red, l, x, r) =>
      match (l, r) {
        | (Leaf, Leaf) => t
        | (Leaf, Node(Red, ll, y, rl)) => Node(Red, Node(Black, ll, y, rl), x, r)
        | (Node(Red, ll, y, Leaf), rl) => Node(Red, Node(Black, ll, y, rl), x, r)
        | (Node(Red, ll, y, Node(Red, lll, z, lllr)), Node(Red, rr, w, rrr)) =>
          Node(Black, Node(Red, Node(Black, ll, y, rr), z, lllr), x, Node(Red, rr, w, rrr))
      }
    | Node(Black, l, x, r) => t
  }

fn max(a: Int, b: Int) -> Int =
  if a > b then a else b
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
  here: | Leaf => t
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
18 |     | Leaf => t
   |     ^
error: Expected pattern at line 32:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:32:5
  here: | Leaf => List()
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     | Leaf => List()
   |     ^
error: Expected pattern at line 38:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:38:5
  here: | Leaf => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
38 |     | Leaf => 0
   |     ^
error: Expected pattern at line 44:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:44:5
  here: | Leaf => t
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
44 |     | Leaf => t
   |     ^
error[E012]: duplicate function 'balance'
  at line 42
  in fn balance
  here: fn balance(t: Tree, c: Color) -> Tree =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
16 | fn balance(t: Tree, c: Color) -> Tree =
   | ---------------------------------- first definition of 'balance' here
...
42 | fn balance(t: Tree, c: Color) -> Tree =
   | ^

6 error(s) found
FAILED: /tmp/dojo-red-black-tree-1.almd
  parse error: Expected pattern at line 9:5 (got Pipe '|')
  parse error: Expected pattern at line 18:5 (got Pipe '|')
  parse error: Expected pattern at line 32:5 (got Pipe '|')
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
      if v == x then Node(Black, Leaf, x, Leaf)
      else if v < x then balance(Node(Red, insert(l, v), x, r), c)
      else balance(Node(Red, l, x, insert(r, v)), c)
  }

fn balance(t: Tree, c: Color) -> Tree =
  match t {
    | Leaf => t
    | Node(Red, l, x, r) =>
      match (l, r) {
        | (Leaf, Leaf) => t
        | (Leaf, Node(Red, ll, y, rl)) => Node(Red, Node(Black, ll, y, rl), x, r)
        | (Node(Red, ll, y, Leaf), rl) => Node(Red, Node(Black, ll, y, rl), x, r)
        | (Node(Red, ll, y, Node(Red, lll, z, lllr)), Node(Red, rr, w, rrr)) =>
          Node(Black, Node(Red, Node(Black, ll, y, rr), z, lllr), x, Node(Red, rr, w, rrr))
      }
    | Node(Black, l, x, r) => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    | Leaf => List()
    | Node(c, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    | Leaf => 0
    | Node(c, l, _, r) => 1 + max(height(l), height(r))
  }

fn max(a: Int, b: Int) -> Int =
  if a > b then a else b
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
  here: | Leaf => t
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
18 |     | Leaf => t
   |     ^
error: Expected pattern at line 32:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:32:5
  here: | Leaf => List()
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     | Leaf => List()
   |     ^
error: Expected pattern at line 38:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:38:5
  here: | Leaf => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
38 |     | Leaf => 0
   |     ^

4 error(s) found
FAILED: /tmp/dojo-red-black-tree-2.almd
  parse error: Expected pattern at line 9:5 (got Pipe '|')
  parse error: Expected pattern at line 18:5 (got Pipe '|')
  parse error: Expected pattern at line 32:5 (got Pipe '|')
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
      if v == x then Node(Black, Leaf, x, Leaf)
      else if v < x then balance(Node(Red, insert(l, v), x, r), c)
      else balance(Node(Red, l, x, insert(r, v)), c)
  }

fn balance(t: Tree, c: Color) -> Tree =
  match t {
    | Leaf => t
    | Node(Red, l, x, r) =>
      match (l, r) {
        | (Leaf, Leaf) => t
        | (Leaf, Node(Red, ll, y, rl)) => Node(Red, Node(Black, ll, y, rl), x, r)
        | (Node(Red, ll, y, Leaf), rl) => Node(Red, Node(Black, ll, y, rl), x, r)
        | (Node(Red, ll, y, Node(Red, lll, z, lllr)), Node(Red, rr, w, rrr)) =>
          Node(Black, Node(Red, Node(Black, ll, y, rr), z, lllr), x, Node(Red, rr, w, rrr))
      }
    | Node(Black, l, x, r) => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    | Leaf => List()
    | Node(c, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    | Leaf => 0
    | Node(c, l, _, r) => 1 + max(height(l), height(r))
  }

fn max(a: Int, b: Int) -> Int =
  if a > b then a else b
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
  here: | Leaf => t
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
18 |     | Leaf => t
   |     ^
error: Expected pattern at line 32:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:32:5
  here: | Leaf => List()
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     | Leaf => List()
   |     ^
error: Expected pattern at line 38:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:38:5
  here: | Leaf => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
38 |     | Leaf => 0
   |     ^

4 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
  parse error: Expected pattern at line 9:5 (got Pipe '|')
  parse error: Expected pattern at line 18:5 (got Pipe '|')
  parse error: Expected pattern at line 32:5 (got Pipe '|')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-red-black-tree-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
