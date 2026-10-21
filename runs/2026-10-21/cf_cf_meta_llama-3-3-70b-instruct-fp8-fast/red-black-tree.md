# red-black-tree

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
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

fn balance(color: Color, left: Tree, value: Int, right: Tree) -> Tree =
  match (color, left, right) with
    | (Black, Node(Red, Node(Red, a, x, b), y, c), d) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, d))
    | (Black, Node(Red, a, x, Node(Red, b, y, c)), z) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, z))
    | (Black, d, Node(Red, Node(Red, a, x, b), y, c)) =>
      Node(Red, Node(Black, d, value, a), x, Node(Black, b, y, c))
    | (Black, d, Node(Red, a, x, Node(Red, b, y, c))) =>
      Node(Red, Node(Black, d, value, a), x, Node(Black, b, y, c))
    | _ => Node(color, left, value, right)

fn insert(t: Tree, v: Int) -> Tree =
  let ins = (t: Tree, v: Int) =>
    match t with
      | Leaf => Node(Red, Leaf, v, Leaf)
      | Node(color, left, value, right) =>
        if v < value then
          balance(color, ins(left, v), value, right)
        else if v > value then
          balance(color, left, value, ins(right, v))
        else t
  in
  match ins(t, v) with
    | Node(_, left, value, right) => Node(Black, left, value, right)
    | Leaf => Leaf

fn inorder(t: Tree) -> List[Int] =
  match t with
    | Leaf => []
    | Node(_, left, value, right) =>
      inorder(left) + [value] + inorder(right)

fn height(t: Tree) -> Int =
  match t with
    | Leaf => 0
    | Node(_, left, _, right) =>
      1 + int.max(height(left), height(right))
```

**Diagnostic:**

```
error: Expected LBrace at line 8:30 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-0.almd:8:30
  here: match (color, left, right) with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   match (color, left, right) with
  |                              ^
error: Expected LBrace at line 21:13 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-0.almd:21:13
  here: match t with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |     match t with
   |             ^
error: Expected expression at line 29:3 (got In 'in')
  --> /tmp/dojo-red-black-tree-0.almd:29:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
29 |   in
   |   ^
error: Expected LBrace at line 30:19 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-0.almd:30:19
  here: match ins(t, v) with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
30 |   match ins(t, v) with
   |                   ^
error: Expected LBrace at line 35:11 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-0.almd:35:11
  here: match t with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
35 |   match t with
   |           ^
error: Expected LBrace at line 41:11 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-0.almd:41:11
  here: match t with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
41 |   match t with
   |           ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-0.almd:24:16
  in variable value
  here: if v < value then
  hint: Did you mean `value.int`?
  try:
      value.int
   |
24 |         if v < value then
   |                ^^^^^
error[E003]: undefined variable 'color'
  --> /tmp/dojo-red-black-tree-0.almd:25:19
  in variable color
  here: balance(color, ins(left, v), value, right)
  hint: Check the variable name
   |
25 |           balance(color, ins(left, v), value, right)
   |                   ^^^^^
error[E003]: undefined variable 'left'
  --> /tmp/dojo-red-black-tree-0.almd:25:30
  in variable left
  here: balance(color, ins(left, v), value, right)
  hint: Check the variable name
   |
25 |           balance(color, ins(left, v), value, right)
   |                              ^^^^
error[E002]: undefined function 'ins'
  --> /tmp/dojo-red-black-tree-0.almd:25:26
  in call to ins()
  here: balance(color, ins(left, v), value, right)
  hint: Did you mean `insert`?
  try:
      insert
   |
25 |           balance(color, ins(left, v), value, right)
   |                          ^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-0.almd:25:40
  in variable value
  here: balance(color, ins(left, v), value, right)
  hint: Did you mean `value.int`?
  try:
      value.int
   |
25 |           balance(color, ins(left, v), value, right)
   |                                        ^^^^^
error[E003]: undefined variable 'right'
  --> /tmp/dojo-red-black-tree-0.almd:25:47
  in variable right
  here: balance(color, ins(left, v), value, right)
  hint: Did you mean `height`?
  try:
      height
   |
