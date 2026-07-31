# red-black-tree

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn insert(t: Tree, v: Int) -> Tree
  = match t {
    Leaf =>
      Node(Red, Leaf, v, Leaf)
    Node(c, l, k, r) =>
      if k == v then t
      else if v < k then balance(Node(Red, insert(l, v), k, r), c)
      else balance(Node(Red, l, k, insert(r, v)), c)
  }

fn inorder(t: Tree) -> List[Int]
  = match t {
    Leaf => List()
    Node(c, l, k, r) => inorder(l) + [k] + inorder(r)
  }

fn height(t: Tree) -> Int
  = match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + max(height(l), height(r))
  }

fn balance(t: Tree, c: Color) -> Tree
  = match t {
    Node(Red, Node(Red, l1, k1, l2), k, r) =>
      Node(Red, Node(Black, l1, k1, l2), k, r)
    Node(Red, l, k, Node(Red, r
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-0.almd:2:3
  |
2 |   = match t {
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-0.almd:12:3
   |
12 |   = match t {
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 18:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-0.almd:18:3
   |
18 |   = match t {
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 24:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-0.almd:24:3
   |
24 |   = match t {
   |   ^
error: Expected ')' to close function call opened at line 41:20
  --> /tmp/dojo-red-black-tree-0.almd:41:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
41 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
41 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 42:12
  --> /tmp/dojo-red-black-tree-0.almd:42:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
42 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
42 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 46:20
  --> /tmp/dojo-red-black-tree-0.almd:46:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
46 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
46 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 47:12
  --> /tmp/dojo-red-black-tree-0.almd:47:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
47 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
47 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error[E005]: argument 't' expects Tree but got Leaf
  --> /tmp/dojo-red-black-tree-0.almd:29:70
  in call to insert()
  hint: 'Tree' is not a known type. To use it as a type parameter, declare it: fn insert[Tree](...)
   |
 1 | fn insert(t: Tree, v: Int) -> Tree
   | ------------------------ fn insert() defined here
...
29 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E005]: argument 't' expects Tree but got Leaf
  --> /tmp/dojo-red-black-tree-0.almd:30:45
  in call to height()
  hint: 'Tree' is not a known type. To use it as a type parameter, declare it: fn height[Tree](...)
   |
17 | fn height(t: Tree) -> Int
   | ------------------------ fn height() defined here
...
30 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E005]: argument 't' expects Tree but got Leaf
  --> /tmp/dojo-red-black-tree-0.almd:31:59
  in call to insert()
  hint: 'Tree' is not a known type. To use it as a type parameter, declare it: fn insert[Tree](...)
   |
 1 | fn insert(t: Tree, v: Int) -> Tree
   | ------------------------ fn insert() defined here
...
31 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E005]: argument 'f' expects fn(Leaf, Int) -> Leaf but got fn(Tree, Int) -> Tree
  --> /tmp/dojo-red-black-tree-0.almd:33:68
  in call to list.fold()
  hint: Fix the argument type
   |
33 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E005]: argument 't' expects Tree but got Leaf
  --> /tmp/dojo-red-black-tree-0.almd:34:21
  in call to inorder()
  hint: 'Tree' is not a known type. To use it as a type parameter, declare it: fn inorder[Tree](...)
   |
11 | fn inorder(t: Tree) -> List[Int]
   | ------------------------- fn inorder() defined here
...
34 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E005]: argument 'f' expects fn(Leaf, Int) -> Leaf but got fn(Tree, Int) -> Tree
  --> /tmp/dojo-red-black-tree-0.almd:37:81
  in call to list.fold()
  hint: Fix the argument type
   |
37 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E005]: argument 't' expects Tree but got Leaf
  --> /tmp/dojo-red-black-tree-0.almd:38:21
  in call to inorder()
  hint: 'Tree' is not a known type. To use it as a type parameter, declare it: fn inorder[Tree](...)
   |
11 | fn inorder(t: Tree) -> List[Int]
   | ------------------------- fn inorder() defined here
...
38 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-0.almd:43:17
  in variable t
  hint: Check the variable name
   |
43 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-0.almd:48:17
  in variable t
  hint: Check the variable name
   |
48 |   assert(height(t) < 11)
   |                 ^
error[E001]: type mismatch in call to insert(): expected Tree but got Leaf
  --> /tmp/dojo-red-black-tree-0.almd:29:70
  in call to insert()
  hint: Fix the expression type or change the expected type
   |
29 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E001]: type mismatch in call to height(): expected Tree but got Leaf
  --> /tmp/dojo-red-black-tree-0.almd:30:45
  in call to height()
  hint: Fix the expression type or change the expected type
   |
30 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E001]: type mismatch in call to insert(): expected Tree but got Leaf
  --> /tmp/dojo-red-black-tree-0.almd:31:59
  in call to insert()
  hint: Fix the expression type or change the expected type
   |
31 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E001]: type mismatch in call to list.fold(): expected fn(Leaf, Int) -> Leaf but got fn(Tree, Int) -> Tree
  --> /tmp/dojo-red-black-tree-0.almd:33:68
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
33 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E001]: type mismatch in call to inorder(): expected Tree but got Leaf
  --> /tmp/dojo-red-black-tree-0.almd:34:21
  in call to inorder()
  hint: Fix the expression type or change the expected type
   |
