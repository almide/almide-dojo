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
      Node(Black, Node(Red, l, x, r1), y, Node(Black, r2, v, r3))
      where
        (v, r3) = match r2 {
          Leaf => (y, Leaf)
          Node(c, r21, z, r22) =>
            if z < y then (y, Node(c, r21, z, r22))
            else (z, Node(c, r21, y, r22))
        }
    Node(Red, l, x, Node(Black, r1, y, r2)) =>
      Node(Black, Node(Red, l, x, r1), y, Node(Black, r2, v, r3))
      where
        (v, r3) = match r1 {
          Leaf => (x, Leaf)
          Node(c, r11, z, r12) =>
            if z > x then (x, Node(c, r11, z, r12))
            else (z, Node(c, r11, x, r12))
        }
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
error: Expected FatArrow at line 20:12 (got Newline '')
  --> /tmp/dojo-red-black-tree-0.almd:20:12
  here: where
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 |       where
   |            ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-0.almd:41:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
41 |     Leaf => List()
   |             ^^^^
error[E002]: undefined function 'max'
  --> /tmp/dojo-red-black-tree-0.almd:48:29
  in call to max()
  here: Node(c, l, _, r) => 1 + max(height(l), height(r))
  hint: Check the function name
   |
48 |     Node(c, l, _, r) => 1 + max(height(l), height(r))
   |                             ^^^
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-0.almd:42:52
  in match arm
  here: Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
42 |     Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-0.almd:42:52
  in fn 'inorder'
  here: Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Fix the expression type or change the expected type
   |
42 |     Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^

5 error(s) found
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
      Node(Black, Node(Red, l, x, r1), y, Node(Black, r2, y, r2))
      where
        (r2) = match r2 {
          Leaf => Leaf
          Node(c, r21, z, r22) =>
            if z < y then r22
            else if z > y then Node(c, r21, y, r22)
            else Node(c, r21, z, r22)
        }
    Node(Red, l, x, Node(Black, r1, y, r2)) =>
      Node(Black, Node(Red, l, x, r1), y, Node(Black, r2, x, r2))
      where
        (r2) = match r2 {
          Leaf => Leaf
          Node(c, r21, z, r22) =>
            if z > x then r22
            else if z < x then Node(c, r21, x, r22)
            else Node(c, r21, z, r22)
        }
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

fn max(a: Int, b: Int) -> Int =
  if a > b then a else b
```

**Diagnostic:**

```
error: Expected FatArrow at line 20:12 (got Newline '')
  --> /tmp/dojo-red-black-tree-1.almd:20:12
  here: where
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 |       where
   |            ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-1.almd:43:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
43 |     Leaf => List()
   |             ^^^^
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-1.almd:44:52
  in match arm
  here: Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
44 |     Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-1.almd:44:52
  in fn 'inorder'
  here: Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Fix the expression type or change the expected type
   |
44 |     Node(c, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^

4 error(s) found
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
      Node(Black, Node(Red, l, x, r1), y, Node(Black, r2, y, r2))
      where
        (r2) = match r2 {
          Leaf => Leaf
          Node(c, r21, z, r22) =>
            if z < y then r22
            else if z > y then Node(c, r21, y, r22)
            else Node(c, r21, z, r22)
        }
    Node(Red, l, x, Node(Black, r1, y, r2)) =>
      Node(Black, Node(Red, l, x, r1), y, Node(Black, r2, x, r2))
      where
        (r2) = match r2 {
          Leaf => Leaf
          Node(c, r21, z, r22) =>
            if z > x then r22
            else if z < x then Node(c, r21, x, r22)
            else Node(c, r21, z, r22)
        }
    t => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => list.empty()
    Node(c, l, x, r) => list.concat(list.map(inorder(l), fn(x) => x), [x], list.map(inorder(r), fn(x) => x))
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(c, l, _, r) => 1 + list.max(list.map([height(l), height(r)], fn(x) => x))
  }

fn max(xs: List[Int]) -> Int =
  match xs {
    list.empty() => 0
    _ => list.fold(xs, 0, fn(acc, x) => if x > acc then x else acc)
  }
```

**Diagnostic:**

```
error: Expected FatArrow at line 20:12 (got Newline '')
  --> /tmp/dojo-red-black-tree-2.almd:20:12
  here: where
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 |       where
   |            ^
