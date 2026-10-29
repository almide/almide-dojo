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
      else if v < x then balance(Node(Red, l, v, Leaf), x, r)
      else balance(Node(Red, Leaf, x, r), l, v)
  }

fn balance(t: Tree, x: Int, r: Tree) -> Tree =
  match t {
    Node(Red, l, y, Node(Red, _, _, r)) =>
      Node(Black, Node(Red, l, y, t), x, r)
    Node(Red, l, y, Node(Red, _, _, r)) =>
      Node(Black, Node(Red, l, y, t), x, r)
    Node(Red, l, y, r) =>
      Node(Red, Node(Black, l, y, r), x, t)
    _ => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + max(height(l), height(r))
  }
```

**Diagnostic:**

```
error[E005]: argument 'x' expects Int but got Tree
  --> /tmp/dojo-red-black-tree-0.almd:13:43
  in call to balance()
  here: else balance(Node(Red, Leaf, x, r), l, v)
  hint: Fix the argument type
   |
16 | fn balance(t: Tree, x: Int, r: Tree) -> Tree =
   | ------------------------- fn balance() defined here
...
13 |       else balance(Node(Red, Leaf, x, r), l, v)
   |                                           ^
error[E005]: argument 'r' expects Tree but got Int
  --> /tmp/dojo-red-black-tree-0.almd:13:46
  in call to balance()
  here: else balance(Node(Red, Leaf, x, r), l, v)
  hint: Fix the argument type
   |
16 | fn balance(t: Tree, x: Int, r: Tree) -> Tree =
   | ------------------------- fn balance() defined here
...
13 |       else balance(Node(Red, Leaf, x, r), l, v)
   |                                              ^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-0.almd:21:7
  in match
  here: Node(Black, Node(Red, l, y, t), x, r)
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
21 |       Node(Black, Node(Red, l, y, t), x, r)
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
  here: Node(_, l, _, r) => 1 + max(height(l), height(r))
  hint: Check the function name
   |
36 |     Node(_, l, _, r) => 1 + max(height(l), height(r))
   |                             ^^^
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-0.almd:30:52
  in match arm
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
30 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-0.almd:30:52
  in fn 'inorder'
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Fix the expression type or change the expected type
   |
30 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^

7 error(s) found
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
      if v == x then Node(Black, Leaf, x, Leaf) + [Node(Black, Leaf, v, Leaf)]
      else if v < x then balance(Node(Red, l, v, Leaf), x, r)
      else balance(Node(Red, Leaf, x, r), l, v)
  }

fn balance(t: Tree, x: Int, r: Tree) -> Tree =
  match t {
    Node(Red, l, y, Node(Red, _, _, r)) =>
      Node(Black, Node(Red, l, y, t), x, r)
    Node(Red, l, y, Node(Red, _, _, r)) =>
      Node(Black, Node(Red, l, y, t), x, r)
    Node(Red, l, y, r) =>
      Node(Red, Node(Black, l, y, r), x, t)
    _ => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => int.min(Int.max, Int.min)
    List(x) => x
    List(x, y) => if x > y then x else y
    List(x, y, z) => if x > y then if x > z then x else z else if y > z then y else z
    List(x, y, z, w) => if x > y then if x > z then if x > w then x else w else if z > w then z else w else if y > z then if y > w then y else w else if z > w then z else w
    _ => int.min(Int.max, Int.min)
  }
```

**Diagnostic:**

```
error: Expected LParen at line 39:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-1.almd:39:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
39 | fn list.max(xs: List[Int]) -> Int =
   |        ^
error: operator '+' requires numeric, String, or List types but got Tree and List[Tree]
  --> /tmp/dojo-red-black-tree-1.almd:11:73
  in operator +
  here: if v == x then Node(Black, Leaf, x, Leaf) + [Node(Black, Leaf, v, Leaf)]
  hint: Use + with numeric types, String, or List
   |
11 |       if v == x then Node(Black, Leaf, x, Leaf) + [Node(Black, Leaf, v, Leaf)]
   |                                                                         ^^^^
error[E005]: argument 'x' expects Int but got Tree
  --> /tmp/dojo-red-black-tree-1.almd:13:43
  in call to balance()
  here: else balance(Node(Red, Leaf, x, r), l, v)
  hint: Fix the argument type
   |
16 | fn balance(t: Tree, x: Int, r: Tree) -> Tree =
   | ------------------------- fn balance() defined here
...
13 |       else balance(Node(Red, Leaf, x, r), l, v)
   |                                           ^
