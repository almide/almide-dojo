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
  | (Black, Node(Red, Node(Red, a, x, b), y, c), d, e) =>
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, d, e))
  | (Black, Node(Red, a, x, Node(Red, b, y, c)), z, d) =>
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
  | (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) =>
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
  | (Black, a, x, Node(Red, b, y, Node(Red, c, z, d))) =>
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
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
      else
        t
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
error: Expected expression at line 30:3 (got In 'in')
  --> /tmp/dojo-red-black-tree-0.almd:30:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
30 |   in
   |   ^
error: Expected LBrace at line 31:19 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-0.almd:31:19
  here: match ins(t, v) with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
31 |   match ins(t, v) with
   |                   ^
error: Expected LBrace at line 36:11 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-0.almd:36:11
  here: match t with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
36 |   match t with
   |           ^
error: Expected LBrace at line 42:11 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-0.almd:42:11
  here: match t with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
42 |   match t with
   |           ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-0.almd:24:14
  in variable value
  here: if v < value then
  hint: Did you mean `value.int`?
  try:
      value.int
   |
24 |       if v < value then
   |              ^^^^^
error[E003]: undefined variable 'color'
  --> /tmp/dojo-red-black-tree-0.almd:25:17
  in variable color
  here: balance(color, ins(left, v), value, right)
  hint: Check the variable name
   |
25 |         balance(color, ins(left, v), value, right)
   |                 ^^^^^
error[E003]: undefined variable 'left'
  --> /tmp/dojo-red-black-tree-0.almd:25:28
  in variable left
  here: balance(color, ins(left, v), value, right)
  hint: Check the variable name
   |
25 |         balance(color, ins(left, v), value, right)
   |                            ^^^^
error[E002]: undefined function 'ins'
  --> /tmp/dojo-red-black-tree-0.almd:25:24
  in call to ins()
  here: balance(color, ins(left, v), value, right)
  hint: Did you mean `insert`?
  try:
      insert
   |
25 |         balance(color, ins(left, v), value, right)
   |                        ^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-0.almd:25:38
  in variable value
  here: balance(color, ins(left, v), value, right)
  hint: Did you mean `value.int`?
  try:
      value.int
   |
25 |         balance(color, ins(left, v), value, right)
   |                                      ^^^^^
error[E003]: undefined variable 'right'
  --> /tmp/dojo-red-black-tree-0.almd:25:45
  in variable right
  here: balance(color, ins(left, v), value, right)
  hint: Did you mean `height`?
  try:
      height
   |
25 |         balance(color, ins(left, v), value, right)
   |                                             ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-0.almd:26:19
  in variable value
  here: else if v > value then
  hint: Did you mean `value.int`?
  try:
      value.int
   |
26 |       else if v > value then
   |                   ^^^^^
error[E003]: undefined variable 'color'
  --> /tmp/dojo-red-black-tree-0.almd:27:17
  in variable color
  here: balance(color, left, value, ins(right, v))
  hint: Check the variable name
   |
27 |         balance(color, left, value, ins(right, v))
   |                 ^^^^^
error[E003]: undefined variable 'left'
  --> /tmp/dojo-red-black-tree-0.almd:27:24
  in variable left
  here: balance(color, left, value, ins(right, v))
  hint: Check the variable name
   |
27 |         balance(color, left, value, ins(right, v))
   |                        ^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-0.almd:27:30
  in variable value
  here: balance(color, left, value, ins(right, v))
  hint: Did you mean `value.int`?
  try:
      value.int
   |
27 |         balance(color, left, value, ins(right, v))
   |                              ^^^^^
error[E003]: undefined variable 'right'
  --> /tmp/dojo-red-black-tree-0.almd:27:41
  in variable right
  here: balance(color, left, value, ins(right, v))
  hint: Did you mean `height`?
  try:
      height
   |
27 |         balance(color, left, value, ins(right, v))
   |                                         ^^^^^
error[E002]: undefined function 'ins'
  --> /tmp/dojo-red-black-tree-0.almd:27:37
  in call to ins()
  here: balance(color, left, value, ins(right, v))
  hint: Did you mean `insert`?
  try:
      insert
   |
