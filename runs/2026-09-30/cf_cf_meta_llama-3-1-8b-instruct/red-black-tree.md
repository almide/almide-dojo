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
    Leaf => Node(Black, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if v == x then t
      else if v < x then balance(Node(c, l, v, Leaf), x, r)
      else balance(Node(c, Leaf, x, r), v, l)
  }

fn balance(t: Tree, x: Int, r: Tree) -> Tree =
  match t {
    Leaf => Node(Red, Leaf, x, r)
    Node(c, l, y, t') =>
      if c == Red && y == x && t' == Leaf then Node(Black, l, x, r)
      else if c == Red && y == x then balance(Node(Black, l, x, r), y, t')
      else if c == Red && y < x then balance(Node(Black, Node(Red, l, y, Leaf), x, r), y, t')
      else if c == Red && y > x then balance(Node(Black, Node(Red, Leaf, y, l), x, r), y, t')
      else if c == Black && y < x then balance(Node(Red, l, y, Node(Black, Leaf, x, r)), y, t')
      else if c == Black && y > x then balance(Node(Red, Node(Black, Leaf, y, l), x, r), y, t')
      else t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(c, l, _, r) => 1 + max(height(l), height(r))
  }
```

**Diagnostic:**

```
error: Expected RParen at line 19:20 (got String ') =>
      if c == Red && y == x && t')
  --> /tmp/dojo-red-black-tree-0.almd:19:20
  here: Node(c, l, y, t') =>
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
   |
19 |     Node(c, l, y, t') =>
   |                    ^

1 error(s) found
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
    Leaf => Node(Black, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if v == x then Node(Black, Leaf, x, r) + [Leaf]
      else if v < x then balance(Node(Red, l, v, Leaf), x, r)
      else balance(Node(Red, Leaf, x, r), v, l)
  }

fn balance(t: Tree, x: Int, r: Tree) -> Tree =
  match t {
    Leaf => Node(Red, Leaf, x, r)
    Node(c, l, y, t') =>
      if c == Red && y == x && t' == Leaf then Node(Black, l, x, r)
      else if c == Red && y == x then balance(Node(Black, l, x, r), y, t')
      else if c == Red && y < x then balance(Node(Black, Node(Red, l, y, Leaf), x, r), y, t')
      else if c == Red && y > x then balance(Node(Black, Node(Red, Leaf, y, l), x, r), y, t')
      else if c == Black && y < x then balance(Node(Red, l, y, Node(Black, Leaf, x, r)), y, t')
      else if c == Black && y > x then balance(Node(Red, Node(Black, Leaf, y, l), x, r), y, t')
      else t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(c, l, _, r) => 1 + max(height(l), height(r))
  }
```

**Diagnostic:**

```
error: Expected RParen at line 19:20 (got String ') =>
      if c == Red && y == x && t')
  --> /tmp/dojo-red-black-tree-1.almd:19:20
  here: Node(c, l, y, t') =>
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
   |
19 |     Node(c, l, y, t') =>
   |                    ^
error: operator '+' requires numeric, String, or List types but got Tree and List[Tree]
  --> /tmp/dojo-red-black-tree-1.almd:11:49
  in operator +
  here: if v == x then Node(Black, Leaf, x, r) + [Leaf]
  hint: Use + with numeric types, String, or List
   |
11 |       if v == x then Node(Black, Leaf, x, r) + [Leaf]
   |                                                 ^^^^

2 error(s) found
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
    Leaf => Node(Black, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if v == x then Node(Black, Leaf, x, r) + [Leaf]
      else if v < x then balance(Node(Red, l, v, Leaf), x, r)
      else balance(Node(Red, Leaf, x, r), v, l)
  }

fn balance(t: Tree, x: Int, r: Tree) -> Tree =
  match t {
    Leaf => Node(Red, Leaf, x, r)
    Node(c, l, y, t') =>
      if c == Red && y == x && t' == Leaf then Node(Black, l, x, r)
      else if c == Red && y == x then balance(Node(Black, l, x, r), y, t')
      else if c == Red && y < x then balance(Node(Black, Node(Red, l, y, Leaf), x, r), y, t')
      else if c == Red && y > x then balance(Node(Black, Node(Red, Leaf, y, l), x, r), y, t')
      else if c == Black && y < x then balance(Node(Red, l, y, Node(Black, Leaf, x, r)), y, t')
      else if c == Black && y > x then balance(Node(Red, Node(Black, Leaf, y, l), x, r), y, t')
      else t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(c, l, _, r) => 1 + max(height(l), height(r))
  }
```

**Diagnostic:**

```
error: Expected RParen at line 19:20 (got String ') =>
      if c == Red && y == x && t')
  --> /tmp/dojo-red-black-tree-2.almd:19:20
  here: Node(c, l, y, t') =>
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
   |
19 |     Node(c, l, y, t') =>
   |                    ^
error: operator '+' requires numeric, String, or List types but got Tree and List[Tree]
  --> /tmp/dojo-red-black-tree-2.almd:11:49
  in operator +
  here: if v == x then Node(Black, Leaf, x, r) + [Leaf]
  hint: Use + with numeric types, String, or List
   |
11 |       if v == x then Node(Black, Leaf, x, r) + [Leaf]
   |                                                 ^^^^

2 error(s) found
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
    Leaf => Node(Black, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if v == x then Node(Black, Leaf, x, r) + [Leaf]
      else if v < x then balance(Node(Red, l, v, Leaf), x, r)
      else balance(Node(Red, Leaf, x, r), v, l)
  }

fn balance(t: Tree, x: Int, r: Tree) -> Tree =
  match t {
    Leaf => Node(Red, Leaf, x, r)
    Node(c, l, y, t') =>
      if c == Red && y == x && t' == Leaf then Node(Black, l, x, r)
      else if c == Red && y == x then balance(Node(Black, l, x, r), y, t')
      else if c == Red && y < x then balance(Node(Black, Node(Red, l, y, Leaf), x, r), y, t')
      else if c == Red && y > x then balance(Node(Black, Node(Red, Leaf, y, l), x, r), y, t')
      else if c == Black && y < x then balance(Node(Red, l, y, Node(Black, Leaf, x, r)), y, t')
      else if c == Black && y > x then balance(Node(Red, Node(Black, Leaf, y, l), x, r), y, t')
      else t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(c, l, _, r) => 1 + max(height(l), height(r))
  }

fn balance(t: Tree, x: Int, r: Tree) -> Tree =
  match t {
    Leaf => Node(Red, Leaf, x, r)
    Node(c, l, y, t') =>
      if c == Red && y == x && t' == Leaf then Node(Black, l, x, r)
      else if c == Red && y == x then balance(Node(Black, l, x, r), y, t')
      else if c == Red && y < x then balance(Node(Black, Node(Red, l, y, Leaf), x, r), y, t')
      else if c == Red && y > x then balance(Node(Black, Node(Red, Leaf, y, l), x, r), y, t')
      else if c == Black && y < x then balance(Node(Red, l, y, Node(Black, Leaf, x, r)), y, t')
      else if c == Black && y > x then balance(Node(Red, Node(Black, Leaf, y, l), x, r), y, t')
      else t
  }

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Black, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if v == x then Node(Black, Leaf, x, r) + [Leaf]
      else if v < x then balance(Node(Red, l, v, Leaf), x, r)
      else balance(Node(Red, Leaf, x, r), v, l)
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(c, l, _, r) => 1 + max(height(l), height(r))
  }
```

**Diagnostic:**

```
error: Expected RParen at line 19:20 (got String ') =>
      if c == Red && y == x && t')
  --> /tmp/dojo-red-black-tree-3.almd:19:20
  here: Node(c, l, y, t') =>
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
   |
19 |     Node(c, l, y, t') =>
   |                    ^
error[E012]: duplicate function 'insert'
  at line 29
  in fn insert
  here: fn inorder(t: Tree) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 7 | fn insert(t: Tree, v: Int) -> Tree =
   | --------------------------------- first definition of 'insert' here
...
29 | fn inorder(t: Tree) -> List[Int] =
   | ^
error: operator '+' requires numeric, String, or List types but got Tree and List[Tree]
  --> /tmp/dojo-red-black-tree-3.almd:11:49
  in operator +
  here: if v == x then Node(Black, Leaf, x, r) + [Leaf]
  hint: Use + with numeric types, String, or List
   |
11 |       if v == x then Node(Black, Leaf, x, r) + [Leaf]
   |                                                 ^^^^
error: operator '+' requires numeric, String, or List types but got Tree and List[Tree]
  --> /tmp/dojo-red-black-tree-3.almd:33:49
  in operator +
  here: }
  hint: Use + with numeric types, String, or List
   |
33 |   }
   |                                                 ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-3.almd:40:13
  in call to List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
error[E002]: undefined function 'max'
  --> /tmp/dojo-red-black-tree-3.almd:47:29
  in call to max()
  here: else if c == Red && y < x then balance(Node(Black, Node(Red, l, y, Leaf), x, r), y, t')
  hint: Check the function name
   |
47 |       else if c == Red && y < x then balance(Node(Black, Node(Red, l, y, Leaf), x, r), y, t')
   |                             ^^^
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-3.almd:41:52
  in match arm
  here: fn balance(t: Tree, x: Int, r: Tree) -> Tree =
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
41 | fn balance(t: Tree, x: Int, r: Tree) -> Tree =
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-3.almd:41:52
  in fn 'inorder'
  here: fn balance(t: Tree, x: Int, r: Tree) -> Tree =
  hint: Fix the expression type or change the expected type
   |
41 | fn balance(t: Tree, x: Int, r: Tree) -> Tree =
   |                                                    ^

8 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
