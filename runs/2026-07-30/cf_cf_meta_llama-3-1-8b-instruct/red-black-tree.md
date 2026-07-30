# red-black-tree

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
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

fn balance(t: Tree) -> Tree =
  match t {
    | Node(Red, l, v, r) =>
      match l {
        | Leaf => Node(Black, l, v, r)
        | Node(Red, ll, lv, lr) => Node(Black, Node(Red, ll, lv, lr), v, r)
        | Node(Black, ll, lv, lr) => Node(Red, Node(Black, ll, lv, lr), v, r)
      }
    | Node(Black, l, v, r) => Node(Black, l, v, r)
  }

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf => Node(Red, Leaf, v, Leaf)
    | Node(c, l, x, r) =>
      if v < x then balance(Node(c, l, x, insert(r, v)))
      else if v > x then balance(Node(c, insert(l, v), x, r))
      else Node(c, l, x, r)
  }

fn inorder
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-0.almd
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:9:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Node(Red, l, v, r) =>
  |     ^
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:20:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | Leaf => Node(Red, Leaf, v, Leaf)
   |     ^
error: Expected LParen at line 27:11 (got Newline '')
  --> /tmp/dojo-red-black-tree-0.almd:27:11
   |
27 | fn inorder
   |           ^
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
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:30:45
  in call to height()
  hint: Check the function name
   |
30 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:31:59
  in call to height()
  hint: Check the function name
   |
31 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-0.almd:43:17
  in variable t
  hint: Check the variable name
   |
43 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:43:17
  in call to height()
  hint: Check the function name
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
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:48:17
  in call to height()
  hint: Check the function name
   |
48 |   assert(height(t) < 11)
   |                 ^

13 error(s) found
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

fn balance(t: Tree) -> Tree =
  match t {
    | Node(Red, l, v, r) =>
      match l {
        | Leaf => Node(Black, l, v, r)
        | Node(Red, ll, lv, lr) => Node(Black, Node(Red, ll, lv, lr), v, r)
        | Node(Black, ll, lv, lr) => Node(Red, Node(Black, ll, lv, lr), v, r)
      }
    | Node(Black, l, v, r) => Node(Black, l, v, r)
  }

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf => Node(Red, Leaf, v, Leaf)
    | Node(c, l, x, r) =>
      if v < x then balance(Node(c, l, x, insert(r, v)))
      else if v > x then balance(Node(c, insert(l, v), x, r))
      else Node(c, l, x, r)
  }

fn inorder
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-1.almd
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:9:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Node(Red, l, v, r) =>
  |     ^
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:20:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | Leaf => Node(Red, Leaf, v, Leaf)
   |     ^
error: Expected LParen at line 27:11 (got Newline '')
  --> /tmp/dojo-red-black-tree-1.almd:27:11
   |
27 | fn inorder
   |           ^
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
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:30:45
  in call to height()
  hint: Check the function name
   |
30 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:31:59
  in call to height()
  hint: Check the function name
   |
31 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-1.almd:43:17
  in variable t
  hint: Check the variable name
   |
43 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:43:17
  in call to height()
  hint: Check the function name
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
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:48:17
  in call to height()
  hint: Check the function name
   |
48 |   assert(height(t) < 11)
   |                 ^

13 error(s) found
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

fn balance(t: Tree) -> Tree =
  match t {
    | Node(Red, l, v, r) =>
      match l {
        | Leaf => Node(Black, l, v, r)
        | Node(Red, ll, lv, lr) => Node(Black, Node(Red, ll, lv, lr), v, r)
        | Node(Black, ll, lv, lr) => Node(Red, Node(Black, ll, lv, lr), v, r)
      }
    | Node(Black, l, v, r) => Node(Black, l, v, r)
  }

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf => Node(Red, Leaf, v, Leaf)
    | Node(c, l, x, r) =>
      if v < x then balance(Node(c, l, x, insert(r, v)))
      else if v > x then balance(Node(c, insert(l, v), x, r))
      else Node(c, l, x, r)
  }

