# red-black-tree

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
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

fn balance(t: Tree, v: Int, r: Tree) -> Tree =
  match (t, v, r) with
    (Node(Red, Node(Red, a, x, b), y, c), z, d) when x < y && y < z =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    (Node(Red, Node(Red, a, x, b), y, c), z, d) when x < z && z < y =>
      Node(Red, Node(Black, a, x, Node(Black, b, z, c)), y, d)
    (Node(Red, a, x, Node(Red, b, y, c)), z, d) when x < y && y < z =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    (Node(Red, a, x, Node(Red, b, y,
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-0.almd
error: Expected LBrace at line 8:19 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-0.almd:8:19
  |
8 |   match (t, v, r) with
  |                   ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:17:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
17 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:17:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
17 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:17:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
17 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:17:78
  in call to inorder()
  hint: Check the function name
   |
17 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:18:45
  in call to height()
  hint: Check the function name
   |
18 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:19:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
19 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:19:59
  in call to height()
  hint: Check the function name
   |
19 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:21:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
21 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                                                                    ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:22:21
  in call to inorder()
  hint: Check the function name
   |
22 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:25:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
25 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:26:21
  in call to inorder()
  hint: Check the function name
   |
26 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:29:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
29 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, v))
   |                                                           ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:30:21
  in call to inorder()
  hint: Check the function name
   |
30 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:31:17
  in call to height()
  hint: Check the function name
   |
31 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:34:64
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
34 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, 32 - v))
   |                                                                ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:35:21
  in call to inorder()
  hint: Check the function name
   |
35 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:36:17
  in call to height()
  hint: Check the function name
   |
36 |   assert(height(t) < 11)
   |                 ^

18 error(s) found
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
  let rec insert_impl = (t: Tree, v: Int) -> Tree =
    match t with
      Leaf -> Node(Red, Leaf, v, Leaf)
      Node(c, l, x, r) ->
        if v < x then
          balance(insert_impl(l, v), x, r)
        else if v > x then
          balance(l, x, insert_impl(r, v))
        else
          t
  let result = insert_impl(t, v)
  match result with
    Node(_, l, x, r) -> Node(Black, l, x, r)
    _ -> result