34 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E001]: type mismatch in call to list.fold(): expected fn(Leaf, Int) -> Leaf but got fn(Tree, Int) -> Tree
  --> /tmp/dojo-red-black-tree-0.almd:37:81
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
37 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E001]: type mismatch in call to inorder(): expected Tree but got Leaf
  --> /tmp/dojo-red-black-tree-0.almd:38:21
  in call to inorder()
  hint: Fix the expression type or change the expected type
   |
38 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^

24 error(s) found
Compile error for /tmp/dojo-red-black-tree-0.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn insert(t: Tree, v: Int) -> Tree
  = match t {
    Leaf =>
      Node(Red, Leaf, v, Leaf)
    Node(c, l, k, r) =>
      if k == v then t
      else if v < k then balance(Node(Red, insert(l, v), k, r), c)
      else balance(Node(Red, l, k, insert(r, v)), c)
  }

fn inorder(t: Tree) -> List[Int]
  = match t {
    Leaf => List()
    Node(_, l, k, r) => inorder(l) + [k] + inorder(r)
  }

fn height(t: Tree) -> Int
  = match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + max(height(l), height(r))
  }

fn balance(t: Tree, c: Color) -> Tree
  = match t {
    Node(Red, Node(Red, l1, k1, l2), k, r) =>
      Node(Red, Node(Black, l1, k1, l2), k, r)
    Node(Red, l, k, Node(Red, r1
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-1.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-1.almd:2:3
  |
2 |   = match t {
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-1.almd:12:3
   |
12 |   = match t {
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 18:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-1.almd:18:3
   |
18 |   = match t {
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 24:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-1.almd:24:3
   |
24 |   = match t {
   |   ^
error: Expected ')' to close function call opened at line 41:20
  --> /tmp/dojo-red-black-tree-1.almd:41:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
41 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
41 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 42:12
  --> /tmp/dojo-red-black-tree-1.almd:42:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
42 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
42 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 46:20
  --> /tmp/dojo-red-black-tree-1.almd:46:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
46 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
46 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 47:12
  --> /tmp/dojo-red-black-tree-1.almd:47:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
47 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
47 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error[E005]: argument 't' expects Tree but got Leaf
  --> /tmp/dojo-red-black-tree-1.almd:29:70
  in call to insert()
  hint: 'Tree' is not a known type. To use it as a type parameter, declare it: fn insert[Tree](...)
   |
 1 | fn insert(t: Tree, v: Int) -> Tree
   | ------------------------ fn insert() defined here
...
29 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E005]: argument 't' expects Tree but got Leaf
  --> /tmp/dojo-red-black-tree-1.almd:30:45
  in call to height()
  hint: 'Tree' is not a known type. To use it as a type parameter, declare it: fn height[Tree](...)
   |
17 | fn height(t: Tree) -> Int
   | ------------------------ fn height() defined here
...
30 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E005]: argument 't' expects Tree but got Leaf
  --> /tmp/dojo-red-black-tree-1.almd:31:59
  in call to insert()
  hint: 'Tree' is not a known type. To use it as a type parameter, declare it: fn insert[Tree](...)
   |
 1 | fn insert(t: Tree, v: Int) -> Tree
   | ------------------------ fn insert() defined here
...
31 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E005]: argument 'f' expects fn(Leaf, Int) -> Leaf but got fn(Tree, Int) -> Tree
  --> /tmp/dojo-red-black-tree-1.almd:33:68
  in call to list.fold()
  hint: Fix the argument type
   |
33 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E005]: argument 't' expects Tree but got Leaf
  --> /tmp/dojo-red-black-tree-1.almd:34:21
  in call to inorder()
  hint: 'Tree' is not a known type. To use it as a type parameter, declare it: fn inorder[Tree](...)
   |
11 | fn inorder(t: Tree) -> List[Int]
   | ------------------------- fn inorder() defined here
...
34 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E005]: argument 'f' expects fn(Leaf, Int) -> Leaf but got fn(Tree, Int) -> Tree
  --> /tmp/dojo-red-black-tree-1.almd:37:81
  in call to list.fold()
  hint: Fix the argument type
   |
37 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E005]: argument 't' expects Tree but got Leaf
  --> /tmp/dojo-red-black-tree-1.almd:38:21
  in call to inorder()
  hint: 'Tree' is not a known type. To use it as a type parameter, declare it: fn inorder[Tree](...)
   |
11 | fn inorder(t: Tree) -> List[Int]
   | ------------------------- fn inorder() defined here
...
38 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-1.almd:43:17
  in variable t
  hint: Check the variable name
   |
43 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-1.almd:48:17
  in variable t
  hint: Check the variable name
   |
48 |   assert(height(t) < 11)
   |                 ^
error[E001]: type mismatch in call to insert(): expected Tree but got Leaf
  --> /tmp/dojo-red-black-tree-1.almd:29:70
  in call to insert()
  hint: Fix the expression type or change the expected type
   |
29 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E001]: type mismatch in call to height(): expected Tree but got Leaf
  --> /tmp/dojo-red-black-tree-1.almd:30:45
  in call to height()
  hint: Fix the expression type or change the expected type
   |