27 |         balance(color, left, value, ins(right, v))
   |                                     ^^^
error[E001]: type mismatch in fn 'insert': expected Tree but got Unit
  --> /tmp/dojo-red-black-tree-0.almd:29:9
  in fn 'insert'
  here: t
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Tree:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Tree
   |
29 |         t
   |         ^

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
  | (Black, Node(Red, Node(Red, a, x, b), y, c), d, e) =>
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, d, e))
  | (Black, Node(Red, a, x, Node(Red, b, y, c)), z, d) =>
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
  | (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) =>
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
  | (Black, a, x, Node(Red, b, y, Node(Red, c, z, d))) =>
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
  | _ => Node(color, left, value, right)

fn insert(t: Tree, v: Int) -> Tree =
  let ins = (t: Tree, v: Int) -> Tree =
    match t with
    | Leaf => Node(Red, Leaf, v, Leaf)
    | Node(c, left, value, right) =>
      if v < value then
        balance(c, ins(left, v), value, right)
      else if v > value then
        balance(c, left, value, ins(right, v))
      else
        t
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
  --> /tmp/dojo-red-black-tree-1.almd:8:30
  here: match (color, left, right) with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   match (color, left, right) with
  |                              ^
error: Expected ')' to close type-ascribed expression opened at line 20:13
  --> /tmp/dojo-red-black-tree-1.almd:20:21
  here: let ins = (t: Tree, v: Int) -> Tree =
  hint: Add ')' or check for a missing delimiter inside the type-ascribed expression
   |
20 |   let ins = (t: Tree, v: Int) -> Tree =
   |             --------------- '(' opened here
   |
20 |   let ins = (t: Tree, v: Int) -> Tree =
   |                     ^
error: Expected LBrace at line 21:13 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-1.almd:21:13
  here: match t with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |     match t with
   |             ^
error: Expected expression at line 30:3 (got In 'in')
  --> /tmp/dojo-red-black-tree-1.almd:30:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
30 |   in
   |   ^
error: Expected LBrace at line 31:19 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-1.almd:31:19
  here: match ins(t, v) with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
31 |   match ins(t, v) with
   |                   ^
error: Expected LBrace at line 36:11 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-1.almd:36:11
  here: match t with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
36 |   match t with
   |           ^
error: Expected LBrace at line 42:11 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-1.almd:42:11
  here: match t with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
42 |   match t with
   |           ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-1.almd:24:14
  in variable value
  here: if v < value then
  hint: Did you mean `value.str`?
  try:
      value.str
   |
24 |       if v < value then
   |              ^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-red-black-tree-1.almd:25:17
  in variable c
  here: balance(c, ins(left, v), value, right)
  hint: Did you mean `t`?
  try:
      t
   |
25 |         balance(c, ins(left, v), value, right)
   |                 ^
error[E003]: undefined variable 'left'
  --> /tmp/dojo-red-black-tree-1.almd:25:24
  in variable left
  here: balance(c, ins(left, v), value, right)
  hint: Check the variable name
   |
25 |         balance(c, ins(left, v), value, right)
   |                        ^^^^
error[E002]: undefined function 'ins'
  --> /tmp/dojo-red-black-tree-1.almd:25:20
  in call to ins()
  here: balance(c, ins(left, v), value, right)
  hint: Did you mean `insert`?
  try:
      insert
   |
25 |         balance(c, ins(left, v), value, right)
   |                    ^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-1.almd:25:34
  in variable value
  here: balance(c, ins(left, v), value, right)
  hint: Did you mean `value.str`?
  try:
      value.str
   |
25 |         balance(c, ins(left, v), value, right)
   |                                  ^^^^^
error[E003]: undefined variable 'right'
  --> /tmp/dojo-red-black-tree-1.almd:25:41
  in variable right
  here: balance(c, ins(left, v), value, right)
  hint: Did you mean `height`?
  try:
      height
   |
25 |         balance(c, ins(left, v), value, right)
   |                                         ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-1.almd:26:19
  in variable value
  here: else if v > value then
  hint: Did you mean `value.str`?
  try:
      value.str
   |
26 |       else if v > value then
   |                   ^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-red-black-tree-1.almd:27:17
  in variable c
  here: balance(c, left, value, ins(right, v))
  hint: Did you mean `t`?
  try:
      t
   |
