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
      else if v < x then balance(Node(Red, l, v, Node(Red, Leaf, x, r)))
      else balance(Node(Red, Node(Red, Leaf, x, r), v, l))
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, l, x, r), v, Node(Red, Leaf, y, Leaf)) =>
      Node(Black, Node(Red, l, x, Node(Red, Leaf, y, Leaf)), v, Node(Black, r, y, Leaf))
    Node(Red, Node(Red, l, x, Node(Red, Leaf, y, Leaf)), v, r) =>
      Node(Black, Node(Red, l, x, Node(Red, Leaf, y, Leaf)), v, Node(Black, r, y, Leaf))
    Node(Red, l, x, Node(Red, Node(Red, Leaf, y, Leaf), v, r)) =>
      Node(Black, Node(Red, l, x, Node(Red, Node(Red, Leaf, y, Leaf), v, r)), y, Leaf)
    Node(Red, l, x, Node(Red, Leaf, y, Node(Red, Leaf, v, r))) =>
      Node(Black, Node(Red, l, x, Node(Red, Leaf, y, Node(Red, Leaf, v, r))), y, Leaf)
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
    Node(_, l, _, r) => 1 + max(height(l), height(r))
  }
```

**Diagnostic:**

```
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-0.almd:31:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
31 |     Leaf => List()
   |             ^^^^
error[E002]: undefined function 'max'
  --> /tmp/dojo-red-black-tree-0.almd:38:29
  in call to max()
  here: Node(_, l, _, r) => 1 + max(height(l), height(r))
  hint: Check the function name
   |
38 |     Node(_, l, _, r) => 1 + max(height(l), height(r))
   |                             ^^^
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-0.almd:32:52
  in match arm
  here: Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
32 |     Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-0.almd:32:52
  in fn 'inorder'
  here: Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Fix the expression type or change the expected type
   |
32 |     Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^

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
      if v == x then t
      else if v < x then balance(Node(Red, l, v, Node(Red, Leaf, x, r)))
      else balance(Node(Red, Node(Red, Leaf, x, r), v, l))
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, l, x, r), v, Node(Red, Leaf, y, Leaf)) =>
      Node(Black, Node(Red, l, x, Node(Red, Leaf, y, Leaf)), v, Node(Black, r, y, Leaf))
    Node(Red, Node(Red, l, x, Node(Red, Leaf, y, Leaf)), v, r) =>
      Node(Black, Node(Red, l, x, Node(Red, Leaf, y, Leaf)), v, Node(Black, r, y, Leaf))
    Node(Red, l, x, Node(Red, Node(Red, Leaf, y, Leaf), v, r)) =>
      Node(Black, Node(Red, l, x, Node(Red, Node(Red, Leaf, y, Leaf), v, r)), y, Leaf)
    Node(Red, l, x, Node(Red, Leaf, y, Node(Red, Leaf, v, r))) =>
      Node(Black, Node(Red, l, x, Node(Red, Leaf, y, Node(Red, Leaf, v, r))), y, Leaf)
    t => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(c, l, x, r) => list.concat(list.map(inorder(l), identity), [x], list.map(inorder(r), identity))
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], identity))
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, l, x, r), v, Node(Red, Leaf, y, Leaf)) =>
      Node(Black, Node(Red, l, x, Node(Red, Leaf, y, Leaf)), v, Node(Black, r, y, Leaf))
    Node(Red, Node(Red, l, x, Node(Red, Leaf, y, Leaf)), v, r) =>
      Node(Black, Node(Red, l, x, Node(Red, Leaf, y, Leaf)), v, Node(Black, r, y, Leaf))
    Node(Red, l, x, Node(Red, Node(Red, Leaf, y, Leaf), v, r)) =>
      Node(Black, Node(Red, l, x, Node(Red, Node(Red, Leaf, y, Leaf), v, r)), y, Leaf)
    Node(Red, l, x, Node(Red, Leaf, y, Node(Red, Leaf, v, r))) =>
      Node(Black, Node(Red, l, x, Node(Red, Leaf, y, Node(Red, Leaf, v, r))), y, Leaf)
    t => t
  }
```

**Diagnostic:**

```
error[E012]: duplicate function 'balance'
  at line 41
  in fn balance
  here: fn balance(t: Tree) -> Tree =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
16 | fn balance(t: Tree) -> Tree =
   | ---------------------------------- first definition of 'balance' here
...
41 | fn balance(t: Tree) -> Tree =
   | ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-1.almd:31:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
31 |     Leaf => List()
   |             ^^^^
error[E003]: undefined variable 'identity'
  --> /tmp/dojo-red-black-tree-1.almd:32:58
  in variable identity
  here: Node(c, l, x, r) => list.concat(list.map(inorder(l), identity), [x], list.map(inorder(r), identity))
  hint: Check the variable name
   |
32 |     Node(c, l, x, r) => list.concat(list.map(inorder(l), identity), [x], list.map(inorder(r), identity))
   |                                                          ^^^^^^^^
error[E003]: undefined variable 'identity'
  --> /tmp/dojo-red-black-tree-1.almd:32:95
  in variable identity
  here: Node(c, l, x, r) => list.concat(list.map(inorder(l), identity), [x], list.map(inorder(r), identity))
  hint: Check the variable name
   |
