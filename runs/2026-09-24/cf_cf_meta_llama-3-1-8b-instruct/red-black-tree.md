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
      else if v < x then balance(Node(c, l, v, r), x, t)
      else balance(Node(c, l, x, r), v, t)
  }

fn balance(t: Tree, x: Int, old: Tree) -> Tree =
  match t {
    Node(Red, l, y, r) =>
      if y == x then t
      else if y < x then balance(Node(Black, l, y, r), x, old)
      else match r {
        Node(Red, a, z, b) =>
          if z == x then Node(Red, Node(Black, l, y, a), z, b)
          else if z < x then Node(Red, Node(Black, l, y, a), z, balance(Node(Black, b, x, r), x, old))
          else Node(Red, Node(Black, l, y, a), z, balance(Node(Black, b, x, r), x, old))
        _ => t
      }
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
  --> /tmp/dojo-red-black-tree-0.almd:33:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
33 |     Leaf => List()
   |             ^^^^
error[E002]: undefined function 'max'
  --> /tmp/dojo-red-black-tree-0.almd:40:51
  in call to max()
  here: Node(_, l, _, r) => 1 + max(height(l), height(r))
  hint: Check the function name
   |
40 |     Node(_, l, _, r) => 1 + max(height(l), height(r))
   |                                                   ^
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-0.almd:34:52
  in match arm
  here: Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
34 |     Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-0.almd:34:52
  in fn 'inorder'
  here: Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Fix the expression type or change the expected type
   |
34 |     Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
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
      else if v < x then balance(Node(c, l, v, r), x, t)
      else balance(Node(c, l, x, r), v, t)
  }

fn balance(t: Tree, x: Int, old: Tree) -> Tree =
  match t {
    Node(Red, l, y, r) =>
      if y == x then t
      else if y < x then balance(Node(Black, l, y, r), x, old)
      else match r {
        Node(Red, a, z, b) =>
          if z == x then Node(Red, Node(Black, l, y, a), z, b)
          else if z < x then Node(Red, Node(Black, l, y, a), z, balance(Node(Black, b, x, r), x, old))
          else Node(Red, Node(Black, l, y, a), z, balance(Node(Black, b, x, r), x, old))
        _ => t
      }
    _ => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(c, l, x, r) => list.concat(list.map(inorder(l), fn(x) => [x]), [x], list.map(inorder(r), fn(x) => [x]))
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.map([height(l)], fn(x) => x), list.map([height(r)], fn(x) => x))
  }
```

**Diagnostic:**

```
error: Expected expression at line 34:58 (got Fn 'fn')
  --> /tmp/dojo-red-black-tree-1.almd:34:58
  here: Node(c, l, x, r) => list.concat(list.map(inorder(l), fn(x) => [x]), [x], list.map(inorder(r), fn(x) => [x]))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
34 |     Node(c, l, x, r) => list.concat(list.map(inorder(l), fn(x) => [x]), [x], list.map(inorder(r), fn(x) => [x]))
   |                                                          ^
error: Expected function name at line 34:60 (got LParen '(')
  --> /tmp/dojo-red-black-tree-1.almd:34:60
  here: Node(c, l, x, r) => list.concat(list.map(inorder(l), fn(x) => [x]), [x], list.map(inorder(r), fn(x) => [x]))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
34 |     Node(c, l, x, r) => list.concat(list.map(inorder(l), fn(x) => [x]), [x], list.map(inorder(r), fn(x) => [x]))
   |                                                            ^
error: Expected function name at line 34:101 (got LParen '(')
  --> /tmp/dojo-red-black-tree-1.almd:34:101
  here: Node(c, l, x, r) => list.concat(list.map(inorder(l), fn(x) => [x]), [x], list.map(inorder(r), fn(x) => [x]))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
34 |     Node(c, l, x, r) => list.concat(list.map(inorder(l), fn(x) => [x]), [x], list.map(inorder(r), fn(x) => [x]))
   |                                                                                                     ^
