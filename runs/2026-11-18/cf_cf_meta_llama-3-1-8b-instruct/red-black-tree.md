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
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, Node(Red, Leaf, x, Leaf))
    | Node(Red, Node(Red, l, a, m), b, r) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, Node(Red, Leaf, x, Leaf))
    | Node(Red, l, a, Node(Red, m, b, r)) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, Node(Red, Leaf, x, Leaf))
    | Node(Red, l, a, Node(Red, m, b, r)) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, Node(Red, Leaf, x, Leaf))
    | _ => t
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
  here: | Node(Red, Node(Red, l, a, m), b, r) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
18 |     | Node(Red, Node(Red, l, a, m), b, r) =>
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
      else if v < x then balance(Node(Red, l, v, r), x)
      else balance(Node(Red, Node(c, l, x, Leaf), v, r), x)
  }

fn balance(t: Tree, x: Int) -> Tree =
  match t {
    | Node(Red, Node(Red, l, a, m), b, r) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, Node(Red, Leaf, x, Leaf))
    | Node(Red, Node(Red, l, a, m), b, r) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, Node(Red, Leaf, x, Leaf))
    | Node(Red, l, a, Node(Red, m, b, r)) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, Node(Red, Leaf, x, Leaf))
    | Node(Red, l, a, Node(Red, m, b, r)) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, Node(Red, Leaf, x, Leaf))
    | Node(c, l, x, r) => Node(c, l, x, r)
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

fn balance(t: Tree, x: Int) -> Tree =
  match t {
    | Node(Red, Node(Red, l, a, m), b, r) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, Node(Red, Leaf, x, Leaf))
    | Node(Red, Node(Red, l, a, m), b, r) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, Node(Red, Leaf, x, Leaf))
    | Node(Red, l, a, Node(Red, m, b, r)) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, Node(Red, Leaf, x, Leaf))
    | Node(Red, l, a, Node(Red, m, b, r)) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, Node(Red, Leaf, x, Leaf))
    | Node(c, l, x, r) => Node(c, l, x, r)
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
error: Expected pattern at line 43:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:43:5
  here: | Node(Red, Node(Red, l, a, m), b, r) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
43 |     | Node(Red, Node(Red, l, a, m), b, r) =>
   |     ^
error[E012]: duplicate function 'balance'
  at line 41
  in fn balance
  here: fn balance(t: Tree, x: Int) -> Tree =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
16 | fn balance(t: Tree, x: Int) -> Tree =
   | ---------------------------------- first definition of 'balance' here
...
41 | fn balance(t: Tree, x: Int) -> Tree =
   | ^

6 error(s) found
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
      else if v < x then balance(Node(Red, l, v, r), x)
      else balance(Node(Red, Node(c, l, x, Leaf), v, r), x)
  }

fn balance(t: Tree, x: Int) -> Tree =
  match t {
    | Node(Red, Node(Red, l, a, m), b, r) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, Node(Red, Leaf, x, Leaf))
    | Node(Red, Node(Red, l, a, m), b, r) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, Node(Red, Leaf, x, Leaf))
    | Node(Red, l, a, Node(Red, m, b, r)) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, Node(Red, Leaf, x, Leaf))
    | Node(Red, l, a, Node(Red, m, b, r)) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, Node(Red, Leaf, x, Leaf))
    | Node(c, l, x, r) => Node(c, l, x, r)
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
      else if v < x then balance(Node(Red, l, v, r), x)
      else balance(Node(Red, Node(c, l, x, Leaf), v, r), x)
  }

fn balance(t: Tree, x: Int) -> Tree =
  match t {
    | Node(Red, Node(Red, l, a, m), b, r) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, Node(Red, Leaf, x, Leaf))
    | Node(Red, Node(Red, l, a, m), b, r) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, Node(Red, Leaf, x, Leaf))
    | Node(Red, l, a, Node(Red, m, b, r)) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, Node(Red, Leaf, x, Leaf))
    | Node(Red, l, a, Node(Red, m, b, r)) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, Node(Red, Leaf, x, Leaf))
    | Node(c, l, x, r) => Node(c, l, x, r)
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
