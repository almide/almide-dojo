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
      if y < x then balance(Node(Black, Node(Red, l, x, r1), y, r2))
      else balance(Node(Black, Node(Red, l, x, Node(Black, Leaf, y, r1)), r2))
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
  --> /tmp/dojo-red-black-tree-0.almd:21:75
  in constructor Node()
  here: else balance(Node(Black, Node(Red, l, x, Node(Black, Leaf, y, r1)), r2))
  hint: Check the number of arguments
   |
21 |       else balance(Node(Black, Node(Red, l, x, Node(Black, Leaf, y, r1)), r2))
   |                                                                           ^^
error[E005]: Node() argument 3 expects Int but got Tree
  --> /tmp/dojo-red-black-tree-0.almd:21:75
  in constructor Node()
  here: else balance(Node(Black, Node(Red, l, x, Node(Black, Leaf, y, r1)), r2))
  hint: Node(Color, Tree, Int, Tree) expects argument #3 to be Int, got Tree
   |
21 |       else balance(Node(Black, Node(Red, l, x, Node(Black, Leaf, y, r1)), r2))
   |                                                                           ^^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-0.almd:28:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
28 |     Leaf => List()
   |             ^^^^
error[E002]: undefined function 'max'
  --> /tmp/dojo-red-black-tree-0.almd:35:29
  in call to max()
  here: Node(_, l, _, r) => 1 + max(height(l), height(r))
  hint: Check the function name
   |
35 |     Node(_, l, _, r) => 1 + max(height(l), height(r))
   |                             ^^^
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-0.almd:29:52
  in match arm
  here: Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
29 |     Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-0.almd:29:52
  in fn 'inorder'
  here: Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Fix the expression type or change the expected type
   |
29 |     Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
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
      else if v < x then balance(Node(Red, l, v, Node(Black, Leaf, x, r)))
      else balance(Node(Red, Node(Black, Leaf, x, r), v, l))
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, l, x, Node(Red, r1, y, r2)) =>
      if y < x then balance(Node(Black, Node(Red, l, x, r1), y, r2))
      else balance(Node(Black, Node(Red, l, x, Node(Black, Leaf, y, r1)), r2))
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
    Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => Int.min(Int.max(Int.min_value(), Int.max_value()))
    List(x, xs) => list.max(xs)
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
error[E004]: Node() expects 4 argument(s) but got 3
  --> /tmp/dojo-red-black-tree-1.almd:20:75
  in constructor Node()
  here: else balance(Node(Black, Node(Red, l, x, Node(Black, Leaf, y, r1)), r2))
  hint: Check the number of arguments
   |
20 |       else balance(Node(Black, Node(Red, l, x, Node(Black, Leaf, y, r1)), r2))
   |                                                                           ^^
error[E005]: Node() argument 3 expects Int but got Tree
  --> /tmp/dojo-red-black-tree-1.almd:20:75
  in constructor Node()
  here: else balance(Node(Black, Node(Red, l, x, Node(Black, Leaf, y, r1)), r2))
  hint: Node(Color, Tree, Int, Tree) expects argument #3 to be Int, got Tree
   |
20 |       else balance(Node(Black, Node(Red, l, x, Node(Black, Leaf, y, r1)), r2))
   |                                                                           ^^
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
...
34 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                                      ^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got Int and Option[?0]
  --> /tmp/dojo-red-black-tree-1.almd:34:38
  in operator +
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Use + with numeric types, String, or List
   |
34 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                                      ^^^^^^^^^
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
error[E025]: cannot infer a concrete type for this expression (type Option[?0])
  --> /tmp/dojo-red-black-tree-1.almd:34:29
  in this expression with an unconstrained type
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
34 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

10 error(s) found
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
      else if v < x then balance(Node(Red, l, v, Node(Black, Leaf, x, r)))
      else balance(Node(Red, Node(Black, Leaf, x, r), v, l))
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, l, x, Node(Red, r1, y, r2)) =>
      if y < x then balance(Node(Black, Node(Red, l, x, r1), y, r2))
      else balance(Node(Black, Node(Red, l, x, Node(Black, Leaf, y, r1)), r2))
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
    Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => int.min(int.max(int.min_value(), int.max_value()))
    List(x, xs) => list.max(xs)
  }

fn int.min(a: Int, b: Int) -> Int =
  if a <= b then a else b

fn int.max(a: Int, b: Int) -> Int =
  if a >= b then a else b
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
error: Expected LParen at line 43:7 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:43:7
  here: fn int.min(a: Int, b: Int) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
