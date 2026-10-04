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
      else if v < x then balance(Node(c, l, x, insert(r, v)))
      else balance(Node(c, insert(l, v), x, r))
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, l1, x1, l2), y, r) =>
      Node(Black, Node(Black, l1, x1, l2), y, r)
    Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, r))
    Node(Red, l, x, Node(Red, r, y, r2)) =>
      Node(Black, Node(Red, l, x, r), y, Node(Black, r, x, r2))
    Node(c, l, x, r) => t
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
error[E010]: non-exhaustive match: missing Leaf
  --> /tmp/dojo-red-black-tree-0.almd:17:9
  in match
  here: match t {
  hint: add arms for Leaf:
  Leaf => _
Or use `_ => todo()` to compile incrementally.
   |
17 |   match t {
   |         ^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-0.almd:23:7
  in match
  here: Node(Black, Node(Red, l, x, r), y, Node(Black, r, x, r2))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
23 |       Node(Black, Node(Red, l, x, r), y, Node(Black, r, x, r2))
   |       ^^^^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-0.almd:21:63
  in variable r
  here: Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, r))
  hint: Did you mean `t`?
  try:
      t
   |
21 |       Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, r))
   |                                                               ^
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
      if v == x then Node(c, l, x, r)
      else if v < x then balance(Node(c, l, x, insert(r, v)))
      else balance(Node(c, insert(l, v), x, r))
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, l1, x1, l2), y, r) =>
      Node(Black, Node(Black, l1, x1, l2), y, r)
    Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, r))
    Node(Red, l, x, Node(Red, r, y, r2)) =>
      Node(Black, Node(Red, l, x, r), y, Node(Black, r, x, r2))
    Node(c, l, x, r) => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => int.min(Int.max, Int.min)
    x :: xs => list.fold(xs, x, (acc, x) => int.max(acc, x))
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
error[E010]: non-exhaustive match: missing Leaf
  --> /tmp/dojo-red-black-tree-1.almd:17:9
  in match
  here: match t {
  hint: add arms for Leaf:
  Leaf => _
Or use `_ => todo()` to compile incrementally.
   |
17 |   match t {
   |         ^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-1.almd:23:7
  in match
  here: Node(Black, Node(Red, l, x, r), y, Node(Black, r, x, r2))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
23 |       Node(Black, Node(Red, l, x, r), y, Node(Black, r, x, r2))
   |       ^^^^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-1.almd:21:63
  in variable r
  here: Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, r))
  hint: Did you mean `t`?
  try:
      t
   |
21 |       Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, r))
   |                                                               ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-1.almd:29:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
29 |     Leaf => List()
   |             ^^^^
error[E004]: list.max() expects 1 argument(s) but got 2
  --> /tmp/dojo-red-black-tree-1.almd:36:56
  in call to list.max()
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Check the number of arguments
  try:
      // list.max() takes 1 arg(s) — you passed 2
      list.max(<xs: List[A]>)
   |
36 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                                                        ^
error[E005]: argument 'xs' expects List[A] but got Int
  --> /tmp/dojo-red-black-tree-1.almd:36:38
  in call to list.max()
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Fix the argument type
...
36 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                                      ^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got Int and Option[?0]
  --> /tmp/dojo-red-black-tree-1.almd:36:38
  in operator +
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Use + with numeric types, String, or List
   |
36 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                                      ^^^^^^^^^
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
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
36 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

11 error(s) found
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
      if v == x then Node(c, l, x, r)
      else if v < x then balance(Node(c, l, x, insert(r, v)))
      else balance(Node(c, insert(l, v), x, r))
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, l1, x1, l2), y, r) =>
      Node(Black, Node(Black, l1, x1, l2), y, r)
    Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, r))
    Node(Red, l, x, Node(Red, r, y, r2)) =>
      Node(Black, Node(Red, l, x, r), y, Node(Black, r, x, r2))
    Node(c, l, x, r) => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => int.min(Int.max, Int.min)
    x :: xs => list.fold(xs, x, (acc, x) => int.max(acc, x))
  }

fn list.fold(xs: List[Int], init: Int, f: fn(Int, Int) -> Int) -> Int =
  match xs {
    List() => init
    x :: xs => f(list.fold(xs, init, f), x)
  }
```

**Diagnostic:**

```
error: Expected LParen at line 39:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:39:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
39 | fn list.max(xs: List[Int]) -> Int =
   |        ^
error: Expected LParen at line 45:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:45:8
  here: fn list.fold(xs: List[Int], init: Int, f: fn(Int, Int) -> Int) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
45 | fn list.fold(xs: List[Int], init: Int, f: fn(Int, Int) -> Int) -> Int =
   |        ^
error: Expected function name at line 45:45 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:45:45
  here: fn list.fold(xs: List[Int], init: Int, f: fn(Int, Int) -> Int) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
45 | fn list.fold(xs: List[Int], init: Int, f: fn(Int, Int) -> Int) -> Int =
   |                                             ^
error[E010]: non-exhaustive match: missing Leaf
  --> /tmp/dojo-red-black-tree-2.almd:17:9
  in match
  here: match t {
  hint: add arms for Leaf:
  Leaf => _
Or use `_ => todo()` to compile incrementally.
   |
17 |   match t {
   |         ^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-2.almd:23:7
  in match
  here: Node(Black, Node(Red, l, x, r), y, Node(Black, r, x, r2))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
23 |       Node(Black, Node(Red, l, x, r), y, Node(Black, r, x, r2))
   |       ^^^^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-2.almd:21:63
  in variable r
  here: Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, r))
  hint: Did you mean `t`?
  try:
      t
   |