32 |     Node(c, l, x, r) => list.concat(list.map(inorder(l), identity), [x], list.map(inorder(r), identity))
   |                                                                                               ^^^^^^^^
error[E002]: undefined function 'list.concat'
  --> /tmp/dojo-red-black-tree-1.almd:32:25
  in call to list.concat()
  here: Node(c, l, x, r) => list.concat(list.map(inorder(l), identity), [x], list.map(inorder(r), identity))
  hint: No function 'concat' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
32 |     Node(c, l, x, r) => list.concat(list.map(inorder(l), identity), [x], list.map(inorder(r), identity))
   |                         ^^^^^^^^^^^
error[E003]: undefined variable 'identity'
  --> /tmp/dojo-red-black-tree-1.almd:38:71
  in variable identity
  here: Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], identity))
  hint: Check the variable name
   |
38 |     Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], identity))
   |                                                                       ^^^^^^^^
error: operator '+' requires numeric, String, or List types but got Int and Option[?2]
  --> /tmp/dojo-red-black-tree-1.almd:38:71
  in operator +
  here: Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], identity))
  hint: Use + with numeric types, String, or List
   |
38 |     Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], identity))
   |                                                                       ^^^^^^^^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-1.almd:32:95
  in fn 'inorder'
  here: Node(c, l, x, r) => list.concat(list.map(inorder(l), identity), [x], list.map(inorder(r), identity))
  hint: Fix the expression type or change the expected type
   |
32 |     Node(c, l, x, r) => list.concat(list.map(inorder(l), identity), [x], list.map(inorder(r), identity))
   |                                                                                               ^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?0])
  --> /tmp/dojo-red-black-tree-1.almd:32:37
  in this expression with an unconstrained type
  here: Node(c, l, x, r) => list.concat(list.map(inorder(l), identity), [x], list.map(inorder(r), identity))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
32 |     Node(c, l, x, r) => list.concat(list.map(inorder(l), identity), [x], list.map(inorder(r), identity))
   |                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?1])
  --> /tmp/dojo-red-black-tree-1.almd:32:74
  in this expression with an unconstrained type
  here: Node(c, l, x, r) => list.concat(list.map(inorder(l), identity), [x], list.map(inorder(r), identity))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
32 |     Node(c, l, x, r) => list.concat(list.map(inorder(l), identity), [x], list.map(inorder(r), identity))
   |                                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?2])
  --> /tmp/dojo-red-black-tree-1.almd:38:38
  in this expression with an unconstrained type
  here: Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], identity))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
38 |     Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], identity))
   |                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?2])
  --> /tmp/dojo-red-black-tree-1.almd:38:29
  in this expression with an unconstrained type
  here: Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], identity))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
38 |     Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], identity))
   |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

12 error(s) found
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
      if v == x then t
      else if v < x then balance(Node(Red, l, v, Node(Red, Leaf, x, r)))
      else balance(Node(Red, Node(Red, Leaf, x, r), v, l))
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, l, x, r), v, Node(Red, Leaf, y, Leaf)) =>
      Node(Black, Node(Red, l, x, Node(Red, Leaf, y, Leaf)), v, Node(Black, r, y, Leaf))
    Node(Red, Node(Red, l, x, Node(Red, Leaf, y, Leaf)), v, r) =>
      Node(Black, Node(Red, l, x, Node(Red, Leaf, y, Leaf)), v, Node(Black, r, y, Leaf))
    Node(Red, l, x, Node(Red, Node(Red, Leaf, y, Leaf), v, r)) =>
      Node(Black, Node(Red, l, x, Node(Red, Node(Red, Leaf, y, Leaf), v, r)), y, Leaf)
    Node(Red, l, x, Node(Red, Leaf, y, Node(Red, Leaf, v, r))) =>
      Node(Black, Node(Red, l, x, Node(Red, Leaf, y, Node(Red, Leaf, v, r))), y, Leaf)
    t => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(c, l, x, r) => list.concat(list.map(inorder(l), identity), [x], list.map(inorder(r), identity))
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], identity))
  }

fn identity(x: Int) -> Int = x

fn list_concat(xs: List[Int], ys: List[Int]) -> List[Int] =
  list.fold(xs, ys, (acc, x) => acc + [x])

fn list_max(xs: List[Int]) -> Option[Int] =
  match xs {
    List() => none
    List(x) => some(x)
    List(x, xs) => match list_max(xs) {
      none => some(x)
      some(y) => if x > y then some(x) else some(y)
    }
  }

fn list_max(xs: List[Int], ys: List[Int]) -> Option[Int] =
  match list_max(xs) {
    none => list_max(ys)
    some(x) => match list_max(ys) {
      none => some(x)
      some(y) => if x > y then some(x) else some(y)
    }
  }