25 |           balance(color, ins(left, v), value, right)
   |                                               ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-0.almd:26:21
  in variable value
  here: else if v > value then
  hint: Did you mean `value.int`?
  try:
      value.int
   |
26 |         else if v > value then
   |                     ^^^^^
error[E003]: undefined variable 'color'
  --> /tmp/dojo-red-black-tree-0.almd:27:19
  in variable color
  here: balance(color, left, value, ins(right, v))
  hint: Check the variable name
   |
27 |           balance(color, left, value, ins(right, v))
   |                   ^^^^^
error[E003]: undefined variable 'left'
  --> /tmp/dojo-red-black-tree-0.almd:27:26
  in variable left
  here: balance(color, left, value, ins(right, v))
  hint: Check the variable name
   |
27 |           balance(color, left, value, ins(right, v))
   |                          ^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-0.almd:27:32
  in variable value
  here: balance(color, left, value, ins(right, v))
  hint: Did you mean `value.int`?
  try:
      value.int
   |
27 |           balance(color, left, value, ins(right, v))
   |                                ^^^^^
error[E003]: undefined variable 'right'
  --> /tmp/dojo-red-black-tree-0.almd:27:43
  in variable right
  here: balance(color, left, value, ins(right, v))
  hint: Did you mean `height`?
  try:
      height
   |
27 |           balance(color, left, value, ins(right, v))
   |                                           ^^^^^
error[E002]: undefined function 'ins'
  --> /tmp/dojo-red-black-tree-0.almd:27:39
  in call to ins()
  here: balance(color, left, value, ins(right, v))
  hint: Did you mean `insert`?
  try:
      insert
   |
27 |           balance(color, left, value, ins(right, v))
   |                                       ^^^
error[E001]: type mismatch in fn 'insert': expected Tree but got Unit
  --> /tmp/dojo-red-black-tree-0.almd:28:14
  in fn 'insert'
  here: else t
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Tree:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Tree
   |
28 |         else t
   |              ^

19 error(s) found
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

fn balance(color: Color, left: Tree, value: Int, right: Tree) -> Tree =
  match (color, left, right) with
    | (Black, Node(Red, Node(Red, a, x, b), y, c), d) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, d))
    | (Black, Node(Red, a, x, Node(Red, b, y, c)), z) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, z))
    | (Black, d, Node(Red, Node(Red, a, x, b), y, c)) =>
      Node(Red, Node(Black, d, value, a), x, Node(Black, b, y, c))
    | (Black, d, Node(Red, a, x, Node(Red, b, y, c))) =>
      Node(Red, Node(Black, d, value, a), x, Node(Black, b, y, c))
    | _ => Node(color, left, value, right)

fn insert(t: Tree, v: Int) -> Tree =
  let ins = (t: Tree, v: Int) =>
    match t with
      | Leaf => Node(Red, Leaf, v, Leaf)
      | Node(c, l, val, r) =>
        if v < val then
          balance(c, ins(l, v), val, r)
        else if v > val then
          balance(c, l, val, ins(r, v))
        else t
  in
  match ins(t, v) with
    | Node(_, l, val, r) => Node(Black, l, val, r)
    | Leaf => Leaf

fn inorder(t: Tree) -> List[Int] =
  match t with
    | Leaf => []
    | Node(_, l, val, r) =>
      inorder(l) + [val] + inorder(r)

fn height(t: Tree) -> Int =
  match t with
    | Leaf => 0
    | Node(_, l, _, r) =>
      1 + int.max(height(l), height(r))
```

**Diagnostic:**

```
error: Expected LBrace at line 8:30 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-1.almd:8:30
  here: match (color, left, right) with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   match (color, left, right) with
  |                              ^
error: Expected LBrace at line 21:13 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-1.almd:21:13
  here: match t with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |     match t with
   |             ^
error: Expected expression at line 29:3 (got In 'in')
  --> /tmp/dojo-red-black-tree-1.almd:29:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
29 |   in
   |   ^
