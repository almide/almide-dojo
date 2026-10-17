# red-black-tree

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E014`

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
  | (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) =>
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
  | (Black, a, x, Node(Red, b, y, Node(Red, c, z, d))) =>
    Node(Red, Node(Black, a, x, b), z, Node(Black, c, y, d))
  | _ => Node(color, left, value, right)

fn insert(t: Tree, v: Int) -> Tree =
  let rec insert = (t: Tree, v: Int) -> Tree =
    match t with
    | Leaf => Node(Red, Leaf, v, Leaf)
    | Node(color, left, value, right) =>
      if v < value then
        balance(color, insert(left, v), value, right)
      else if v > value then
        balance(color, left, value, insert(right, v))
      else
        t
  in
  match insert(t, v) with
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
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-red-black-tree-0.almd:20:7
  in let rec
  here: let rec insert = (t: Tree, v: Int) -> Tree =
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
   |
20 |   let rec insert = (t: Tree, v: Int) -> Tree =
   |       ^^^
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
error: Expected LBrace at line 31:22 (got Ident 'with')
  --> /tmp/dojo-red-black-tree-0.almd:31:22
  here: match insert(t, v) with
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
31 |   match insert(t, v) with
   |                      ^
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
  here: balance(color, insert(left, v), value, right)
  hint: Check the variable name
   |
25 |         balance(color, insert(left, v), value, right)
   |                 ^^^^^
error[E003]: undefined variable 'left'
  --> /tmp/dojo-red-black-tree-0.almd:25:31
  in variable left
  here: balance(color, insert(left, v), value, right)
  hint: Check the variable name
   |
25 |         balance(color, insert(left, v), value, right)
   |                               ^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-0.almd:25:41
  in variable value
  here: balance(color, insert(left, v), value, right)
  hint: Did you mean `value.int`?
  try:
      value.int
   |
25 |         balance(color, insert(left, v), value, right)
   |                                         ^^^^^
error[E003]: undefined variable 'right'
  --> /tmp/dojo-red-black-tree-0.almd:25:48
  in variable right
  here: balance(color, insert(left, v), value, right)
  hint: Did you mean `height`?
  try:
      height
   |
25 |         balance(color, insert(left, v), value, right)
   |                                                ^^^^^
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
  here: balance(color, left, value, insert(right, v))
  hint: Check the variable name
   |
27 |         balance(color, left, value, insert(right, v))
   |                 ^^^^^
error[E003]: undefined variable 'left'
  --> /tmp/dojo-red-black-tree-0.almd:27:24
  in variable left
  here: balance(color, left, value, insert(right, v))
  hint: Check the variable name
   |
27 |         balance(color, left, value, insert(right, v))
   |                        ^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-0.almd:27:30
  in variable value
  here: balance(color, left, value, insert(right, v))
  hint: Did you mean `value.int`?
  try:
      value.int
   |
27 |         balance(color, left, value, insert(right, v))
   |                              ^^^^^
error[E003]: undefined variable 'right'
  --> /tmp/dojo-red-black-tree-0.almd:27:44
  in variable right
  here: balance(color, left, value, insert(right, v))
  hint: Did you mean `height`?
  try:
      height
   |
27 |         balance(color, left, value, insert(right, v))
   |                                            ^^^^^
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

18 error(s) found
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
  match (color, left, right) {
  | (Black, Node(Red, Node(Red, a, x, b), y, c), d) =>
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, d))
  | (Black, Node(Red, a, x, Node(Red, b, y, c)), z) =>
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, z))
  | (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) =>
    Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
  | (Black, a, x, Node(Red, b, y, Node(Red, c, z, d))) =>
    Node(Red, Node(Black, a, x, b), z, Node(Black, c, y, d))
  | _ => Node(color, left, value, right)
  }

fn insert(t: Tree, v: Int) -> Tree =
  let insert = (t: Tree, v: Int) -> Tree =
    match t {
    | Leaf => Node(Red, Leaf, v, Leaf)
    | Node(color, left, value, right) =>
      if v < value then
        balance(color, insert(left, v), value, right)
      else if v > value then
        balance(color, left, value, insert(right, v))
      else
        t
    }
  in
  match insert(t, v) {
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
  --> /tmp/dojo-red-black-tree-1.almd:9:3
  here: | (Black, Node(Red, Node(Red, a, x, b), y, c), d) =>
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |   | (Black, Node(Red, Node(Red, a, x, b), y, c), d) =>
  |   ^
error: Expected ')' to close type-ascribed expression opened at line 21:16
  --> /tmp/dojo-red-black-tree-1.almd:21:24
  here: let insert = (t: Tree, v: Int) -> Tree =
  hint: Add ')' or check for a missing delimiter inside the type-ascribed expression
   |
21 |   let insert = (t: Tree, v: Int) -> Tree =
   |                --------------- '(' opened here
   |
21 |   let insert = (t: Tree, v: Int) -> Tree =
   |                        ^
error: Expected pattern at line 23:5 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:23:5
  here: | Leaf => Node(Red, Leaf, v, Leaf)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
23 |     | Leaf => Node(Red, Leaf, v, Leaf)
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 31:5 (got RBrace '}')
  --> /tmp/dojo-red-black-tree-1.almd:31:5
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
31 |     }
   |     ^
error: Expected pattern at line 40:3 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:40:3
  here: | Leaf => []
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
40 |   | Leaf => []
   |   ^
error: Expected pattern at line 47:3 (got Pipe '|')
  --> /tmp/dojo-red-black-tree-1.almd:47:3
  here: | Leaf => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
47 |   | Leaf => 0
   |   ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-1.almd:25:14
  in variable value
  here: if v < value then
  hint: Did you mean `value.int`?
  try:
      value.int
   |
25 |       if v < value then
   |              ^^^^^
error[E003]: undefined variable 'color'
  --> /tmp/dojo-red-black-tree-1.almd:26:17
  in variable color
  here: balance(color, insert(left, v), value, right)
  hint: Check the variable name
   |
26 |         balance(color, insert(left, v), value, right)
   |                 ^^^^^
error[E003]: undefined variable 'left'
  --> /tmp/dojo-red-black-tree-1.almd:26:31
  in variable left
  here: balance(color, insert(left, v), value, right)
  hint: Check the variable name
   |
26 |         balance(color, insert(left, v), value, right)
   |                               ^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-1.almd:26:41
  in variable value
  here: balance(color, insert(left, v), value, right)
  hint: Did you mean `value.int`?
  try:
      value.int
   |
26 |         balance(color, insert(left, v), value, right)
   |                                         ^^^^^
error[E003]: undefined variable 'right'
  --> /tmp/dojo-red-black-tree-1.almd:26:48
  in variable right
  here: balance(color, insert(left, v), value, right)
  hint: Did you mean `height`?
  try:
      height
   |
26 |         balance(color, insert(left, v), value, right)
   |                                                ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-1.almd:27:19
  in variable value
  here: else if v > value then
  hint: Did you mean `value.int`?
  try:
      value.int
   |
27 |       else if v > value then
   |                   ^^^^^
error[E003]: undefined variable 'color'
  --> /tmp/dojo-red-black-tree-1.almd:28:17
  in variable color
  here: balance(color, left, value, insert(right, v))
  hint: Check the variable name
   |
28 |         balance(color, left, value, insert(right, v))
   |                 ^^^^^
error[E003]: undefined variable 'left'
  --> /tmp/dojo-red-black-tree-1.almd:28:24
  in variable left
  here: balance(color, left, value, insert(right, v))
  hint: Check the variable name
   |
28 |         balance(color, left, value, insert(right, v))
   |                        ^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-red-black-tree-1.almd:28:30
  in variable value
  here: balance(color, left, value, insert(right, v))
  hint: Did you mean `value.int`?
  try:
      value.int
   |
28 |         balance(color, left, value, insert(right, v))
   |                              ^^^^^
error[E003]: undefined variable 'right'
  --> /tmp/dojo-red-black-tree-1.almd:28:44
  in variable right
  here: balance(color, left, value, insert(right, v))
  hint: Did you mean `height`?
  try:
      height
   |
28 |         balance(color, left, value, insert(right, v))
   |                                            ^^^^^

16 error(s) found
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
  match (color, left, right) {
    (Black, Node(Red, Node(Red, a, x, b), y, c), d) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, d))
    (Black, Node(Red, a, x, Node(Red, b, y, c)), z) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, z))
    (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    (Black, a, x, Node(Red, b, y, Node(Red, c, z, d))) =>
      Node(Red, Node(Black, a, x, b), z, Node(Black, c, y, d))
    _ => Node(color, left, value, right)
  }

fn insert(t: Tree, v: Int) -> Tree =
  let rec insert = (t_: Tree, v_: Int) -> Tree =
    match t_ {
      Leaf => Node(Red, Leaf, v_, Leaf)
      Node(color_, left_, value_, right_) =>
        if v_ < value_ then
          balance(color_, insert(left_, v_), value_, right_)
        else if v_ > value_ then
          balance(color_, left_, value_, insert(right_, v_))
        else
          t_
    }
  in
  match insert(t, v) {
    Node(_, left_, value_, right_) => Node(Black, left_, value_, right_)
    Leaf => Leaf
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(_, left_, value_, right_) =>
      inorder(left_) + [value_] + inorder(right_)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, left_, _, right_) =>
      1 + int.max(height(left_), height(right_))
  }
```