```

**Diagnostic:**

```
error[E012]: duplicate function 'list_max'
  at line 56
  in fn list_max
  here: fn list_max(xs: List[Int], ys: List[Int]) -> Option[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
46 | fn list_max(xs: List[Int]) -> Option[Int] =
   | ----------------------------------- first definition of 'list_max' here
...
56 | fn list_max(xs: List[Int], ys: List[Int]) -> Option[Int] =
   | ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-2.almd:31:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
31 |     Leaf => List()
   |             ^^^^
error[E002]: undefined function 'list.concat'
  --> /tmp/dojo-red-black-tree-2.almd:32:25
  in call to list.concat()
  here: Node(c, l, x, r) => list.concat(list.map(inorder(l), identity), [x], list.map(inorder(r), identity))
  hint: No function 'concat' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
32 |     Node(c, l, x, r) => list.concat(list.map(inorder(l), identity), [x], list.map(inorder(r), identity))
   |                         ^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got Int and Option[Int]
  --> /tmp/dojo-red-black-tree-2.almd:38:71
  in operator +
  here: Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], identity))
  hint: Use + with numeric types, String, or List
   |
38 |     Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], identity))
   |                                                                       ^^^^^^^^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-2.almd:32:95
  in fn 'inorder'
  here: Node(c, l, x, r) => list.concat(list.map(inorder(l), identity), [x], list.map(inorder(r), identity))
  hint: Fix the expression type or change the expected type
   |
32 |     Node(c, l, x, r) => list.concat(list.map(inorder(l), identity), [x], list.map(inorder(r), identity))
   |                                                                                               ^^^^^^^^

5 error(s) found
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
      if v == x then t
      else if v < x then balance(Node(Red, l, v, Node(Red, Leaf, x, r)))
      else balance(Node(Red, Node(Red, Leaf, x, r), v, l))
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, l, x, r), v, Node(Red, Leaf, y, Leaf)) =>
      Node(Black, Node(Red, l, x, Node(Red, Leaf, y, Leaf)), v, Node(Black, r, y, Leaf))
    Node(Red, Node(Red, l, x, Node(Red, Leaf, y, Leaf)), v, r) =>
      Node(Black, Node(Red, l, x, Node(Red, Leaf, y, Leaf)), v, Node(Black, r, y, Leaf))
    Node(Red, l, x, Node(Red, Node(Red, Leaf, y, Leaf), v, r)) =>
      Node(Black, Node(Red, l, x, Node(Red, Node(Red, Leaf, y, Leaf), v, r)), y, Leaf)
    Node(Red, l, x, Node(Red, Leaf, y, Node(Red, Leaf, v, r))) =>
      Node(Black, Node(Red, l, x, Node(Red, Leaf, y, Node(Red, Leaf, v, r))), y, Leaf)
    t => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(c, l, x, r) => list.concat(list.map(inorder(l), identity), [x], list.map(inorder(r), identity))
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], identity))
  }

fn identity(x: Int) -> Int = x

fn list_concat(xs: List[Int], ys: List[Int]) -> List[Int] =
  list.fold(xs, ys, (acc, x) => acc + [x])

fn list_max(xs: List[Int]) -> Option[Int] =
  match xs {
    List() => none
    List(x) => some(x)
    List(x, xs) => match list_max(xs) {
      none => some(x)
      some(y) => if x > y then some(x) else some(y)
    }
  }

fn list_max(xs: List[Int], ys: List[Int]) -> Option[Int] =
  match list_max(xs) {
    none => list_max(ys)
    some(x) => match list_max(ys) {
      none => some(x)
      some(y) => if x > y then some(x) else some(y)
    }
  }

fn list_max(xs: List[Int], ys: List[Int], zs: List[Int]) -> Option[Int] =
  match list_max(xs) {
    none => list_max(ys, zs)
    some(x) => match list_max(ys, zs) {
      none => some(x)
      some(y) => if x > y then some(x) else some(y)
    }
  }

fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int]) -> Option[Int] =
  match list_max(xs) {
    none => list_max(ys, zs, wt)
    some(x) => match list_max(ys, zs, wt) {
      none => some(x)
      some(y) => if x > y then some(x) else some(y)
    }
  }

fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int]) -> Option[Int] =
  match list_max(xs) {
    none => list_max(ys, zs, wt, vu)
    some(x) => match list_max(ys, zs, wt, vu) {
      none => some(x)
      some(y) => if x > y then some(x) else some(y)
    }
  }

fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int]) -> Option[Int] =
  match list_max(xs) {
    none => list_max(ys, zs, wt, vu, xd)
    some(x) => match list_max(ys, zs, wt, vu, xd) {
      none => some(x)
      some(y) => if x > y then some(x) else some(y)
    }
  }

fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int]) -> Option[Int] =
  match list_max(xs) {
    none => list_max(ys, zs, wt, vu, xd, yz)
    some(x) => match list_max(ys, zs, wt, vu, xd, yz) {
      none => some(x)
      some(y) => if x > y then some(x) else some(y)
    }
  }

fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int]) -> Option[Int] =
  match list_max(xs) {
    none => list_max(ys, zs, wt, vu, xd, yz, ab)
    some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab) {
      none => some(x)
      some(y) => if x > y then some(x) else some(y)
    }
  }

fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int]) -> Option[Int] =
  match list_max(xs) {
    none => list_max(ys, zs, wt, vu, xd, yz, ab, cd)
    some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd) {
      none => some(x)
      some(y) => if x > y then some(x) else some(y)
    }
  }

fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int]) -> Option[Int] =
  match list_max(xs) {
    none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef)
    some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef) {
      none => some(x)
      some(y) => if x > y then some(x) else some(y)
    }
  }

fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int]) -> Option[Int] =
  match list_max(xs) {
    none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh)
    some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh) {
      none => some(x)
      some(y) => if x > y then some(x) else some(y)
    }
  }

fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int]) -> Option[Int] =
  match list_max(xs) {
    none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij)
    some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij) {
      none => some(x)
      some(y) => if x > y then some(x) else some(y)
    }
  }

fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int]) -> Option[Int] =
  match list_max(xs) {
    none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl)
    some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl) {
      none => some(x)
      some(y) => if x > y then some(x) else some(y)
    }
  }

fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int]) -> Option[Int] =
  match list_max(xs) {
    none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn)
    some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn) {
      none => some(x)
      some(y) => if x > y then some(x) else some(y)
    }
  }

fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int], no: List[Int]) -> Option[Int] =
  match list_max(xs) {
    none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no)
    some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no) {
      none => some(x)
      some(y) => if x > y then some(x) else some(y)
    }
  }

fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int], no: List[Int], pq: List[Int]) -> Option[Int] =
  match list_max(xs) {
    none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq)
    some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq) {
      none => some(x)
      some(y) => if x > y then some(x) else some(y)
    }
  }

fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int], no: List[Int], pq: List[Int], rs: List[Int]) -> Option[Int] =
  match list_max(xs) {
    none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs)
    some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs) {
      none => some(x)
      some(y) => if x > y then some(x) else some(y)
    }
  }

fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int], no: List[Int], pq: List[Int], rs: List[Int], tu: List[Int]) -> Option[Int] =
  match list_max(xs) {
    none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu)
    some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu) {
      none => some(x)
      some(y) => if x > y then some(x) else some(y)
    }
  }

fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int], no: List[Int], pq: List[Int], rs: List[Int], tu: List[Int], vw: List[Int]) -> Option[Int] =
  match list_max(xs) {
    none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu, vw)
    some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu, vw) {
      none => some(x)
      some(y) => if x > y then some(x) else some(y)
    }
  }

fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int], no: List[Int], pq: List[Int], rs: List[Int], tu: List[Int], vw: List[Int], xy: List[Int]) -> Option[Int] =
  match list_max(xs) {
    none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu, vw, xy)
    some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu, vw, xy) {
      none => some(x)
      some(y) => if x > y then some(x) else some(y)
    }
  }

fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int], no: List[Int], pq: List[Int], rs: List[Int], tu: List[Int], vw: List[Int], xy: List[Int], zc: List[Int]) -> Option[Int] =
  match list_max(xs) {
    none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu, vw, xy, zc)
    some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu, vw, xy, zc) {
      none => some(x)
      some(y) => if x > y then some(x) else some(y)
    }
  }

fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int], no: List[Int], pq: List[Int], rs: List[Int], tu: List[Int], vw: List[Int], xy: List[Int], zc: List[Int], de: List[Int]) -> Option[Int] =
  match list_max(xs) {
    none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu, vw, xy, zc, de)
    some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu, vw, xy, zc, de) {
      none => some(x)
      some(y) => if x > y then some(x) else some(y)
    }
  }

fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List
```

**Diagnostic:**

```
error: Expected ')' to close function parameters opened at line 245:12
  --> /tmp/dojo-red-black-tree-3.almd:247:1
  here: test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
  hint: Add ')' or check for a missing delimiter inside the function parameters
    |
245 | fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List
    |            --------------- '(' opened here
 ...
247 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
    | ^^^^
error[E012]: duplicate function 'list_max'
  at line 56
  in fn list_max
  here: fn list_max(xs: List[Int], ys: List[Int]) -> Option[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
46 | fn list_max(xs: List[Int]) -> Option[Int] =
   | ----------------------------------- first definition of 'list_max' here
...
56 | fn list_max(xs: List[Int], ys: List[Int]) -> Option[Int] =
   | ^
error[E012]: duplicate function 'list_max'
  at line 65
  in fn list_max
  here: fn list_max(xs: List[Int], ys: List[Int], zs: List[Int]) -> Option[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
46 | fn list_max(xs: List[Int]) -> Option[Int] =
   | ----------------------------------- first definition of 'list_max' here
...
65 | fn list_max(xs: List[Int], ys: List[Int], zs: List[Int]) -> Option[Int] =
   | ^
error[E012]: duplicate function 'list_max'
  at line 74
  in fn list_max
  here: fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int]) -> Option[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
46 | fn list_max(xs: List[Int]) -> Option[Int] =
   | ----------------------------------- first definition of 'list_max' here
...
74 | fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int]) -> Option[Int] =
   | ^
error[E012]: duplicate function 'list_max'
  at line 83
  in fn list_max
  here: fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int]) -> Option[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
46 | fn list_max(xs: List[Int]) -> Option[Int] =
   | ----------------------------------- first definition of 'list_max' here
...
83 | fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int]) -> Option[Int] =
   | ^
error[E012]: duplicate function 'list_max'
  at line 92
  in fn list_max
  here: fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int]) -> Option[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
46 | fn list_max(xs: List[Int]) -> Option[Int] =
   | ----------------------------------- first definition of 'list_max' here
...
92 | fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int]) -> Option[Int] =
   | ^
