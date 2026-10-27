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
      else if v < x then balance(Node(Red, l, v, Leaf), x, r)
      else balance(Node(Red, Leaf, v, r), x, l)
  }

fn balance(t: Tree, x: Int, r: Tree) -> Tree =
  match t {
    Node(Red, l, y, Node(Red, _, _, r)) =>
      Node(Black, Node(Red, l, y, t), x, r)
    Node(Red, l, y, Node(Red, _, _, r)) =>
      Node(Black, Node(Red, l, y, t), x, r)
    _ => Node(Red, l, x, r)
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
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-0.almd:21:7
  in match
  here: Node(Black, Node(Red, l, y, t), x, r)
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
21 |       Node(Black, Node(Red, l, y, t), x, r)
   |       ^^^^
error[E003]: undefined variable 'l'
  --> /tmp/dojo-red-black-tree-0.almd:22:20
  in variable l
  here: _ => Node(Red, l, x, r)
  hint: Did you mean `t`?
  try:
      t
   |
22 |     _ => Node(Red, l, x, r)
   |                    ^
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
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
28 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-0.almd:28:52
  in fn 'inorder'
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Fix the expression type or change the expected type
   |
28 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
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
      else if v < x then balance(Node(Red, l, v, Leaf), x, r)
      else balance(Node(Red, Leaf, v, r), x, l)
  }

fn balance(t: Tree, x: Int, r: Tree) -> Tree =
  match t {
    Node(Red, l, y, Node(Red, _, _, r)) =>
      Node(Black, Node(Red, l, y, t), x, r)
    Node(Red, l, y, _) =>
      Node(Black, Node(Red, l, y, t), x, r)
    _ => Node(Red, l, x, r)
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + int.max(height(l), height(r))
  }
```

**Diagnostic:**

```
error[E003]: undefined variable 'l'
  --> /tmp/dojo-red-black-tree-1.almd:22:20
  in variable l
  here: _ => Node(Red, l, x, r)
  hint: Did you mean `t`?
  try:
      t
   |
22 |     _ => Node(Red, l, x, r)
   |                    ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-1.almd:27:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
27 |     Leaf => List()
   |             ^^^^
error[E001]: type mismatch in match arm: expected List but got List[Int]
  --> /tmp/dojo-red-black-tree-1.almd:28:52
  in match arm
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
28 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
   |                                                    ^
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-1.almd:28:52
  in fn 'inorder'
  here: Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  hint: Fix the expression type or change the expected type
   |
28 |     Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
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
      if v == x then Node(Black, Leaf, x, r)
      else if v < x then balance(Node(Red, l, v, Leaf), x, r)
      else balance(Node(Red, Leaf, v, r), x, l)
  }

fn balance(t: Tree, x: Int, r: Tree) -> Tree =
  match t {
    Node(Red, l, y, Node(Red, _, _, r)) =>
      Node(Black, Node(Red, l, y, t), x, r)
    Node(Red, l, y, _) =>
      Node(Black, Node(Red, l, y, t), x, r)
    _ => Node(Red, l, x, r)
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + int.max(height(l), height(r))
  }

fn list() = import list
fn int() = import int

fn inorder(t: Tree) -> list.List[int.Int] =
  match t {
    Leaf => list.List()
    Node(_, l, x, r) => list.List.concat(list.List.concat(inorder(l), list.List.of([x])), inorder(r))
  }

fn height(t: Tree) -> int.Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + int.max(height(l), height(r))
  }
```

**Diagnostic:**

```
error: Missing return type at line 37:11
  --> /tmp/dojo-red-black-tree-2.almd:37:11
  here: fn list() = import list
  hint: every fn declares its return type and takes '=' before its body:
        fn list(...) -> Type = { ... }
   |
37 | fn list() = import list
   |           ^
error: Missing return type at line 38:10
  --> /tmp/dojo-red-black-tree-2.almd:38:10
  here: fn int() = import int
  hint: every fn declares its return type and takes '=' before its body:
        fn int(...) -> Type = { ... }
   |
38 | fn int() = import int
   |          ^
