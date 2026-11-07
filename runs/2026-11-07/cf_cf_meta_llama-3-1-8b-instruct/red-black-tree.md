# red-black-tree

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E012`

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
      else if v < x then balance(Node(c, l, v, r), x)
      else balance(Node(c, Node(Black, Leaf, v, Leaf), x, r), x)
  }

fn balance(t: Tree, x: Int) -> Tree =
  match t {
    Node(Red, Node(Red, l1, x1, l2), x, r) =>
      Node(Black, Node(Black, l1, x1, l2), x, r)
    Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, Leaf))
    Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, Leaf))
    t => t
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
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-0.almd:23:7
  in match
  here: Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, Leaf))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
23 |       Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, Leaf))
   |       ^^^^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-0.almd:29:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
29 |     Leaf => List()
   |             ^^^^
error[E002]: undefined function 'max'
  --> /tmp/dojo-red-black-tree-0.almd:36:29
  in call to max()
  here: Node(c, l, _, r) => 1 + max(height(l), height(r))
  hint: Check the function name
   |
36 |     Node(c, l, _, r) => 1 + max(height(l), height(r))
   |                             ^^^
error[E001]: type mismatch in match arm: expected List[Int] but got List — List[Int] is the declared return type, and the arm at line 30 produces it
  --> /tmp/dojo-red-black-tree-0.almd:29:13
  in match arm
  here: Leaf => List()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
29 |     Leaf => List()
   |             ^^^^

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
    Leaf => Node(Black, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if v == x then Node(Black, Leaf, v, Leaf)
      else if v < x then balance(Node(c, l, v, r), x)
      else balance(Node(c, Node(Black, Leaf, v, Leaf), x, r), x)
  }

fn balance(t: Tree, x: Int) -> Tree =
  match t {
    Node(Red, Node(Red, l1, x1, l2), x, r) =>
      Node(Black, Node(Black, l1, x1, l2), x, r)
    Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, Leaf))
    Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, Leaf))
    t => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(c, l, _, r) => 1 + int.max(height(l), height(r))
  }

fn max(a: Int, b: Int) -> Int =
  if a > b then a else b
```

**Diagnostic:**

```
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-1.almd:23:7
  in match
  here: Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, Leaf))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
23 |       Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, Leaf))
   |       ^^^^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-1.almd:29:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
29 |     Leaf => List()
   |             ^^^^
error[E001]: type mismatch in match arm: expected List[Int] but got List — List[Int] is the declared return type, and the arm at line 30 produces it
  --> /tmp/dojo-red-black-tree-1.almd:29:13
  in match arm
  here: Leaf => List()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
29 |     Leaf => List()
   |             ^^^^

3 error(s) found
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
      if v == x then Node(Black, Leaf, v, Leaf)
      else if v < x then balance(Node(c, l, v, r), x)
      else balance(Node(c, Node(Black, Leaf, v, Leaf), x, r), x)
  }

fn balance(t: Tree, x: Int) -> Tree =
  match t {
    Node(Red, Node(Red, l1, x1, l2), x, r) =>
      Node(Black, Node(Black, l1, x1, l2), x, r)
    Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, Leaf))
    Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, Leaf))
    Node(Red, l, x, r) =>
      Node(Black, l, x, r)
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(c, l, _, r) => 1 + int.max(height(l), height(r))
  }

fn max(a: Int, b: Int) -> Int =
  if a > b then a else b

fn list() -> List[Int] = List()
```

**Diagnostic:**

