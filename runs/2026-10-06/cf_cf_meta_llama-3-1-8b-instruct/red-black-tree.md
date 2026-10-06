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
    | Node(Red, Node(Red, l1, x1, l2), x, r) =>
      Node(Black, Node(Red, l1, x1, l2), x, r)
    | Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      Node(Black, Node(Red, l, x, r1), x1, r2)
    | Node(Red, l, x, r) =>
      Node(Red, l, x, r)
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
  here: | Node(Red, Node(Red, l1, x1, l2), x, r) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
18 |     | Node(Red, Node(Red, l1, x1, l2), x, r) =>
   |     ^
error: Expected pattern at line 29:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:29:5
  here: | Leaf => List()
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
29 |     | Leaf => List()
   |     ^
error: Expected pattern at line 35:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:35:5
  here: | Leaf => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
35 |     | Leaf => 0
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
      if v == x then Node(Black, Leaf, x, Leaf) + [Node(Black, Leaf, v, Leaf)]
      else if v < x then balance(Node(Red, l, v, r), x)
      else balance(Node(Red, Node(c, l, x, Leaf), v, r), x)
  }

fn balance(t: Tree, x: Int) -> Tree =
  match t {
    | Node(Red, Node(Red, l1, x1, l2), x, r) =>
      Node(Black, Node(Red, l1, x1, l2), x, r)
    | Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      Node(Black, Node(Red, l, x, r1), x1, r2)
    | Node(Red, l, x, r) =>
      Node(Red, l, x, r)
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
    | Node(_, l, _, r) => 1 + max(height(l), height(r))
  }

fn balance(t: Tree, x: Int) -> Tree =
  match t {
    | Node(Red, Node(Red, l1, x1, l2), x, r) =>
      Node(Black, Node(Red, l1, x1, l2), x, r)
    | Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      Node(Black, Node(Red, l, x, r1), x1, r2)
    | Node(Red, l, x, r) =>
      Node(Red, l, x, r)
    | _ => t
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
  here: | Node(Red, Node(Red, l1, x1, l2), x, r) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
18 |     | Node(Red, Node(Red, l1, x1, l2), x, r) =>
   |     ^
error: Expected pattern at line 29:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:29:5
  here: | Leaf => List()
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
29 |     | Leaf => List()
   |     ^
error: Expected pattern at line 35:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:35:5
  here: | Leaf => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
35 |     | Leaf => 0
   |     ^
error: Expected pattern at line 41:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:41:5
  here: | Node(Red, Node(Red, l1, x1, l2), x, r) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
41 |     | Node(Red, Node(Red, l1, x1, l2), x, r) =>
   |     ^
error[E012]: duplicate function 'balance'
  at line 39
  in fn balance
  here: fn balance(t: Tree, x: Int) -> Tree =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
16 | fn balance(t: Tree, x: Int) -> Tree =
   | ---------------------------------- first definition of 'balance' here
...
39 | fn balance(t: Tree, x: Int) -> Tree =
   | ^

6 error(s) found
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
      if v == x then Node(Black, Leaf, x, Leaf) + [Node(Black, Leaf, v, Leaf)]
      else if v < x then balance(Node(Red, l, v, r), x)
      else balance(Node(Red, Node(c, l, x, Leaf), v, r), x)
  }

fn balance(t: Tree, x: Int) -> Tree =
  match t {
    | Node(Red, Node(Red, l1, x1, l2), x, r) =>
      Node(Black, Node(Red, l1, x1, l2), x, r)
    | Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      Node(Black, Node(Red, l, x, r1), x1, r2)
    | Node(Red, l, x, r) =>
      Node(Red, l, x, r)
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
    | Node(_, l, _, r) => 1 + max(height(l), height(r))
  }

fn balance_red_red(t: Tree, x: Int) -> Tree =
  match t {
    | Node(Red, Node(Red, l1, x1, l2), x, r) =>
      Node(Black, Node(Red, l1, x1, l2), x, r)
    | Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      Node(Black, Node(Red, l, x, r1), x1, r2)
    | _ => t
  }

fn balance(t: Tree, x: Int) -> Tree =
  match t {
    | Node(Red, Node(Red, l1, x1, l2), x, r) =>
      balance_red_red(Node(Red, l1, x1, l2), x)
    | Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      balance_red_red(Node(Red, l, x, r1), x1)
    | Node(Red, l, x, r) =>
      Node(Red, l, x, r)
    | _ => t
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
  here: | Node(Red, Node(Red, l1, x1, l2), x, r) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
18 |     | Node(Red, Node(Red, l1, x1, l2), x, r) =>
   |     ^
error: Expected pattern at line 29:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:29:5
  here: | Leaf => List()
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
29 |     | Leaf => List()
   |     ^
error: Expected pattern at line 35:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:35:5
  here: | Leaf => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
35 |     | Leaf => 0
   |     ^
error: Expected pattern at line 41:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:41:5
  here: | Node(Red, Node(Red, l1, x1, l2), x, r) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
41 |     | Node(Red, Node(Red, l1, x1, l2), x, r) =>
   |     ^
error: Expected pattern at line 50:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:50:5
  here: | Node(Red, Node(Red, l1, x1, l2), x, r) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
50 |     | Node(Red, Node(Red, l1, x1, l2), x, r) =>
   |     ^
error[E012]: duplicate function 'balance'
  at line 48
  in fn balance
  here: fn balance(t: Tree, x: Int) -> Tree =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
16 | fn balance(t: Tree, x: Int) -> Tree =
   | ---------------------------------- first definition of 'balance' here
...
48 | fn balance(t: Tree, x: Int) -> Tree =
   | ^

7 error(s) found
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
      if v == x then Node(Black, Leaf, x, Leaf) + [Node(Black, Leaf, v, Leaf)]
      else if v < x then balance(Node(Red, l, v, r), x)
      else balance(Node(Red, Node(c, l, x, Leaf), v, r), x)
  }

fn balance(t: Tree, x: Int) -> Tree =
  match t {
    | Node(Red, Node(Red, l1, x1, l2), x, r) =>
      Node(Black, Node(Red, l1, x1, l2), x, r)
    | Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      Node(Black, Node(Red, l, x, r1), x1, r2)
    | Node(Red, l, x, r) =>
      Node(Red, l, x, r)
    | _ => t
  }

fn balance_red_red(t: Tree, x: Int) -> Tree =
  match t {
    | Node(Red, Node(Red, l1, x1, l2), x, r) =>
      Node(Black, Node(Red, l1, x1, l2), x, r)
    | Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      Node(Black, Node(Red, l, x, r1), x1, r2)
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
  here: | Node(Red, Node(Red, l1, x1, l2), x, r) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
18 |     | Node(Red, Node(Red, l1, x1, l2), x, r) =>
   |     ^
error: Expected pattern at line 29:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:29:5
  here: | Node(Red, Node(Red, l1, x1, l2), x, r) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
29 |     | Node(Red, Node(Red, l1, x1, l2), x, r) =>
   |     ^
error: Expected pattern at line 38:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:38:5
  here: | Leaf => List()
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
38 |     | Leaf => List()
   |     ^
error: Expected pattern at line 44:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:44:5
  here: | Leaf => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
44 |     | Leaf => 0
   |     ^

5 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
