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
      else if v < x then balance(Node(Red, l, v, r), x)
      else balance(Node(Red, Node(c, l, x, Leaf), v, r), x)
  }

fn balance(t: Tree, x: Int) -> Tree =
  match t {
    Node(Red, Node(Red, l, a, m), b, r) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, t)
    Node(Red, l, a, Node(Red, m, b, r)) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, t)
    _ => t
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
  --> /tmp/dojo-red-black-tree-0.almd:27:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
27 |     Leaf => List()
   |             ^^^^
error[E002]: undefined function 'max'
  --> /tmp/dojo-red-black-tree-0.almd:34:29
  in call to max()
  here: Node(_, l, _, r) => 1 + max(height(l), height(r))
  hint: Check the function name
   |
34 |     Node(_, l, _, r) => 1 + max(height(l), height(r))
   |                             ^^^
error[E001]: type mismatch in match arm: expected List[Int] but got List — List[Int] is the declared return type, and the arm at line 28 produces it
  --> /tmp/dojo-red-black-tree-0.almd:27:13
  in match arm
  here: Leaf => List()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
27 |     Leaf => List()
   |             ^^^^

3 error(s) found
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
      else if v < x then balance(Node(Red, l, v, r), x)
      else balance(Node(Red, Node(c, l, x, Leaf), v, r), x)
  }

fn balance(t: Tree, x: Int) -> Tree =
  match t {
    Node(Red, Node(Red, l, a, m), b, r) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, t)
    Node(Red, l, a, Node(Red, m, b, r)) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, t)
    _ => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => x
  }
```

**Diagnostic:**

```
error: Expected LParen at line 37:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-1.almd:37:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
37 | fn list.max(xs: List[Int]) -> Int =
   |        ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-1.almd:27:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
27 |     Leaf => List()
   |             ^^^^
error[E004]: list.max() expects 1 argument(s) but got 2
  --> /tmp/dojo-red-black-tree-1.almd:34:56
  in call to list.max()
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Check the number of arguments
  try:
      // list.max() takes 1 arg(s) — you passed 2
      list.max(<xs: List[A]>)
   |
34 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                                                        ^
error[E005]: argument 'xs' expects List[A] but got Int
  --> /tmp/dojo-red-black-tree-1.almd:34:38
  in call to list.max()
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Fix the argument type
   |
34 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                                      ^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got Int and Option[?0]
  --> /tmp/dojo-red-black-tree-1.almd:34:38
  in operator +
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Use + with numeric types, String, List, or Bytes
   |
34 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                                      ^^^^^^^^^
error[E001]: type mismatch in match arm: expected List[Int] but got List — List[Int] is the declared return type, and the arm at line 28 produces it
  --> /tmp/dojo-red-black-tree-1.almd:27:13
  in match arm
  here: Leaf => List()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
27 |     Leaf => List()
   |             ^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?0])
  --> /tmp/dojo-red-black-tree-1.almd:34:29
  in this expression with an unconstrained type
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
34 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

7 error(s) found
FAILED: /tmp/dojo-red-black-tree-1.almd
  parse error: Expected LParen at line 37:8 (got Dot '.')
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
    Leaf => Node(Black, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if v == x then t
      else if v < x then balance(Node(Red, l, v, r), x)
      else balance(Node(Red, Node(c, l, x, Leaf), v, r), x)
  }

fn balance(t: Tree, x: Int) -> Tree =
  match t {
    Node(Red, Node(Red, l, a, m), b, r) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, t)
    Node(Red, l, a, Node(Red, m, b, r)) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, t)
    _ => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => x
  }

fn list.binary_search(xs: List[Int], target: Int) -> Option[Int] =
  match xs {
    List() => none
    List(x, xs) =>
      if x == target then some(x)
      else if x < target then list.binary_search(xs, target)
      else list.binary_search(xs, target)
  }