27 |         balance(c, left, value, ins(right, v))
   |                 ^
error[E003]: undefined variable 'left'
  --> /tmp/dojo-red-black-tree-1.almd:27:20
  in variable left
  here: balance(c, left, value, ins(right, v))
  hint: Check the variable name
   |
27 |         balance(c, left, value, ins(right, v))
   |                    ^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-1.almd:27:26
  in variable value
  here: balance(c, left, value, ins(right, v))
  hint: Did you mean `value.str`?
  try:
      value.str
   |
27 |         balance(c, left, value, ins(right, v))
   |                          ^^^^^
error[E003]: undefined variable 'right'
  --> /tmp/dojo-red-black-tree-1.almd:27:37
  in variable right
  here: balance(c, left, value, ins(right, v))
  hint: Did you mean `height`?
  try:
      height
   |
27 |         balance(c, left, value, ins(right, v))
   |                                     ^^^^^
error[E002]: undefined function 'ins'
  --> /tmp/dojo-red-black-tree-1.almd:27:33
  in call to ins()
  here: balance(c, left, value, ins(right, v))
  hint: Did you mean `insert`?
  try:
      insert
   |
27 |         balance(c, left, value, ins(right, v))
   |                                 ^^^
error[E001]: type mismatch in fn 'insert': expected Tree but got Unit
  --> /tmp/dojo-red-black-tree-1.almd:29:9
  in fn 'insert'
  here: t
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Tree:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Tree
   |
29 |         t
   |         ^

20 error(s) found
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
  | (Black, Node(Red, Node(Red, a, x, b), y, c), z, d) =>
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
  | (Black, Node(Red, a, x, Node(Red, b, y, c)), z, d) =>
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
  | (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) =>
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
  | (Black, a, x, Node(Red, b, y, Node(Red, c, z, d))) =>
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
  | _ => Node(color, left, value, right)

fn insert(t: Tree, v: Int) -> Tree =
  let rec ins = (t: Tree, v: Int) -> Tree =
    match t with
    | Leaf => Node(Red, Leaf, v, Leaf)
    | Node(c, left, value, right) =>
      if v < value then
        balance(c, ins(left, v), value, right)
      else if v > value then
        balance(c, left, value, ins(right, v))
      else
        t
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
  --> /tmp/dojo-red-black-tree-2.almd:8:30
  here: match (color, left, right) with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   match (color, left, right) with
  |                              ^
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-red-black-tree-2.almd:20:7
  in let rec
  here: let rec ins = (t: Tree, v: Int) -> Tree =
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
   |
20 |   let rec ins = (t: Tree, v: Int) -> Tree =
   |       ^^^
error: Expected LBrace at line 21:13 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-2.almd:21:13
  here: match t with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |     match t with
   |             ^
error: Expected expression at line 30:3 (got In 'in')
  --> /tmp/dojo-red-black-tree-2.almd:30:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
30 |   in
   |   ^
error: Expected LBrace at line 31:19 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-2.almd:31:19
  here: match ins(t, v) with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
31 |   match ins(t, v) with
   |                   ^
error: Expected LBrace at line 36:11 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-2.almd:36:11
  here: match t with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
36 |   match t with
   |           ^
error: Expected LBrace at line 42:11 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-2.almd:42:11
  here: match t with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
42 |   match t with
   |           ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-2.almd:24:14
  in variable value
  here: if v < value then
  hint: Did you mean `value.int`?
  try:
      value.int
   |
24 |       if v < value then
   |              ^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-red-black-tree-2.almd:25:17
  in variable c
  here: balance(c, ins(left, v), value, right)
  hint: Did you mean `t`?
  try:
      t
   |
25 |         balance(c, ins(left, v), value, right)
   |                 ^
error[E003]: undefined variable 'left'
  --> /tmp/dojo-red-black-tree-2.almd:25:24
  in variable left
  here: balance(c, ins(left, v), value, right)
  hint: Check the variable name
   |
25 |         balance(c, ins(left, v), value, right)
   |                        ^^^^