30 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E001]: type mismatch in call to insert(): expected Tree but got Leaf
  --> /tmp/dojo-red-black-tree-1.almd:31:59
  in call to insert()
  hint: Fix the expression type or change the expected type
   |
31 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E001]: type mismatch in call to list.fold(): expected fn(Leaf, Int) -> Leaf but got fn(Tree, Int) -> Tree
  --> /tmp/dojo-red-black-tree-1.almd:33:68
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
33 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E001]: type mismatch in call to inorder(): expected Tree but got Leaf
  --> /tmp/dojo-red-black-tree-1.almd:34:21
  in call to inorder()
  hint: Fix the expression type or change the expected type
   |
34 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E001]: type mismatch in call to list.fold(): expected fn(Leaf, Int) -> Leaf but got fn(Tree, Int) -> Tree
  --> /tmp/dojo-red-black-tree-1.almd:37:81
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
37 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E001]: type mismatch in call to inorder(): expected Tree but got Leaf
  --> /tmp/dojo-red-black-tree-1.almd:38:21
  in call to inorder()
  hint: Fix the expression type or change the expected type
   |
38 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^

24 error(s) found
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

fn insert(t: Tree, v: Int) -> Tree
  = match t {
    Leaf => 
      Node(Red, Leaf, v, Leaf)
    Node(c, l, k, r) => 
      if k == v then t
      else if v < k then balance(Node(Red, insert(l, v), k, r), c)
      else balance(Node(Red, l, k, insert(r, v)), c)
  }

fn inorder(t: Tree) -> List[Int]
  = match t {
    Leaf => List()
    Node(_, l, k, r) => inorder(l) + [k] + inorder(r)
  }

fn height(t: Tree) -> Int
  = match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + max(height(l), height(r))
  }

fn balance(t: Tree, c: Color) -> Tree
  = match t {
    Node(Red, Node(Red, l1, k1, l2), k, r) => 
      Node(Red, Node(
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-2.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-2.almd:8:3
  |
8 |   = match t {
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 18:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-2.almd:18:3
   |
18 |   = match t {
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 24:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-2.almd:24:3
   |
24 |   = match t {
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 30:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-2.almd:30:3
   |
30 |   = match t {
   |   ^
error: Expected ')' to close function call opened at line 46:20
  --> /tmp/dojo-red-black-tree-2.almd:46:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
46 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
46 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 47:12
  --> /tmp/dojo-red-black-tree-2.almd:47:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
47 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
47 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 51:20
  --> /tmp/dojo-red-black-tree-2.almd:51:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
51 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
51 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 52:12
  --> /tmp/dojo-red-black-tree-2.almd:52:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
52 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
52 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-2.almd:48:17
  in variable t
  hint: Check the variable name
   |
48 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-2.almd:53:17
  in variable t
  hint: Check the variable name
   |
53 |   assert(height(t) < 11)
   |                 ^

10 error(s) found
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

fn insert(t: Tree, v: Int) -> Tree
  = match t {
    Leaf => 
      Node(Red, Leaf, v, Leaf)
    Node(c, l, k, r) => 
      if k == v then t
      else if v < k then balance(Node(Red, insert(l, v), k, r), c)
      else balance(Node(Red, l, k, insert(r, v)), c)
  }

fn inorder(t: Tree) -> List[Int]
  = match t {
    Leaf => List()
    Node(_, l, k, r) => inorder(l) + [k] + inorder(r)
  }

fn height(t: Tree) -> Int
  = match t {
    Leaf => 0
    Node(_, l, _, r) => 1 + max(height(l), height(r))
  }

fn balance(t: Tree, c: Color) -> Tree
  = match t {
    Node(Red, Node(Red, l1, k1, l2), k, r) => 
      Node(Black, Node(R
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-3.almd:8:3
  |
8 |   = match t {
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 18:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-3.almd:18:3
   |
18 |   = match t {
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 24:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-3.almd:24:3
   |
24 |   = match t {
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 30:3 (got Eq '=')
  --> /tmp/dojo-red-black-tree-3.almd:30:3
   |
30 |   = match t {
   |   ^
error: Expected ')' to close function call opened at line 46:20
  --> /tmp/dojo-red-black-tree-3.almd:46:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
46 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
46 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 47:12
  --> /tmp/dojo-red-black-tree-3.almd:47:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
47 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
47 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 51:20
  --> /tmp/dojo-red-black-tree-3.almd:51:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
51 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
51 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                      ^^^
error: Expected ')' to close function call opened at line 52:12
  --> /tmp/dojo-red-black-tree-3.almd:52:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
52 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
52 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-3.almd:48:17
  in variable t
  hint: Check the variable name
   |
48 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-3.almd:53:17
  in variable t
  hint: Check the variable name
   |
53 |   assert(height(t) < 11)
   |                 ^

10 error(s) found
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-3.almd

1/1 test file(s) failed

```
