# red-black-tree

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn insert(t: Tree, v: Int) -> Tree = 
  match t {
    Leaf => Node(Black, Node(Red, Leaf, v, Leaf), v, Leaf)
    | Node(c, l, k, r) =>
      if k == v then t
      else if v < k then balance(t, v)
      else balance(Node(c, l, k, insert(r, v)), k)
  }

fn inorder(t: Tree) -> List[Int] = 
  match t {
    Leaf => []
    | Node(_, l, k, r) => inorder(l) + [k] + inorder(r)
  }

fn height(t: Tree) -> Int = 
  match t {
    Leaf => 0
    | Node(_, l, _, r) => 1 + max(height(l), height(r))
  }

fn balance(t: Tree, v: Int) -> Tree = 
  match t {
    Node(Red, Node(Red, l1, k1, r1), k2, r2) =>
      if v < k1 then rotate_right(Node(Red, Node(Black, l1, k1, r1), k2, r2))
      else rotate_left(Node
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-0.almd
error: Expected pattern at line 4:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:4:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |     | Node(c, l, k, r) =>
  |     ^
error: Expected pattern at line 13:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:13:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
13 |     | Node(_, l, k, r) => inorder(l) + [k] + inorder(r)
   |     ^
error: Expected pattern at line 19:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:19:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
19 |     | Node(_, l, _, r) => 1 + max(height(l), height(r))
   |     ^
error: Expected ')' to close function call opened at line 26:23
  --> /tmp/dojo-red-black-tree-0.almd:28:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
26 |       else rotate_left(Node
   |                       --------------- '(' opened here
...
28 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   | ^^^^

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
    Leaf => Node(Black, Node(Red, Leaf, v, Leaf), v, Leaf)
    | Node(c, l, k, r) =>
      if k == v then t
      else if v < k then balance(t, v)
      else balance(Node(c, l, k, insert(r, v)), k)
  }

fn inorder(t: Tree) -> List[Int] = 
  match t {
    Leaf => []
    | Node(c, l, k, r) => inorder(l) ++ [k] ++ inorder(r)
  }

fn height(t: Tree) -> Int = 
  match t {
    Leaf => 0
    | Node(_, l, _, r) => 1 + max(height(l), height(r))
  }

fn balance(t: Tree, v: Int) -> Tree = 
  match t {
    Node(Red, Node(Red, l1, k1, r1), k2, r2) =>
      if v < k1 then rotate_right(Node
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-1.almd
error: Expected pattern at line 10:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:10:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
10 |     | Node(c, l, k, r) =>
   |     ^
error: Expected pattern at line 19:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:19:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
19 |     | Node(c, l, k, r) => inorder(l) ++ [k] ++ inorder(r)
   |     ^
error: Expected pattern at line 25:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:25:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
25 |     | Node(_, l, _, r) => 1 + max(height(l), height(r))
   |     ^
error: Expected ')' to close function call opened at line 31:34
  --> /tmp/dojo-red-black-tree-1.almd:33:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
31 |       if v < k1 then rotate_right(Node
   |                                  --------------- '(' opened here
...
33 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   | ^^^^

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
    Leaf => Node(Black, Node(Red, Leaf, v, Leaf), v, Leaf)
    | Node(c, l, k, r) =>
      if k == v then t
      else if v < k then balance(t, v)
      else balance(Node(c, l, k, insert(r, v)), k)
  }

fn inorder(t: Tree) -> List[Int] = 
  match t {
    Leaf => []
    | Node(_, l, k, r) => inorder(l) ++ [k] ++ inorder(r)
  }

fn height(t: Tree) -> Int = 
  match t {
    Leaf => 0
    | Node(_, l, _, r) => 1 + max(height(l), height(r))
  }

fn balance(t: Tree, v: Int) -> Tree = 
  match t {
    Node(Red, Node(Red, l1, k1, r1), k2, r2) =>
      if v < k1 then rotate_right(Node(R
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-2.almd
error: Expected pattern at line 10:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:10:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
10 |     | Node(c, l, k, r) =>
   |     ^
error: Expected pattern at line 19:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:19:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
19 |     | Node(_, l, k, r) => inorder(l) ++ [k] ++ inorder(r)
   |     ^
error: Expected pattern at line 25:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:25:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
25 |     | Node(_, l, _, r) => 1 + max(height(l), height(r))
   |     ^
error: Expected ')' to close constructor call opened at line 31:39
  --> /tmp/dojo-red-black-tree-2.almd:33:1
  hint: Add ')' or check for a missing delimiter inside the constructor call
   |
31 |       if v < k1 then rotate_right(Node(R
   |                                       --------------- '(' opened here
...
33 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   | ^^^^

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

fn insert(t: Tree, v: Int) -> Tree = 
  match t {
    Leaf => Node(Black, Node(Red, Leaf, v, Leaf), v, Leaf)
    | Node(c, l, k, r) =>
      if k == v then t
      else if v < k then balance(t, v)
      else balance(Node(c, l, k, insert(r, v)), k)
  }

fn inorder(t: Tree) -> List[Int] = 
  match t {
    Leaf => []
    | Node(_, l, k, r) => inorder(l) ++ [k] ++ inorder(r)
  }

fn height(t: Tree) -> Int = 
  match t {
    Leaf => 0
    | Node(_, l, _, r) => 1 + max(height(l), height(r))
  }

fn balance(t: Tree, v: Int) -> Tree = 
  match t {
    Node(Red, Node(Red, l1, k1, r1), k2, r2) =>
      if v < k1 then rotate_right(Node(R
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-3.almd
error: Expected pattern at line 10:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:10:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
10 |     | Node(c, l, k, r) =>
   |     ^
error: Expected pattern at line 19:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:19:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
19 |     | Node(_, l, k, r) => inorder(l) ++ [k] ++ inorder(r)
   |     ^
error: Expected pattern at line 25:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:25:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
25 |     | Node(_, l, _, r) => 1 + max(height(l), height(r))
   |     ^
error: Expected ')' to close constructor call opened at line 31:39
  --> /tmp/dojo-red-black-tree-3.almd:33:1
  hint: Add ')' or check for a missing delimiter inside the constructor call
   |
31 |       if v < k1 then rotate_right(Node(R
   |                                       --------------- '(' opened here
...
33 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   | ^^^^

4 error(s) found
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-3.almd

1/1 test file(s) failed

```