fn inorder
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-2.almd
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:9:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Node(Red, l, v, r) =>
  |     ^
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:20:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | Leaf => Node(Red, Leaf, v, Leaf)
   |     ^
error: Expected LParen at line 27:11 (got Newline '')
  --> /tmp/dojo-red-black-tree-2.almd:27:11
   |
27 | fn inorder
   |           ^
error: Expected ')' to close function call opened at line 41:20
  --> /tmp/dojo-red-black-tree-2.almd:41:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
41 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
41 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 42:12
  --> /tmp/dojo-red-black-tree-2.almd:42:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
42 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
42 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 46:20
  --> /tmp/dojo-red-black-tree-2.almd:46:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
46 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
46 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
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
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:30:45
  in call to height()
  hint: Check the function name
   |
30 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:31:59
  in call to height()
  hint: Check the function name
   |
31 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-2.almd:43:17
  in variable t
  hint: Check the variable name
   |
43 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:43:17
  in call to height()
  hint: Check the function name
   |
43 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-2.almd:48:17
  in variable t
  hint: Check the variable name
   |
48 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:48:17
  in call to height()
  hint: Check the function name
   |
48 |   assert(height(t) < 11)
   |                 ^

13 error(s) found
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

fn balance(t: Tree) -> Tree =
  match t {
    | Node(Red, l, v, r) =>
      match l {
        | Leaf => Node(Black, l, v, r)
        | Node(Red, ll, lv, lr) => Node(Black, Node(Red, ll, lv, lr), v, r)
        | Node(Black, ll, lv, lr) => Node(Red, Node(Black, ll, lv, lr), v, r)
      }
    | Node(Black, l, v, r) => Node(Black, l, v, r)
  }

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf => Node(Red, Leaf, v, Leaf)
    | Node(c, l, x, r) =>
      if v < x then balance(Node(c, l, x, insert(r, v)))
      else if v > x then balance(Node(c, insert(l, v), x, r))
      else Node(c, l, x, r)
  }

fn inorder
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-3.almd
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:9:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Node(Red, l, v, r) =>
  |     ^
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:20:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | Leaf => Node(Red, Leaf, v, Leaf)
   |     ^
error: Expected LParen at line 27:11 (got Newline '')
  --> /tmp/dojo-red-black-tree-3.almd:27:11
   |
27 | fn inorder
   |           ^
error: Expected ')' to close function call opened at line 41:20
  --> /tmp/dojo-red-black-tree-3.almd:41:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
41 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                    --------------- '(' opened here
   |
41 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, v))
   |                      ^^^
error: Expected ')' to close function call opened at line 42:12
  --> /tmp/dojo-red-black-tree-3.almd:42:26
  hint: Add ')' or check for a missing delimiter inside the function call
   |
42 |   assert_eq(inorder(t), 1...31)
   |            --------------- '(' opened here
   |
42 |   assert_eq(inorder(t), 1...31)
   |                          ^^^
error: Expected ')' to close function call opened at line 46:20
  --> /tmp/dojo-red-black-tree-3.almd:46:22
  hint: Add ')' or check for a missing delimiter inside the function call
   |
46 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                    --------------- '(' opened here
   |
46 |   let t = list.fold(1...31, Leaf, (acc, v) => insert(acc, 32 - v))
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
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:30:45
  in call to height()
  hint: Check the function name
   |
30 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:31:59
  in call to height()
  hint: Check the function name
   |
31 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-3.almd:43:17
  in variable t
  hint: Check the variable name
   |
43 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:43:17
  in call to height()
  hint: Check the function name
   |
43 |   assert(height(t) < 11)
   |                 ^
error[E003]: undefined variable 't'
  --> /tmp/dojo-red-black-tree-3.almd:48:17
  in variable t
  hint: Check the variable name
   |
48 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:48:17
  in call to height()
  hint: Check the function name
   |
48 |   assert(height(t) < 11)
   |                 ^

13 error(s) found
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-3.almd

1/1 test file(s) failed

```