error: Expected expression at line 40:60 (got Fn 'fn')
  --> /tmp/dojo-red-black-tree-1.almd:40:60
  here: Node(_, l, _, r) => 1 + list.max(list.map([height(l)], fn(x) => x), list.map([height(r)], fn(x) => x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
40 |     Node(_, l, _, r) => 1 + list.max(list.map([height(l)], fn(x) => x), list.map([height(r)], fn(x) => x))
   |                                                            ^
error: Expected function name at line 40:62 (got LParen '(')
  --> /tmp/dojo-red-black-tree-1.almd:40:62
  here: Node(_, l, _, r) => 1 + list.max(list.map([height(l)], fn(x) => x), list.map([height(r)], fn(x) => x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
40 |     Node(_, l, _, r) => 1 + list.max(list.map([height(l)], fn(x) => x), list.map([height(r)], fn(x) => x))
   |                                                              ^
error: Expected function name at line 40:97 (got LParen '(')
  --> /tmp/dojo-red-black-tree-1.almd:40:97
  here: Node(_, l, _, r) => 1 + list.max(list.map([height(l)], fn(x) => x), list.map([height(r)], fn(x) => x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
40 |     Node(_, l, _, r) => 1 + list.max(list.map([height(l)], fn(x) => x), list.map([height(r)], fn(x) => x))
   |                                                                                                 ^

6 error(s) found
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
      else if v < x then balance(Node(c, l, v, r), x, t)
      else balance(Node(c, l, x, r), v, t)
  }

fn balance(t: Tree, x: Int, old: Tree) -> Tree =
  match t {
    Node(Red, l, y, r) =>
      if y == x then t
      else if y < x then balance(Node(Black, l, y, r), x, old)
      else match r {
        Node(Red, a, z, b) =>
          if z == x then Node(Red, Node(Black, l, y, a), z, b)
          else if z < x then Node(Red, Node(Black, l, y, a), z, balance(Node(Black, b, x, r), x, old))
          else Node(Red, Node(Black, l, y, a), z, balance(Node(Black, b, x, r), x, old))
        _ => t
      }
    _ => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(c, l, x, r) => list.concat(list.map(inorder(l), (x) => [x]), [x], list.map(inorder(r), (x) => [x]))
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.map([height(l)], (x) => x), list.map([height(r)], (x) => x))
  }
```

**Diagnostic:**

```
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-2.almd:33:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
33 |     Leaf => List()
   |             ^^^^
error[E002]: undefined function 'list.concat'
  --> /tmp/dojo-red-black-tree-2.almd:34:105
  in call to list.concat()
  here: Node(c, l, x, r) => list.concat(list.map(inorder(l), (x) => [x]), [x], list.map(inorder(r), (x) => [x]))
  hint: No function 'concat' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
34 |     Node(c, l, x, r) => list.concat(list.map(inorder(l), (x) => [x]), [x], list.map(inorder(r), (x) => [x]))
   |                                                                                                         ^
error[E004]: list.max() expects 1 argument(s) but got 2
  --> /tmp/dojo-red-black-tree-2.almd:40:100
  in call to list.max()
  here: Node(_, l, _, r) => 1 + list.max(list.map([height(l)], (x) => x), list.map([height(r)], (x) => x))
  hint: Check the number of arguments
  try:
      // list.max() takes 1 arg(s) — you passed 2
      list.max(<xs: List[A]>)
   |
40 |     Node(_, l, _, r) => 1 + list.max(list.map([height(l)], (x) => x), list.map([height(r)], (x) => x))
   |                                                                                                    ^
error: operator '+' requires numeric, String, or List types but got Int and Option[Int]
  --> /tmp/dojo-red-black-tree-2.almd:40:100
  in operator +
  here: Node(_, l, _, r) => 1 + list.max(list.map([height(l)], (x) => x), list.map([height(r)], (x) => x))
  hint: Use + with numeric types, String, or List
   |
40 |     Node(_, l, _, r) => 1 + list.max(list.map([height(l)], (x) => x), list.map([height(r)], (x) => x))
   |                                                                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-2.almd:34:105
  in fn 'inorder'
  here: Node(c, l, x, r) => list.concat(list.map(inorder(l), (x) => [x]), [x], list.map(inorder(r), (x) => [x]))
  hint: Fix the expression type or change the expected type
   |
34 |     Node(c, l, x, r) => list.concat(list.map(inorder(l), (x) => [x]), [x], list.map(inorder(r), (x) => [x]))
   |                                                                                                         ^

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
      else if v < x then balance(Node(c, l, v, r), x, t)
      else balance(Node(c, l, x, r), v, t)
  }

fn balance(t: Tree, x: Int, old: Tree) -> Tree =
  match t {
    Node(Red, l, y, r) =>
      if y == x then t
      else if y < x then balance(Node(Black, l, y, r), x, old)
      else match r {
        Node(Red, a, z, b) =>
          if z == x then Node(Red, Node(Black, l, y, a), z, b)
          else if z < x then Node(Red, Node(Black, l, y, a), z, balance(Node(Black, b, x, r), x, old))
          else Node(Red, Node(Black, l, y, a), z, balance(Node(Black, b, x, r), x, old))
        _ => t
      }
    _ => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(c, l, x, r) => list.concat(list.map(inorder(l), (x) => [x]), [x], list.map(inorder(r), (x) => [x]))
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + list.max(list.map([height(l)], (x) => x), list.map([height(r)], (x) => x))
  }

fn list.concat(xs: List[Int], x: Int, ys: List[Int]) -> List[Int] =
  list.concat(xs, ys) + [x]

fn list.max(xs: List[Int]) -> Option[Int] =
  match xs {
    List() => none
    _ => some(list.fold(xs, Int.min, (acc, x) => x))
  }
```

**Diagnostic:**

```
error: Expected LParen at line 43:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:43:8
  here: fn list.concat(xs: List[Int], x: Int, ys: List[Int]) -> List[Int] =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
43 | fn list.concat(xs: List[Int], x: Int, ys: List[Int]) -> List[Int] =
   |        ^
error: Expected LParen at line 46:8 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:46:8
  here: fn list.max(xs: List[Int]) -> Option[Int] =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
46 | fn list.max(xs: List[Int]) -> Option[Int] =
   |        ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-3.almd:33:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
33 |     Leaf => List()
   |             ^^^^
error[E002]: undefined function 'list.concat'
  --> /tmp/dojo-red-black-tree-3.almd:34:105
  in call to list.concat()
  here: Node(c, l, x, r) => list.concat(list.map(inorder(l), (x) => [x]), [x], list.map(inorder(r), (x) => [x]))
  hint: No function 'concat' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
34 |     Node(c, l, x, r) => list.concat(list.map(inorder(l), (x) => [x]), [x], list.map(inorder(r), (x) => [x]))
   |                                                                                                         ^
error[E004]: list.max() expects 1 argument(s) but got 2
  --> /tmp/dojo-red-black-tree-3.almd:40:100
  in call to list.max()
  here: Node(_, l, _, r) => 1 + list.max(list.map([height(l)], (x) => x), list.map([height(r)], (x) => x))
  hint: Check the number of arguments
  try:
      // list.max() takes 1 arg(s) — you passed 2
      list.max(<xs: List[A]>)
   |
40 |     Node(_, l, _, r) => 1 + list.max(list.map([height(l)], (x) => x), list.map([height(r)], (x) => x))
   |                                                                                                    ^
error: operator '+' requires numeric, String, or List types but got Int and Option[Int]
  --> /tmp/dojo-red-black-tree-3.almd:40:100
  in operator +
  here: Node(_, l, _, r) => 1 + list.max(list.map([height(l)], (x) => x), list.map([height(r)], (x) => x))
  hint: Use + with numeric types, String, or List
   |
40 |     Node(_, l, _, r) => 1 + list.max(list.map([height(l)], (x) => x), list.map([height(r)], (x) => x))
   |                                                                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-3.almd:34:105
  in fn 'inorder'
  here: Node(c, l, x, r) => list.concat(list.map(inorder(l), (x) => [x]), [x], list.map(inorder(r), (x) => [x]))
  hint: Fix the expression type or change the expected type
   |
34 |     Node(c, l, x, r) => list.concat(list.map(inorder(l), (x) => [x]), [x], list.map(inorder(r), (x) => [x]))
   |                                                                                                         ^

7 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