fn list.fold(xs: List[Int], init: Int, f: fn(Int, Int) -> Int) -> Int =
  match xs {
    List() => init
    List(x, xs) => f(x, list.fold(xs, init, f))
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => 0
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List
```

**Diagnostic:**

```
error: Expected LParen at line 37:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:37:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
37 | fn list.max(xs: List[Int]) -> Int =
   |        ^
error: Expected LParen at line 43:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:43:8
  here: fn list.binary_search(xs: List[Int], target: Int) -> Option[Int] =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
43 | fn list.binary_search(xs: List[Int], target: Int) -> Option[Int] =
   |        ^
error: Expected LParen at line 52:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:52:8
  here: fn list.fold(xs: List[Int], init: Int, f: fn(Int, Int) -> Int) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
52 | fn list.fold(xs: List[Int], init: Int, f: fn(Int, Int) -> Int) -> Int =
   |        ^
error: Expected function name at line 52:45 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:52:45
  here: fn list.fold(xs: List[Int], init: Int, f: fn(Int, Int) -> Int) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
52 | fn list.fold(xs: List[Int], init: Int, f: fn(Int, Int) -> Int) -> Int =
   |                                             ^
error: Expected LParen at line 58:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:58:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
58 | fn list.max(xs: List[Int]) -> Int =
   |        ^
error: Expected function name at line 61:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:61:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
61 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
   |                                       ^
error: Expected LParen at line 64:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:64:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
64 | fn list.max(xs: List[Int]) -> Int =
   |        ^
error: Expected function name at line 67:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:67:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
67 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
   |                                       ^
error: Expected LParen at line 70:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:70:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
70 | fn list.max(xs: List[Int]) -> Int =
   |        ^
error: Expected function name at line 73:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:73:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
73 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
   |                                       ^
error: Expected LParen at line 76:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:76:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
76 | fn list.max(xs: List[Int]) -> Int =
   |        ^
error: Expected function name at line 79:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:79:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
79 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
   |                                       ^
error: Expected LParen at line 82:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:82:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
82 | fn list.max(xs: List[Int]) -> Int =
   |        ^
error: Expected function name at line 85:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:85:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
85 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
   |                                       ^
error: Expected LParen at line 88:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:88:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
88 | fn list.max(xs: List[Int]) -> Int =
   |        ^
error: Expected function name at line 91:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:91:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
91 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
   |                                       ^
error: Expected LParen at line 94:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:94:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
94 | fn list.max(xs: List[Int]) -> Int =
   |        ^
error: Expected function name at line 97:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:97:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
97 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
   |                                       ^
error: Expected LParen at line 100:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:100:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
100 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 103:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:103:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
103 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 106:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:106:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
106 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 109:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:109:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
109 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 112:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:112:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
112 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 115:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:115:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
115 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 118:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:118:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
118 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 121:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:121:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
121 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 124:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:124:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
124 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 127:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:127:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
127 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 130:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:130:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
130 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 133:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:133:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
133 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 136:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:136:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
136 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 139:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:139:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
139 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 142:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:142:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
142 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 145:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:145:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
145 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 148:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:148:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
148 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 151:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:151:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
151 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 154:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:154:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
154 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 157:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:157:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
157 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 160:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:160:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
160 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 163:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:163:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
163 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 166:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:166:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
166 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 169:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:169:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
169 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 172:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:172:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
172 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 175:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:175:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
175 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 178:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:178:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
178 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 181:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:181:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
181 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 184:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:184:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
184 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 187:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:187:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
187 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 190:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:190:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
190 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 193:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:193:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
193 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 196:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:196:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
196 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 199:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:199:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
199 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 202:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:202:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
202 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 205:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:205:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
205 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 208:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:208:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
208 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 211:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:211:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
211 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 214:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:214:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
214 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 217:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:217:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
217 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 220:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:220:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
220 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 223:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:223:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
223 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 226:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:226:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
226 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 229:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:229:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
229 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 232:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:232:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
232 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 235:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:235:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
235 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 238:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:238:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
238 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 241:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:241:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
241 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 244:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:244:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
244 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 247:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:247:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
247 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 250:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:250:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
250 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 253:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:253:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
253 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 256:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:256:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
256 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 259:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:259:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
259 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 262:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:262:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
262 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 265:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:265:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
265 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 268:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:268:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
268 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 271:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:271:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
271 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 274:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:274:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
274 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 277:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:277:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
277 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 280:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:280:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
280 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 283:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:283:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
283 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 286:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:286:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
286 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 289:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:289:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
289 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 292:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:292:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
292 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 295:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:295:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
295 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 298:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:298:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
298 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 301:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:301:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
301 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 304:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:304:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
304 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 307:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:307:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
307 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 310:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:310:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
310 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 313:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:313:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
313 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 316:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:316:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
316 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 319:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:319:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
319 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 322:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:322:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
322 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 325:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:325:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
325 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 328:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:328:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
328 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 331:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:331:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
331 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 334:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:334:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
334 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 337:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:337:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
337 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 340:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:340:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
340 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 343:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:343:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
343 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 346:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:346:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
346 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 349:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:349:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
349 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 352:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:352:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
352 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 355:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:355:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
355 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 358:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:358:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
358 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 361:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:361:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
361 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 364:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:364:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
364 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 367:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:367:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
367 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 370:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:370:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
370 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 373:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:373:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
373 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 376:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:376:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
376 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 379:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:379:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
379 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 382:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:382:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
382 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 385:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:385:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
385 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 388:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:388:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
388 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 391:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:391:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
391 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 394:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:394:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
394 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 397:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:397:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
397 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 400:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:400:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
400 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 403:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:403:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
403 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 406:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:406:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
406 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 409:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:409:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
409 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 412:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:412:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
412 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 415:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:415:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
415 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 418:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:418:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
418 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 421:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:421:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
421 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 424:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:424:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
424 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 427:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:427:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
427 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 430:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:430:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
430 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 433:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:433:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
433 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 436:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:436:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
436 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 439:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:439:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
439 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 442:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:442:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
442 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 445:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:445:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
445 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 448:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:448:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
448 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 451:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:451:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
451 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 454:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:454:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
454 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 457:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:457:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
457 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 460:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:460:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
460 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 463:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:463:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
463 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 466:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:466:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
466 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 469:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:469:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
469 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 472:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:472:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
472 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 475:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:475:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
475 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 478:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:478:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
478 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 481:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:481:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
481 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 484:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:484:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
484 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 487:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:487:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
487 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 490:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:490:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
490 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 493:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:493:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
493 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 496:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:496:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
496 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 499:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:499:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
499 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 502:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:502:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
502 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 505:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:505:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
505 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 508:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:508:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
508 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 511:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:511:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
511 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 514:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:514:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
514 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 517:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:517:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
517 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 520:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:520:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
520 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 523:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:523:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
523 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 526:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:526:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
526 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 529:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:529:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
529 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 532:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:532:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
532 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error: Expected function name at line 535:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:535:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
535 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
    |                                       ^
error: Expected LParen at line 538:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:538:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
538 | fn list.max(xs: List[Int]) -> Int =
    |        ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-2.almd:27:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
27 |     Leaf => List()
   |             ^^^^
error[E004]: list.max() expects 1 argument(s) but got 2
  --> /tmp/dojo-red-black-tree-2.almd:34:56
  in call to list.max()
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Check the number of arguments
  try:
      // list.max() takes 1 arg(s) — you passed 2
      list.max(<xs: List[A]>)
   |
34 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                                                        ^
error[E005]: argument 'xs' expects List[A] but got Int
  --> /tmp/dojo-red-black-tree-2.almd:34:38
  in call to list.max()
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Fix the argument type
   |
34 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                                      ^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got Int and Option[?0]
  --> /tmp/dojo-red-black-tree-2.almd:34:38
  in operator +
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Use + with numeric types, String, List, or Bytes
   |
34 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                                      ^^^^^^^^^
error[E001]: type mismatch in match arm: expected List[Int] but got List — List[Int] is the declared return type, and the arm at line 28 produces it
  --> /tmp/dojo-red-black-tree-2.almd:27:13
  in match arm
  here: Leaf => List()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
27 |     Leaf => List()
   |             ^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?0])
  --> /tmp/dojo-red-black-tree-2.almd:34:29
  in this expression with an unconstrained type
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
34 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