error[E002]: undefined function 'ins'
  --> /tmp/dojo-red-black-tree-2.almd:25:20
  in call to ins()
  here: balance(c, ins(left, v), value, right)
  hint: Did you mean `insert`?
  try:
      insert
   |
25 |         balance(c, ins(left, v), value, right)
   |                    ^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-2.almd:25:34
  in variable value
  here: balance(c, ins(left, v), value, right)
  hint: Did you mean `value.int`?
  try:
      value.int
   |
25 |         balance(c, ins(left, v), value, right)
   |                                  ^^^^^
error[E003]: undefined variable 'right'
  --> /tmp/dojo-red-black-tree-2.almd:25:41
  in variable right
  here: balance(c, ins(left, v), value, right)
  hint: Did you mean `height`?
  try:
      height
   |
25 |         balance(c, ins(left, v), value, right)
   |                                         ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-2.almd:26:19
  in variable value
  here: else if v > value then
  hint: Did you mean `value.int`?
  try:
      value.int
   |
26 |       else if v > value then
   |                   ^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-red-black-tree-2.almd:27:17
  in variable c
  here: balance(c, left, value, ins(right, v))
  hint: Did you mean `t`?
  try:
      t
   |
27 |         balance(c, left, value, ins(right, v))
   |                 ^
error[E003]: undefined variable 'left'
  --> /tmp/dojo-red-black-tree-2.almd:27:20
  in variable left
  here: balance(c, left, value, ins(right, v))
  hint: Check the variable name
   |
27 |         balance(c, left, value, ins(right, v))
   |                    ^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-2.almd:27:26
  in variable value
  here: balance(c, left, value, ins(right, v))
  hint: Did you mean `value.int`?
  try:
      value.int
   |
27 |         balance(c, left, value, ins(right, v))
   |                          ^^^^^
error[E003]: undefined variable 'right'
  --> /tmp/dojo-red-black-tree-2.almd:27:37
  in variable right
  here: balance(c, left, value, ins(right, v))
  hint: Did you mean `height`?
  try:
      height
   |
27 |         balance(c, left, value, ins(right, v))
   |                                     ^^^^^
error[E002]: undefined function 'ins'
  --> /tmp/dojo-red-black-tree-2.almd:27:33
  in call to ins()
  here: balance(c, left, value, ins(right, v))
  hint: Did you mean `insert`?
  try:
      insert
   |
27 |         balance(c, left, value, ins(right, v))
   |                                 ^^^
error[E001]: type mismatch in fn 'insert': expected Tree but got Unit
  --> /tmp/dojo-red-black-tree-2.almd:29:9
  in fn 'insert'
  here: t
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Tree:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Tree
   |
29 |         t
   |         ^

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
  match (color, left, right) {
  | (Black, Node(Red, Node(Red, a, x, b), y, c), z, d) =>
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
  | (Black, Node(Red, a, x, Node(Red, b, y, c)), z, d) =>
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
  | (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) =>
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
  | (Black, a, x, Node(Red, b, y, Node(Red, c, z, d))) =>
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
  | _ => Node(color, left, value, right)
  }

fn insert(t: Tree, v: Int) -> Tree =
  let ins = (t: Tree, v: Int) -> Tree =
    match t {
    | Leaf => Node(Red, Leaf, v, Leaf)
    | Node(c, left, value, right) =>
      if v < value then
        balance(c, ins(left, v), value, right)
      else if v > value then
        balance(c, left, value, ins(right, v))
      else
        t
    }
  in
  match ins(t, v) {
  | Node(_, left, value, right) => Node(Black, left, value, right)
  | Leaf => Leaf
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
  | Leaf => []
  | Node(_, left, value, right) =>
    inorder(left) + [value] + inorder(right)
  }

fn height(t: Tree) -> Int =
  match t {
  | Leaf => 0
  | Node(_, left, _, right) =>
    1 + int.max(height(left), height(right))
  }
```

**Diagnostic:**

```
error: Expected pattern at line 9:3 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:9:3
  here: | (Black, Node(Red, Node(Red, a, x, b), y, c), z, d) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |   | (Black, Node(Red, Node(Red, a, x, b), y, c), z, d) =>
  |   ^