error[E005]: argument 'r' expects Tree but got Int
  --> /tmp/dojo-red-black-tree-1.almd:13:46
  in call to balance()
  here: else balance(Node(Red, Leaf, x, r), l, v)
  hint: Fix the argument type
   |
16 | fn balance(t: Tree, x: Int, r: Tree) -> Tree =
   | ------------------------- fn balance() defined here
...
13 |       else balance(Node(Red, Leaf, x, r), l, v)
   |                                              ^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-1.almd:21:7
  in match
  here: Node(Black, Node(Red, l, y, t), x, r)
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
21 |       Node(Black, Node(Red, l, y, t), x, r)
   |       ^^^^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-1.almd:29:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
29 |     Leaf => List()
   |             ^^^^
error[E002]: undefined function 'list.height'
  --> /tmp/dojo-red-black-tree-1.almd:36:38
  in call to list.height()
  here: Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  hint: No function 'height' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
36 |     Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
   |                                      ^^^^^^^^^^^
error[E002]: undefined function 'list.height'
  --> /tmp/dojo-red-black-tree-1.almd:36:54
  in call to list.height()
  here: Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  hint: No function 'height' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
36 |     Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
   |                                                      ^^^^^^^^^^^
error[E004]: list.max() expects 1 argument(s) but got 2
  --> /tmp/dojo-red-black-tree-1.almd:36:66
  in call to list.max()
  here: Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  hint: Check the number of arguments
  try:
      // list.max() takes 1 arg(s) — you passed 2
      list.max(<xs: List[A]>)
   |
36 |     Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
   |                                                                  ^
error: operator '+' requires numeric, String, or List types but got Int and Option[?0]
  --> /tmp/dojo-red-black-tree-1.almd:36:66
  in operator +
  here: Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  hint: Use + with numeric types, String, or List
   |
36 |     Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
   |                                                                  ^
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-1.almd:30:52
  in match arm
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
30 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-1.almd:30:52
  in fn 'inorder'
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Fix the expression type or change the expected type
   |
30 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E025]: cannot infer a concrete type for this expression (type Option[?0])
  --> /tmp/dojo-red-black-tree-1.almd:36:29
  in this expression with an unconstrained type
  here: Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
36 |     Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
   |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

13 error(s) found
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
      if v == x then Node(Black, Leaf, x, Leaf) + [Node(Black, Leaf, v, Leaf)]
      else if v < x then balance(Node(Red, l, v, r), x)
      else balance(Node(Red, Leaf, x, r), l, v)
  }

fn balance(t: Tree, x: Int) -> Tree =
  match t {
    Node(Red, l, y, Node(Red, _, _, _)) =>
      Node(Black, Node(Red, l, y, t), x, t)
    Node(Red, l, y, r) =>
      Node(Red, Node(Black, l, y, r), x, t)
    _ => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => int.min(Int.max, Int.min)
    List(x) => x
    List(x, y) => if x > y then x else y
    List(x, y, z) => if x > y then if x > z then x else z else if y > z then y else z
    List(x, y, z, w) => if x > y then if x > z then if x > w then x else w else if z > w then z else w else if y > z then if y > w then y else w else if z > w then z else w
    _ => int.min(Int.max, Int.min)
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }
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
error: Expected LParen at line 47:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:47:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
47 | fn list.height(t: Tree) -> Int =
   |        ^
error: operator '+' requires numeric, String, or List types but got Tree and List[Tree]
  --> /tmp/dojo-red-black-tree-2.almd:11:73
  in operator +
  here: if v == x then Node(Black, Leaf, x, Leaf) + [Node(Black, Leaf, v, Leaf)]
  hint: Use + with numeric types, String, or List
   |
11 |       if v == x then Node(Black, Leaf, x, Leaf) + [Node(Black, Leaf, v, Leaf)]
   |                                                                         ^^^^
error[E004]: balance() expects 2 argument(s) but got 3
  --> /tmp/dojo-red-black-tree-2.almd:13:46
  in call to balance()
  here: else balance(Node(Red, Leaf, x, r), l, v)
  hint: Check the number of arguments
  try:
      // balance() takes 2 arg(s) — you passed 3
      balance(<t: Tree>, <x: Int>)
   |
13 |       else balance(Node(Red, Leaf, x, r), l, v)
   |                                              ^
error[E005]: argument 'x' expects Int but got Tree
  --> /tmp/dojo-red-black-tree-2.almd:13:43
  in call to balance()
  here: else balance(Node(Red, Leaf, x, r), l, v)
  hint: Fix the argument type
   |
16 | fn balance(t: Tree, x: Int) -> Tree =
   | ------------------------- fn balance() defined here
