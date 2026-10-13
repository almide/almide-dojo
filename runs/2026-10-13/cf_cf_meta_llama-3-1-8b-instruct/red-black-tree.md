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
      else if v < x then balance(Node(Red, l, v, Node(Black, Leaf, x, r)))
      else balance(Node(Red, Node(Black, Leaf, x, r), v, l))
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, l, x, Node(Red, r1, y, r2)) =>
      if x < y then balance(Node(Black, Node(Red, l, x, r1), y, r2))
      else balance(Node(Black, Node(Red, Node(Black, Leaf, x, l), y, r1), r2))
    Node(Red, l, x, r) => Node(Black, l, x, r)
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
error[E004]: Node() expects 4 argument(s) but got 3
  --> /tmp/dojo-red-black-tree-0.almd:20:75
  in constructor Node()
  here: else balance(Node(Black, Node(Red, Node(Black, Leaf, x, l), y, r1), r2))
  hint: Check the number of arguments
   |
20 |       else balance(Node(Black, Node(Red, Node(Black, Leaf, x, l), y, r1), r2))
   |                                                                           ^^
error[E005]: Node() argument 3 expects Int but got Tree
  --> /tmp/dojo-red-black-tree-0.almd:20:75
  in constructor Node()
  here: else balance(Node(Black, Node(Red, Node(Black, Leaf, x, l), y, r1), r2))
  hint: Node(Color, Tree, Int, Tree) expects argument #3 to be Int, got Tree
   |
20 |       else balance(Node(Black, Node(Red, Node(Black, Leaf, x, l), y, r1), r2))
   |                                                                           ^^
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
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-0.almd:28:52
  in match arm
  here: Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
28 |     Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-0.almd:28:52
  in fn 'inorder'
  here: Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Fix the expression type or change the expected type
   |
28 |     Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
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
      if v == x then Node(Black, Leaf, x, r)
      else if v < x then balance(Node(Red, l, v, Node(Black, Leaf, x, r)))
      else balance(Node(Red, Node(Black, Leaf, x, r), v, l))
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, l, x, Node(Red, r1, y, r2)) =>
      if x < y then balance(Node(Black, Node(Red, l, x, r1), y, r2))
      else balance(Node(Black, Node(Red, Node(Black, Leaf, x, l), y, r1), r2))
    Node(Red, l, x, r) => Node(Black, l, x, r)
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
    Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], int.to_int)) 
  }
```

**Diagnostic:**

```
error[E004]: Node() expects 4 argument(s) but got 3
  --> /tmp/dojo-red-black-tree-1.almd:20:75
  in constructor Node()
  here: else balance(Node(Black, Node(Red, Node(Black, Leaf, x, l), y, r1), r2))
  hint: Check the number of arguments
   |
20 |       else balance(Node(Black, Node(Red, Node(Black, Leaf, x, l), y, r1), r2))
   |                                                                           ^^
error[E005]: Node() argument 3 expects Int but got Tree
  --> /tmp/dojo-red-black-tree-1.almd:20:75
  in constructor Node()
  here: else balance(Node(Black, Node(Red, Node(Black, Leaf, x, l), y, r1), r2))
  hint: Node(Color, Tree, Int, Tree) expects argument #3 to be Int, got Tree
   |
20 |       else balance(Node(Black, Node(Red, Node(Black, Leaf, x, l), y, r1), r2))
   |                                                                           ^^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-1.almd:27:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
27 |     Leaf => List()
   |             ^^^^
error[E003]: undefined variable 'int'
  --> /tmp/dojo-red-black-tree-1.almd:34:71
  in variable int
  here: Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], int.to_int))
  hint: Did you mean `t`?
  try:
      t
   |
34 |     Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], int.to_int))
   |                                                                       ^^^
error: operator '+' requires numeric, String, or List types but got Int and Option[?0]
  --> /tmp/dojo-red-black-tree-1.almd:34:71
  in operator +
  here: Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], int.to_int))
  hint: Use + with numeric types, String, or List
   |
34 |     Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], int.to_int))
   |                                                                       ^^^
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-1.almd:28:52
  in match arm
  here: Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
28 |     Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-1.almd:28:52
  in fn 'inorder'
  here: Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Fix the expression type or change the expected type
   |
28 |     Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E025]: cannot infer a concrete type for this expression (type List[?0])
  --> /tmp/dojo-red-black-tree-1.almd:34:38
  in this expression with an unconstrained type
  here: Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], int.to_int))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
34 |     Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], int.to_int))
   |                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?0])
  --> /tmp/dojo-red-black-tree-1.almd:34:29
  in this expression with an unconstrained type
  here: Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], int.to_int))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
34 |     Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], int.to_int))
   |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

9 error(s) found
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
      if v == x then Node(Black, Leaf, x, r)
      else if v < x then balance(Node(Red, l, v, Node(Black, Leaf, x, r)))
      else balance(Node(Red, Node(Black, Leaf, x, r), v, l))
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, l, x, Node(Red, r1, y, r2)) =>
      if x < y then balance(Node(Black, Node(Red, l, x, r1), y, r2))
      else balance(Node(Black, Node(Red, Node(Black, Leaf, x, l), y, r1), r2))
    Node(Red, l, x, r) => Node(Black, l, x, r)
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
    Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], int.to_int).unwrap_or(0))
  }