```
error[E010]: non-exhaustive match: missing Leaf, Node(Black, Leaf, _, Leaf), Node(Black, Node(_, _, _, _), _, Leaf)
  --> /tmp/dojo-red-black-tree-2.almd:17:9
  in match
  here: match t {
  hint: add arms for Leaf, Node(Black, Leaf, _, Leaf), Node(Black, Node(_, _, _, _), _, Leaf):
  Leaf => _
  Node(Black, Leaf, arg1, Leaf) => _
  Node(Black, Node(arg1, arg2, arg3, arg4), arg5, Leaf) => _
Or use `_ => todo()` to compile incrementally.
   |
17 |   match t {
   |         ^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-2.almd:23:7
  in match
  here: Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, Leaf))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
23 |       Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, Leaf))
   |       ^^^^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-2.almd:30:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
30 |     Leaf => List()
   |             ^^^^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-2.almd:43:26
  in call to List()
  here: fn list() -> List[Int] = List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
43 | fn list() -> List[Int] = List()
   |                          ^^^^
error[E001]: type mismatch in match arm: expected List[Int] but got List — List[Int] is the declared return type, and the arm at line 31 produces it
  --> /tmp/dojo-red-black-tree-2.almd:30:13
  in match arm
  here: Leaf => List()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
30 |     Leaf => List()
   |             ^^^^
error[E001]: type mismatch in fn 'list': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-2.almd:43:26
  in fn 'list'
  here: fn list() -> List[Int] = List()
  hint: Fix the expression type or change the expected type
   |
43 | fn list() -> List[Int] = List()
   |                          ^^^^

6 error(s) found
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
      if v == x then Node(Black, Leaf, v, Leaf)
      else if v < x then balance(Node(c, l, v, r), x)
      else balance(Node(c, Node(Black, Leaf, v, Leaf), x, r), x)
  }

fn balance(t: Tree, x: Int) -> Tree =
  match t {
    Node(Red, Node(Red, l1, x1, l2), x, r) =>
      Node(Black, Node(Black, l1, x1, l2), x, r)
    Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, Leaf))
    Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, Leaf))
    Node(Red, l, x, r) =>
      Node(Black, l, x, r)
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(c, l, _, r) => 1 + int.max(height(l), height(r))
  }

fn max(a: Int, b: Int) -> Int =
  if a > b then a else b

fn list() -> List[Int] = list()

fn list() -> List[Int] = List()
```

**Diagnostic:**

```
error[E012]: duplicate function 'list'
  at line 45
  in fn list
  here: fn list() -> List[Int] = List()
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
43 | fn list() -> List[Int] = list()
   | ------------------------------- first definition of 'list' here
...
45 | fn list() -> List[Int] = List()
   | ^
error[E010]: non-exhaustive match: missing Leaf, Node(Black, Leaf, _, Leaf), Node(Black, Node(_, _, _, _), _, Leaf)
  --> /tmp/dojo-red-black-tree-3.almd:17:9
  in match
  here: match t {
  hint: add arms for Leaf, Node(Black, Leaf, _, Leaf), Node(Black, Node(_, _, _, _), _, Leaf):
  Leaf => _
  Node(Black, Leaf, arg1, Leaf) => _
  Node(Black, Node(arg1, arg2, arg3, arg4), arg5, Leaf) => _
Or use `_ => todo()` to compile incrementally.
   |
17 |   match t {
   |         ^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-3.almd:23:7
  in match
  here: Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, Leaf))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
23 |       Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, Leaf))
   |       ^^^^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-3.almd:30:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
30 |     Leaf => List()
   |             ^^^^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-3.almd:45:26
  in call to List()
  here: fn list() -> List[Int] = List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
45 | fn list() -> List[Int] = List()
   |                          ^^^^
error[E001]: type mismatch in match arm: expected List[Int] but got List — List[Int] is the declared return type, and the arm at line 31 produces it
  --> /tmp/dojo-red-black-tree-3.almd:30:13
  in match arm
  here: Leaf => List()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
30 |     Leaf => List()
   |             ^^^^
error[E001]: type mismatch in fn 'list': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-3.almd:45:26
  in fn 'list'
  here: fn list() -> List[Int] = List()
  hint: Fix the expression type or change the expected type
   |
45 | fn list() -> List[Int] = List()
   |                          ^^^^

7 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