**Diagnostic:**

```
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-red-black-tree-2.almd:21:7
  in let rec
  here: let rec insert = (t_: Tree, v_: Int) -> Tree =
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
   |
21 |   let rec insert = (t_: Tree, v_: Int) -> Tree =
   |       ^^^
error: Expected expression at line 32:3 (got In 'in')
  --> /tmp/dojo-red-black-tree-2.almd:32:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
32 |   in
   |   ^
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-2.almd:16:7
  in match
  here: Node(Red, Node(Black, a, x, b), z, Node(Black, c, y, d))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
16 |       Node(Red, Node(Black, a, x, b), z, Node(Black, c, y, d))
   |       ^^^^
error[E001]: tuple pattern has 4 element(s) but the value has 3
  --> /tmp/dojo-red-black-tree-2.almd:12:64
  in tuple destructure
  here: Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, z))
  hint: Match the pattern's shape to the tuple's arity
   |
12 |       Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, z))
   |                                                                ^
error[E005]: Node() argument 3 expects Int but got Tree
  --> /tmp/dojo-red-black-tree-2.almd:14:35
  in constructor Node()
  here: Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
  hint: Node(Color, Tree, Int, Tree) expects argument #3 to be Int, got Tree
   |
14 |       Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
   |                                   ^
error[E001]: tuple pattern has 4 element(s) but the value has 3
  --> /tmp/dojo-red-black-tree-2.almd:14:60
  in tuple destructure
  here: Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
  hint: Match the pattern's shape to the tuple's arity
   |
14 |       Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
   |                                                            ^
error[E005]: Node() argument 3 expects Int but got Tree
  --> /tmp/dojo-red-black-tree-2.almd:16:35
  in constructor Node()
  here: Node(Red, Node(Black, a, x, b), z, Node(Black, c, y, d))
  hint: Node(Color, Tree, Int, Tree) expects argument #3 to be Int, got Tree
   |
16 |       Node(Red, Node(Black, a, x, b), z, Node(Black, c, y, d))
   |                                   ^
error[E003]: undefined variable 't_'
  --> /tmp/dojo-red-black-tree-2.almd:22:11
  in variable t_
  here: match t_ {
  hint: Did you mean `t`?
  try:
      t
   |
22 |     match t_ {
   |           ^^
error[E003]: undefined variable 'v_'
  --> /tmp/dojo-red-black-tree-2.almd:23:31
  in variable v_
  here: Leaf => Node(Red, Leaf, v_, Leaf)
  hint: Did you mean `v`?
  try:
      v
   |
23 |       Leaf => Node(Red, Leaf, v_, Leaf)
   |                               ^^
error[E003]: undefined variable 'v_'
  --> /tmp/dojo-red-black-tree-2.almd:25:12
  in variable v_
  here: if v_ < value_ then
  hint: Did you mean `v`?
  try:
      v
   |
25 |         if v_ < value_ then
   |            ^^
error[E003]: undefined variable 'v_'
  --> /tmp/dojo-red-black-tree-2.almd:26:41
  in variable v_
  here: balance(color_, insert(left_, v_), value_, right_)
  hint: Did you mean `v`?
  try:
      v
   |
26 |           balance(color_, insert(left_, v_), value_, right_)
   |                                         ^^
error[E003]: undefined variable 'v_'
  --> /tmp/dojo-red-black-tree-2.almd:27:17
  in variable v_
  here: else if v_ > value_ then
  hint: Did you mean `v`?
  try:
      v
   |
27 |         else if v_ > value_ then
   |                 ^^
error[E003]: undefined variable 'v_'
  --> /tmp/dojo-red-black-tree-2.almd:28:57
  in variable v_
  here: balance(color_, left_, value_, insert(right_, v_))
  hint: Did you mean `v`?
  try:
      v
   |
28 |           balance(color_, left_, value_, insert(right_, v_))
   |                                                         ^^
error[E003]: undefined variable 't_'
  --> /tmp/dojo-red-black-tree-2.almd:30:11
  in variable t_
  here: t_
  hint: Did you mean `t`?
  try:
      t
   |
30 |           t_
   |           ^^

14 error(s) found
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
    (Black, Node(Red, Node(Red, a, x, b), y, c), d) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, d))
    (Black, Node(Red, a, x, Node(Red, b, y, c)), z) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, z))
    (Black, a, x, Node(Red, Node(Red, b, y, c), z, d)) =>
      Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
    (Black, a, x, Node(Red, b, y, Node(Red, c, z, d))) =>
      Node(Red, Node(Black, a, x, b), z, Node(Black, c, y, d))
    _ => Node(color, left, value, right)
  }

fn insert(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Red, Leaf, v, Leaf)
    Node(color, left, value, right) =>
      if v < value then
        balance(color, insert(left, v), value, right)
      else if v > value then
        balance(color, left, value, insert(right, v))
      else
        t
  }

fn insert_final(t: Tree, v: Int) -> Tree =
  match insert(t, v) {
    Node(_, left, value, right) => Node(Black, left, value, right)
    Leaf => Leaf
  }

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => []
    Node(_, left, value, right) =>
      inorder(left) + [value] + inorder(right)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0
    Node(_, left, _, right) =>
      1 + int.max(height(left), height(right))
  }
```

