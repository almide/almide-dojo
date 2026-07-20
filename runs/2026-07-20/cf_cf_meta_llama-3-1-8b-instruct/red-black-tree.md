# red-black-tree

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn insert(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Black, Leaf, v, Leaf)
    Node(c, l, x, r) =>
      if v < x then
        let Node(c2, l2, x2, r2) = insert(l, v) in
        match c, c2 {
          Red, Red => Node(Black, l2, x, r2)
          _, _ => Node(c2, l2, x, r2)
        }
      else if v > x then
        let Node(c2, l2, x2, r2) = insert(r, v) in
        match c2, c {
          Red, Red => Node(Black, l, x, r2)
          _, _ => Node(c2, l, x, r2)
        }
      else Node(c, l, x, r)
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-red-black-tree-0.almd:6:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |         let Node(c2, l2, x2, r2) = insert(l, v) in
  |         ^^^
error: Expected expression at line 30:1 (got Test 'test')
  --> /tmp/dojo-red-black-tree-0.almd:30:1
   |
30 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   | ^
error[E005]: argument 't' expects Tree but got Leaf
  --> /tmp/dojo-red-black-tree-0.almd:35:21
  in call to inorder()
  hint: 'Tree' is not a known type. To use it as a type parameter, declare it: fn inorder[Tree](...)
   |
20 | fn inorder(t: Tree) -> List[Int] =
   | ------------------------- fn inorder() defined here
...
35 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E005]: argument 't' expects Tree but got Leaf
  --> /tmp/dojo-red-black-tree-0.almd:39:21
  in call to inorder()
  hint: 'Tree' is not a known type. To use it as a type parameter, declare it: fn inorder[Tree](...)
   |
20 | fn inorder(t: Tree) -> List[Int] =
   | ------------------------- fn inorder() defined here
...
39 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E005]: argument 't' expects Tree but got Leaf
  --> /tmp/dojo-red-black-tree-0.almd:43:21
  in call to inorder()
  hint: 'Tree' is not a known type. To use it as a type parameter, declare it: fn inorder[Tree](...)
   |
20 | fn inorder(t: Tree) -> List[Int] =
   | ------------------------- fn inorder() defined here
...
43 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E005]: argument 't' expects Tree but got Leaf
  --> /tmp/dojo-red-black-tree-0.almd:48:21
  in call to inorder()
  hint: 'Tree' is not a known type. To use it as a type parameter, declare it: fn inorder[Tree](...)
   |
20 | fn inorder(t: Tree) -> List[Int] =
   | ------------------------- fn inorder() defined here
...
48 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E001]: type mismatch in call to inorder(): expected Tree but got Leaf
  --> /tmp/dojo-red-black-tree-0.almd:35:21
  in call to inorder()
  hint: Fix the expression type or change the expected type
   |
35 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E001]: type mismatch in call to inorder(): expected Tree but got Leaf
  --> /tmp/dojo-red-black-tree-0.almd:39:21
  in call to inorder()
  hint: Fix the expression type or change the expected type
   |
39 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E001]: type mismatch in call to inorder(): expected Tree but got Leaf
  --> /tmp/dojo-red-black-tree-0.almd:43:21
  in call to inorder()
  hint: Fix the expression type or change the expected type
   |
43 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E001]: type mismatch in call to inorder(): expected Tree but got Leaf
  --> /tmp/dojo-red-black-tree-0.almd:48:21
  in call to inorder()
  hint: Fix the expression type or change the expected type
   |
48 |   assert_eq(inorder(t), 1..=31)
   |                     ^

10 error(s) found
Compile error for /tmp/dojo-red-black-tree-0.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-0.almd

1/1 test file(s) failed

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
      if v < x then
        let l2 = insert(l, v) in
        match c {
          Red => Node(Black, l2, x, r)
          Black => Node(Red, l2, x, r)
        }
      else if v > x then
        let r2 = insert(r, v) in
        match c {
          Red => Node(Black, l, x, r2)
          Black => Node(Red, l, x, r2)
        }
      else Node(c, l, x, r)
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, l, _, _) =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-red-black-tree-1.almd:12:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |         let l2 = insert(l, v) in
   |         ^^^
error: Expected expression at line 37:1 (got Test 'test')
  --> /tmp/dojo-red-black-tree-1.almd:37:1
   |
37 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   | ^

2 error(s) found
Compile error for /tmp/dojo-red-black-tree-1.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-1.almd

1/1 test file(s) failed

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
      if v < x then
        let l2 = insert(l, v) in
        match c {
          Red => Node(Black, l2, x, r)
          Black => Node(Red, l2, x, r)
        }
      else if v > x then
        let r2 = insert(r, v) in
        match c {
          Red => Node(Black, l, x, r2)
          Black => Node(Red, l, x, r2)
        }
      else Node(c, l, x, r)
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, l1, x1
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-red-black-tree-2.almd:12:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |         let l2 = insert(l, v) in
   |         ^^^
error: Expected RParen at line 34:31 (got Newline '')
  --> /tmp/dojo-red-black-tree-2.almd:34:31
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
   |
34 |     Node(Red, Node(Red, l1, x1
   |                               ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:37:45
  in call to height()
  hint: Check the function name
   |
37 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:38:59
  in call to height()
  hint: Check the function name
   |
38 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:50:17
  in call to height()
  hint: Check the function name
   |
50 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:55:17
  in call to height()
  hint: Check the function name
   |
55 |   assert(height(t) < 11)
   |                 ^

6 error(s) found
Compile error for /tmp/dojo-red-black-tree-2.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-2.almd

1/1 test file(s) failed

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
      if v < x then
        let l2 = insert(l, v) in
        match c {
          Red => Node(Black, l2, x, r)
          Black => Node(Red, l2, x, r)
        }
      else if v > x then
        let r2 = insert(r, v) in
        match c {
          Red => Node(Black, l, x, r2)
          Black => Node(Red, l, x, r2)
        }
      else Node(c, l, x, r)
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(_, l, x, r) => inorder(l) + [x] + inorder(r)
  }

fn balance(t: Tree) -> Tree =
  match t {
    Node(Red, Node(Red, l1, x1
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-red-black-tree-3.almd:12:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |         let l2 = insert(l, v) in
   |         ^^^
error: Expected RParen at line 34:31 (got Newline '')
  --> /tmp/dojo-red-black-tree-3.almd:34:31
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
   |
34 |     Node(Red, Node(Red, l1, x1
   |                               ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:37:45
  in call to height()
  hint: Check the function name
   |
37 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:38:59
  in call to height()
  hint: Check the function name
   |
38 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:50:17
  in call to height()
  hint: Check the function name
   |
50 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:55:17
  in call to height()
  hint: Check the function name
   |
55 |   assert(height(t) < 11)
   |                 ^

6 error(s) found
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-3.almd

1/1 test file(s) failed

```
