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

fn balance(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf => Node(Black, Leaf, v, Leaf)
    | Node(c, l, x, r) =>
      if x < v then
        match r {
          | Leaf => Node(c, l, x, r)
          | Node(c2, l2, y, r2) =>
            if c2 == Red && c == Red && y < v then
              Node(Black, Node(Black, l, x, l2), y, r2)
            else
              match l {
                | Leaf => Node(c, l, x, r)
                | Node(c3, l3, z, r3) =>
                  if c3 == Red && c == Red && z > x then
                    Node(Black, Node(Black, l3, z, l), x, r3)
                  else
                    Node(c, Node(Red, l3, z, l), x, r)
              }
        }
      else
        match l {
          | Leaf => Node(c, l, x, r)
          | Node(c2, l2, y, r2) =>
            if c2 == Red && c == Red && y > x then
              Node(Black, Node(Black, l2, y, l), x, r2)
            else
              match r {
                | Leaf => Node(c, l, x, r)
                | Node(c3, l3, z, r3) =>
                  if c3 == Red && c == Red && z < v then
                    Node(Black, Node(Black, l, x, l3), z, r3)
                  else
                    Node(c, l, x, Node(Red, r3, z, r))
              }
        }
  }

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf => Node(Black, Leaf, v, Leaf)
    | Node(c, l, x, r) =>
      if v == x then
        Node(c, l, x, r)
      else if v < x then
        balance(Node(c, l, x, insert(r, v)), v)
      else
        balance(Node(c, insert(l, v), x, r), v)
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
error: Expected pattern at line 47:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:47:5
  here: | Leaf => Node(Black, Leaf, v, Leaf)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
47 |     | Leaf => Node(Black, Leaf, v, Leaf)
   |     ^
error: Expected pattern at line 59:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:59:5
  here: | Leaf => List()
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
59 |     | Leaf => List()
   |     ^
error: Expected pattern at line 65:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:65:5
  here: | Leaf => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
65 |     | Leaf => 0
   |     ^

4 error(s) found
FAILED: /tmp/dojo-red-black-tree-0.almd
  parse error: Expected pattern at line 9:5 (got Pipe '|')
  parse error: Expected pattern at line 47:5 (got Pipe '|')
  parse error: Expected pattern at line 59:5 (got Pipe '|')
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

fn balance(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf => Node(Black, Leaf, v, Leaf)
    | Node(c, l, x, r) =>
      if x < v then
        match r {
          | Leaf => Node(c, l, x, r)
          | Node(c2, l2, y, r2) =>
            if c2 == Red && c == Red && y < v then
              Node(Black, Node(Black, l, x, l2), y, r2)
            else
              match l {
                | Leaf => Node(c, l, x, r)
                | Node(c3, l3, z, r3) =>
                  if c3 == Red && c == Red && z > x then
                    Node(Black, Node(Black, l3, z, l), x, r3)
                  else
                    Node(c, Node(Red, l3, z, l), x, r)
              }
        }
      else
        match l {
          | Leaf => Node(c, l, x, r)
          | Node(c2, l2, y, r2) =>
            if c2 == Red && c == Red && y > x then
              Node(Black, Node(Black, l2, y, l), x, r2)
            else
              match r {
                | Leaf => Node(c, l, x, r)
                | Node(c3, l3, z, r3) =>
                  if c3 == Red && c == Red && z < v then
                    Node(Black, Node(Black, l, x, l3), z, r3)
                  else
                    Node(c, l, x, Node(Red, r3, z, r))
              }
        }
  }

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf => Node(Black, Leaf, v, Leaf)
    | Node(c, l, x, r) =>
      if v == x then
        Node(c, l, x, r)
      else if v < x then
        balance(Node(c, l, x, insert(r, v)), v)
      else
        balance(Node(c, insert(l, v), x, r), v)
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
error: Expected pattern at line 47:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:47:5
  here: | Leaf => Node(Black, Leaf, v, Leaf)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
47 |     | Leaf => Node(Black, Leaf, v, Leaf)
   |     ^
error: Expected pattern at line 59:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:59:5
  here: | Leaf => List()
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
59 |     | Leaf => List()
   |     ^
error: Expected pattern at line 65:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:65:5
  here: | Leaf => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
65 |     | Leaf => 0
   |     ^

4 error(s) found
FAILED: /tmp/dojo-red-black-tree-1.almd
  parse error: Expected pattern at line 9:5 (got Pipe '|')
  parse error: Expected pattern at line 47:5 (got Pipe '|')
  parse error: Expected pattern at line 59:5 (got Pipe '|')
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