21 |       Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, r))
   |                                                               ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-2.almd:29:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
29 |     Leaf => List()
   |             ^^^^
error[E004]: list.max() expects 1 argument(s) but got 2
  --> /tmp/dojo-red-black-tree-2.almd:36:56
  in call to list.max()
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Check the number of arguments
  try:
      // list.max() takes 1 arg(s) — you passed 2
      list.max(<xs: List[A]>)
   |
36 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                                                        ^
error[E005]: argument 'xs' expects List[A] but got Int
  --> /tmp/dojo-red-black-tree-2.almd:36:38
  in call to list.max()
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Fix the argument type
...
36 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                                      ^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got Int and Option[?0]
  --> /tmp/dojo-red-black-tree-2.almd:36:38
  in operator +
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Use + with numeric types, String, or List
   |
36 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                                      ^^^^^^^^^
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-2.almd:30:52
  in match arm
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
30 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-2.almd:30:52
  in fn 'inorder'
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Fix the expression type or change the expected type
   |
30 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E025]: cannot infer a concrete type for this expression (type Option[?0])
  --> /tmp/dojo-red-black-tree-2.almd:36:29
  in this expression with an unconstrained type
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
36 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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
      if v == x then Node(c, l, x, r)
      else if v < x then balance(Node(c, l, x, insert(r, v)))
      else balance(Node(c, insert(l, v), x, r))
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, l1, x1, l2), y, r) =>
      Node(Black, Node(Black, l1, x1, l2), y, r)
    Node(Red, l, x, Node(Red, r1, x1, r2)) =>
      Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, r))
    Node(Red, l, x, Node(Red, r, y, r2)) =>
      Node(Black, Node(Red, l, x, r), y, Node(Black, r, x, r2))
    Node(c, l, x, r) => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => int.min(Int.max, Int.min)
    x :: xs => list.fold(xs, x, (acc, x) => int.max(acc, x))
  }

fn list.fold(xs: List[Int], init: Int, f: fn(Int, Int) -> Int) -> Int =
  match xs {
    List() => init
    x :: xs => f(list.fold(xs, init, f), x)
  }

fn list.binary_search(xs: List[Int], target: Int) -> Option[Int] =
  match xs {
    List() => none
    x :: xs =>
      if x == target then some(x)
      else if x < target then list.binary_search(xs, target)
      else none
  }
```

**Diagnostic:**

```
error: Expected LParen at line 39:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:39:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
39 | fn list.max(xs: List[Int]) -> Int =
   |        ^
error: Expected LParen at line 45:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:45:8
  here: fn list.fold(xs: List[Int], init: Int, f: fn(Int, Int) -> Int) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
45 | fn list.fold(xs: List[Int], init: Int, f: fn(Int, Int) -> Int) -> Int =
   |        ^
error: Expected function name at line 45:45 (got LParen '(')
  --> /tmp/dojo-red-black-tree-3.almd:45:45
  here: fn list.fold(xs: List[Int], init: Int, f: fn(Int, Int) -> Int) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
45 | fn list.fold(xs: List[Int], init: Int, f: fn(Int, Int) -> Int) -> Int =
   |                                             ^
error: Expected LParen at line 51:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:51:8
  here: fn list.binary_search(xs: List[Int], target: Int) -> Option[Int] =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
51 | fn list.binary_search(xs: List[Int], target: Int) -> Option[Int] =
   |        ^
error[E010]: non-exhaustive match: missing Leaf
  --> /tmp/dojo-red-black-tree-3.almd:17:9
  in match
  here: match t {
  hint: add arms for Leaf:
  Leaf => _
Or use `_ => todo()` to compile incrementally.
   |
17 |   match t {
   |         ^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-3.almd:23:7
  in match
  here: Node(Black, Node(Red, l, x, r), y, Node(Black, r, x, r2))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
23 |       Node(Black, Node(Red, l, x, r), y, Node(Black, r, x, r2))
   |       ^^^^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-3.almd:21:63
  in variable r
  here: Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, r))
  hint: Did you mean `t`?
  try:
      t
   |
21 |       Node(Black, Node(Red, l, x, r1), x1, Node(Black, r2, x, r))
   |                                                               ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-3.almd:29:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
29 |     Leaf => List()
   |             ^^^^
error[E004]: list.max() expects 1 argument(s) but got 2
  --> /tmp/dojo-red-black-tree-3.almd:36:56
  in call to list.max()
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Check the number of arguments
  try:
      // list.max() takes 1 arg(s) — you passed 2
      list.max(<xs: List[A]>)
   |
36 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                                                        ^
error[E005]: argument 'xs' expects List[A] but got Int
  --> /tmp/dojo-red-black-tree-3.almd:36:38
  in call to list.max()
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Fix the argument type
...
36 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                                      ^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got Int and Option[?0]
  --> /tmp/dojo-red-black-tree-3.almd:36:38
  in operator +
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Use + with numeric types, String, or List
   |
36 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                                      ^^^^^^^^^
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-3.almd:30:52
  in match arm
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
30 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-3.almd:30:52
  in fn 'inorder'
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Fix the expression type or change the expected type
   |
30 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E025]: cannot infer a concrete type for this expression (type Option[?0])
  --> /tmp/dojo-red-black-tree-3.almd:36:29
  in this expression with an unconstrained type
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
36 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

14 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
