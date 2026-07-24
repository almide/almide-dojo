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

fn balance(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf => Node(Black, Node(Red, Leaf, v, Leaf), v, Leaf)
    | Node(c, l, x, r) =>
      if x <= v then
        if c == Red && l != Leaf && match l { | Node(_, _, x, _) => x == v } then
          let l' = match l { | Node(_, _, _, r) => r }
          let l'' = match l' { | Node(_, _, x, _) => x }
          let r' = match r { | Node(_, _, x, _) => x }
          if l'' <= v && v <= r' then
            let l''' = Node(Black, l, l''.to_string(), Leaf)
            let r'''' = Node(Black, Leaf, r'.to_string(), r)
            Node(Black, l''' + [Node(Red, Leaf, v.to_string(), r'''')], v.to_string(), Leaf)
          else
            let l' = match l { | Node
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-0.almd
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-0.almd:9:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Leaf => Node(Black, Node(Red, Leaf, v, Leaf), v, Leaf)
  |     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:18:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
18 |             let r'''' = Node(Black, Leaf, r'.to_string(), r)
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:18:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
18 |             let r'''' = Node(Black, Leaf, r'.to_string(), r)
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:18:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
18 |             let r'''' = Node(Black, Leaf, r'.to_string(), r)
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:18:78
  in call to inorder()
  hint: Check the function name
   |
18 |             let r'''' = Node(Black, Leaf, r'.to_string(), r)
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:19:45
  in call to height()
  hint: Check the function name
   |
19 |             Node(Black, l''' + [Node(Red, Leaf, v.to_string(), r'''')], v.to_string(), Leaf)
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:20:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
20 |           else
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:20:59
  in call to height()
  hint: Check the function name
   |
20 |           else
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:22:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:23:21
  in call to inorder()
  hint: Check the function name
   |
23 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:26:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
26 | test "duplicates keep one node" {
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:27:21
  in call to inorder()
  hint: Check the function name
   |
27 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:30:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
30 | test "mixed insert order" {
   |                                                           ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:31:21
  in call to inorder()
  hint: Check the function name
   |
31 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:32:17
  in call to height()
  hint: Check the function name
   |
32 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                 ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-0.almd:35:64
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
35 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, v))
   |                                                                ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-0.almd:36:21
  in call to inorder()
  hint: Check the function name
   |
36 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-0.almd:37:17
  in call to height()
  hint: Check the function name
   |
37 |   assert(height(t) < 11)
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

fn balance(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf => Node(Black, Node(Red, Leaf, v, Leaf), v, Leaf)
    | Node(c, l, x, r) =>
      if x <= v then
        if c == Red && l != Leaf && match l { | Node(_, _, x, _) => x == v } then
          let l' = match l { | Node(_, _, _, r) => r }
          let l'' = match l' { | Node(_, _, x, _) => x }
          let r' = match r { | Node(_, _, x, _) => x }
          if l'' <= v && v <= r' then
            let l''' = Node(Black, l, l''.to_string(), Leaf)
            let r'''' = Node(Black, Leaf, r'.to_string(), r)
            Node(Black, l''' + [Node(Red, Leaf, v.to_string(), r'''')], v.to_string(), Leaf)
          else
            let l' = match l { |
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-1.almd
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:9:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Leaf => Node(Black, Node(Red, Leaf, v, Leaf), v, Leaf)
  |     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:18:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
18 |             let r'''' = Node(Black, Leaf, r'.to_string(), r)
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:18:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
18 |             let r'''' = Node(Black, Leaf, r'.to_string(), r)
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:18:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
18 |             let r'''' = Node(Black, Leaf, r'.to_string(), r)
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:18:78
  in call to inorder()
  hint: Check the function name
   |
18 |             let r'''' = Node(Black, Leaf, r'.to_string(), r)
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:19:45
  in call to height()
  hint: Check the function name
   |
19 |             Node(Black, l''' + [Node(Red, Leaf, v.to_string(), r'''')], v.to_string(), Leaf)
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:20:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
20 |           else
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:20:59
  in call to height()
  hint: Check the function name
   |
20 |           else
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:22:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:23:21
  in call to inorder()
  hint: Check the function name
   |
23 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:26:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
26 | test "duplicates keep one node" {
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:27:21
  in call to inorder()
  hint: Check the function name
   |
27 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:30:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
30 | test "mixed insert order" {
   |                                                           ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:31:21
  in call to inorder()
  hint: Check the function name
   |
31 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:32:17
  in call to height()
  hint: Check the function name
   |
32 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                 ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-1.almd:35:64
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
35 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, v))
   |                                                                ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-1.almd:36:21
  in call to inorder()
  hint: Check the function name
   |
36 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-1.almd:37:17
  in call to height()
  hint: Check the function name
   |
37 |   assert(height(t) < 11)
   |                 ^

18 error(s) found
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

fn balance(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf => Node(Black, Node(Red, Leaf, v, Leaf), v, Leaf)
    | Node(c, l, x, r) =>
      if x <= v then
        if c == Red && l != Leaf && match l { | Node(_, _, x, _) => x == v } then
          let l' = match l { | Node(_, _, _, r) => r }
          let l'' = match l' { | Node(_, _, x, _) => x }
          let r' = match r { | Node(_, _, x, _) => x }
          if l'' <= v && v <= r' then
            let l''' = Node(Black, l, l''.to_string(), Leaf)
            let r'''' = Node(Black, Leaf, r'.to_string(), r)
            Node(Black, l''' + [Node(Red, Leaf, v.to_string(), r'''')], v.to_string(), Leaf)
          else
            let l' = match l { |
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-2.almd
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-2.almd:9:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Leaf => Node(Black, Node(Red, Leaf, v, Leaf), v, Leaf)
  |     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:18:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
18 |             let r'''' = Node(Black, Leaf, r'.to_string(), r)
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:18:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
18 |             let r'''' = Node(Black, Leaf, r'.to_string(), r)
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:18:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
18 |             let r'''' = Node(Black, Leaf, r'.to_string(), r)
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:18:78
  in call to inorder()
  hint: Check the function name
   |
18 |             let r'''' = Node(Black, Leaf, r'.to_string(), r)
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:19:45
  in call to height()
  hint: Check the function name
   |