error[E012]: duplicate function 'list_max'
  at line 101
  in fn list_max
  here: fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int]) -> Option[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 46 | fn list_max(xs: List[Int]) -> Option[Int] =
    | ----------------------------------- first definition of 'list_max' here
 ...
101 | fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int]) -> Option[Int] =
    | ^
error[E012]: duplicate function 'list_max'
  at line 110
  in fn list_max
  here: fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int]) -> Option[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 46 | fn list_max(xs: List[Int]) -> Option[Int] =
    | ----------------------------------- first definition of 'list_max' here
 ...
110 | fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int]) -> Option[Int] =
    | ^
error[E012]: duplicate function 'list_max'
  at line 119
  in fn list_max
  here: fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int]) -> Option[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 46 | fn list_max(xs: List[Int]) -> Option[Int] =
    | ----------------------------------- first definition of 'list_max' here
 ...
119 | fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int]) -> Option[Int] =
    | ^
error[E012]: duplicate function 'list_max'
  at line 128
  in fn list_max
  here: fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int]) -> Option[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 46 | fn list_max(xs: List[Int]) -> Option[Int] =
    | ----------------------------------- first definition of 'list_max' here
 ...
128 | fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int]) -> Option[Int] =
    | ^
error[E012]: duplicate function 'list_max'
  at line 137
  in fn list_max
  here: fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int]) -> Option[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 46 | fn list_max(xs: List[Int]) -> Option[Int] =
    | ----------------------------------- first definition of 'list_max' here
 ...
137 | fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int]) -> Option[Int] =
    | ^
error[E012]: duplicate function 'list_max'
  at line 146
  in fn list_max
  here: fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int]) -> Option[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 46 | fn list_max(xs: List[Int]) -> Option[Int] =
    | ----------------------------------- first definition of 'list_max' here
 ...
146 | fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int]) -> Option[Int] =
    | ^
error[E012]: duplicate function 'list_max'
  at line 155
  in fn list_max
  here: fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int]) -> Option[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 46 | fn list_max(xs: List[Int]) -> Option[Int] =
    | ----------------------------------- first definition of 'list_max' here
 ...
155 | fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int]) -> Option[Int] =
    | ^
error[E012]: duplicate function 'list_max'
  at line 164
  in fn list_max
  here: fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int]) -> Option[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 46 | fn list_max(xs: List[Int]) -> Option[Int] =
    | ----------------------------------- first definition of 'list_max' here
 ...
164 | fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int]) -> Option[Int] =
    | ^
error[E012]: duplicate function 'list_max'
  at line 173
  in fn list_max
  here: fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int], no: List[Int]) -> Option[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 46 | fn list_max(xs: List[Int]) -> Option[Int] =
    | ----------------------------------- first definition of 'list_max' here
 ...
173 | fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int], no: List[Int]) -> Option[Int] =
    | ^
error[E012]: duplicate function 'list_max'
  at line 182
  in fn list_max
  here: fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int], no: List[Int], pq: List[Int]) -> Option[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 46 | fn list_max(xs: List[Int]) -> Option[Int] =
    | ----------------------------------- first definition of 'list_max' here
 ...
182 | fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int], no: List[Int], pq: List[Int]) -> Option[Int] =
    | ^
error[E012]: duplicate function 'list_max'
  at line 191
  in fn list_max
  here: fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int], no: List[Int], pq: List[Int], rs: List[Int]) -> Option[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 46 | fn list_max(xs: List[Int]) -> Option[Int] =
    | ----------------------------------- first definition of 'list_max' here
 ...
191 | fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int], no: List[Int], pq: List[Int], rs: List[Int]) -> Option[Int] =
    | ^
error[E012]: duplicate function 'list_max'
  at line 200
  in fn list_max
  here: fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int], no: List[Int], pq: List[Int], rs: List[Int], tu: List[Int]) -> Option[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 46 | fn list_max(xs: List[Int]) -> Option[Int] =
    | ----------------------------------- first definition of 'list_max' here
 ...
200 | fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int], no: List[Int], pq: List[Int], rs: List[Int], tu: List[Int]) -> Option[Int] =
    | ^
error[E012]: duplicate function 'list_max'
  at line 209
  in fn list_max
  here: fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int], no: List[Int], pq: List[Int], rs: List[Int], tu: List[Int], vw: List[Int]) -> Option[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 46 | fn list_max(xs: List[Int]) -> Option[Int] =
    | ----------------------------------- first definition of 'list_max' here
 ...
209 | fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int], no: List[Int], pq: List[Int], rs: List[Int], tu: List[Int], vw: List[Int]) -> Option[Int] =
    | ^
error[E012]: duplicate function 'list_max'
  at line 218
  in fn list_max
  here: fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int], no: List[Int], pq: List[Int], rs: List[Int], tu: List[Int], vw: List[Int], xy: List[Int]) -> Option[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 46 | fn list_max(xs: List[Int]) -> Option[Int] =
    | ----------------------------------- first definition of 'list_max' here
 ...
218 | fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int], no: List[Int], pq: List[Int], rs: List[Int], tu: List[Int], vw: List[Int], xy: List[Int]) -> Option[Int] =
    | ^
