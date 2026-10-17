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
      else if v < x then
        let t' = insert(l, v)
        match c, t'.color, t'.color {
          Red, Red, Red => Node(Red, t', x, r)
          Red, Red, _ => Node(Black, t', x, r)
          Red, _, _ => Node(Red, t', x, r)
          _ => t
        }
      else
        let t' = insert(r, v)
        match c, t'.color, t'.color {
          Red, Red, Red => Node(Red, l, x, t')
          Red, Red, _ => Node(Black, l, x, t')
          Red, _, _ => Node(Red, l, x, t')
          _ => t
        }
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
error: 'let' is not an expression in Almide
  --> /tmp/dojo-red-black-tree-0.almd:13:9
  in let-in
  here: let t' = insert(l, v)
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |         let t' = insert(l, v)
   |         ^^^
error: 'let' is not an expression in Almide at line 13:9
  --> /tmp/dojo-red-black-tree-0.almd:13:9
  here: let t' = insert(l, v)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |         let t' = insert(l, v)
   |         ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-0.almd:26:13
  in call to List()
  here: _ => t
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
26 |           _ => t
   |             ^^^^
error[E002]: undefined function 'max'
  --> /tmp/dojo-red-black-tree-0.almd:33:29
  in call to max()
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Check the function name
   |
33 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                             ^^^
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-0.almd:27:52
  in match arm
  here: }
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
27 |         }
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-0.almd:27:52
  in fn 'inorder'
  here: }
  hint: Fix the expression type or change the expected type
   |
27 |         }
   |                                                    ^

6 error(s) found
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
      else if v < x then
        let t' = insert(l, v)
        match c, t'.color, t'.color {
          Red, Red, Red => Node(Red, t', x, r)
          Red, Red, _ => Node(Black, t', x, r)
          Red, _, _ => Node(Red, t', x, r)
          _ => t
        }
      else
        let t' = insert(r, v)
        match c, t'.color, t'.color {
          Red, Red, Red => Node(Red, l, x, t')
          Red, Red, _ => Node(Black, l, x, t')
          Red, _, _ => Node(Red, l, x, t')
          _ => t
        }
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
    List() => int.min(Int.max(Int.min_value(), Int.max_value()), Int.max(Int.min_value(), Int.max_value()))
    List(x, xs) => list.fold(xs, x, (acc, x) => if x > acc then x else acc)
  }
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-red-black-tree-1.almd:13:9
  in let-in
  here: let t' = insert(l, v)
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |         let t' = insert(l, v)
   |         ^^^
error: 'let' is not an expression in Almide at line 13:9
  --> /tmp/dojo-red-black-tree-1.almd:13:9
  here: let t' = insert(l, v)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |         let t' = insert(l, v)
   |         ^
error: Expected LParen at line 36:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-1.almd:36:8
  here: fn height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
36 | fn height(t: Tree) -> Int =
   |        ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-1.almd:26:13
  in call to List()
  here: _ => t
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
26 |           _ => t
   |             ^^^^
error[E002]: undefined function 'list.height'
  --> /tmp/dojo-red-black-tree-1.almd:33:38
  in call to list.height()
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: No function 'height' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
33 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                      ^^^^^^^^^^^
error[E002]: undefined function 'list.height'
  --> /tmp/dojo-red-black-tree-1.almd:33:54
  in call to list.height()
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: No function 'height' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
33 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                      ^
error[E004]: list.max() expects 1 argument(s) but got 2
  --> /tmp/dojo-red-black-tree-1.almd:33:66
  in call to list.max()
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Check the number of arguments
  try:
      // list.max() takes 1 arg(s) — you passed 2
      list.max(<xs: List[A]>)
   |
33 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                                  ^
error: operator '+' requires numeric, String, or List types but got Int and Option[?0]
  --> /tmp/dojo-red-black-tree-1.almd:33:66
  in operator +
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Use + with numeric types, String, or List
   |
33 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                                  ^
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-1.almd:27:52
  in match arm
  here: }
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
27 |         }
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-1.almd:27:52
  in fn 'inorder'
  here: }
  hint: Fix the expression type or change the expected type
   |
27 |         }
   |                                                    ^
error[E025]: cannot infer a concrete type for this expression (type Option[?0])
  --> /tmp/dojo-red-black-tree-1.almd:33:29
  in this expression with an unconstrained type
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
33 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                             ^^^^^^^^^^^^^^^^^^^^^^^^^

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
      if v == x then t
      else if v < x then
        let t' = insert(l, v)
        match c, t'.color, t'.color {
          Red, Red, Red => Node(Red, t', x, r)
          Red, Red, _ => Node(Black, t', x, r)
          Red, _, _ => Node(Red, t', x, r)
          _ => t
        }
      else
        let t' = insert(r, v)
        match c, t'.color, t'.color {
          Red, Red, Red => Node(Red, l, x, t')
          Red, Red, _ => Node(Black, l, x, t')
          Red, _, _ => Node(Red, l, x, t')
          _ => t
        }
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
    List() => int.min(Int.max(Int.min_value(), Int.max_value()), Int.max(Int.min_value(), Int.max_value()))
    List(x, xs) => list.fold(xs, x, (acc, x) => if x > acc then x else acc)
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-red-black-tree-2.almd:13:9
  in let-in
  here: let t' = insert(l, v)
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |         let t' = insert(l, v)
   |         ^^^
error: 'let' is not an expression in Almide at line 13:9
  --> /tmp/dojo-red-black-tree-2.almd:13:9
  here: let t' = insert(l, v)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |         let t' = insert(l, v)
   |         ^
error: Expected LParen at line 36:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:36:8
  here: fn height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
36 | fn height(t: Tree) -> Int =
   |        ^
error: Expected LParen at line 42:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:42:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
42 | fn list.max(xs: List[Int]) -> Int =
   |        ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-2.almd:26:13
  in call to List()
  here: _ => t
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
26 |           _ => t
   |             ^^^^
error[E002]: undefined function 'list.height'
  --> /tmp/dojo-red-black-tree-2.almd:33:38
  in call to list.height()
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: No function 'height' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
33 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                      ^^^^^^^^^^^
error[E002]: undefined function 'list.height'
  --> /tmp/dojo-red-black-tree-2.almd:33:54
  in call to list.height()
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: No function 'height' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
33 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                      ^
error[E004]: list.max() expects 1 argument(s) but got 2
  --> /tmp/dojo-red-black-tree-2.almd:33:66
  in call to list.max()
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Check the number of arguments
  try:
      // list.max() takes 1 arg(s) — you passed 2
      list.max(<xs: List[A]>)
   |
33 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                                  ^
error: operator '+' requires numeric, String, or List types but got Int and Option[?0]
  --> /tmp/dojo-red-black-tree-2.almd:33:66
  in operator +
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Use + with numeric types, String, or List
   |
33 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                                  ^
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-2.almd:27:52
  in match arm
  here: }
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
27 |         }
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-2.almd:27:52
  in fn 'inorder'
  here: }
  hint: Fix the expression type or change the expected type
   |
27 |         }
   |                                                    ^
error[E025]: cannot infer a concrete type for this expression (type Option[?0])
  --> /tmp/dojo-red-black-tree-2.almd:33:29
  in this expression with an unconstrained type
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
33 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                             ^^^^^^^^^^^^^^^^^^^^^^^^^

12 error(s) found
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
      else if v < x then
        let t' = insert(l, v)
        match c, t'.color, t'.color {
          Red, Red, Red => Node(Red, t', x, r)
          Red, Red, _ => Node(Black, t', x, r)
          Red, _, _ => Node(Red, t', x, r)
          _ => t
        }
      else
        let t' = insert(r, v)
        match c, t'.color, t'.color {
          Red, Red, Red => Node(Red, l, x, t')
          Red, Red, _ => Node(Black, l, x, t')
          Red, _, _ => Node(Red, l, x, t')
          _ => t
        }
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
    List() => int.min(Int.max(Int.min_value(), Int.max_value()), Int.max(Int.min_value(), Int.max_value()))
    List(x, xs) => list.fold(xs, x, (acc, x) => if x > acc then x else acc)
  }

fn list.height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.height(l), list.height(r))
  }

fn list.fold[A, B](xs: List[A], init: B, f: fn(B, A) -> B) -> B =
  match xs {
    List() => init
    List(x, xs) => f(list.fold(xs, init, f), x)
  }
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-red-black-tree-3.almd:13:9
  in let-in
  here: let t' = insert(l, v)
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |         let t' = insert(l, v)
   |         ^^^
error: 'let' is not an expression in Almide at line 13:9
  --> /tmp/dojo-red-black-tree-3.almd:13:9
  here: let t' = insert(l, v)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |         let t' = insert(l, v)
   |         ^
error: Expected LParen at line 36:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:36:8
  here: fn height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
36 | fn height(t: Tree) -> Int =
   |        ^
error: Expected LParen at line 42:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:42:8
  here: fn list.max(xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
42 | fn list.max(xs: List[Int]) -> Int =
   |        ^
error: Expected LParen at line 48:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:48:8
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
48 | fn list.height(t: Tree) -> Int =
   |        ^
error: Expected function name at line 48:47 (got LParen '(')
  --> /tmp/dojo-red-black-tree-3.almd:48:47
  here: fn list.height(t: Tree) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
48 | fn list.height(t: Tree) -> Int =
   |                                               ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-3.almd:26:13
  in call to List()
  here: _ => t
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
26 |           _ => t
   |             ^^^^
error[E002]: undefined function 'list.height'
  --> /tmp/dojo-red-black-tree-3.almd:33:38
  in call to list.height()
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: No function 'height' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
33 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                      ^^^^^^^^^^^
error[E002]: undefined function 'list.height'
  --> /tmp/dojo-red-black-tree-3.almd:33:54
  in call to list.height()
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: No function 'height' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
33 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                      ^
error[E004]: list.max() expects 1 argument(s) but got 2
  --> /tmp/dojo-red-black-tree-3.almd:33:66
  in call to list.max()
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Check the number of arguments
  try:
      // list.max() takes 1 arg(s) — you passed 2
      list.max(<xs: List[A]>)
   |
33 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                                  ^
error: operator '+' requires numeric, String, or List types but got Int and Option[?0]
  --> /tmp/dojo-red-black-tree-3.almd:33:66
  in operator +
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Use + with numeric types, String, or List
   |
33 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                                  ^
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-3.almd:27:52
  in match arm
  here: }
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
27 |         }
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-3.almd:27:52
  in fn 'inorder'
  here: }
  hint: Fix the expression type or change the expected type
   |
27 |         }
   |                                                    ^
error[E025]: cannot infer a concrete type for this expression (type Option[?0])
  --> /tmp/dojo-red-black-tree-3.almd:33:29
  in this expression with an unconstrained type
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
33 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                             ^^^^^^^^^^^^^^^^^^^^^^^^^

14 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