error[E012]: duplicate function 'inorder'
  at line 40
  in fn inorder
  here: fn inorder(t: Tree) -> list.List[int.Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
25 | fn inorder(t: Tree) -> List[Int] =
   | ---------------------------------- first definition of 'inorder' here
...
40 | fn inorder(t: Tree) -> list.List[int.Int] =
   | ^
error[E012]: duplicate function 'height'
  at line 46
  in fn height
  here: fn height(t: Tree) -> int.Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
31 | fn height(t: Tree) -> Int =
   | --------------------------------- first definition of 'height' here
...
46 | fn height(t: Tree) -> int.Int =
   | ^
error[E029]: unknown type 'List'
  --> /tmp/dojo-red-black-tree-2.almd:40:29
  in return type of 'inorder'
  here: fn inorder(t: Tree) -> list.List[int.Int] =
  hint: no `type List` is declared (or imported) in this program — declare it, or check the spelling
   |
40 | fn inorder(t: Tree) -> list.List[int.Int] =
   |                             ^^^^
error[E029]: unknown type 'Int'
  --> /tmp/dojo-red-black-tree-2.almd:40:38
  in return type of 'inorder'
  here: fn inorder(t: Tree) -> list.List[int.Int] =
  hint: no `type Int` is declared (or imported) in this program — declare it, or check the spelling
   |
40 | fn inorder(t: Tree) -> list.List[int.Int] =
   |                                      ^^^
error[E003]: undefined variable 'l'
  --> /tmp/dojo-red-black-tree-2.almd:22:20
  in variable l
  here: _ => Node(Red, l, x, r)
  hint: Did you mean `x`?
  try:
      x
   |
22 |     _ => Node(Red, l, x, r)
   |                    ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-2.almd:27:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
27 |     Leaf => List()
   |             ^^^^
error[E002]: undefined function 'list.List'
  --> /tmp/dojo-red-black-tree-2.almd:42:13
  in call to list.List()
  here: Leaf => list.List()
  hint: Did you mean `list.last`?
  try:
      list.last
   |
42 |     Leaf => list.List()
   |             ^^^^^^^^^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-red-black-tree-2.almd:43:71
  in variable list
  here: Node(_, l, x, r) => list.List.concat(list.List.concat(inorder(l), list.List.of([x])), inorder(r))
  hint: Did you mean `list.min`?
  try:
      list.min
   |
43 |     Node(_, l, x, r) => list.List.concat(list.List.concat(inorder(l), list.List.of([x])), inorder(r))
   |                                                                       ^^^^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-red-black-tree-2.almd:43:42
  in variable list
  here: Node(_, l, x, r) => list.List.concat(list.List.concat(inorder(l), list.List.of([x])), inorder(r))
  hint: Did you mean `list.min`?
  try:
      list.min
   |
43 |     Node(_, l, x, r) => list.List.concat(list.List.concat(inorder(l), list.List.of([x])), inorder(r))
   |                                          ^^^^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-red-black-tree-2.almd:43:25
  in variable list
  here: Node(_, l, x, r) => list.List.concat(list.List.concat(inorder(l), list.List.of([x])), inorder(r))
  hint: Did you mean `list.min`?
  try:
      list.min
   |
43 |     Node(_, l, x, r) => list.List.concat(list.List.concat(inorder(l), list.List.of([x])), inorder(r))
   |                         ^^^^
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
error[E001]: type mismatch in fn 'height': expected Int but got Int
  --> /tmp/dojo-red-black-tree-2.almd:49:55
  in fn 'height'
  here: Node(_, l, _, r) => 1 + int.max(height(l), height(r))
  hint: Fix the expression type or change the expected type
   |
49 |     Node(_, l, _, r) => 1 + int.max(height(l), height(r))
   |                                                       ^
error[E025]: cannot infer a concrete type for this expression (type ?0)
  --> /tmp/dojo-red-black-tree-2.almd:43:71
  in this expression with an unconstrained type
  here: Node(_, l, x, r) => list.List.concat(list.List.concat(inorder(l), list.List.of([x])), inorder(r))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
43 |     Node(_, l, x, r) => list.List.concat(list.List.concat(inorder(l), list.List.of([x])), inorder(r))
   |                                                                       ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?1)
  --> /tmp/dojo-red-black-tree-2.almd:43:42
  in this expression with an unconstrained type
  here: Node(_, l, x, r) => list.List.concat(list.List.concat(inorder(l), list.List.of([x])), inorder(r))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
43 |     Node(_, l, x, r) => list.List.concat(list.List.concat(inorder(l), list.List.of([x])), inorder(r))
   |                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

17 error(s) found
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
      else if v < x then balance(Node(Red, l, v, Leaf), x, r)
      else balance(Node(Red, Leaf, v, r), x, l)
  }