error[E012]: duplicate function 'list_max'
  at line 227
  in fn list_max
  here: fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int], no: List[Int], pq: List[Int], rs: List[Int], tu: List[Int], vw: List[Int], xy: List[Int], zc: List[Int]) -> Option[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 46 | fn list_max(xs: List[Int]) -> Option[Int] =
    | ----------------------------------- first definition of 'list_max' here
 ...
227 | fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int], no: List[Int], pq: List[Int], rs: List[Int], tu: List[Int], vw: List[Int], xy: List[Int], zc: List[Int]) -> Option[Int] =
    | ^
error[E012]: duplicate function 'list_max'
  at line 236
  in fn list_max
  here: fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int], no: List[Int], pq: List[Int], rs: List[Int], tu: List[Int], vw: List[Int], xy: List[Int], zc: List[Int], de: List[Int]) -> Option[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 46 | fn list_max(xs: List[Int]) -> Option[Int] =
    | ----------------------------------- first definition of 'list_max' here
 ...
236 | fn list_max(xs: List[Int], ys: List[Int], zs: List[Int], wt: List[Int], vu: List[Int], xd: List[Int], yz: List[Int], ab: List[Int], cd: List[Int], ef: List[Int], gh: List[Int], ij: List[Int], kl: List[Int], mn: List[Int], no: List[Int], pq: List[Int], rs: List[Int], tu: List[Int], vw: List[Int], xy: List[Int], zc: List[Int], de: List[Int]) -> Option[Int] =
    | ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-3.almd:31:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
31 |     Leaf => List()
   |             ^^^^
error[E002]: undefined function 'list.concat'
  --> /tmp/dojo-red-black-tree-3.almd:32:25
  in call to list.concat()
  here: Node(c, l, x, r) => list.concat(list.map(inorder(l), identity), [x], list.map(inorder(r), identity))
  hint: No function 'concat' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
32 |     Node(c, l, x, r) => list.concat(list.map(inorder(l), identity), [x], list.map(inorder(r), identity))
   |                         ^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got Int and Option[Int]
  --> /tmp/dojo-red-black-tree-3.almd:38:71
  in operator +
  here: Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], identity))
  hint: Use + with numeric types, String, or List
   |
38 |     Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], identity))
   |                                                                       ^^^^^^^^
error[E004]: list_max() expects 1 argument(s) but got 2
  --> /tmp/dojo-red-black-tree-3.almd:67:26
  in call to list_max()
  here: none => list_max(ys, zs)
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 2
      list_max(<xs: List[Int]>)
   |
67 |     none => list_max(ys, zs)
   |                          ^^