error: Expected LBrace at line 30:19 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-1.almd:30:19
  here: match ins(t, v) with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
30 |   match ins(t, v) with
   |                   ^
error: Expected LBrace at line 35:11 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-1.almd:35:11
  here: match t with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
35 |   match t with
   |           ^
error: Expected LBrace at line 41:11 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-1.almd:41:11
  here: match t with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
41 |   match t with
   |           ^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-red-black-tree-1.almd:24:16
  in variable val
  here: if v < val then
  hint: Did you mean `v`?
  try:
      v
   |
24 |         if v < val then
   |                ^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-red-black-tree-1.almd:25:19
  in variable c
  here: balance(c, ins(l, v), val, r)
  hint: Did you mean `v`?
  try:
      v
   |
25 |           balance(c, ins(l, v), val, r)
   |                   ^
error[E003]: undefined variable 'l'
  --> /tmp/dojo-red-black-tree-1.almd:25:26
  in variable l
  here: balance(c, ins(l, v), val, r)
  hint: Did you mean `v`?
  try:
      v
   |
25 |           balance(c, ins(l, v), val, r)
   |                          ^
error[E002]: undefined function 'ins'
  --> /tmp/dojo-red-black-tree-1.almd:25:22
  in call to ins()
  here: balance(c, ins(l, v), val, r)
  hint: Did you mean `insert`?
  try:
      insert
   |
25 |           balance(c, ins(l, v), val, r)
   |                      ^^^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-red-black-tree-1.almd:25:33
  in variable val
  here: balance(c, ins(l, v), val, r)
  hint: Did you mean `v`?
  try:
      v
   |
25 |           balance(c, ins(l, v), val, r)
   |                                 ^^^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-1.almd:25:38
  in variable r
  here: balance(c, ins(l, v), val, r)
  hint: Did you mean `v`?
  try:
      v
   |
25 |           balance(c, ins(l, v), val, r)
   |                                      ^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-red-black-tree-1.almd:26:21
  in variable val
  here: else if v > val then
  hint: Did you mean `v`?
  try:
      v
   |
26 |         else if v > val then
   |                     ^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-red-black-tree-1.almd:27:19
  in variable c
  here: balance(c, l, val, ins(r, v))
  hint: Did you mean `v`?
  try:
      v
   |
27 |           balance(c, l, val, ins(r, v))
   |                   ^
error[E003]: undefined variable 'l'
  --> /tmp/dojo-red-black-tree-1.almd:27:22
  in variable l
  here: balance(c, l, val, ins(r, v))
  hint: Did you mean `v`?
  try:
      v
   |
27 |           balance(c, l, val, ins(r, v))
   |                      ^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-red-black-tree-1.almd:27:25
  in variable val
  here: balance(c, l, val, ins(r, v))
  hint: Did you mean `v`?
  try:
      v
   |
27 |           balance(c, l, val, ins(r, v))
   |                         ^^^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-1.almd:27:34
  in variable r
  here: balance(c, l, val, ins(r, v))
  hint: Did you mean `v`?
  try:
      v
   |
27 |           balance(c, l, val, ins(r, v))
   |                                  ^
error[E002]: undefined function 'ins'
  --> /tmp/dojo-red-black-tree-1.almd:27:30
  in call to ins()
  here: balance(c, l, val, ins(r, v))
  hint: Did you mean `insert`?
  try:
      insert
   |
27 |           balance(c, l, val, ins(r, v))
   |                              ^^^
error[E001]: type mismatch in fn 'insert': expected Tree but got Unit
  --> /tmp/dojo-red-black-tree-1.almd:28:14
  in fn 'insert'
  here: else t
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Tree:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Tree
   |
28 |         else t
   |              ^

19 error(s) found
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

