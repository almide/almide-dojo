# red-black-tree

- **model**: `cli:claude`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
type Color = | Red | Black

type Tree =
  | Leaf
  | Node(Color, Tree, Int, Tree)

fn is_red(t: Tree) -> Bool =
  match t {
    Leaf => false,
    Node(c, _, _, _) => match c {
      Red => true,
      Black => false
    }
  }

fn paint_black(t: Tree) -> Tree =
  match t {
    Leaf => Leaf,
    Node(_, l, v, r) => Node(Black, l, v, r)
  }

fn t_left(t: Tree) -> Tree =
  match t {
    Leaf => Leaf,
    Node(_, l, _, _) => l
  }

fn t_right(t: Tree) -> Tree =
  match t {
    Leaf => Leaf,
    Node(_, _, _, r) => r
  }

fn t_val(t: Tree) -> Int =
  match t {
    Leaf => 0,
    Node(_, _, v, _) => v
  }

fn balance(c: Color, l: Tree, v: Int, r: Tree) -> Tree =
  match c {
    Red => Node(Red, l, v, r),
    Black =>
      if is_red(l) && is_red(t_left(l)) then
        Node(Red,
          paint_black(t_left(l)),
          t_val(l),
          Node(Black, t_right(l), v, r))
      else if is_red(l) && is_red(t_right(l)) then
        Node(Red,
          Node(Black, t_left(l), t_val(l), t_left(t_right(l))),
          t_val(t_right(l)),
          Node(Black, t_right(t_right(l)), v, r))
      else if is_red(r) && is_red(t_left(r)) then
        Node(Red,
          Node(Black, l, v, t_left(t_left(r))),
          t_val(t_left(r)),
          Node(Black, t_right(t_left(r)), t_val(r), t_right(r)))
      else if is_red(r) && is_red(t_right(r)) then
        Node(Red,
          Node(Black, l, v, t_left(r)),
          t_val(r),
          paint_black(t_right(r)))
      else
        Node(Black, l, v, r)
  }

fn ins(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Red, Leaf, v, Leaf),
    Node(c, l, x, r) =>
      if v < x then balance(c, ins(l, v), x, r)
      else if v > x then balance(c, l, x, ins(r, v))
      else Node(c, l, x, r)
  }

fn insert(t: Tree, v: Int) -> Tree = paint_black(ins(t, v))

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => [],
    Node(_, l, v, r) => inorder(l) + [v] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0,
    Node(_, l, _, r) => 1 + int.max(height(l), height(r))
  }
```

**Diagnostic:**

```
error: '&&' is not valid in Almide at line 44:20
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-red-black-tree-0.almd:44:20
  here: if is_red(l) && is_red(t_left(l)) then
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
44 |       if is_red(l) && is_red(t_left(l)) then
   |                    ^

1 error(s) found
FAILED: /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-red-black-tree-0.almd
Compile error for /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-red-black-tree-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
type Color = | Red | Black

type Tree =
  | Leaf
  | Node(Color, Tree, Int, Tree)

fn is_red(t: Tree) -> Bool =
  match t {
    Leaf => false,
    Node(c, _, _, _) => match c {
      Red => true,
      Black => false
    }
  }

fn paint_black(t: Tree) -> Tree =
  match t {
    Leaf => Leaf,
    Node(_, l, v, r) => Node(Black, l, v, r)
  }

fn t_left(t: Tree) -> Tree =
  match t {
    Leaf => Leaf,
    Node(_, l, _, _) => l
  }

fn t_right(t: Tree) -> Tree =
  match t {
    Leaf => Leaf,
    Node(_, _, _, r) => r
  }

fn t_val(t: Tree) -> Int =
  match t {
    Leaf => 0,
    Node(_, _, v, _) => v
  }

fn balance(c: Color, l: Tree, v: Int, r: Tree) -> Tree =
  match c {
    Red => Node(Red, l, v, r),
    Black =>
      if is_red(l) and is_red(t_left(l)) then
        Node(Red,
          paint_black(t_left(l)),
          t_val(l),
          Node(Black, t_right(l), v, r))
      else if is_red(l) and is_red(t_right(l)) then
        Node(Red,
          Node(Black, t_left(l), t_val(l), t_left(t_right(l))),
          t_val(t_right(l)),
          Node(Black, t_right(t_right(l)), v, r))
      else if is_red(r) and is_red(t_left(r)) then
        Node(Red,
          Node(Black, l, v, t_left(t_left(r))),
          t_val(t_left(r)),
          Node(Black, t_right(t_left(r)), t_val(r), t_right(r)))
      else if is_red(r) and is_red(t_right(r)) then
        Node(Red,
          Node(Black, l, v, t_left(r)),
          t_val(r),
          paint_black(t_right(r)))
      else
        Node(Black, l, v, r)
  }

fn ins(t: Tree, v: Int) -> Tree =
  match t {
    Leaf => Node(Red, Leaf, v, Leaf),
    Node(c, l, x, r) =>
      if v < x then balance(c, ins(l, v), x, r)
      else if v > x then balance(c, l, x, ins(r, v))
      else Node(c, l, x, r)
  }

fn insert(t: Tree, v: Int) -> Tree = paint_black(ins(t, v))

fn inorder(t: Tree) -> List[Int] =
  match t {
    Leaf => [],
    Node(_, l, v, r) => inorder(l) + [v] + inorder(r)
  }

fn height(t: Tree) -> Int =
  match t {
    Leaf => 0,
    Node(_, l, _, r) => 1 + int.max(height(l), height(r))
  }
```