error[E004]: list_max() expects 1 argument(s) but got 2
  --> /tmp/dojo-red-black-tree-3.almd:68:35
  in call to list_max()
  here: some(x) => match list_max(ys, zs) {
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 2
      list_max(<xs: List[Int]>)
   |
68 |     some(x) => match list_max(ys, zs) {
   |                                   ^^
error[E004]: list_max() expects 1 argument(s) but got 3
  --> /tmp/dojo-red-black-tree-3.almd:76:30
  in call to list_max()
  here: none => list_max(ys, zs, wt)
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 3
      list_max(<xs: List[Int]>)
   |
76 |     none => list_max(ys, zs, wt)
   |                              ^^
error[E004]: list_max() expects 1 argument(s) but got 3
  --> /tmp/dojo-red-black-tree-3.almd:77:39
  in call to list_max()
  here: some(x) => match list_max(ys, zs, wt) {
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 3
      list_max(<xs: List[Int]>)
   |
77 |     some(x) => match list_max(ys, zs, wt) {
   |                                       ^^
error[E004]: list_max() expects 1 argument(s) but got 4
  --> /tmp/dojo-red-black-tree-3.almd:85:34
  in call to list_max()
  here: none => list_max(ys, zs, wt, vu)
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 4
      list_max(<xs: List[Int]>)
   |
85 |     none => list_max(ys, zs, wt, vu)
   |                                  ^^
error[E004]: list_max() expects 1 argument(s) but got 4
  --> /tmp/dojo-red-black-tree-3.almd:86:43
  in call to list_max()
  here: some(x) => match list_max(ys, zs, wt, vu) {
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 4
      list_max(<xs: List[Int]>)
   |
86 |     some(x) => match list_max(ys, zs, wt, vu) {
   |                                           ^^
error[E004]: list_max() expects 1 argument(s) but got 5
  --> /tmp/dojo-red-black-tree-3.almd:94:38
  in call to list_max()
  here: none => list_max(ys, zs, wt, vu, xd)
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 5
      list_max(<xs: List[Int]>)
   |
94 |     none => list_max(ys, zs, wt, vu, xd)
   |                                      ^^
error[E004]: list_max() expects 1 argument(s) but got 5
  --> /tmp/dojo-red-black-tree-3.almd:95:47
  in call to list_max()
  here: some(x) => match list_max(ys, zs, wt, vu, xd) {
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 5
      list_max(<xs: List[Int]>)
   |
95 |     some(x) => match list_max(ys, zs, wt, vu, xd) {
   |                                               ^^
error[E004]: list_max() expects 1 argument(s) but got 6
  --> /tmp/dojo-red-black-tree-3.almd:103:42
  in call to list_max()
  here: none => list_max(ys, zs, wt, vu, xd, yz)
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 6
      list_max(<xs: List[Int]>)
    |
103 |     none => list_max(ys, zs, wt, vu, xd, yz)
    |                                          ^^
error[E004]: list_max() expects 1 argument(s) but got 6
  --> /tmp/dojo-red-black-tree-3.almd:104:51
  in call to list_max()
  here: some(x) => match list_max(ys, zs, wt, vu, xd, yz) {
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 6
      list_max(<xs: List[Int]>)
    |
104 |     some(x) => match list_max(ys, zs, wt, vu, xd, yz) {
    |                                                   ^^
error[E004]: list_max() expects 1 argument(s) but got 7
  --> /tmp/dojo-red-black-tree-3.almd:112:46
  in call to list_max()
  here: none => list_max(ys, zs, wt, vu, xd, yz, ab)
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 7
      list_max(<xs: List[Int]>)
    |
112 |     none => list_max(ys, zs, wt, vu, xd, yz, ab)
    |                                              ^^
error[E004]: list_max() expects 1 argument(s) but got 7
  --> /tmp/dojo-red-black-tree-3.almd:113:55
  in call to list_max()
  here: some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab) {
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 7
      list_max(<xs: List[Int]>)
    |
113 |     some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab) {
    |                                                       ^^
error[E004]: list_max() expects 1 argument(s) but got 8
  --> /tmp/dojo-red-black-tree-3.almd:121:50
  in call to list_max()
  here: none => list_max(ys, zs, wt, vu, xd, yz, ab, cd)
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 8
      list_max(<xs: List[Int]>)
    |
121 |     none => list_max(ys, zs, wt, vu, xd, yz, ab, cd)
    |                                                  ^^
error[E004]: list_max() expects 1 argument(s) but got 8
  --> /tmp/dojo-red-black-tree-3.almd:122:59
  in call to list_max()
  here: some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd) {
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 8
      list_max(<xs: List[Int]>)
    |
122 |     some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd) {
    |                                                           ^^
error[E004]: list_max() expects 1 argument(s) but got 9
  --> /tmp/dojo-red-black-tree-3.almd:130:54
  in call to list_max()
  here: none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef)
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 9
      list_max(<xs: List[Int]>)
    |
130 |     none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef)
    |                                                      ^^
error[E004]: list_max() expects 1 argument(s) but got 9
  --> /tmp/dojo-red-black-tree-3.almd:131:63
  in call to list_max()
  here: some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef) {
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 9
      list_max(<xs: List[Int]>)
    |
131 |     some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef) {
    |                                                               ^^
error[E004]: list_max() expects 1 argument(s) but got 10
  --> /tmp/dojo-red-black-tree-3.almd:139:58
  in call to list_max()
  here: none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh)
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 10
      list_max(<xs: List[Int]>)
    |
139 |     none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh)
    |                                                          ^^
error[E004]: list_max() expects 1 argument(s) but got 10
  --> /tmp/dojo-red-black-tree-3.almd:140:67
  in call to list_max()
  here: some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh) {
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 10
      list_max(<xs: List[Int]>)
    |
140 |     some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh) {
    |                                                                   ^^
error[E004]: list_max() expects 1 argument(s) but got 11
  --> /tmp/dojo-red-black-tree-3.almd:148:62
  in call to list_max()
  here: none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij)
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 11
      list_max(<xs: List[Int]>)
    |
148 |     none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij)
    |                                                              ^^
error[E004]: list_max() expects 1 argument(s) but got 11
  --> /tmp/dojo-red-black-tree-3.almd:149:71
  in call to list_max()
  here: some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij) {
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 11
      list_max(<xs: List[Int]>)
    |
149 |     some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij) {
    |                                                                       ^^
error[E004]: list_max() expects 1 argument(s) but got 12
  --> /tmp/dojo-red-black-tree-3.almd:157:66
  in call to list_max()
  here: none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl)
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 12
      list_max(<xs: List[Int]>)
    |
157 |     none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl)
    |                                                                  ^^
error[E004]: list_max() expects 1 argument(s) but got 12
  --> /tmp/dojo-red-black-tree-3.almd:158:75
  in call to list_max()
  here: some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl) {
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 12
      list_max(<xs: List[Int]>)
    |
158 |     some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl) {
    |                                                                           ^^
error[E004]: list_max() expects 1 argument(s) but got 13
  --> /tmp/dojo-red-black-tree-3.almd:166:70
  in call to list_max()
  here: none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn)
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 13
      list_max(<xs: List[Int]>)
    |
166 |     none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn)
    |                                                                      ^^
error[E004]: list_max() expects 1 argument(s) but got 13
  --> /tmp/dojo-red-black-tree-3.almd:167:79
  in call to list_max()
  here: some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn) {
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 13
      list_max(<xs: List[Int]>)
    |
167 |     some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn) {
    |                                                                               ^^
error[E004]: list_max() expects 1 argument(s) but got 14
  --> /tmp/dojo-red-black-tree-3.almd:175:74
  in call to list_max()
  here: none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no)
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 14
      list_max(<xs: List[Int]>)
    |
175 |     none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no)
    |                                                                          ^^