171 error(s) found
FAILED: /tmp/dojo-red-black-tree-2.almd
  parse error: Expected LParen at line 37:8 (got Dot '.')
  parse error: Expected LParen at line 43:8 (got Dot '.')
  parse error: Expected LParen at line 52:8 (got Dot '.')
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
    Leaf => Node(Black, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if v == x then t
      else if v < x then balance(Node(Red, l, v, r), x)
      else balance(Node(Red, Node(c, l, x, Leaf), v, r), x)
  }

fn balance(t: Tree, x: Int) -> Tree =
  match t {
    Node(Red, Node(Red, l, a, m), b, r) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, t)
    Node(Red, l, a, Node(Red, m, b, r)) =>
      Node(Black, Node(Red, l, a, Node(Black, m, b, r)), x, t)
    _ => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  }

fn list.max(xs: List[Int]) -> Option[Int] =
  match xs {
    List() => none
    List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  }

fn list.fold(xs: List[Int], init: Int, f: fn(Int, Int) -> Int) -> Int =
  match xs {
    List() => init
    List(x, xs) => f(x, list.fold(xs, init, f))
  }
```

**Diagnostic:**

```
error: Expected LParen at line 37:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:37:8
  here: fn list.max(xs: List[Int]) -> Option[Int] =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
