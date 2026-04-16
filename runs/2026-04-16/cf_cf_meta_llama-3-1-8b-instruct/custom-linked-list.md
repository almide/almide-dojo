# custom-linked-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
type MyList =
    | Nil
    | Cons(Int, MyList);

fn from_list(xs: List[Int]) -> MyList {
    match xs {
        List::Nil => Nil,
        List::Cons(head, tail) => Cons(head, from_list(tail)),
    }
}

fn to_list(ml: MyList) -> List[Int] {
    match ml {
        Nil => List::Nil,
        Cons(head, tail) => List::Cons(head, to_list(tail)),
    }
}

fn my_len(ml: MyList) -> Int {
    match ml {
        Nil => 0,
        Cons(_, tail) => 1 + my_len(tail),
    }
}

fn my_map(ml: MyList, f: fn(Int) -> Int) -> MyList {
    match ml {
        Nil => Nil,
        Cons(head, tail) => Cons(f(head), my_map(tail, f)),
    }
}

fn my_filter(ml: MyList, pred: fn(Int) -> Bool) -> MyList {
    match ml {
        Nil => Nil,
        Cons(head, tail) => if pred(head) {
            Cons(head, my_filter(tail, pred))
        } else {
            my_filter(tail,
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-0.almd
error: Semicolons are not used in Almide at line 3:24
  --> /tmp/dojo-custom-linked-list-0.almd:3:24
  hint: Remove the ';'. Almide uses newlines to separate statements.
  |
3 |     | Cons(Int, MyList);
  |                        ^
error: Missing '=' before function body at line 5:39
  --> /tmp/dojo-custom-linked-list-0.almd:5:39
  hint: Almide requires '=' before the body. Write: fn from_list(...) -> Type = { ... }
  |
5 | fn from_list(xs: List[Int]) -> MyList {
  |                                       ^
error: Missing '=' before function body at line 12:37
  --> /tmp/dojo-custom-linked-list-0.almd:12:37
  hint: Almide requires '=' before the body. Write: fn to_list(...) -> Type = { ... }
   |
12 | fn to_list(ml: MyList) -> List[Int] {
   |                                     ^
error: Missing '=' before function body at line 19:30
  --> /tmp/dojo-custom-linked-list-0.almd:19:30
  hint: Almide requires '=' before the body. Write: fn my_len(...) -> Type = { ... }
   |
19 | fn my_len(ml: MyList) -> Int {
   |                              ^
error: Missing '=' before function body at line 26:52
  --> /tmp/dojo-custom-linked-list-0.almd:26:52
  hint: Almide requires '=' before the body. Write: fn my_map(...) -> Type = { ... }
   |
26 | fn my_map(ml: MyList, f: fn(Int) -> Int) -> MyList {
   |                                                    ^
error: Missing '=' before function body at line 33:59
  --> /tmp/dojo-custom-linked-list-0.almd:33:59
  hint: Almide requires '=' before the body. Write: fn my_filter(...) -> Type = { ... }
   |
33 | fn my_filter(ml: MyList, pred: fn(Int) -> Bool) -> MyList {
   |                                                           ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-0.almd:49:67
  in call to my_reverse()
  hint: Check the function name
   |
49 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-0.almd:50:56
  in call to my_reverse()
  hint: Check the function name
   |
50 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-0.almd:51:68
  in call to my_reverse()
  hint: Check the function name
   |
51 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^

9 error(s) found
Compile error for /tmp/dojo-custom-linked-list-0.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
type MyList =
    | Nil
    | Cons(Int, MyList);

fn from_list(xs: List[Int]) -> MyList = {
    match xs {
        List::Nil => Nil,
        List::Cons(head, tail) => Cons(head, from_list(tail)),
    }
}

fn to_list(ml: MyList) -> List[Int] = {
    match ml {
        Nil => List::Nil,
        Cons(head, tail) => List::Cons(head, to_list(tail)),
    }
}

fn my_len(ml: MyList) -> Int = {
    match ml {
        Nil => 0,
        Cons(_, tail) => 1 + my_len(tail),
    }
}

fn my_map(ml: MyList, f: fn(Int) -> Int) -> MyList = {
    match ml {
        Nil => Nil,
        Cons(head, tail) => Cons(f(head), my_map(tail, f)),
    }
}

fn my_filter(ml: MyList, pred: fn(Int) -> Bool) -> MyList = {
    match ml {
        Nil => Nil,
        Cons(head, tail) => if pred(head) {
            Cons(head, my_filter(tail, pred))
        } else {
            my_filter(t
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-1.almd
error: Semicolons are not used in Almide at line 3:24
  --> /tmp/dojo-custom-linked-list-1.almd:3:24
  hint: Remove the ';'. Almide uses newlines to separate statements.
  |
3 |     | Cons(Int, MyList);
  |                        ^
error: Expected FatArrow at line 7:13 (got Colon ':')
  --> /tmp/dojo-custom-linked-list-1.almd:7:13
  hint: `head :: tail` (cons pattern) is Haskell/OCaml/Elm syntax. Almide list patterns use [] / [a, b] literals only. For head/tail recursion, use `list.first(xs)` and `list.drop(xs, 1)` on the non-empty arm.
  |
7 |         List::Nil => Nil,
  |             ^
error: '::' is not valid in Almide at line 8:13
  --> /tmp/dojo-custom-linked-list-1.almd:8:13
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
  |
8 |         List::Cons(head, tail) => Cons(head, from_list(tail)),
  |             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:1 (got RBrace '}')
  --> /tmp/dojo-custom-linked-list-1.almd:10:1
   |
10 | }
   | ^
error: Expected pattern at line 14:20 (got Colon ':')
  --> /tmp/dojo-custom-linked-list-1.almd:14:20
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
14 |         Nil => List::Nil,
   |                    ^
error: Expected expression at line 15:26 (got FatArrow '=>')
  --> /tmp/dojo-custom-linked-list-1.almd:15:26
   |
15 |         Cons(head, tail) => List::Cons(head, to_list(tail)),
   |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 17:1 (got RBrace '}')
  --> /tmp/dojo-custom-linked-list-1.almd:17:1
   |
17 | }
   | ^
error: Expected Then at line 36:43 (got LBrace '{')
  --> /tmp/dojo-custom-linked-list-1.almd:36:43
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
36 |         Cons(head, tail) => if pred(head) {
   |                                           ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 38:11 (got Else 'else')
  --> /tmp/dojo-custom-linked-list-1.almd:38:11
   |
38 |         } else {
   |           ^
error[E003]: undefined variable 'head'
  --> /tmp/dojo-custom-linked-list-1.almd:15:14
  in variable head
  hint: Check the variable name
   |
15 |         Cons(head, tail) => List::Cons(head, to_list(tail)),
   |              ^^^^
error[E003]: undefined variable 'tail'
  --> /tmp/dojo-custom-linked-list-1.almd:15:20
  in variable tail
  hint: Check the variable name
   |
15 |         Cons(head, tail) => List::Cons(head, to_list(tail)),
   |                    ^^^^
error[E003]: undefined variable 'head'
  --> /tmp/dojo-custom-linked-list-1.almd:37:18
  in variable head
  hint: Check the variable name
   |
37 |             Cons(head, my_filter(tail, pred))
   |                  ^^^^
error[E003]: undefined variable 'tail'
  --> /tmp/dojo-custom-linked-list-1.almd:37:34
  in variable tail
  hint: Check the variable name
   |
37 |             Cons(head, my_filter(tail, pred))
   |                                  ^^^^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-1.almd:49:67
  in call to my_reverse()
  hint: Check the function name
   |
49 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-1.almd:50:56
  in call to my_reverse()
  hint: Check the function name
   |
50 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-1.almd:51:68
  in call to my_reverse()
  hint: Check the function name
   |
51 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E001]: type mismatch in fn 'from_list': expected MyList but got Unit
  --> /tmp/dojo-custom-linked-list-1.almd:8:9
  in fn 'from_list'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to MyList:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type MyList
  |
8 |         List::Cons(head, tail) => Cons(head, from_list(tail)),
  |         ^^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got Unit
  --> /tmp/dojo-custom-linked-list-1.almd:15:20
  in fn 'to_list'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[Int]
   |
15 |         Cons(head, tail) => List::Cons(head, to_list(tail)),
   |                    ^^^^

18 error(s) found
Compile error for /tmp/dojo-custom-linked-list-1.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
type MyList =
    | Nil
    | Cons(Int, MyList);

fn from_list(xs: List[Int]) -> MyList = {
    match xs {
        List::Nil => Nil,
        List::Cons(head, tail) => Cons(head, from_list(tail)),
    }
}

fn to_list(ml: MyList) -> List[Int] = {
    match ml {
        Nil => List::Nil,
        Cons(head, tail) => List::Cons(head, to_list(tail)),
    }
}

fn my_len(ml: MyList) -> Int = {
    match ml {
        Nil => 0,
        Cons(_, tail) => 1 + my_len(tail),
    }
}

fn my_map(ml: MyList, f: fn(Int) -> Int) -> MyList = {
    match ml {
        Nil => Nil,
        Cons(head, tail) => Cons(f(head), my_map(tail, f)),
    }
}

fn my_filter(ml: MyList, pred: fn(Int) -> Bool) -> MyList = {
    match ml {
        Nil => Nil,
        Cons(head, tail) => if pred(head) {
            Cons(head, my_filter(tail, pred))
        } else {
            my_filter(t
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-2.almd
error: Semicolons are not used in Almide at line 3:24
  --> /tmp/dojo-custom-linked-list-2.almd:3:24
  hint: Remove the ';'. Almide uses newlines to separate statements.
  |
3 |     | Cons(Int, MyList);
  |                        ^
error: Expected FatArrow at line 7:13 (got Colon ':')
  --> /tmp/dojo-custom-linked-list-2.almd:7:13
  hint: `head :: tail` (cons pattern) is Haskell/OCaml/Elm syntax. Almide list patterns use [] / [a, b] literals only. For head/tail recursion, use `list.first(xs)` and `list.drop(xs, 1)` on the non-empty arm.
  |
7 |         List::Nil => Nil,
  |             ^
error: '::' is not valid in Almide at line 8:13
  --> /tmp/dojo-custom-linked-list-2.almd:8:13
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
  |
8 |         List::Cons(head, tail) => Cons(head, from_list(tail)),
  |             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:1 (got RBrace '}')
  --> /tmp/dojo-custom-linked-list-2.almd:10:1
   |
10 | }
   | ^
error: Expected pattern at line 14:20 (got Colon ':')
  --> /tmp/dojo-custom-linked-list-2.almd:14:20
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
14 |         Nil => List::Nil,
   |                    ^
error: Expected expression at line 15:26 (got FatArrow '=>')
  --> /tmp/dojo-custom-linked-list-2.almd:15:26
   |
15 |         Cons(head, tail) => List::Cons(head, to_list(tail)),
   |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 17:1 (got RBrace '}')
  --> /tmp/dojo-custom-linked-list-2.almd:17:1
   |
17 | }
   | ^
error: Expected Then at line 36:43 (got LBrace '{')
  --> /tmp/dojo-custom-linked-list-2.almd:36:43
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
36 |         Cons(head, tail) => if pred(head) {
   |                                           ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 38:11 (got Else 'else')
  --> /tmp/dojo-custom-linked-list-2.almd:38:11
   |
38 |         } else {
   |           ^
error[E003]: undefined variable 'head'
  --> /tmp/dojo-custom-linked-list-2.almd:15:14
  in variable head
  hint: Check the variable name
   |
15 |         Cons(head, tail) => List::Cons(head, to_list(tail)),
   |              ^^^^
error[E003]: undefined variable 'tail'
  --> /tmp/dojo-custom-linked-list-2.almd:15:20
  in variable tail
  hint: Check the variable name
   |
15 |         Cons(head, tail) => List::Cons(head, to_list(tail)),
   |                    ^^^^
error[E003]: undefined variable 'head'
  --> /tmp/dojo-custom-linked-list-2.almd:37:18
  in variable head
  hint: Check the variable name
   |
37 |             Cons(head, my_filter(tail, pred))
   |                  ^^^^
error[E003]: undefined variable 'tail'
  --> /tmp/dojo-custom-linked-list-2.almd:37:34
  in variable tail
  hint: Check the variable name
   |
37 |             Cons(head, my_filter(tail, pred))
   |                                  ^^^^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-2.almd:49:67
  in call to my_reverse()
  hint: Check the function name
   |
49 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-2.almd:50:56
  in call to my_reverse()
  hint: Check the function name
   |
50 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-2.almd:51:68
  in call to my_reverse()
  hint: Check the function name
   |
51 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E001]: type mismatch in fn 'from_list': expected MyList but got Unit
  --> /tmp/dojo-custom-linked-list-2.almd:8:9
  in fn 'from_list'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to MyList:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type MyList
  |
8 |         List::Cons(head, tail) => Cons(head, from_list(tail)),
  |         ^^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got Unit
  --> /tmp/dojo-custom-linked-list-2.almd:15:20
  in fn 'to_list'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[Int]
   |
15 |         Cons(head, tail) => List::Cons(head, to_list(tail)),
   |                    ^^^^

18 error(s) found
Compile error for /tmp/dojo-custom-linked-list-2.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
type MyList =
    | Nil
    | Cons(Int, MyList);

fn from_list(xs: List[Int]) -> MyList = {
    let rec helper(xs: List[Int]) -> MyList = {
        match xs {
            List::Nil => Nil,
            List::Cons(head, tail) => Cons(head, helper(tail)),
        }
    };
    helper(xs)
}

fn to_list(ml: MyList) -> List[Int] = {
    let rec helper(ml: MyList) -> List[Int] = {
        match ml {
            Nil => List::Nil,
            Cons(head, tail) => List::Cons(head, helper(tail)),
        }
    };
    helper(ml)
}

fn my_len(ml: MyList) -> Int = {
    let rec helper(ml: MyList) -> Int = {
        match ml {
            Nil => 0,
            Cons(_, tail) => 1 + helper(tail),
        }
    };
    helper(ml)
}

fn my_map(ml: MyList, f: fn(Int) -> Int) -> MyList = {
    let rec helper(ml: MyList) -> MyList = {
        match ml {
            Nil => Nil,
            Cons(head, tail) => Cons(f(head),
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-3.almd
error: Semicolons are not used in Almide at line 3:24
  --> /tmp/dojo-custom-linked-list-3.almd:3:24
  hint: Remove the ';'. Almide uses newlines to separate statements.
  |
3 |     | Cons(Int, MyList);
  |                        ^
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-custom-linked-list-3.almd:6:9
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
6 |     let rec helper(xs: List[Int]) -> MyList = {
  |         ^^^
error: Expected FatArrow at line 8:17 (got Colon ':')
  --> /tmp/dojo-custom-linked-list-3.almd:8:17
  hint: `head :: tail` (cons pattern) is Haskell/OCaml/Elm syntax. Almide list patterns use [] / [a, b] literals only. For head/tail recursion, use `list.first(xs)` and `list.drop(xs, 1)` on the non-empty arm.
  |
8 |             List::Nil => Nil,
  |                 ^
error: '::' is not valid in Almide at line 9:17
  --> /tmp/dojo-custom-linked-list-3.almd:9:17
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
  |
9 |             List::Cons(head, tail) => Cons(head, helper(tail)),
  |                 ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:5 (got RBrace '}')
  --> /tmp/dojo-custom-linked-list-3.almd:11:5
   |
11 |     };
   |     ^
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-custom-linked-list-3.almd:16:9
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
   |
16 |     let rec helper(ml: MyList) -> List[Int] = {
   |         ^^^
error: Expected pattern at line 18:24 (got Colon ':')
  --> /tmp/dojo-custom-linked-list-3.almd:18:24
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
18 |             Nil => List::Nil,
   |                        ^
error: Expected expression at line 19:30 (got FatArrow '=>')
  --> /tmp/dojo-custom-linked-list-3.almd:19:30
   |
19 |             Cons(head, tail) => List::Cons(head, helper(tail)),
   |                              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 21:5 (got RBrace '}')
  --> /tmp/dojo-custom-linked-list-3.almd:21:5
   |
21 |     };
   |     ^
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-custom-linked-list-3.almd:26:9
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
   |
26 |     let rec helper(ml: MyList) -> Int = {
   |         ^^^
error: Semicolons are not used in Almide at line 31:6
  --> /tmp/dojo-custom-linked-list-3.almd:31:6
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
31 |     };
   |      ^
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-custom-linked-list-3.almd:36:9
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
   |
36 |     let rec helper(ml: MyList) -> MyList = {
   |         ^^^
error: Expected expression at line 41:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-3.almd:41:1
   |
41 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^
error[E003]: undefined variable 'head'
  --> /tmp/dojo-custom-linked-list-3.almd:19:18
  in variable head
  hint: Check the variable name
   |
19 |             Cons(head, tail) => List::Cons(head, helper(tail)),
   |                  ^^^^
error[E003]: undefined variable 'tail'
  --> /tmp/dojo-custom-linked-list-3.almd:19:24
  in variable tail
  hint: Check the variable name
   |
19 |             Cons(head, tail) => List::Cons(head, helper(tail)),
   |                        ^^^^
error[E002]: undefined function 'helper'
  --> /tmp/dojo-custom-linked-list-3.almd:29:41
  in call to helper()
  hint: Check the function name
   |
29 |             Cons(_, tail) => 1 + helper(tail),
   |                                         ^^^^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-3.almd:47:98
  in call to my_filter()
  hint: Did you mean `map.filter`?
  try:
      // my_filter(...)  →  map.filter(...)
      map.filter(...)
   |
47 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                                                  ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-3.almd:48:91
  in call to my_filter()
  hint: Did you mean `map.filter`?
  try:
      // my_filter(...)  →  map.filter(...)
      map.filter(...)
   |
48 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-3.almd:49:67
  in call to my_reverse()
  hint: Check the function name
   |
49 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-3.almd:50:56
  in call to my_reverse()
  hint: Check the function name
   |
50 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-3.almd:51:68
  in call to my_reverse()
  hint: Check the function name
   |
51 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E001]: type mismatch in fn 'from_list': expected MyList but got Unit
  --> /tmp/dojo-custom-linked-list-3.almd:9:13
  in fn 'from_list'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to MyList:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type MyList
  |
9 |             List::Cons(head, tail) => Cons(head, helper(tail)),
  |             ^^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got Unit
  --> /tmp/dojo-custom-linked-list-3.almd:19:24
  in fn 'to_list'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[Int]
   |
19 |             Cons(head, tail) => List::Cons(head, helper(tail)),
   |                        ^^^^
error[E001]: type mismatch in fn 'my_map': expected MyList but got Unit
  --> /tmp/dojo-custom-linked-list-3.almd:35:54
  in fn 'my_map'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to MyList:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type MyList
   |
35 | fn my_map(ml: MyList, f: fn(Int) -> Int) -> MyList = {
   |                                                      ^

24 error(s) found
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```