fn balance(color: Color, left: Tree, value: Int, right: Tree) -> Tree =
  match (color, left, right) with
    | (Black, Node(Red, Node(Red, a, x, b), y, c), d) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, d))
    | (Black, Node(Red, a, x, Node(Red, b, y, c)), z) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, z))
    | (Black, d, Node(Red, Node(Red, a, x, b), y, c)) =>
      Node(Red, Node(Black, d, value, a), x, Node(Black, b, y, c))
    | (Black, d, Node(Red, a, x, Node(Red, b, y, c))) =>
      Node(Red, Node(Black, d, value, a), x, Node(Black, b, y, c))
    | _ => Node(color, left, value, right)

fn insert(t: Tree, v: Int) -> Tree =
  let ins = (t: Tree, v: Int) -> Tree =
    match t with
      | Leaf => Node(Red, Leaf, v, Leaf)
      | Node(c, l, val, r) =>
        if v < val then
          balance(c, ins(l, v), val, r)
        else if v > val then
          balance(c, l, val, ins(r, v))
        else t
  in
  match ins(t, v) with
    | Node(_, l, val, r) => Node(Black, l, val, r)
    | Leaf => Leaf

fn inorder(t: Tree) -> List[Int] =
  match t with
    | Leaf => []
    | Node(_, l, val, r) =>
      inorder(l) + [val] + inorder(r)

fn height(t: Tree) -> Int =
  match t with
    | Leaf => 0
    | Node(_, l, _, r) =>
      1 + int.max(height(l), height(r))
```

**Diagnostic:**

```
error: Expected LBrace at line 8:30 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-2.almd:8:30
  here: match (color, left, right) with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   match (color, left, right) with
  |                              ^
error: Expected ')' to close type-ascribed expression opened at line 20:13
  --> /tmp/dojo-red-black-tree-2.almd:20:21
  here: let ins = (t: Tree, v: Int) -> Tree =
  hint: Add ')' or check for a missing delimiter inside the type-ascribed expression
   |
20 |   let ins = (t: Tree, v: Int) -> Tree =
   |             --------------- '(' opened here
   |
20 |   let ins = (t: Tree, v: Int) -> Tree =
   |                     ^
error: Expected LBrace at line 21:13 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-2.almd:21:13
  here: match t with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |     match t with
   |             ^
error: Expected expression at line 29:3 (got In 'in')
  --> /tmp/dojo-red-black-tree-2.almd:29:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
29 |   in
   |   ^
error: Expected LBrace at line 30:19 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-2.almd:30:19
  here: match ins(t, v) with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
30 |   match ins(t, v) with
   |                   ^
error: Expected LBrace at line 35:11 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-2.almd:35:11
  here: match t with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
35 |   match t with
   |           ^
error: Expected LBrace at line 41:11 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-2.almd:41:11
  here: match t with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
41 |   match t with
   |           ^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-red-black-tree-2.almd:24:16
  in variable val
  here: if v < val then
  hint: Did you mean `v`?
  try:
      v
   |
24 |         if v < val then
   |                ^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-red-black-tree-2.almd:25:19
  in variable c
  here: balance(c, ins(l, v), val, r)
  hint: Did you mean `t`?
  try:
      t
   |
25 |           balance(c, ins(l, v), val, r)
   |                   ^
error[E003]: undefined variable 'l'
  --> /tmp/dojo-red-black-tree-2.almd:25:26
  in variable l
  here: balance(c, ins(l, v), val, r)
  hint: Did you mean `t`?
  try:
      t
   |
25 |           balance(c, ins(l, v), val, r)
   |                          ^
error[E002]: undefined function 'ins'
  --> /tmp/dojo-red-black-tree-2.almd:25:22
  in call to ins()
  here: balance(c, ins(l, v), val, r)
  hint: Did you mean `insert`?
  try:
      insert
   |
25 |           balance(c, ins(l, v), val, r)
   |                      ^^^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-red-black-tree-2.almd:25:33
  in variable val
  here: balance(c, ins(l, v), val, r)
  hint: Did you mean `v`?
  try:
      v
   |
25 |           balance(c, ins(l, v), val, r)
   |                                 ^^^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-2.almd:25:38
  in variable r
  here: balance(c, ins(l, v), val, r)
  hint: Did you mean `t`?
  try:
      t
   |