**Diagnostic:**

```
error[E014]: unreachable match arm
  --> /tmp/dojo-red-black-tree-3.almd:16:7
  in match
  here: Node(Red, Node(Black, a, x, b), z, Node(Black, c, y, d))
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
16 |       Node(Red, Node(Black, a, x, b), z, Node(Black, c, y, d))
   |       ^^^^
error[E001]: tuple pattern has 4 element(s) but the value has 3
  --> /tmp/dojo-red-black-tree-3.almd:12:64
  in tuple destructure
  here: Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, z))
  hint: Match the pattern's shape to the tuple's arity
   |
12 |       Node(Red, Node(Black, a, x, b), y, Node(Black, c, value, z))
   |                                                                ^
error[E005]: Node() argument 3 expects Int but got Tree
  --> /tmp/dojo-red-black-tree-3.almd:14:35
  in constructor Node()
  here: Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
  hint: Node(Color, Tree, Int, Tree) expects argument #3 to be Int, got Tree
   |
14 |       Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
   |                                   ^
error[E001]: tuple pattern has 4 element(s) but the value has 3
  --> /tmp/dojo-red-black-tree-3.almd:14:60
  in tuple destructure
  here: Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
  hint: Match the pattern's shape to the tuple's arity
   |
14 |       Node(Red, Node(Black, a, x, b), y, Node(Black, c, z, d))
   |                                                            ^
error[E005]: Node() argument 3 expects Int but got Tree
  --> /tmp/dojo-red-black-tree-3.almd:16:35
  in constructor Node()
  here: Node(Red, Node(Black, a, x, b), z, Node(Black, c, y, d))
  hint: Node(Color, Tree, Int, Tree) expects argument #3 to be Int, got Tree
   |
16 |       Node(Red, Node(Black, a, x, b), z, Node(Black, c, y, d))
   |                                   ^

5 error(s) found
FAILED: /tmp/dojo-red-black-tree-3.almd
Compile error for /tmp/dojo-red-black-tree-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