fn balance(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Black, Leaf, v, Leaf)
    | Node(c, l, x, r) =>
      if x < v then
        match r {
          Leaf => Node(c, l, x, r)
          | Node(c2, l2, y, r2) =>
            if c2 == Red && c == Red && y < v then
              Node(Black, Node(Black, l, x, l2), y, r2)
            else
              match l {
                Leaf => Node(c, l, x, r)
                | Node(c3, l3, z, r3) =>
                  if c3 == Red && c == Red && z > x then
                    Node(Black, Node(Black, l3, z, l), x, r3)
                  else
                    Node(c, Node(Red, l3, z, l), x, r)
              }
        }
      else
        match l {
          Leaf => Node(c, l, x, r)
          | Node(c2, l2, y, r2) =>
            if c2 == Red && c == Red && y > x then
              Node(Black, Node(Black, l2, y, l), x, r2)
            else
              match r {
                Leaf => Node(c, l, x, r)
                | Node(c3, l3, z, r3) =>
                  if c3 == Red && c == Red && z < v then
                    Node(Black, Node(Black, l, x, l3), z, r3)
                  else
                    Node(c, l, x, Node(Red, r3, z, r))
              }
        }
  }

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Black, Leaf, v, Leaf)
    | Node(c, l, x, r) =>
      if v == x then
        Node(c, l, x, r)
      else if v < x then
        balance(Node(c, l, x, insert(r, v)), v)
      else
        balance(Node(c, insert(l, v), x, r), v)
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    | Node(c, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    | Node(c, l, _, r) => 1 + max(height(l), height(r))
  }
```

**Diagnostic:**

```
error: Expected pattern at line 10:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:10:5
  here: | Node(c, l, x, r) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
10 |     | Node(c, l, x, r) =>
   |     ^
error: Expected pattern at line 48:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:48:5
  here: | Node(c, l, x, r) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
48 |     | Node(c, l, x, r) =>
   |     ^
error: Expected pattern at line 60:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:60:5
  here: | Node(c, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
60 |     | Node(c, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
   |     ^
error: Expected pattern at line 66:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:66:5
  here: | Node(c, l, _, r) => 1 + max(height(l), height(r))
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
66 |     | Node(c, l, _, r) => 1 + max(height(l), height(r))
   |     ^

4 error(s) found
FAILED: /tmp/dojo-red-black-tree-2.almd
  parse error: Expected pattern at line 10:5 (got Pipe '|')
  parse error: Expected pattern at line 48:5 (got Pipe '|')
  parse error: Expected pattern at line 60:5 (got Pipe '|')
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

fn balance(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Black, Leaf, v, Leaf)
    | Node(c, l, x, r) =>
      if x < v then
        match r {
          Leaf => Node(c, l, x, r)
          | Node(c2, l2, y, r2) =>
            if c2 == Red && c == Red && y < v then
              Node(Black, Node(Black, l, x, l2), y, r2)
            else
              match l {
                Leaf => Node(c, l, x, r)
                | Node(c3, l3, z, r3) =>
                  if c3 == Red && c == Red && z > x then
                    Node(Black, Node(Black, l3, z, l), x, r3)
                  else
                    Node(c, Node(Red, l3, z, l), x, r)
              }
        }
      else
        match l {
          Leaf => Node(c, l, x, r)
          | Node(c2, l2, y, r2) =>
            if c2 == Red && c == Red && y > x then
              Node(Black, Node(Black, l2, y, l), x, r2)
            else
              match r {
                Leaf => Node(c, l, x, r)
                | Node(c3, l3, z, r3) =>
                  if c3 == Red && c == Red && z < v then
                    Node(Black, Node(Black, l, x, l3), z, r3)
                  else
                    Node(c, l, x, Node(Red, r3, z, r))
              }
        }
  }

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Black, Leaf, v, Leaf)
    | Node(c, l, x, r) =>
      if v == x then
        Node(c, l, x, r)
      else if v < x then
        balance(Node(c, l, x, insert(r, v)), v)
      else
        balance(Node(c, insert(l, v), x, r), v)
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    | Node(c, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    | Node(c, l, _, r) => 1 + max(height(l), height(r))
  }
```

**Diagnostic:**

```
error: Expected pattern at line 10:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:10:5
  here: | Node(c, l, x, r) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
10 |     | Node(c, l, x, r) =>
   |     ^
error: Expected pattern at line 48:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:48:5
  here: | Node(c, l, x, r) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
48 |     | Node(c, l, x, r) =>
   |     ^
error: Expected pattern at line 60:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:60:5
  here: | Node(c, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
60 |     | Node(c, l, x, r) => inorder(l) ++ [x] ++ inorder(r)
   |     ^
error: Expected pattern at line 66:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:66:5
  here: | Node(c, l, _, r) => 1 + max(height(l), height(r))
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
66 |     | Node(c, l, _, r) => 1 + max(height(l), height(r))
   |     ^

4 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
  parse error: Expected pattern at line 10:5 (got Pipe '|')
  parse error: Expected pattern at line 48:5 (got Pipe '|')
  parse error: Expected pattern at line 60:5 (got Pipe '|')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-red-black-tree-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