19 |             Node(Black, l''' + [Node(Red, Leaf, v.to_string(), r'''')], v.to_string(), Leaf)
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:20:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
20 |           else
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:20:59
  in call to height()
  hint: Check the function name
   |
20 |           else
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:22:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:23:21
  in call to inorder()
  hint: Check the function name
   |
23 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:26:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
26 | test "duplicates keep one node" {
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:27:21
  in call to inorder()
  hint: Check the function name
   |
27 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:30:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
30 | test "mixed insert order" {
   |                                                           ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:31:21
  in call to inorder()
  hint: Check the function name
   |
31 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:32:17
  in call to height()
  hint: Check the function name
   |
32 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                 ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-2.almd:35:64
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
35 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, v))
   |                                                                ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-2.almd:36:21
  in call to inorder()
  hint: Check the function name
   |
36 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-2.almd:37:17
  in call to height()
  hint: Check the function name
   |
37 |   assert(height(t) < 11)
   |                 ^

18 error(s) found
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

fn balance(t: Tree, v: Int) -> Tree =
  match t {
    | Leaf => Node(Black, Node(Red, Leaf, v, Leaf), v, Leaf)
    | Node(c, l, x, r) =>
      if x <= v then
        if c == Red && l != Leaf && match l { | Node(_, _, x_, _) => x_ == v } then
          let l' = match l { | Node(_, _, _, r) => r }
          let l'' = match l' { | Node(_, _, x_, _) => x_ }
          let r' = match r { | Node(_, _, x, _) => x }
          if l'' <= v && v <= r' then
            let l''' = Node(Black, l, l''.to_string(), Leaf)
            let r'''' = Node(Black, Leaf, r'.to_string(), r)
            Node(Black, l''' + [Node(Red, Leaf, v.to_string(), r'''')], v.to_string(), Leaf)
          else
            let l' = match l
```

**Diagnostic:**

```
Compiling /tmp/dojo-red-black-tree-3.almd
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:9:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Leaf => Node(Black, Node(Red, Leaf, v, Leaf), v, Leaf)
  |     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:18:70
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
18 |             let r'''' = Node(Black, Leaf, r'.to_string(), r)
   |                                                                      ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:18:74
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
18 |             let r'''' = Node(Black, Leaf, r'.to_string(), r)
   |                                                                          ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:18:78
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
18 |             let r'''' = Node(Black, Leaf, r'.to_string(), r)
   |                                                                              ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:18:78
  in call to inorder()
  hint: Check the function name
   |
18 |             let r'''' = Node(Black, Leaf, r'.to_string(), r)
   |                                                                              ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:19:45
  in call to height()
  hint: Check the function name
   |
19 |             Node(Black, l''' + [Node(Red, Leaf, v.to_string(), r'''')], v.to_string(), Leaf)
   |                                             ^^^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:20:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
20 |           else
   |                                                           ^^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:20:59
  in call to height()
  hint: Check the function name
   |
20 |           else
   |                                                           ^^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:22:68
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:23:21
  in call to inorder()
  hint: Check the function name
   |
23 | test "inorder sorted" { assert_eq(inorder(insert(insert(insert(Leaf, 5), 3), 8)), [3, 5, 8]) }
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:26:81
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
26 | test "duplicates keep one node" {
   |                                                                                 ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:27:21
  in call to inorder()
  hint: Check the function name
   |
27 |   let t = list.fold([2, 1, 2, 3, 1], Leaf, (acc, v) => insert(acc, v))
   |                     ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:30:59
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
30 | test "mixed insert order" {
   |                                                           ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:31:21
  in call to inorder()
  hint: Check the function name
   |
31 |   let t = list.fold([10, 4, 17, 1, 6, 12, 20, 4], Leaf, (acc, v) => insert(acc, v))
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:32:17
  in call to height()
  hint: Check the function name
   |
32 |   assert_eq(inorder(t), [1, 4, 6, 10, 12, 17, 20])
   |                 ^
error[E002]: undefined function 'insert'
  --> /tmp/dojo-red-black-tree-3.almd:35:64
  in call to insert()
  hint: Did you mean `assert`?
  try:
      // insert(...)  →  assert(...)
      assert(...)
   |
35 |   let t = list.fold(1..=31, Leaf, (acc, v) => insert(acc, v))
   |                                                                ^
error[E002]: undefined function 'inorder'
  --> /tmp/dojo-red-black-tree-3.almd:36:21
  in call to inorder()
  hint: Check the function name
   |
36 |   assert_eq(inorder(t), 1..=31)
   |                     ^
error[E002]: undefined function 'height'
  --> /tmp/dojo-red-black-tree-3.almd:37:17
  in call to height()
  hint: Check the function name
   |
37 |   assert(height(t) < 11)
   |                 ^

18 error(s) found
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed
FAILED: /tmp/dojo-red-black-tree-3.almd

1/1 test file(s) failed

```