...
13 |       else balance(Node(Red, Leaf, x, r), l, v)
   |                                           ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-2.almd:27:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
27 |     Leaf => List()
   |             ^^^^
error[E002]: undefined function 'list.height'
  --> /tmp/dojo-red-black-tree-2.almd:34:38
  in call to list.height()
  here: Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  hint: No function 'height' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
34 |     Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
   |                                      ^^^^^^^^^^^
error[E002]: undefined function 'list.height'
  --> /tmp/dojo-red-black-tree-2.almd:34:54
  in call to list.height()
  here: Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  hint: No function 'height' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
34 |     Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
   |                                                      ^^^^^^^^^^^
error[E004]: list.max() expects 1 argument(s) but got 2
  --> /tmp/dojo-red-black-tree-2.almd:34:66
  in call to list.max()
  here: Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  hint: Check the number of arguments
  try:
      // list.max() takes 1 arg(s) — you passed 2
      list.max(<xs: List[A]>)
   |
34 |     Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
   |                                                                  ^
error: operator '+' requires numeric, String, or List types but got Int and Option[?0]
  --> /tmp/dojo-red-black-tree-2.almd:34:66
  in operator +
  here: Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  hint: Use + with numeric types, String, or List
   |
34 |     Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
   |                                                                  ^
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-2.almd:28:52
  in match arm
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
28 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-2.almd:28:52
  in fn 'inorder'
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Fix the expression type or change the expected type
   |
28 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E025]: cannot infer a concrete type for this expression (type Option[?0])
  --> /tmp/dojo-red-black-tree-2.almd:34:29
  in this expression with an unconstrained type
  here: Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
34 |     Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
   |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

13 error(s) found
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
      if v == x then Node(Black, Leaf, x, Leaf) + [Node(Black, Leaf, v, Leaf)]
      else if v < x then balance(Node(Red, l, v, r), x)
      else balance(Node(Red, Leaf, x, r), l, v)
  }