43 | fn int.min(a: Int, b: Int) -> Int =
   |       ^
error: Expected LParen at line 46:7 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:46:7
  here: fn int.max(a: Int, b: Int) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
46 | fn int.max(a: Int, b: Int) -> Int =
   |       ^
error[E004]: Node() expects 4 argument(s) but got 3
  --> /tmp/dojo-red-black-tree-2.almd:20:75
  in constructor Node()
  here: else balance(Node(Black, Node(Red, l, x, Node(Black, Leaf, y, r1)), r2))
  hint: Check the number of arguments
   |
20 |       else balance(Node(Black, Node(Red, l, x, Node(Black, Leaf, y, r1)), r2))
   |                                                                           ^^
error[E005]: Node() argument 3 expects Int but got Tree
  --> /tmp/dojo-red-black-tree-2.almd:20:75
  in constructor Node()
  here: else balance(Node(Black, Node(Red, l, x, Node(Black, Leaf, y, r1)), r2))
  hint: Node(Color, Tree, Int, Tree) expects argument #3 to be Int, got Tree
   |
20 |       else balance(Node(Black, Node(Red, l, x, Node(Black, Leaf, y, r1)), r2))
   |                                                                           ^^
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
...
34 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                                      ^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got Int and Option[?0]
  --> /tmp/dojo-red-black-tree-2.almd:34:38
  in operator +
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Use + with numeric types, String, or List
   |
34 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                                      ^^^^^^^^^
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
error[E025]: cannot infer a concrete type for this expression (type Option[?0])
  --> /tmp/dojo-red-black-tree-2.almd:34:29
  in this expression with an unconstrained type
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
34 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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
      else if v < x then balance(Node(Red, l, v, Node(Black, Leaf, x, r)))
      else balance(Node(Red, Node(Black, Leaf, x, r), v, l))
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, l, x, Node(Red, r1, y, r2)) =>
      if y < x then balance(Node(Black, Node(Red, l, x, r1), y, r2))
      else balance(Node(Black, Node(Red, l, x, Node(Black, Leaf, y, r1)), r2))
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
    Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  }

fn list.max(xs: List[Int]) -> Int =
  match xs {
    List() => int.min(int.max(int.min_value(), int.max_value()))
    List(x, xs) => match list.max(xs) {
      none => int.min(int.max(int.min_value(), int.max_value()))
      some(x) => x
    }
  }

fn int.min(a: Int, b: Int) -> Int =
  if a <= b then a else b

fn int.max(a: Int, b: Int) -> Int =
  if a >= b then a else b
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
error: Expected LParen at line 46:7 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:46:7
  here: fn int.min(a: Int, b: Int) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
46 | fn int.min(a: Int, b: Int) -> Int =
   |       ^
error: Expected LParen at line 49:7 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:49:7
  here: fn int.max(a: Int, b: Int) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
49 | fn int.max(a: Int, b: Int) -> Int =
   |       ^
error[E004]: Node() expects 4 argument(s) but got 3
  --> /tmp/dojo-red-black-tree-3.almd:20:75
  in constructor Node()
  here: else balance(Node(Black, Node(Red, l, x, Node(Black, Leaf, y, r1)), r2))
  hint: Check the number of arguments
   |
20 |       else balance(Node(Black, Node(Red, l, x, Node(Black, Leaf, y, r1)), r2))
   |                                                                           ^^
error[E005]: Node() argument 3 expects Int but got Tree
  --> /tmp/dojo-red-black-tree-3.almd:20:75
  in constructor Node()
  here: else balance(Node(Black, Node(Red, l, x, Node(Black, Leaf, y, r1)), r2))
  hint: Node(Color, Tree, Int, Tree) expects argument #3 to be Int, got Tree
   |
20 |       else balance(Node(Black, Node(Red, l, x, Node(Black, Leaf, y, r1)), r2))
   |                                                                           ^^
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
...
34 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                                      ^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got Int and Option[?0]
  --> /tmp/dojo-red-black-tree-3.almd:34:38
  in operator +
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Use + with numeric types, String, or List
   |
34 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                                      ^^^^^^^^^
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
error[E025]: cannot infer a concrete type for this expression (type Option[?0])
  --> /tmp/dojo-red-black-tree-3.almd:34:29
  in this expression with an unconstrained type
  here: Node(_, l, _, r) => 1 + list.max(height(l), height(r))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
34 |     Node(_, l, _, r) => 1 + list.max(height(l), height(r))
   |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

12 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