```

**Diagnostic:**

```
error[E004]: Node() expects 4 argument(s) but got 3
  --> /tmp/dojo-red-black-tree-2.almd:20:75
  in constructor Node()
  here: else balance(Node(Black, Node(Red, Node(Black, Leaf, x, l), y, r1), r2))
  hint: Check the number of arguments
   |
20 |       else balance(Node(Black, Node(Red, Node(Black, Leaf, x, l), y, r1), r2))
   |                                                                           ^^
error[E005]: Node() argument 3 expects Int but got Tree
  --> /tmp/dojo-red-black-tree-2.almd:20:75
  in constructor Node()
  here: else balance(Node(Black, Node(Red, Node(Black, Leaf, x, l), y, r1), r2))
  hint: Node(Color, Tree, Int, Tree) expects argument #3 to be Int, got Tree
   |
20 |       else balance(Node(Black, Node(Red, Node(Black, Leaf, x, l), y, r1), r2))
   |                                                                           ^^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-2.almd:27:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
27 |     Leaf => List()
   |             ^^^^
error[E003]: undefined variable 'int'
  --> /tmp/dojo-red-black-tree-2.almd:34:71
  in variable int
  here: Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], int.to_int).unwrap_or(0))
  hint: Did you mean `t`?
  try:
      t
   |
34 |     Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], int.to_int).unwrap_or(0))
   |                                                                       ^^^
error[E002]: undefined method 'unwrap_or' on list
  --> /tmp/dojo-red-black-tree-2.almd:34:38
  in method call .unwrap_or()
  here: Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], int.to_int).unwrap_or(0))
  hint: Almide doesn't use method-call syntax. Write `list.<fn>(x)` (or `x |> list.<fn>`) — there is no method `unwrap_or` on `list`. Run `almide explain E002` for examples.
   |
34 |     Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], int.to_int).unwrap_or(0))
   |                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got Int and Option[?1]
  --> /tmp/dojo-red-black-tree-2.almd:34:71
  in operator +
  here: Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], int.to_int).unwrap_or(0))
  hint: Use + with numeric types, String, or List
   |
34 |     Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], int.to_int).unwrap_or(0))
   |                                                                       ^^^
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-2.almd:28:52
  in match arm
  here: Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
28 |     Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-2.almd:28:52
  in fn 'inorder'
  here: Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Fix the expression type or change the expected type
   |
28 |     Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E025]: cannot infer a concrete type for this expression (type List[?0])
  --> /tmp/dojo-red-black-tree-2.almd:34:38
  in this expression with an unconstrained type
  here: Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], int.to_int).unwrap_or(0))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
34 |     Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], int.to_int).unwrap_or(0))
   |                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?1])
  --> /tmp/dojo-red-black-tree-2.almd:34:29
  in this expression with an unconstrained type
  here: Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], int.to_int).unwrap_or(0))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
34 |     Node(_, l, _, r) => 1 + list.max(list.map([height(l), height(r)], int.to_int).unwrap_or(0))
   |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

10 error(s) found
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
      if v == x then Node(Black, Leaf, x, r)
      else if v < x then balance(Node(Red, l, v, Node(Black, Leaf, x, r)))
      else balance(Node(Red, Node(Black, Leaf, x, r), v, l))
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, l, x, Node(Red, r1, y, r2)) =>
      if x < y then balance(Node(Black, Node(Red, l, x, r1), y, r2))
      else balance(Node(Black, Node(Red, Node(Black, Leaf, x, l), y, r1), r2))
    Node(Red, l, x, r) => Node(Black, l, x, r)
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
    Node(_, l, _, r) => 1 + list.max([height(l), height(r)]).unwrap_or(0)
  }

fn list.max(xs: List[Int]) -> Option[Int] =
  match xs {
    List() => none
    List(x, xs) => match xs {
      List() => some(x)
      xs => match list.max(xs) {
        none => some(x)
        some(y) => if x > y then some(x) else some(y)
      }
    }
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
error[E004]: Node() expects 4 argument(s) but got 3
  --> /tmp/dojo-red-black-tree-3.almd:20:75
  in constructor Node()
  here: else balance(Node(Black, Node(Red, Node(Black, Leaf, x, l), y, r1), r2))
  hint: Check the number of arguments
   |
20 |       else balance(Node(Black, Node(Red, Node(Black, Leaf, x, l), y, r1), r2))
   |                                                                           ^^
error[E005]: Node() argument 3 expects Int but got Tree
  --> /tmp/dojo-red-black-tree-3.almd:20:75
  in constructor Node()
  here: else balance(Node(Black, Node(Red, Node(Black, Leaf, x, l), y, r1), r2))
  hint: Node(Color, Tree, Int, Tree) expects argument #3 to be Int, got Tree
   |
20 |       else balance(Node(Black, Node(Red, Node(Black, Leaf, x, l), y, r1), r2))
   |                                                                           ^^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-3.almd:27:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
27 |     Leaf => List()
   |             ^^^^
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-3.almd:28:52
  in match arm
  here: Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
28 |     Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-3.almd:28:52
  in fn 'inorder'
  here: Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Fix the expression type or change the expected type
   |
28 |     Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^

6 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
