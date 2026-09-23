# custom-linked-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn from_list(xs: List[Int]) -> MyList =
  match xs {
    Nil => Nil
    Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) |> Cons(x, _)
  }
```

**Diagnostic:**

```
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:3:12
  in variable Nil
  here: Nil => Nil
  hint: Check the variable name
  |
3 |     Nil => Nil
  |            ^^^
error[E003]: unknown type or constructor 'Cons' in call position
  --> /tmp/dojo-custom-linked-list-0.almd:4:38
  in call to Cons()
  here: Cons(x, xs) => Cons(x, from_list(xs))
  hint: No type, variant constructor, or opaque alias named 'Cons' is in scope. Check the spelling or add the missing import.
  |
4 |     Cons(x, xs) => Cons(x, from_list(xs))
  |                                      ^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:9:12
  in variable Nil
  here: Nil => Nil
  hint: Did you mean `ml`?
  try:
      ml
  |
9 |     Nil => Nil
  |            ^^^
error[E003]: unknown type or constructor 'Cons' in call position
  --> /tmp/dojo-custom-linked-list-0.almd:10:38
  in call to Cons()
  here: Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
  hint: No type, variant constructor, or opaque alias named 'Cons' is in scope. Check the spelling or add the missing import.
   |
10 |     Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
   |                                      ^^^^
error[E005]: argument 'xs' expects List[A] but got Cons
  --> /tmp/dojo-custom-linked-list-0.almd:10:38
  in call to list.reverse()
  here: Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
  hint: Fix the argument type
   |
35 |   }
   | ------------------------------ fn list.reverse() defined here
...
10 |     Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
   |                                      ^^^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:21:12
  in variable Nil
  here: Nil => Nil
  hint: Did you mean `ml`?
  try:
      ml
   |
21 |     Nil => Nil
   |            ^^^
error[E003]: unknown type or constructor 'Cons' in call position
  --> /tmp/dojo-custom-linked-list-0.almd:22:46
  in call to Cons()
  here: Cons(x, tail) => Cons(f(x), my_map(tail, f))
  hint: No type, variant constructor, or opaque alias named 'Cons' is in scope. Check the spelling or add the missing import.
   |
22 |     Cons(x, tail) => Cons(f(x), my_map(tail, f))
   |                                              ^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:27:12
  in variable Nil
  here: Nil => Nil
  hint: Did you mean `ml`?
  try:
      ml
   |
27 |     Nil => Nil
   |            ^^^
error[E003]: unknown type or constructor 'Cons' in call position
  --> /tmp/dojo-custom-linked-list-0.almd:28:62
  in call to Cons()
  here: Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  hint: No type, variant constructor, or opaque alias named 'Cons' is in scope. Check the spelling or add the missing import.
   |
28 |     Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                              ^^^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:33:12
  in variable Nil
  here: Nil => Nil
  hint: Did you mean `ml`?
  try:
      ml
   |
33 |     Nil => Nil
   |            ^^^
error[E046]: placeholder `_` is not valid in a call argument (argument 2 of Cons())
  --> /tmp/dojo-custom-linked-list-0.almd:34:50
  in call argument
  here: Cons(x, tail) => my_reverse(tail) |> Cons(x, _)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Cons(x, /* the other arguments */)
   |
34 |     Cons(x, tail) => my_reverse(tail) |> Cons(x, _)
   |                                                  ^
error[E003]: undefined variable 'Cons'
  --> /tmp/dojo-custom-linked-list-0.almd:34:42
  in variable Cons
  here: Cons(x, tail) => my_reverse(tail) |> Cons(x, _)
  hint: Check the variable name
   |
34 |     Cons(x, tail) => my_reverse(tail) |> Cons(x, _)
   |                                          ^^^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:39:40
  in variable Nil
  here: test "my_len empty" { assert_eq(my_len(Nil), 0) }
  hint: Check the variable name
   |
39 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:42:49
  in variable Nil
  here: test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
  hint: Check the variable name
   |
42 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                 ^^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:46:56
  in variable Nil
  here: test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
  hint: Check the variable name
   |