error: Expected ')' to close type-ascribed expression opened at line 21:13
  --> /tmp/dojo-red-black-tree-3.almd:21:21
  here: let ins = (t: Tree, v: Int) -> Tree =
  hint: Add ')' or check for a missing delimiter inside the type-ascribed expression
   |
21 |   let ins = (t: Tree, v: Int) -> Tree =
   |             --------------- '(' opened here
   |
21 |   let ins = (t: Tree, v: Int) -> Tree =
   |                     ^
error: Expected pattern at line 23:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:23:5
  here: | Leaf => Node(Red, Leaf, v, Leaf)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
23 |     | Leaf => Node(Red, Leaf, v, Leaf)
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 31:5 (got RBrace '}')
  --> /tmp/dojo-red-black-tree-3.almd:31:5
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
31 |     }
   |     ^
error: Expected pattern at line 40:3 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:40:3
  here: | Leaf => []
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
40 |   | Leaf => []
   |   ^
error: Expected pattern at line 47:3 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-3.almd:47:3
  here: | Leaf => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
47 |   | Leaf => 0
   |   ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-3.almd:25:14
  in variable value
  here: if v < value then
  hint: Did you mean `value.int`?
  try:
      value.int
   |
25 |       if v < value then
   |              ^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-red-black-tree-3.almd:26:17
  in variable c
  here: balance(c, ins(left, v), value, right)
  hint: Did you mean `v`?
  try:
      v
   |
26 |         balance(c, ins(left, v), value, right)
   |                 ^
error[E003]: undefined variable 'left'
  --> /tmp/dojo-red-black-tree-3.almd:26:24
  in variable left
  here: balance(c, ins(left, v), value, right)
  hint: Check the variable name
   |
26 |         balance(c, ins(left, v), value, right)
   |                        ^^^^
error[E002]: undefined function 'ins'
  --> /tmp/dojo-red-black-tree-3.almd:26:20
  in call to ins()
  here: balance(c, ins(left, v), value, right)
  hint: Did you mean `insert`?
  try:
      insert
   |
26 |         balance(c, ins(left, v), value, right)
   |                    ^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-3.almd:26:34
  in variable value
  here: balance(c, ins(left, v), value, right)
  hint: Did you mean `value.int`?
  try:
      value.int
   |
26 |         balance(c, ins(left, v), value, right)
   |                                  ^^^^^
error[E003]: undefined variable 'right'
  --> /tmp/dojo-red-black-tree-3.almd:26:41
  in variable right
  here: balance(c, ins(left, v), value, right)
  hint: Did you mean `height`?
  try:
      height
   |
26 |         balance(c, ins(left, v), value, right)
   |                                         ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-3.almd:27:19
  in variable value
  here: else if v > value then
  hint: Did you mean `value.int`?
  try:
      value.int
   |
27 |       else if v > value then
   |                   ^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-red-black-tree-3.almd:28:17
  in variable c
  here: balance(c, left, value, ins(right, v))
  hint: Did you mean `v`?
  try:
      v
   |
28 |         balance(c, left, value, ins(right, v))
   |                 ^
error[E003]: undefined variable 'left'
  --> /tmp/dojo-red-black-tree-3.almd:28:20
  in variable left
  here: balance(c, left, value, ins(right, v))
  hint: Check the variable name
   |
28 |         balance(c, left, value, ins(right, v))
   |                    ^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-3.almd:28:26
  in variable value
  here: balance(c, left, value, ins(right, v))
  hint: Did you mean `value.int`?
  try:
      value.int
   |
28 |         balance(c, left, value, ins(right, v))
   |                          ^^^^^
error[E003]: undefined variable 'right'
  --> /tmp/dojo-red-black-tree-3.almd:28:37
  in variable right
  here: balance(c, left, value, ins(right, v))
  hint: Did you mean `height`?
  try:
      height
   |
28 |         balance(c, left, value, ins(right, v))
   |                                     ^^^^^
error[E002]: undefined function 'ins'
  --> /tmp/dojo-red-black-tree-3.almd:28:33
  in call to ins()
  here: balance(c, left, value, ins(right, v))
  hint: Did you mean `insert`?
  try:
      insert
   |
28 |         balance(c, left, value, ins(right, v))
   |                                 ^^^

18 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