error: Expected expression at line 44:58 (got Fn 'fn')
  --> /tmp/dojo-red-black-tree-2.almd:44:58
  here: Node(c, l, x, r) => list.concat(list.map(inorder(l), fn(x) => x), [x], list.map(inorder(r), fn(x) => x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
44 |     Node(c, l, x, r) => list.concat(list.map(inorder(l), fn(x) => x), [x], list.map(inorder(r), fn(x) => x))
   |                                                          ^
error: Expected function name at line 44:60 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:44:60
  here: Node(c, l, x, r) => list.concat(list.map(inorder(l), fn(x) => x), [x], list.map(inorder(r), fn(x) => x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
44 |     Node(c, l, x, r) => list.concat(list.map(inorder(l), fn(x) => x), [x], list.map(inorder(r), fn(x) => x))
   |                                                            ^
error: Expected function name at line 44:99 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:44:99
  here: Node(c, l, x, r) => list.concat(list.map(inorder(l), fn(x) => x), [x], list.map(inorder(r), fn(x) => x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
44 |     Node(c, l, x, r) => list.concat(list.map(inorder(l), fn(x) => x), [x], list.map(inorder(r), fn(x) => x))
   |                                                                                                   ^
error: Expected expression at line 50:71 (got Fn 'fn')
  --> /tmp/dojo-red-black-tree-2.almd:50:71
  here: Node(c, l, _, r) => 1 + list.max(list.map([height(l), height(r)], fn(x) => x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
50 |     Node(c, l, _, r) => 1 + list.max(list.map([height(l), height(r)], fn(x) => x))
   |                                                                       ^
error: Expected function name at line 50:73 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:50:73
  here: Node(c, l, _, r) => 1 + list.max(list.map([height(l), height(r)], fn(x) => x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
50 |     Node(c, l, _, r) => 1 + list.max(list.map([height(l), height(r)], fn(x) => x))
   |                                                                         ^
error: Expected FatArrow at line 55:9 (got Dot '.')
  --> /tmp/dojo-red-black-tree-2.almd:55:9
  here: list.empty() => 0
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
55 |     list.empty() => 0
   |         ^
error: Expected function name at line 56:29 (got LParen '(')
  --> /tmp/dojo-red-black-tree-2.almd:56:29
  here: _ => list.fold(xs, 0, fn(acc, x) => if x > acc then x else acc)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
56 |     _ => list.fold(xs, 0, fn(acc, x) => if x > acc then x else acc)
   |                             ^

8 error(s) found
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
      Node(Black, Node(Red, l, x, r1), y, Node(Black, r2, y, r2))
      where
        (r2) = match r2 {
          Leaf => Leaf
          Node(c, r21, z, r22) =>
            if z < y then r22
            else if z > y then Node(c, r21, y, r22)
            else Node(c, r21, z, r22)
        }
    Node(Red, l, x, Node(Black, r1, y, r2)) =>
      Node(Black, Node(Red, l, x, r1), y, Node(Black, r2, x, r2))
      where
        (r2) = match r2 {
          Leaf => Leaf
          Node(c, r21, z, r22) =>
            if z > x then r22
            else if z < x then Node(c, r21, x, r22)
            else Node(c, r21, z, r22)
        }
    t => t
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => list.empty()
    Node(c, l, x, r) => list.concat(list.map(inorder(l), (x) => x), [x], list.map(inorder(r), (x) => x))
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(c, l, _, r) => 1 + list.max(list.map([height(l), height(r)], (x) => x))
  }

fn max(xs: List[Int]) -> Int =
  match xs {
    list.empty() => 0
    _ => list.fold(xs, 0, (acc, x) => if x > acc then x else acc)
  }
```

**Diagnostic:**

```
error: Expected FatArrow at line 20:12 (got Newline '')
  --> /tmp/dojo-red-black-tree-3.almd:20:12
  here: where
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 |       where
   |            ^
error: Expected FatArrow at line 55:9 (got Dot '.')
  --> /tmp/dojo-red-black-tree-3.almd:55:9
  here: list.empty() => 0
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
55 |     list.empty() => 0
   |         ^
error[E002]: undefined function 'list.empty'
  --> /tmp/dojo-red-black-tree-3.almd:43:13
  in call to list.empty()
  here: Leaf => list.empty()
  hint: Did you mean `[] (empty list literal)`?
   |
43 |     Leaf => list.empty()
   |             ^^^^^^^^^^
error[E002]: undefined function 'list.concat'
  --> /tmp/dojo-red-black-tree-3.almd:44:25
  in call to list.concat()
  here: Node(c, l, x, r) => list.concat(list.map(inorder(l), (x) => x), [x], list.map(inorder(r), (x) => x))
  hint: No function 'concat' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
44 |     Node(c, l, x, r) => list.concat(list.map(inorder(l), (x) => x), [x], list.map(inorder(r), (x) => x))
   |                         ^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got Int and Option[Int]
  --> /tmp/dojo-red-black-tree-3.almd:50:78
  in operator +
  here: Node(c, l, _, r) => 1 + list.max(list.map([height(l), height(r)], (x) => x))
  hint: Use + with numeric types, String, or List
   |
50 |     Node(c, l, _, r) => 1 + list.max(list.map([height(l), height(r)], (x) => x))
   |                                                                              ^

5 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