fn balance(t: Tree, x: Int) -> Tree =
  match t {
    Node(Red, l, y, Node(Red, _, _, _)) =>
      Node(Black, Node(Red, l, y, t), x, t)
    Node(Red, l, y, r) =>
      Node(Red, Node(Black, l, y, r), x, t)
    _ => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => int.min(Int.max, Int.min)
    List(x) => x
    List(x, y) => if x > y then x else y
    List(x, y, z) => if x > y then if x > z then x else z else if y > z then y else z
    List(x, y, z, w) => if x > y then if x > z then if x > w then x else w else if z > w then z else w else if y > z then if y > w then y else w else if z > w then z else w
    _ => int.min(Int.max, Int.min)
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
```

**Diagnostic:**

```
error: Expected LParen at line 37:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:37:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
37 | fn list.max(xs: List[Int]) -> Int =
   |        ^
error: Expected LParen at line 47:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:47:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
47 | fn list.height(t: Tree) -> Int =
   |        ^
error: Expected LParen at line 53:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:53:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
53 | fn list.height(t: Tree) -> Int =
   |        ^
error: Expected LParen at line 59:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:59:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
59 | fn list.height(t: Tree) -> Int =
   |        ^
error: Expected LParen at line 65:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:65:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
65 | fn list.height(t: Tree) -> Int =
   |        ^
error: Expected LParen at line 71:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:71:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
71 | fn list.height(t: Tree) -> Int =
   |        ^
error: Expected LParen at line 77:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:77:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
77 | fn list.height(t: Tree) -> Int =
   |        ^
error: Expected LParen at line 83:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:83:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
83 | fn list.height(t: Tree) -> Int =
   |        ^
error: Expected LParen at line 89:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:89:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
89 | fn list.height(t: Tree) -> Int =
   |        ^
error: Expected LParen at line 95:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:95:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
95 | fn list.height(t: Tree) -> Int =
   |        ^
error: Expected LParen at line 101:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:101:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
101 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 107:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:107:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
107 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 113:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:113:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
113 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 119:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:119:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
119 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 125:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:125:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
125 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 131:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:131:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
131 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 137:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:137:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
137 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 143:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:143:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
143 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 149:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:149:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
149 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 155:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:155:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
155 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 161:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:161:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
161 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 167:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:167:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
167 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 173:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:173:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
173 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 179:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:179:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
179 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 185:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:185:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
185 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 191:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:191:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
191 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 197:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:197:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
197 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 203:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:203:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
203 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 209:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:209:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
209 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 215:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:215:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
215 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 221:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:221:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
221 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 227:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:227:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
227 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 233:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:233:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
233 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 239:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:239:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
239 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 245:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:245:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
245 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 251:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:251:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
251 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 257:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:257:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
257 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 263:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:263:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
263 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 269:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:269:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
269 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 275:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:275:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
275 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 281:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:281:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
281 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 287:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:287:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
287 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 293:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:293:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
293 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 299:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:299:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
299 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 305:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:305:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
305 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 311:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:311:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
311 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 317:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:317:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
317 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 323:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:323:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
323 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 329:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:329:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
329 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 335:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:335:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
335 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 341:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:341:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
341 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 347:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:347:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
347 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 353:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:353:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
353 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 359:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:359:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
359 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 365:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:365:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
365 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 371:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:371:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
371 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 377:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:377:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
377 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 383:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:383:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
383 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 389:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:389:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
389 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 395:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:395:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
395 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 401:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:401:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
401 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 407:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:407:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
407 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 413:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:413:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
413 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 419:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:419:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
419 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 425:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:425:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
425 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 431:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:431:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
431 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 437:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:437:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
437 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 443:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:443:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
443 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 449:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:449:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
449 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 455:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:455:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
455 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 461:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:461:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
461 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 467:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:467:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
467 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 473:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:473:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
473 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 479:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:479:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
479 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 485:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:485:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
485 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 491:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:491:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
491 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 497:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:497:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
497 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 503:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:503:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
503 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 509:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:509:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
509 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 515:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:515:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
515 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 521:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:521:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
521 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 527:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:527:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
527 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 533:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:533:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
533 | fn list.height(t: Tree) -> Int =
    |        ^
error: Expected LParen at line 539:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:539:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
539 | fn list.height(t: Tree) -> Int =
    |        ^
error: operator '+' requires numeric, String, or List types but got Tree and List[Tree]
  --> /tmp/dojo-red-black-tree-3.almd:11:73
  in operator +
  here: if v == x then Node(Black, Leaf, x, Leaf) + [Node(Black, Leaf, v, Leaf)]
  hint: Use + with numeric types, String, or List
   |
11 |       if v == x then Node(Black, Leaf, x, Leaf) + [Node(Black, Leaf, v, Leaf)]
   |                                                                         ^^^^
error[E004]: balance() expects 2 argument(s) but got 3
  --> /tmp/dojo-red-black-tree-3.almd:13:46
  in call to balance()
  here: else balance(Node(Red, Leaf, x, r), l, v)
  hint: Check the number of arguments
  try:
      // balance() takes 2 arg(s) — you passed 3
      balance(<t: Tree>, <x: Int>)
   |
13 |       else balance(Node(Red, Leaf, x, r), l, v)
   |                                              ^
error[E005]: argument 'x' expects Int but got Tree
  --> /tmp/dojo-red-black-tree-3.almd:13:43
  in call to balance()
  here: else balance(Node(Red, Leaf, x, r), l, v)
  hint: Fix the argument type
   |
16 | fn balance(t: Tree, x: Int) -> Tree =
   | ------------------------- fn balance() defined here
...
13 |       else balance(Node(Red, Leaf, x, r), l, v)
   |                                           ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-3.almd:27:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
27 |     Leaf => List()
   |             ^^^^
error[E002]: undefined function 'list.height'
  --> /tmp/dojo-red-black-tree-3.almd:34:38
  in call to list.height()
  here: Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  hint: No function 'height' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
34 |     Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
   |                                      ^^^^^^^^^^^
error[E002]: undefined function 'list.height'
  --> /tmp/dojo-red-black-tree-3.almd:34:54
  in call to list.height()
  here: Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  hint: No function 'height' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
34 |     Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
   |                                                      ^^^^^^^^^^^
error[E004]: list.max() expects 1 argument(s) but got 2
  --> /tmp/dojo-red-black-tree-3.almd:34:66
  in call to list.max()
  here: Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  hint: Check the number of arguments
  try:
      // list.max() takes 1 arg(s) — you passed 2
      list.max(<xs: List[A]>)
   |
34 |     Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
   |                                                                  ^
error: operator '+' requires numeric, String, or List types but got Int and Option[?0]
  --> /tmp/dojo-red-black-tree-3.almd:34:66
  in operator +
  here: Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  hint: Use + with numeric types, String, or List
   |
34 |     Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
   |                                                                  ^
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-3.almd:28:52
  in match arm
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
28 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-3.almd:28:52
  in fn 'inorder'
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Fix the expression type or change the expected type
   |
28 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E025]: cannot infer a concrete type for this expression (type Option[?0])
  --> /tmp/dojo-red-black-tree-3.almd:34:29
  in this expression with an unconstrained type
  here: Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
34 |     Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
   |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

95 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