fn balance(t: Tree, v: Int, r: Tree) -> Tree =
  match (t, v, r) with
    (Node(Red, Node(Red, a, x, b), y, c), z, d) when x < y && y < z ->
      Node(Red, Node(Black, a, x, b), y, Node(Black
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-1.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-red-black-tree-1.almd:8:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
8 |   let rec insert_impl = (t: Tree, v: Int) -> Tree =
  |       ^^^
error: Expected LBrace at line 9:13 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-1.almd:9:13
  |
9 |     match t with
  |             ^
error: Expected expression at line 10:12 (got Arrow '->')
  --> /tmp/dojo-red-black-tree-1.almd:10:12
   |
10 |       Leaf -> Node(Red, Leaf, v, Leaf)
   |            ^
error: Expected expression at line 11:24 (got Arrow '->')
  --> /tmp/dojo-red-black-tree-1.almd:11:24
   |
11 |       Node(c, l, x, r) ->
   |                        ^
error: Expected LBrace at line 19:16 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-1.almd:19:16
   |
19 |   match result with
   |                ^
error: Expected expression at line 20:22 (got Arrow '->')
  --> /tmp/dojo-red-black-tree-1.almd:20:22
   |
20 |     Node(_, l, x, r) -> Node(Black, l, x, r)
   |                      ^
error: Expected LBrace at line 24:19 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-1.almd:24:19
   |
24 |   match (t, v, r) with
   |                   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-red-black-tree-1.almd:11:12
  in variable c
  hint: Did you mean `v`?
  try:
      // c  →  v
      v
   |
11 |       Node(c, l, x, r) ->
   |            ^
error[E003]: undefined variable 'l'
  --> /tmp/dojo-red-black-tree-1.almd:11:15
  in variable l
  hint: Did you mean `v`?
  try:
      // l  →  v
      v
   |
11 |       Node(c, l, x, r) ->
   |               ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-red-black-tree-1.almd:11:18
  in variable x
  hint: Did you mean `v`?
  try:
      // x  →  v
      v
   |
11 |       Node(c, l, x, r) ->
   |                  ^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-1.almd:11:21
  in variable r
  hint: Did you mean `v`?
  try:
      // r  →  v
      v
   |
11 |       Node(c, l, x, r) ->
   |                     ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-red-black-tree-1.almd:12:16
  in variable x
  hint: Did you mean `v`?
  try:
      // x  →  v
      v
   |
12 |         if v < x then
   |                ^
error[E003]: undefined variable 'l'
  --> /tmp/dojo-red-black-tree-1.almd:13:31
  in variable l
  hint: Did you mean `v`?
  try:
      // l  →  v
      v
   |
13 |           balance(insert_impl(l, v), x, r)
   |                               ^
error[E002]: undefined function 'insert_impl'
  --> /tmp/dojo-red-black-tree-1.almd:13:34
  in call to insert_impl()
  hint: Check the function name
   |
13 |           balance(insert_impl(l, v), x, r)
   |                                  ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-red-black-tree-1.almd:13:38
  in variable x
  hint: Did you mean `v`?
  try:
      // x  →  v
      v
   |
13 |           balance(insert_impl(l, v), x, r)
   |                                      ^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-1.almd:13:41
  in variable r
  hint: Did you mean `v`?
  try:
      // r  →  v
      v
   |
13 |           balance(insert_impl(l, v), x, r)
   |                                         ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-red-black-tree-1.almd:14:21
  in variable x
  hint: Did you mean `v`?
  try:
      // x  →  v
      v
   |
14 |         else if v > x then
   |                     ^
error[E003]: undefined variable 'l'
  --> /tmp/dojo-red-black-tree-1.almd:15:19
  in variable l
  hint: Did you mean `v`?
  try:
      // l  →  v
      v
   |
15 |           balance(l, x, insert_impl(r, v))
   |                   ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-red-black-tree-1.almd:15:22
  in variable x
  hint: Did you mean `v`?
  try:
      // x  →  v
      v
   |
15 |           balance(l, x, insert_impl(r, v))
   |                      ^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-1.almd:15:37
  in variable r
  hint: Did you mean `v`?
  try:
      // r  →  v
      v
   |
15 |           balance(l, x, insert_impl(r, v))
   |                                     ^
error[E002]: undefined function 'insert_impl'
  --> /tmp/dojo-red-black-tree-1.almd:15:40
  in call to insert_impl()
  hint: Check the function name
   |
15 |           balance(l, x, insert_impl(r, v))
   |                                        ^
error[E002]: undefined function 'insert_impl'
  --> /tmp/dojo-red-black-tree-1.almd:18:31
  in call to insert_impl()
  hint: Check the function name
   |
18 |   let result = insert_impl(t, v)
   |                               ^
error[E003]: undefined variable 'l'
  --> /tmp/dojo-red-black-tree-1.almd:20:13
  in variable l
  hint: Did you mean `v`?
  try:
      // l  →  v
      v
   |
20 |     Node(_, l, x, r) -> Node(Black, l, x, r)
   |             ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-red-black-tree-1.almd:20:16
  in variable x
  hint: Did you mean `v`?
  try:
      // x  →  v
      v
   |
20 |     Node(_, l, x, r) -> Node(Black, l, x, r)
   |                ^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-1.almd:20:19
  in variable r
  hint: Did you mean `v`?
  try:
      // r  →  v
      v
   |
20 |     Node(_, l, x, r) -> Node(Black, l, x, r)
   |                   ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:28:78
  in call to inorder()
  hint: Check the function name
   |
28 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:29:45
  in call to height()
  hint: Check the function name
   |
29 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:30:59
  in call to height()
  hint: Check the function name
   |
30 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:33:21
  in call to inorder()
  hint: Check the function name
   |
33 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:37:21
  in call to inorder()
  hint: Check the function name
   |
37 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:41:21
  in call to inorder()
  hint: Check the function name
   |
41 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:42:17
  in call to height()
  hint: Check the function name
   |
42 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:46:21
  in call to inorder()
  hint: Check the function name
   |
46 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:47:17
  in call to height()
  hint: Check the function name
   |
47 |   assert(height(t) < 11)
   |                 ^
error[E001]: type mismatch in fn 'insert': expected Tree but got Unit
  --> /tmp/dojo-red-black-tree-1.almd:20:19
  in fn 'insert'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Tree:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Tree
   |
20 |     Node(_, l, x, r) -> Node(Black, l, x, r)
   |                   ^

35 error(s) found
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
  fn insert_impl(t: Tree, v: Int) -> Tree =
    match t with
      Leaf -> Node(Red, Leaf, v, Leaf)
      Node(c, l, x, r) ->
        if v < x then
          balance(insert_impl(l, v), x, r)
        else if v > x then
          balance(l, x, insert_impl(r, v))
        else
          t
  let result = insert_impl(t, v)
  match result with
    Node(_, l, x, r) -> Node(Black, l, x, r)
    Leaf -> Leaf

fn balance(t: Tree, v: Int, r: Tree) -> Tree =
  match (t, v, r) with
    (Node(Red, Node(Red, a, x, b), y, c), z, d) when x < y && y < z ->
      Node(Red, Node(Black, a, x, b), y, Node(Black, c,
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-2.almd
error: Expected expression at line 8:3 (got Fn 'fn')
  --> /tmp/dojo-red-black-tree-2.almd:8:3
  |
8 |   fn insert_impl(t: Tree, v: Int) -> Tree =
  |   ^
error: Expected LBrace at line 9:13 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-2.almd:9:13
  |
9 |     match t with
  |             ^
error: Expected LBrace at line 24:19 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-2.almd:24:19
   |
24 |   match (t, v, r) with
   |                   ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:28:78
  in call to inorder()
  hint: Check the function name
   |
28 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:29:45
  in call to height()
  hint: Check the function name
   |
29 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:30:59
  in call to height()
  hint: Check the function name
   |
30 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:33:21
  in call to inorder()
  hint: Check the function name
   |
33 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:37:21
  in call to inorder()
  hint: Check the function name
   |
37 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:41:21
  in call to inorder()
  hint: Check the function name
   |
41 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:42:17
  in call to height()
  hint: Check the function name
   |
42 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:46:21
  in call to inorder()
  hint: Check the function name
   |
46 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:47:17
  in call to height()
  hint: Check the function name
   |
47 |   assert(height(t) < 11)
   |                 ^

12 error(s) found
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
  let rec insert_impl(t: Tree, v: Int) -> Tree =
    match t with
      Leaf -> Node(Red, Leaf, v, Leaf)
      Node(c, l, x, r) ->
        if v < x then
          balance(insert_impl(l, v), x, r)
        else if v > x then
          balance(l, x, insert_impl(r, v))
        else
          t
  let result = insert_impl(t, v)
  match result with
    Node(_, l, x, r) -> Node(Black, l, x, r)
    Leaf -> Leaf

fn balance(t: Tree, v: Int, r: Tree) -> Tree =
  match (t, v, r) with
    (Node(Red, Node(Red, a, x, b), y, c), z, d) when x < y && y < z ->
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-3.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-red-black-tree-3.almd:8:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
8 |   let rec insert_impl(t: Tree, v: Int) -> Tree =
  |       ^^^
error: Expected LBrace at line 9:13 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-3.almd:9:13
  |
9 |     match t with
  |             ^
error: Expected expression at line 10:12 (got Arrow '->')
  --> /tmp/dojo-red-black-tree-3.almd:10:12
   |
10 |       Leaf -> Node(Red, Leaf, v, Leaf)
   |            ^
error: Expected expression at line 11:24 (got Arrow '->')
  --> /tmp/dojo-red-black-tree-3.almd:11:24
   |
11 |       Node(c, l, x, r) ->
   |                        ^
error: Expected LBrace at line 19:16 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-3.almd:19:16
   |
19 |   match result with
   |                ^
error: Expected expression at line 20:22 (got Arrow '->')
  --> /tmp/dojo-red-black-tree-3.almd:20:22
   |
20 |     Node(_, l, x, r) -> Node(Black, l, x, r)
   |                      ^
error: Expected expression at line 21:10 (got Arrow '->')
  --> /tmp/dojo-red-black-tree-3.almd:21:10
   |
21 |     Leaf -> Leaf
   |          ^
error: Expected LBrace at line 24:19 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-3.almd:24:19
   |
24 |   match (t, v, r) with
   |                   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-red-black-tree-3.almd:11:12
  in variable c
  hint: Did you mean `t`?
  try:
      // c  →  t
      t
   |
11 |       Node(c, l, x, r) ->
   |            ^
error[E003]: undefined variable 'l'
  --> /tmp/dojo-red-black-tree-3.almd:11:15
  in variable l
  hint: Did you mean `t`?
  try:
      // l  →  t
      t
   |
11 |       Node(c, l, x, r) ->
   |               ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-red-black-tree-3.almd:11:18
  in variable x
  hint: Did you mean `t`?
  try:
      // x  →  t
      t
   |
11 |       Node(c, l, x, r) ->
   |                  ^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-3.almd:11:21
  in variable r
  hint: Did you mean `t`?
  try:
      // r  →  t
      t
   |
11 |       Node(c, l, x, r) ->
   |                     ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-red-black-tree-3.almd:12:16
  in variable x
  hint: Did you mean `t`?
  try:
      // x  →  t
      t
   |
12 |         if v < x then
   |                ^
error[E003]: undefined variable 'l'
  --> /tmp/dojo-red-black-tree-3.almd:13:31
  in variable l
  hint: Did you mean `t`?
  try:
      // l  →  t
      t
   |
13 |           balance(insert_impl(l, v), x, r)
   |                               ^
error[E002]: undefined function 'insert_impl'
  --> /tmp/dojo-red-black-tree-3.almd:13:34
  in call to insert_impl()
  hint: Check the function name
   |
13 |           balance(insert_impl(l, v), x, r)
   |                                  ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-red-black-tree-3.almd:13:38
  in variable x
  hint: Did you mean `t`?
  try:
      // x  →  t
      t
   |
13 |           balance(insert_impl(l, v), x, r)
   |                                      ^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-3.almd:13:41
  in variable r
  hint: Did you mean `t`?
  try:
      // r  →  t
      t
   |
13 |           balance(insert_impl(l, v), x, r)
   |                                         ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-red-black-tree-3.almd:14:21
  in variable x
  hint: Did you mean `t`?
  try:
      // x  →  t
      t
   |
14 |         else if v > x then
   |                     ^
error[E003]: undefined variable 'l'
  --> /tmp/dojo-red-black-tree-3.almd:15:19
  in variable l
  hint: Did you mean `t`?
  try:
      // l  →  t
      t
   |
15 |           balance(l, x, insert_impl(r, v))
   |                   ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-red-black-tree-3.almd:15:22
  in variable x
  hint: Did you mean `t`?
  try:
      // x  →  t
      t
   |
15 |           balance(l, x, insert_impl(r, v))
   |                      ^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-3.almd:15:37
  in variable r
  hint: Did you mean `t`?
  try:
      // r  →  t
      t
   |
15 |           balance(l, x, insert_impl(r, v))
   |                                     ^
error[E002]: undefined function 'insert_impl'
  --> /tmp/dojo-red-black-tree-3.almd:15:40
  in call to insert_impl()
  hint: Check the function name
   |
15 |           balance(l, x, insert_impl(r, v))
   |                                        ^
error[E002]: undefined function 'insert_impl'
  --> /tmp/dojo-red-black-tree-3.almd:18:31
  in call to insert_impl()
  hint: Check the function name
   |
18 |   let result = insert_impl(t, v)
   |                               ^
error[E003]: undefined variable 'l'
  --> /tmp/dojo-red-black-tree-3.almd:20:13
  in variable l
  hint: Did you mean `t`?
  try:
      // l  →  t
      t
   |
20 |     Node(_, l, x, r) -> Node(Black, l, x, r)
   |             ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-red-black-tree-3.almd:20:16
  in variable x
  hint: Did you mean `t`?
  try:
      // x  →  t
      t
   |
20 |     Node(_, l, x, r) -> Node(Black, l, x, r)
   |                ^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-3.almd:20:19
  in variable r
  hint: Did you mean `t`?
  try:
      // r  →  t
      t
   |
20 |     Node(_, l, x, r) -> Node(Black, l, x, r)
   |                   ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:28:78
  in call to inorder()
  hint: Check the function name
   |
28 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:29:45
  in call to height()
  hint: Check the function name
   |
29 | test "empty tree height" { assert_eq(height(Leaf), 0) }
   |                                             ^^^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:30:59
  in call to height()
  hint: Check the function name
   |
30 | test "single node height" { assert_eq(height(insert(Leaf, 42)), 1) }
   |                                                           ^^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:33:21
  in call to inorder()
  hint: Check the function name
   |
33 |   assert_eq(inorder(t), [1, 2, 3])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:37:21
  in call to inorder()
  hint: Check the function name
   |
37 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                     ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:41:21
  in call to inorder()
  hint: Check the function name
   |
41 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:42:17
  in call to height()
  hint: Check the function name
   |
42 |   assert(height(t) < 11)
   |                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:46:21
  in call to inorder()
  hint: Check the function name
   |
46 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:47:17
  in call to height()
  hint: Check the function name
   |
47 |   assert(height(t) < 11)
   |                 ^
error[E001]: type mismatch in fn 'insert': expected Tree but got Unit
  --> /tmp/dojo-red-black-tree-3.almd:21:5
  in fn 'insert'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Tree:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Tree
   |
21 |     Leaf -> Leaf
   |     ^^^^

36 error(s) found
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-3.almd

1/1 test file(s) failed

```