25 |           balance(c, ins(l, v), val, r)
   |                                      ^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-red-black-tree-2.almd:26:21
  in variable val
  here: else if v > val then
  hint: Did you mean `v`?
  try:
      v
   |
26 |         else if v > val then
   |                     ^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-red-black-tree-2.almd:27:19
  in variable c
  here: balance(c, l, val, ins(r, v))
  hint: Did you mean `t`?
  try:
      t
   |
27 |           balance(c, l, val, ins(r, v))
   |                   ^
error[E003]: undefined variable 'l'
  --> /tmp/dojo-red-black-tree-2.almd:27:22
  in variable l
  here: balance(c, l, val, ins(r, v))
  hint: Did you mean `t`?
  try:
      t
   |
27 |           balance(c, l, val, ins(r, v))
   |                      ^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-red-black-tree-2.almd:27:25
  in variable val
  here: balance(c, l, val, ins(r, v))
  hint: Did you mean `v`?
  try:
      v
   |
27 |           balance(c, l, val, ins(r, v))
   |                         ^^^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-2.almd:27:34
  in variable r
  here: balance(c, l, val, ins(r, v))
  hint: Did you mean `t`?
  try:
      t
   |
27 |           balance(c, l, val, ins(r, v))
   |                                  ^
error[E002]: undefined function 'ins'
  --> /tmp/dojo-red-black-tree-2.almd:27:30
  in call to ins()
  here: balance(c, l, val, ins(r, v))
  hint: Did you mean `insert`?
  try:
      insert
   |
27 |           balance(c, l, val, ins(r, v))
   |                              ^^^
error[E001]: type mismatch in fn 'insert': expected Tree but got Unit
  --> /tmp/dojo-red-black-tree-2.almd:28:14
  in fn 'insert'
  here: else t
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Tree:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Tree
   |
28 |         else t
   |              ^

20 error(s) found
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

fn balance(color: Color, left: Tree, value: Int, right: Tree) -> Tree =
  match (color, left, right) with
    | (Black, Node(Red, Node(Red, a, x, b), y, c), d) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, d))
    | (Black, Node(Red, a, x, Node(Red, b, y, c)), z) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, z))
    | (Black, d, Node(Red, Node(Red, a, x, b), y, c)) =>
      Node(Red, Node(Black, d, value, a), x, Node(Black, b, y, c))
    | (Black, d, Node(Red, a, x, Node(Red, b, y, c))) =>
      Node(Red, Node(Black, d, value, a), x, Node(Black, b, y, c))
    | _ => Node(color, left, value, right)

fn insert(t: Tree, v: Int) -> Tree =
  let ins = (t: Tree, v: Int) -> Tree =
    match t with
      | Leaf => Node(Red, Leaf, v, Leaf)
      | Node(c, l, val, r) =>
        if v < val then
          balance(c, ins(l, v), val, r)
        else if v > val then
          balance(c, l, val, ins(r, v))
        else t
  in
  match ins(t, v) with
    | Node(_, l, val, r) => Node(Black, l, val, r)
    | Leaf => Leaf

fn inorder(t: Tree) -> List[Int] =
  match t with
    | Leaf => []
    | Node(_, l, val, r) =>
      inorder(l) + [val] + inorder(r)

fn height(t: Tree) -> Int =
  match t with
    | Leaf => 0
    | Node(_, l, _, r) =>
      1 + int.max(height(l), height(r))
```

**Diagnostic:**

```
error: Expected LBrace at line 8:30 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-3.almd:8:30
  here: match (color, left, right) with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   match (color, left, right) with
  |                              ^
error: Expected ')' to close type-ascribed expression opened at line 20:13
  --> /tmp/dojo-red-black-tree-3.almd:20:21
  here: let ins = (t: Tree, v: Int) -> Tree =
  hint: Add ')' or check for a missing delimiter inside the type-ascribed expression
   |
20 |   let ins = (t: Tree, v: Int) -> Tree =
   |             --------------- '(' opened here
   |
20 |   let ins = (t: Tree, v: Int) -> Tree =
   |                     ^