error[E004]: list_max() expects 1 argument(s) but got 14
  --> /tmp/dojo-red-black-tree-3.almd:176:83
  in call to list_max()
  here: some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no) {
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 14
      list_max(<xs: List[Int]>)
    |
176 |     some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no) {
    |                                                                                   ^^
error[E004]: list_max() expects 1 argument(s) but got 15
  --> /tmp/dojo-red-black-tree-3.almd:184:78
  in call to list_max()
  here: none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq)
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 15
      list_max(<xs: List[Int]>)
    |
184 |     none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq)
    |                                                                              ^^
error[E004]: list_max() expects 1 argument(s) but got 15
  --> /tmp/dojo-red-black-tree-3.almd:185:87
  in call to list_max()
  here: some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq) {
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 15
      list_max(<xs: List[Int]>)
    |
185 |     some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq) {
    |                                                                                       ^^
error[E004]: list_max() expects 1 argument(s) but got 16
  --> /tmp/dojo-red-black-tree-3.almd:193:82
  in call to list_max()
  here: none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs)
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 16
      list_max(<xs: List[Int]>)
    |
193 |     none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs)
    |                                                                                  ^^
error[E004]: list_max() expects 1 argument(s) but got 16
  --> /tmp/dojo-red-black-tree-3.almd:194:91
  in call to list_max()
  here: some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs) {
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 16
      list_max(<xs: List[Int]>)
    |
194 |     some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs) {
    |                                                                                           ^^
error[E004]: list_max() expects 1 argument(s) but got 17
  --> /tmp/dojo-red-black-tree-3.almd:202:86
  in call to list_max()
  here: none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu)
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 17
      list_max(<xs: List[Int]>)
    |
202 |     none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu)
    |                                                                                      ^^
error[E004]: list_max() expects 1 argument(s) but got 17
  --> /tmp/dojo-red-black-tree-3.almd:203:95
  in call to list_max()
  here: some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu) {
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 17
      list_max(<xs: List[Int]>)
    |
203 |     some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu) {
    |                                                                                               ^^
error[E004]: list_max() expects 1 argument(s) but got 18
  --> /tmp/dojo-red-black-tree-3.almd:211:90
  in call to list_max()
  here: none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu, vw)
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 18
      list_max(<xs: List[Int]>)
    |
211 |     none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu, vw)
    |                                                                                          ^^
error[E004]: list_max() expects 1 argument(s) but got 18
  --> /tmp/dojo-red-black-tree-3.almd:212:99
  in call to list_max()
  here: some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu, vw) {
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 18
      list_max(<xs: List[Int]>)
    |
212 |     some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu, vw) {
    |                                                                                                   ^^
error[E004]: list_max() expects 1 argument(s) but got 19
  --> /tmp/dojo-red-black-tree-3.almd:220:94
  in call to list_max()
  here: none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu, vw, xy)
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 19
      list_max(<xs: List[Int]>)
    |
220 |     none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu, vw, xy)
    |                                                                                              ^^
error[E004]: list_max() expects 1 argument(s) but got 19
  --> /tmp/dojo-red-black-tree-3.almd:221:103
  in call to list_max()
  here: some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu, vw, xy) {
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 19
      list_max(<xs: List[Int]>)
    |
221 |     some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu, vw, xy) {
    |                                                                                                       ^^
error[E004]: list_max() expects 1 argument(s) but got 20
  --> /tmp/dojo-red-black-tree-3.almd:229:98
  in call to list_max()
  here: none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu, vw, xy, zc)
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 20
      list_max(<xs: List[Int]>)
    |
229 |     none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu, vw, xy, zc)
    |                                                                                                  ^^
error[E004]: list_max() expects 1 argument(s) but got 20
  --> /tmp/dojo-red-black-tree-3.almd:230:107
  in call to list_max()
  here: some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu, vw, xy, zc) {
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 20
      list_max(<xs: List[Int]>)
    |
230 |     some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu, vw, xy, zc) {
    |                                                                                                           ^^
error[E004]: list_max() expects 1 argument(s) but got 21
  --> /tmp/dojo-red-black-tree-3.almd:238:102
  in call to list_max()
  here: none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu, vw, xy, zc, de)
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 21
      list_max(<xs: List[Int]>)
    |
238 |     none => list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu, vw, xy, zc, de)
    |                                                                                                      ^^
error[E004]: list_max() expects 1 argument(s) but got 21
  --> /tmp/dojo-red-black-tree-3.almd:239:111
  in call to list_max()
  here: some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu, vw, xy, zc, de) {
  hint: Check the number of arguments
  try:
      // list_max() takes 1 arg(s) — you passed 21
      list_max(<xs: List[Int]>)
    |
239 |     some(x) => match list_max(ys, zs, wt, vu, xd, yz, ab, cd, ef, gh, ij, kl, mn, no, pq, rs, tu, vw, xy, zc, de) {
    |                                                                                                               ^^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-3.almd:32:95
  in fn 'inorder'
  here: Node(c, l, x, r) => list.concat(list.map(inorder(l), identity), [x], list.map(inorder(r), identity))
  hint: Fix the expression type or change the expected type
   |
32 |     Node(c, l, x, r) => list.concat(list.map(inorder(l), identity), [x], list.map(inorder(r), identity))
   |                                                                                               ^^^^^^^^

66 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