fn balance(t: Tree, x: Int, r: Tree) -> Tree =
  match t {
    Node(Red, l, y, Node(Red, _, _, r)) =>
      Node(Black, Node(Red, l, y, t), x, r)
    Node(Red, l, y, _) =>
      Node(Black, Node(Red, l, y, t), x, r)
    _ => Node(Red, l, x, r)
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + int.max(height(l), height(r))
  }

fn list() = import list
fn int() = import int

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => List()
    Node(_, l, x, r) => list.concat(list.concat(inorder(l), list.of([x])), inorder(r))
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + int.max(height(l), height(r))
  }
```

**Diagnostic:**

```
error: Missing return type at line 37:11
  --> /tmp/dojo-red-black-tree-3.almd:37:11
  here: fn list() = import list
  hint: every fn declares its return type and takes '=' before its body:
        fn list(...) -> Type = { ... }
   |
37 | fn list() = import list
   |           ^
error: Missing return type at line 38:10
  --> /tmp/dojo-red-black-tree-3.almd:38:10
  here: fn int() = import int
  hint: every fn declares its return type and takes '=' before its body:
        fn int(...) -> Type = { ... }
   |
38 | fn int() = import int
   |          ^
error[E012]: duplicate function 'inorder'
  at line 40
  in fn inorder
  here: fn inorder(t: Tree) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
25 | fn inorder(t: Tree) -> List[Int] =
   | ---------------------------------- first definition of 'inorder' here
...
40 | fn inorder(t: Tree) -> List[Int] =
   | ^
error[E012]: duplicate function 'height'
  at line 46
  in fn height
  here: fn height(t: Tree) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
31 | fn height(t: Tree) -> Int =
   | --------------------------------- first definition of 'height' here
...
46 | fn height(t: Tree) -> Int =
   | ^
error[E003]: undefined variable 'l'
  --> /tmp/dojo-red-black-tree-3.almd:22:20
  in variable l
  here: _ => Node(Red, l, x, r)
  hint: Did you mean `x`?
  try:
      x
   |
22 |     _ => Node(Red, l, x, r)
   |                    ^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-3.almd:27:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
27 |     Leaf => List()
   |             ^^^^
error[E003]: unknown type or constructor 'List' in call position
  --> /tmp/dojo-red-black-tree-3.almd:42:13
  in call to List()
  here: Leaf => List()
  hint: No type, variant constructor, or opaque alias named 'List' is in scope. Check the spelling or add the missing import.
   |
42 |     Leaf => List()
   |             ^^^^
error[E002]: undefined function 'list.of'
  --> /tmp/dojo-red-black-tree-3.almd:43:61
  in call to list.of()
  here: Node(_, l, x, r) => list.concat(list.concat(inorder(l), list.of([x])), inorder(r))
  hint: Did you mean `list.pop`?
  try:
      list.pop
   |
43 |     Node(_, l, x, r) => list.concat(list.concat(inorder(l), list.of([x])), inorder(r))
   |                                                             ^^^^^^^
error[E002]: undefined function 'list.concat'
  --> /tmp/dojo-red-black-tree-3.almd:43:37
  in call to list.concat()
  here: Node(_, l, x, r) => list.concat(list.concat(inorder(l), list.of([x])), inorder(r))
  hint: No function 'concat' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
43 |     Node(_, l, x, r) => list.concat(list.concat(inorder(l), list.of([x])), inorder(r))
   |                                     ^^^^^^^^^^^
error[E002]: undefined function 'list.concat'
  --> /tmp/dojo-red-black-tree-3.almd:43:25
  in call to list.concat()
  here: Node(_, l, x, r) => list.concat(list.concat(inorder(l), list.of([x])), inorder(r))
  hint: No function 'concat' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
43 |     Node(_, l, x, r) => list.concat(list.concat(inorder(l), list.of([x])), inorder(r))
   |                         ^^^^^^^^^^^
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
error[E001]: type mismatch in fn 'inorder': expected List[Int] but got List
  --> /tmp/dojo-red-black-tree-3.almd:43:84
  in fn 'inorder'
  here: Node(_, l, x, r) => list.concat(list.concat(inorder(l), list.of([x])), inorder(r))
  hint: Fix the expression type or change the expected type
   |
43 |     Node(_, l, x, r) => list.concat(list.concat(inorder(l), list.of([x])), inorder(r))
   |                                                                                    ^

13 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