error: Expected LBrace at line 21:13 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-3.almd:21:13
  here: match t with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |     match t with
   |             ^
error: Expected expression at line 29:3 (got In 'in')
  --> /tmp/dojo-red-black-tree-3.almd:29:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
29 |   in
   |   ^
error: Expected LBrace at line 30:19 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-3.almd:30:19
  here: match ins(t, v) with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
30 |   match ins(t, v) with
   |                   ^
error: Expected LBrace at line 35:11 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-3.almd:35:11
  here: match t with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
35 |   match t with
   |           ^
error: Expected LBrace at line 41:11 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-3.almd:41:11
  here: match t with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
41 |   match t with
   |           ^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-red-black-tree-3.almd:24:16
  in variable val
  here: if v < val then
  hint: Did you mean `v`?
  try:
      v
   |
24 |         if v < val then
   |                ^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-red-black-tree-3.almd:25:19
  in variable c
  here: balance(c, ins(l, v), val, r)
  hint: Did you mean `t`?
  try:
      t
   |
25 |           balance(c, ins(l, v), val, r)
   |                   ^
error[E003]: undefined variable 'l'
  --> /tmp/dojo-red-black-tree-3.almd:25:26
  in variable l
  here: balance(c, ins(l, v), val, r)
  hint: Did you mean `t`?
  try:
      t
   |
25 |           balance(c, ins(l, v), val, r)
   |                          ^
error[E002]: undefined function 'ins'
  --> /tmp/dojo-red-black-tree-3.almd:25:22
  in call to ins()
  here: balance(c, ins(l, v), val, r)
  hint: Did you mean `insert`?
  try:
      insert
   |
25 |           balance(c, ins(l, v), val, r)
   |                      ^^^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-red-black-tree-3.almd:25:33
  in variable val
  here: balance(c, ins(l, v), val, r)
  hint: Did you mean `v`?
  try:
      v
   |
25 |           balance(c, ins(l, v), val, r)
   |                                 ^^^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-3.almd:25:38
  in variable r
  here: balance(c, ins(l, v), val, r)
  hint: Did you mean `t`?
  try:
      t
   |
25 |           balance(c, ins(l, v), val, r)
   |                                      ^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-red-black-tree-3.almd:26:21
  in variable val
  here: else if v > val then
  hint: Did you mean `v`?
  try:
      v
   |
26 |         else if v > val then
   |                     ^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-red-black-tree-3.almd:27:19
  in variable c
  here: balance(c, l, val, ins(r, v))
  hint: Did you mean `t`?
  try:
      t
   |
27 |           balance(c, l, val, ins(r, v))
   |                   ^
error[E003]: undefined variable 'l'
  --> /tmp/dojo-red-black-tree-3.almd:27:22
  in variable l
  here: balance(c, l, val, ins(r, v))
  hint: Did you mean `t`?
  try:
      t
   |
27 |           balance(c, l, val, ins(r, v))
   |                      ^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-red-black-tree-3.almd:27:25
  in variable val
  here: balance(c, l, val, ins(r, v))
  hint: Did you mean `v`?
  try:
      v
   |
27 |           balance(c, l, val, ins(r, v))
   |                         ^^^
error[E003]: undefined variable 'r'
  --> /tmp/dojo-red-black-tree-3.almd:27:34
  in variable r
  here: balance(c, l, val, ins(r, v))
  hint: Did you mean `t`?
  try:
      t
   |
27 |           balance(c, l, val, ins(r, v))
   |                                  ^
error[E002]: undefined function 'ins'
  --> /tmp/dojo-red-black-tree-3.almd:27:30
  in call to ins()
  here: balance(c, l, val, ins(r, v))
  hint: Did you mean `insert`?
  try:
      insert
   |
27 |           balance(c, l, val, ins(r, v))
   |                              ^^^
error[E001]: type mismatch in fn 'insert': expected Tree but got Unit
  --> /tmp/dojo-red-black-tree-3.almd:28:14
  in fn 'insert'
  here: else t
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Tree:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Tree
   |
28 |         else t
   |              ^

20 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