46 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E001]: type mismatch in if branches: expected Cons but got MyList
  --> /tmp/dojo-custom-linked-list-0.almd:28:90
  in if branches
  here: Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  hint: Both branches of `if/then/else` must have the same type
   |
28 |     Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                          ^^^^
error[E029]: unknown type 'MyList'
  in return type of 'from_list'
  hint: no `type MyList` is declared (or imported) in this program — declare it, or check the spelling

17 error(s) found
FAILED: /tmp/dojo-custom-linked-list-0.almd
Compile error for /tmp/dojo-custom-linked-list-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
type MyList =
  | Nil
  | Cons(Int, MyList)

fn from_list(xs: List[Int]) -> MyList =
  match xs {
    Nil => Nil
    Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) |> Cons(x, _)
  }

type MyList =
  | Nil
  | Cons(Int, MyList)

fn from_list(xs: List[Int]) -> MyList =
  match xs {
    Nil => Nil
    Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) |> Cons(x, _)
  }

fn test() {
  test "my_len empty" { assert_eq(my_len(Nil), 0) }
  test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
  test "my_filter on nil" { assert_eq(to_list(my_filter(Nil, (x) => x > 0)), []) }
  test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
  test "my_len non-empty" { assert_eq(my_len(Cons(1, Cons(2, Cons(3, Nil)))), 3) }
  test "my_map on non-empty" { assert_eq(to_list(my_map(Cons(1, Cons(2, Cons(3, Nil))), (x) => x + 1)), [2, 3, 4]) }
  test "my_filter on non-empty" { assert_eq(to_list(my_filter(Cons(1, Cons(2, Cons(3, Nil))), (x) => x > 1)), [2, 3]) }
  test "my_reverse on non-empty" { assert_eq(to_list(my_reverse(Cons(1, Cons(2, Cons(3, Nil))))), [3, 2, 1]) }
}
```

**Diagnostic:**

```
error: Expected function name at line 81:4 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-1.almd:81:4
  here: fn test() {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
81 | fn test() {
   |    ^
error: Expected String at line 81:8 (got LParen '(')
  --> /tmp/dojo-custom-linked-list-1.almd:81:8
  here: fn test() {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
81 | fn test() {
   |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 90:1 (got RBrace '}')
  --> /tmp/dojo-custom-linked-list-1.almd:90:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
90 | }
   | ^
error[E012]: duplicate function 'from_list'
  at line 45
  in fn from_list
  here: fn from_list(xs: List[Int]) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 5 | fn from_list(xs: List[Int]) -> MyList =
   | ------------------------------------ first definition of 'from_list' here
...
45 | fn from_list(xs: List[Int]) -> MyList =
   | ^^^^^^^^^^^^
error[E012]: duplicate function 'to_list'
  at line 51
  in fn to_list
  here: fn to_list(ml: MyList) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
11 | fn to_list(ml: MyList) -> List[Int] =
   | ---------------------------------- first definition of 'to_list' here
...
51 | fn to_list(ml: MyList) -> List[Int] =
   | ^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 57
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
17 | fn my_len(ml: MyList) -> Int =
   | --------------------------------- first definition of 'my_len' here
...
57 | fn my_len(ml: MyList) -> Int =
   | ^^^^^^^^^
error[E012]: duplicate function 'my_map'
  at line 63
  in fn my_map
  here: fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
23 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
   | --------------------------------- first definition of 'my_map' here
...
63 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
   | ^^^^^^^^^
error[E012]: duplicate function 'my_filter'
  at line 69
  in fn my_filter
  here: fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
29 | fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
   | ------------------------------------ first definition of 'my_filter' here
...
69 | fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
   | ^^^^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 75
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
35 | fn my_reverse(ml: MyList) -> MyList =
   | ------------------------------------- first definition of 'my_reverse' here
...
75 | fn my_reverse(ml: MyList) -> MyList =
   | ^^^^^^^^^^^^^
error[E012]: duplicate test 'my_len empty'
  at line 94
  in test "my_len empty"
  here: test "my_len empty" { assert_eq(my_len(Nil), 0) }
  hint: Rename one of the tests, or merge them. Each test name must be unique within a file.
   |
82 |   test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |   ------------------------------ first test 'my_len empty' here
...
94 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   | ^^^^^^^^^^^^^^^^^^^
error[E012]: duplicate test 'my_map on nil'
  at line 97
  in test "my_map on nil"
  here: test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
  hint: Rename one of the tests, or merge them. Each test name must be unique within a file.
   |
83 |   test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |   ------------------------------- first test 'my_map on nil' here
...
97 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   | ^^^^^^^^^^^^^^^^^^^^
error[E012]: duplicate test 'my_reverse empty'
  at line 101
  in test "my_reverse empty"
  here: test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
  hint: Rename one of the tests, or merge them. Each test name must be unique within a file.
    |
 85 |   test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
    |   ---------------------------------- first test 'my_reverse empty' here
 ...
101 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
    | ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: Cons() argument 2 expects MyList but got List[Int]
  --> /tmp/dojo-custom-linked-list-1.almd:14:38
  in constructor Cons()
  here: Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
  hint: Cons(Int, MyList) expects argument #2 to be MyList, got List[Int]
   |
14 |     Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
   |                                      ^^^^
error[E005]: argument 'xs' expects List[A] but got MyList
  --> /tmp/dojo-custom-linked-list-1.almd:14:38
  in call to list.reverse()
  here: Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
  hint: Fix the argument type
   |
35 | fn my_reverse(ml: MyList) -> MyList =
   | ------------------------------ fn list.reverse() defined here
...
14 |     Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
   |                                      ^^^^
error[E046]: placeholder `_` is not valid in a call argument (argument 2 of Cons())
  --> /tmp/dojo-custom-linked-list-1.almd:38:50
  in call argument
  here: Cons(x, tail) => my_reverse(tail) |> Cons(x, _)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Cons(x, /* the other arguments */)
   |
38 |     Cons(x, tail) => my_reverse(tail) |> Cons(x, _)
   |                                                  ^
error[E005]: Cons() argument 2 expects MyList but got List[Int]
  --> /tmp/dojo-custom-linked-list-1.almd:54:38
  in constructor Cons()
  here: Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
  hint: Cons(Int, MyList) expects argument #2 to be MyList, got List[Int]
   |
54 |     Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
   |                                      ^^^^
error[E005]: argument 'xs' expects List[A] but got MyList
  --> /tmp/dojo-custom-linked-list-1.almd:54:38
  in call to list.reverse()
  here: Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
  hint: Fix the argument type
   |
35 | fn my_reverse(ml: MyList) -> MyList =
   | ------------------------------ fn list.reverse() defined here
...
54 |     Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
   |                                      ^^^^
error[E046]: placeholder `_` is not valid in a call argument (argument 2 of Cons())
  --> /tmp/dojo-custom-linked-list-1.almd:78:50
  in call argument
  here: Cons(x, tail) => my_reverse(tail) |> Cons(x, _)
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => Cons(x, /* the other arguments */)
   |
78 |     Cons(x, tail) => my_reverse(tail) |> Cons(x, _)
   |                                                  ^
error[E001]: type mismatch in match arm: expected MyList but got List[?0]
  --> /tmp/dojo-custom-linked-list-1.almd:14:38
  in match arm
  here: Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
14 |     Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
   |                                      ^^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-1.almd:14:38
  in fn 'to_list'
  here: Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
  hint: Fix the expression type or change the expected type
   |
14 |     Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
   |                                      ^^^^
error[E001]: type mismatch in pipe call: expected fn(Int, MyList) -> MyList but got fn(MyList, Int, Unknown) -> MyList
  --> /tmp/dojo-custom-linked-list-1.almd:38:42
  in pipe call
  here: Cons(x, tail) => my_reverse(tail) |> Cons(x, _)
  hint: Fix the expression type or change the expected type
   |
38 |     Cons(x, tail) => my_reverse(tail) |> Cons(x, _)
   |                                          ^^^^
error[E001]: type mismatch in match arm: expected MyList but got List[?2]
  --> /tmp/dojo-custom-linked-list-1.almd:54:38
  in match arm
  here: Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
54 |     Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
   |                                      ^^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-1.almd:54:38
  in fn 'to_list'
  here: Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
  hint: Fix the expression type or change the expected type
   |
54 |     Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
   |                                      ^^^^
error[E001]: type mismatch in pipe call: expected fn(Int, MyList) -> MyList but got fn(MyList, Int, Unknown) -> MyList
  --> /tmp/dojo-custom-linked-list-1.almd:78:42
  in pipe call
  here: Cons(x, tail) => my_reverse(tail) |> Cons(x, _)
  hint: Fix the expression type or change the expected type
   |
78 |     Cons(x, tail) => my_reverse(tail) |> Cons(x, _)
   |                                          ^^^^

24 error(s) found
FAILED: /tmp/dojo-custom-linked-list-1.almd
Compile error for /tmp/dojo-custom-linked-list-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
type MyList =
  | Nil
  | Cons(Int, MyList)

fn from_list(xs: List[Int]) -> MyList =
  match xs {
    Nil => Nil
    Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(x, to_list(tail))
  } |> list.reverse

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) |> Cons(x, to_list(tail))
  } |> list.reverse
```

**Diagnostic:**

```
error[E005]: Cons() argument 2 expects MyList but got List[Int]
  --> /tmp/dojo-custom-linked-list-2.almd:14:38
  in constructor Cons()
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Cons(Int, MyList) expects argument #2 to be MyList, got List[Int]
   |
14 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
error[E005]: argument 'xs' expects List[A] but got MyList
  --> /tmp/dojo-custom-linked-list-2.almd:14:38
  in call to list.reverse()
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Fix the argument type
   |
35 | fn my_reverse(ml: MyList) -> MyList =
   | ------------------------------ fn list.reverse() defined here
...
14 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
error[E005]: argument 'xs' expects List[A] but got MyList
  --> /tmp/dojo-custom-linked-list-2.almd:38:42
  in call to list.reverse()
  here: Cons(x, tail) => my_reverse(tail) |> Cons(x, to_list(tail))
  hint: Fix the argument type
   |
35 | fn my_reverse(ml: MyList) -> MyList =
   | ------------------------------ fn list.reverse() defined here
...
38 |     Cons(x, tail) => my_reverse(tail) |> Cons(x, to_list(tail))
   |                                          ^^^^
error[E001]: type mismatch in pipe call: expected fn(Int, MyList) -> MyList but got fn(MyList, Int, List[Int]) -> MyList
  --> /tmp/dojo-custom-linked-list-2.almd:38:42
  in pipe call
  here: Cons(x, tail) => my_reverse(tail) |> Cons(x, to_list(tail))
  hint: Fix the expression type or change the expected type
   |
38 |     Cons(x, tail) => my_reverse(tail) |> Cons(x, to_list(tail))
   |                                          ^^^^
error[E001]: type mismatch in fn 'my_reverse': expected MyList but got List[?2]
  --> /tmp/dojo-custom-linked-list-2.almd:38:42
  in fn 'my_reverse'
  here: Cons(x, tail) => my_reverse(tail) |> Cons(x, to_list(tail))
  hint: Fix the expression type or change the expected type
   |
38 |     Cons(x, tail) => my_reverse(tail) |> Cons(x, to_list(tail))
   |                                          ^^^^

5 error(s) found
FAILED: /tmp/dojo-custom-linked-list-2.almd
Compile error for /tmp/dojo-custom-linked-list-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
type MyList =
  | Nil
  | Cons(Int, MyList)

fn from_list(xs: List[Int]) -> MyList =
  match xs {
    Nil => Nil
    Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(x, to_list(tail))
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }
```

**Diagnostic:**

```
error[E005]: Cons() argument 2 expects MyList but got List[Int]
  --> /tmp/dojo-custom-linked-list-3.almd:14:38
  in constructor Cons()
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Cons(Int, MyList) expects argument #2 to be MyList, got List[Int]
   |
14 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-3.almd:38:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
38 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-3.almd:14:38
  in fn 'to_list'
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Fix the expression type or change the expected type
   |
14 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^

3 error(s) found
FAILED: /tmp/dojo-custom-linked-list-3.almd
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
