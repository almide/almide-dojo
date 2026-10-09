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
      else if v < x then
        let t' = insert(r, v)
        match c, t' {
          | Red, Node(Red, _, _, _) => balance(Node(Red, l, x, t'))
          | Red, _ => Node(Black, l, x, t')
          | Black, Node(Red, _, _, _) => balance(Node(Red, l, x, t'))
          | Black, _ => Node(Black, l, x, t')
        }
      else
        let t' = insert(l, v)
        match c, t' {
          | Red, Node(Red, _, _, _) => balance(Node(Red, t', x, r))
          | Red, _ => Node(Black, t', x, r)
          | Black, Node(Red, _, _, _) => balance(Node(Red, t', x, r))
          | Black, _ => Node(Black, t', x, r)
        }
  }

fn balance(t: Tree) -> Tree =
  match t {
    | Node(Red, l, x, Node(Red, r, y, Leaf)) =>
      Node(Black, Node(Red, l, x, r), y, Leaf)
    | Node(Red, l, x, Node(Red, r, y, Node(Red, _, _, _))) =>
      Node(Black, Node(Red, l, x, Node(Red, r, y, Leaf)), y, Leaf)
    | Node(Red, l, x, Node(Red, r, y, Node(Red, _, _, _))) =>
      Node(Black, Node(Red, l, x, Node(Red, r, y, Leaf)), y, Leaf)
    | _ => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    | Leaf => List()
    | Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    | Leaf => 0
    | Node(_, _, _, _) => 1 + max(height(Node(_, l, _, _)), height(Node(_, _, _, r)))
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
error: Expected pattern at line 26:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:26:5
  here: | Black, _ => Node(Black, t', x, r)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
26 |           | Black, _ => Node(Black, t', x, r)
   |     ^
error: Expected pattern at line 37:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:37:5
  here: Node(Black, Node(Red, l, x, Node(Red, r, y, Leaf)), y, Leaf)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
37 |       Node(Black, Node(Red, l, x, Node(Red, r, y, Leaf)), y, Leaf)
   |     ^
error: Expected pattern at line 43:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:43:5
  here: | Leaf => List()
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
43 |     | Leaf => List()
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

fn balance(t: Tree) -> Tree =
  match t {
    | Node(Red, l, x, Node(Red, r, y, Leaf)) =>
      Node(Black, Node(Red, l, x, r), y, Leaf)
    | Node(Red, l, x, Node(Red, r, y, Node(Red, _, _, _))) =>
      Node(Black, Node(Red, l, x, Node(Red, r, y, Leaf)), y, Leaf)
    | Node(Red, l, x, Node(Red, r, y, _)) =>
      Node(Black, Node(Red, l, x, Node(Red, r, y, Leaf)), y, Leaf)
    | _ => t
  }

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf => Node(Black, Leaf, v, Leaf)
    | Node(c, l, x, r) =>
      if v == x then t
      else if v < x then
        let t' = insert(r, v)
        match c, t' {
          | Red, Node(Red, _, _, _) => balance(Node(Red, l, x, t'))
          | Red, _ => Node(Black, l, x, t')
          | Black, Node(Red, _, _, _) => balance(Node(Red, l, x, t'))
          | Black, _ => Node(Black, l, x, t')
        }
      else
        let t' = insert(l, v)
        match c, t' {
          | Red, Node(Red, _, _, _) => balance(Node(Red, t', x, r))
          | Red, _ => Node(Black, t', x, r)
          | Black, Node(Red, _, _, _) => balance(Node(Red, t', x, r))
          | Black, _ => Node(Black, t', x, r)
        }
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    | Leaf => List()
    | Node(_, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    | Leaf => 0
    | Node(_, _, _, _) => 1 + max(height(Node(_, l, _, _)), height(Node(_, _, _, r)))
  }
```

**Diagnostic:**

```
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:9:5
  here: | Node(Red, l, x, Node(Red, r, y, Leaf)) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Node(Red, l, x, Node(Red, r, y, Leaf)) =>
  |     ^
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:20:5
  here: | Leaf => Node(Black, Leaf, v, Leaf)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | Leaf => Node(Black, Leaf, v, Leaf)
   |     ^
error: Expected pattern at line 37:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:37:5
  here: | Black, _ => Node(Black, t', x, r)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
37 |           | Black, _ => Node(Black, t', x, r)
   |     ^
error: Expected pattern at line 43:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:43:5
  here: | Leaf => List()
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
43 |     | Leaf => List()
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

fn balance(t: Tree) -> Tree =
  match t {
    | Node(Red, l, x, Node(Red, r, y, Leaf)) =>
      Node(Black, Node(Red, l, x, r), y, Leaf)
    | Node(Red, l, x, Node(Red, r, y, Node(Red, _, _, _))) =>
      Node(Black, Node(Red, l, x, Node(Red, r, y, Leaf)), y, Leaf)
    | Node(Red, l, x, Node(Red, r, y, _)) =>
      Node(Black, Node(Red, l, x, Node(Red, r, y, Leaf)), y, Leaf)
    | Node(_, l, x, Node(Red, r, y, Node(Red, _, _, _))) =>
      Node(Black, Node(Red, l, x, Node(Red, r, y, Leaf)), y, Leaf)
    | Node(_, l, x, Node(Red, r, y, Node(Red, _, _, _))) =>
      Node(Black, Node(Red, l, x, Node(Red, r, y, Leaf)), y, Leaf)
    | Node(_, l, x, Node(Red, r, y, _)) =>
      Node(Black, Node(Red, l, x, Node(Red, r, y, Leaf)), y, Leaf)
    | _ => t
  }

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf => Node(Black, Leaf, v, Leaf)
    | Node(c, l, x, r) =>
      if v == x then t
      else if v < x then
        let t' = insert(r, v)
        match c, t' {
          | Red, Node(Red, _, _, _) => balance(Node(Red, l, x, t'))
          | Red, _ => Node(Black, l, x, t')
          | Black, Node(Red, _, _, _) => balance(Node(Red, l, x, t'))
          | Black, _ => Node(Black, l, x, t')
        }
      else
        let t' = insert(l, v)
        match c, t' {
          | Red, Node(Red, _, _, _) => balance(Node(Red, t', x, r))
          | Red, _ => Node(Black, t', x, r)
          | Black, Node(Red, _, _, _) => balance(Node(Red, t', x, r))
          | Black, _ => Node(Black, t', x, r)
        }
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    | Leaf => List()
    | Node(_, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    | Leaf => 0
    | Node(_, _, _, _) => 1 + max(height(Node(_, l, _, _)), height(Node(_, _, _, r)))
  }
```

**Diagnostic:**

```
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:9:5
  here: | Node(Red, l, x, Node(Red, r, y, Leaf)) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Node(Red, l, x, Node(Red, r, y, Leaf)) =>
  |     ^
error: Expected pattern at line 26:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:26:5
  here: | Leaf => Node(Black, Leaf, v, Leaf)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
26 |     | Leaf => Node(Black, Leaf, v, Leaf)
   |     ^
error: Expected pattern at line 43:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:43:5
  here: | Black, _ => Node(Black, t', x, r)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
43 |           | Black, _ => Node(Black, t', x, r)
   |     ^
error: Expected pattern at line 49:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:49:5
  here: | Leaf => List()
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
49 |     | Leaf => List()
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

fn balance(t: Tree) -> Tree =
  match t {
    | Node(Red, l, x, Node(Red, r, y, Leaf)) =>
      Node(Black, Node(Red, l, x, r), y, Leaf)
    | Node(Red, l, x, Node(Red, r, y, Node(Red, _, _, _))) =>
      Node(Black, Node(Red, l, x, Node(Red, r, y, Leaf)), y, Leaf)
    | Node(Red, l, x, Node(Red, r, y, _)) =>
      Node(Black, Node(Red, l, x, Node(Red, r, y, Leaf)), y, Leaf)
    | Node(_, l, x, Node(Red, r, y, Node(Red, _, _, _))) =>
      Node(Black, Node(Red, l, x, Node(Red, r, y, Leaf)), y, Leaf)
    | Node(_, l, x, Node(Red, r, y, Node(Red, _, _, _))) =>
      Node(Black, Node(Red, l, x, Node(Red, r, y, Leaf)), y, Leaf)
    | Node(_, l, x, Node(Red, r, y, _)) =>
      Node(Black, Node(Red, l, x, Node(Red, r, y, Leaf)), y, Leaf)
    | Node(_, l, x, _) => t
    | _ => t
  }

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf => Node(Black, Leaf, v, Leaf)
    | Node(c, l, x, r) =>
      if v == x then t
      else if v < x then
        let t' = insert(r, v)
        match c, t' {
          | Red, Node(Red, _, _, _) => balance(Node(Red, l, x, t'))
          | Red, _ => Node(Black, l, x, t')
          | Black, Node(Red, _, _, _) => balance(Node(Red, l, x, t'))
          | Black, _ => Node(Black, l, x, t')
        }
      else
        let t' = insert(l, v)
        match c, t' {
          | Red, Node(Red, _, _, _) => balance(Node(Red, t', x, r))
          | Red, _ => Node(Black, t', x, r)
          | Black, Node(Red, _, _, _) => balance(Node(Red, t', x, r))
          | Black, _ => Node(Black, t', x, r)
        }
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    | Leaf => List()
    | Node(_, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    | Leaf => 0
    | Node(_, _, _, _) => 1 + max(height(Node(_, l, _, _)), height(Node(_, _, _, r)))
  }
```

**Diagnostic:**

```
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:9:5
  here: | Node(Red, l, x, Node(Red, r, y, Leaf)) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Node(Red, l, x, Node(Red, r, y, Leaf)) =>
  |     ^
error: Expected pattern at line 27:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:27:5
  here: | Leaf => Node(Black, Leaf, v, Leaf)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
27 |     | Leaf => Node(Black, Leaf, v, Leaf)
   |     ^
error: Expected pattern at line 44:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:44:5
  here: | Black, _ => Node(Black, t', x, r)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
44 |           | Black, _ => Node(Black, t', x, r)
   |     ^
error: Expected pattern at line 50:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:50:5
  here: | Leaf => List()
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
50 |     | Leaf => List()
   |     ^

4 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