37 | fn list.max(xs: List[Int]) -> Option[Int] =
   |        ^
error: Expected function name at line 40:39 (got LParen '(')
  --> /tmp/dojo-red-black-tree-3.almd:40:39
  here: List(x, xs) => list.fold(xs, x, fn(x, y) => x)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
40 |     List(x, xs) => list.fold(xs, x, fn(x, y) => x)
   |                                       ^
error: Expected LParen at line 43:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:43:8
  here: fn list.fold(xs: List[Int], init: Int, f: fn(Int, Int) -> Int) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
43 | fn list.fold(xs: List[Int], init: Int, f: fn(Int, Int) -> Int) -> Int =
   |        ^
error: Expected function name at line 43:45 (got LParen '(')
  --> /tmp/dojo-red-black-tree-3.almd:43:45
  here: fn list.fold(xs: List[Int], init: Int, f: fn(Int, Int) -> Int) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
43 | fn list.fold(xs: List[Int], init: Int, f: fn(Int, Int) -> Int) -> Int =
   |                                             ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-3.almd:27:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
27 |     Leaf => List()
   |             ^^^^
error[E004]: list.max() expects 1 argument(s) but got 2
  --> /tmp/dojo-red-black-tree-3.almd:34:56
  in call to list.max()
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Check the number of arguments
  try:
      // list.max() takes 1 arg(s) — you passed 2
      list.max(<xs: List[A]>)
   |
34 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                                                        ^
error[E005]: argument 'xs' expects List[A] but got Int
  --> /tmp/dojo-red-black-tree-3.almd:34:38
  in call to list.max()
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Fix the argument type
   |
34 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                                      ^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got Int and Option[?0]
  --> /tmp/dojo-red-black-tree-3.almd:34:38
  in operator +
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Use + with numeric types, String, List, or Bytes
   |
34 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                                      ^^^^^^^^^
error[E001]: type mismatch in match arm: expected List[Int] but got List — List[Int] is the declared return type, and the arm at line 28 produces it
  --> /tmp/dojo-red-black-tree-3.almd:27:13
  in match arm
  here: Leaf => List()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
27 |     Leaf => List()
   |             ^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?0])
  --> /tmp/dojo-red-black-tree-3.almd:34:29
  in this expression with an unconstrained type
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
34 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

10 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
  parse error: Expected LParen at line 37:8 (got Dot '.')
  parse error: Expected function name at line 40:39 (got LParen '(')
  parse error: Expected LParen at line 43:8 (got Dot '.')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-red-black-tree-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
