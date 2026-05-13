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
        List::Cons(x, xs) => Cons(x, from_list(xs)),
    }
}

fn to_list(ml: MyList) -> List[Int] {
    match ml {
        Nil => List::Nil,
        Cons(x, ml) => List::Cons(x, to_list(ml)),
    }
}

fn my_len(ml: MyList) -> Int {
    match ml {
        Nil => 0,
        Cons(_, ml) => 1 + my_len(ml),
    }
}

fn my_map(ml: MyList, f: fn(Int) -> Int) -> MyList {
    match ml {
        Nil => Nil,
        Cons(x, ml) => Cons(f(x), my_map(ml, f)),
    }
}

fn my_filter(ml: MyList, pred: fn(Int) -> Bool) -> MyList {
    match ml {
        Nil => Nil,
        Cons(x, ml) => if pred(x) {
            Cons(x, my_filter(ml, pred))
        } else {
            my_filter(ml, pred)
        },
    }
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
  --> /tmp/dojo-custom-linked-list-0.almd:51:67
  in call to my_reverse()
  hint: Check the function name
   |
51 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-0.almd:52:56
  in call to my_reverse()
  hint: Check the function name
   |
52 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-0.almd:53:68
  in call to my_reverse()
  hint: Check the function name
   |
53 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
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

fn from_list(xs: List[Int]) -> MyList = match xs {
    List::Nil => Nil,
    List::Cons(x, xs) => Cons(x, from_list(xs)),
}

fn to_list(ml: MyList) -> List[Int] = match ml {
    Nil => List::Nil,
    Cons(x, ml) => List::Cons(x, to_list(ml)),
}

fn my_len(ml: MyList) -> Int = match ml {
    Nil => 0,
    Cons(_, ml) => 1 + my_len(ml),
}

fn my_map(ml: MyList, f: fn(Int) -> Int) -> MyList = match ml {
    Nil => Nil,
    Cons(x, ml) => Cons(f(x), my_map(ml, f)),
}

fn my_filter(ml: MyList, pred: fn(Int) -> Bool) -> MyList = match ml {
    Nil => Nil,
    Cons(x, ml) => if pred(x) {
        Cons(x, my_filter(ml, pred))
    } else {
        my_filter(ml, pred)
    },
}

fn my_reverse(ml: MyList) -> MyList = match ml {
    Nil
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
error: Expected FatArrow at line 6:9 (got Colon ':')
  --> /tmp/dojo-custom-linked-list-1.almd:6:9
  hint: `head :: tail` (cons pattern) is Haskell/OCaml/Elm syntax. Almide list patterns use [] / [a, b] literals only. For head/tail recursion, use `list.first(xs)` and `list.drop(xs, 1)` on the non-empty arm.
  |
6 |     List::Nil => Nil,
  |         ^
error: Expected pattern at line 11:16 (got Colon ':')
  --> /tmp/dojo-custom-linked-list-1.almd:11:16
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
11 |     Nil => List::Nil,
   |                ^
error: Expected Then at line 27:31 (got LBrace '{')
  --> /tmp/dojo-custom-linked-list-1.almd:27:31
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
27 |     Cons(x, ml) => if pred(x) {
   |                               ^
error: Expected FatArrow at line 35:8 (got Newline '')
  --> /tmp/dojo-custom-linked-list-1.almd:35:8
   |
35 |     Nil
   |        ^

5 error(s) found
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

fn from_list(xs: List[Int]) -> MyList = match xs {
    List::Nil => Nil,
    List::Cons(x, xs) => Cons(x, from_list(xs)),
}

fn to_list(ml: MyList) -> List[Int] = match ml {
    Nil => List::Nil,
    Cons(x, ml) => List::Cons(x, to_list(ml)),
}

fn my_len(ml: MyList) -> Int = match ml {
    Nil => 0,
    Cons(_, ml) => 1 + my_len(ml),
}

fn my_map(ml: MyList, f: fn(Int) -> Int) -> MyList = match ml {
    Nil => Nil,
    Cons(x, ml) => Cons(f(x), my_map(ml, f)),
}

fn my_filter(ml: MyList, pred: fn(Int) -> Bool) -> MyList = match ml {
    Nil => Nil,
    Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred),
}

fn my_reverse(ml: MyList) -> MyList = match ml {
    Nil => Nil,
    Cons(x,
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
error: Expected FatArrow at line 6:9 (got Colon ':')
  --> /tmp/dojo-custom-linked-list-2.almd:6:9
  hint: `head :: tail` (cons pattern) is Haskell/OCaml/Elm syntax. Almide list patterns use [] / [a, b] literals only. For head/tail recursion, use `list.first(xs)` and `list.drop(xs, 1)` on the non-empty arm.
  |
6 |     List::Nil => Nil,
  |         ^
error: Expected pattern at line 11:16 (got Colon ':')
  --> /tmp/dojo-custom-linked-list-2.almd:11:16
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
11 |     Nil => List::Nil,
   |                ^
error: Expected pattern at line 32:12 (got Newline '')
  --> /tmp/dojo-custom-linked-list-2.almd:32:12
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     Cons(x,
   |            ^

4 error(s) found
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

fn from_list(xs: List[Int]) -> MyList = match xs {
    List::Nil => Nil,
    List::Cons(x, xs) => Cons(x, from_list(xs)),
}

fn to_list(ml: MyList) -> List[Int] = match ml {
    Nil => List::Nil,
    Cons(x, ml) => List::Cons(x, to_list(ml)),
}

fn my_len(ml: MyList) -> Int = match ml {
    Nil => 0,
    Cons(_, ml) => 1 + my_len(ml),
}

fn my_map(ml: MyList, f: fn(Int) -> Int) -> MyList = match ml {
    Nil => Nil,
    Cons(x, ml) => Cons(f(x), my_map(ml, f)),
}

fn my_filter(ml: MyList, pred: fn(Int) -> Bool) -> MyList = match ml {
    Nil => Nil,
    Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred),
}

fn my_reverse(ml: MyList) -> MyList = match ml {
    Nil => Nil,
    Cons(x,
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
error: Expected FatArrow at line 6:9 (got Colon ':')
  --> /tmp/dojo-custom-linked-list-3.almd:6:9
  hint: `head :: tail` (cons pattern) is Haskell/OCaml/Elm syntax. Almide list patterns use [] / [a, b] literals only. For head/tail recursion, use `list.first(xs)` and `list.drop(xs, 1)` on the non-empty arm.
  |
6 |     List::Nil => Nil,
  |         ^
error: Expected pattern at line 11:16 (got Colon ':')
  --> /tmp/dojo-custom-linked-list-3.almd:11:16
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
11 |     Nil => List::Nil,
   |                ^
error: Expected pattern at line 32:12 (got Newline '')
  --> /tmp/dojo-custom-linked-list-3.almd:32:12
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     Cons(x,
   |            ^

4 error(s) found
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```
