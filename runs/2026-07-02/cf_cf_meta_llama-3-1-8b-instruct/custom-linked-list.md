# custom-linked-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

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
    Cons(x, tail) =>
      if pred(x) then
        Cons(x, my_filter(tail, pred))
      else
        my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  fn aux(ml: MyList, acc: My
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-0.almd
error: Expected expression at line 36:3 (got Fn 'fn')
  --> /tmp/dojo-custom-linked-list-0.almd:36:3
   |
36 |   fn aux(ml: MyList, acc: My
   |   ^
error: Expected ')' to close function parameters opened at line 36:9
  --> /tmp/dojo-custom-linked-list-0.almd:38:1
  hint: Add ')' or check for a missing delimiter inside the function parameters
   |
36 |   fn aux(ml: MyList, acc: My
   |         --------------- '(' opened here
...
38 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^^^^
error[E005]: argument 'xs' expects List[A] but got Cons
  --> /tmp/dojo-custom-linked-list-0.almd:10:38
  in call to list.reverse()
  hint: Fix the argument type
   |
10 |     Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
   |                                      ^^^^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:40:40
  in call to my_len()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_len[MyList](...)
   |
13 | fn my_len(ml: MyList) -> Int =
   | ------------------------ fn my_len() defined here
...
40 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:43:65
  in call to my_map()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_map[MyList](...)
   |
19 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
   | ------------------------ fn my_map() defined here
...
43 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-0.almd:4:38
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
4 |     Cons(x, xs) => Cons(x, from_list(xs))
  |                                      ^^
error[E001]: type mismatch in fn 'from_list': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:4:38
  in fn 'from_list'
  hint: Fix the expression type or change the expected type
  |
4 |     Cons(x, xs) => Cons(x, from_list(xs))
  |                                      ^^
error[E001]: type mismatch in call to list.reverse(): expected List[A] but got Cons
  --> /tmp/dojo-custom-linked-list-0.almd:10:38
  in call to list.reverse()
  hint: Fix the expression type or change the expected type
   |
10 |     Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
   |                                      ^^^^
error[E001]: type mismatch in match arm: expected Nil but got List[?0]
  --> /tmp/dojo-custom-linked-list-0.almd:10:38
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
10 |     Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
   |                                      ^^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:10:38
  in fn 'to_list'
  hint: Fix the expression type or change the expected type
   |
10 |     Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
   |                                      ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-0.almd:22:46
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
22 |     Cons(x, tail) => Cons(f(x), my_map(tail, f))
   |                                              ^
error[E001]: type mismatch in fn 'my_map': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:22:46
  in fn 'my_map'
  hint: Fix the expression type or change the expected type
   |
22 |     Cons(x, tail) => Cons(f(x), my_map(tail, f))
   |                                              ^
error[E001]: type mismatch in if branches: expected Cons but got MyList
  --> /tmp/dojo-custom-linked-list-0.almd:32:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
32 |         my_filter(tail, pred)
   |                         ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-0.almd:32:25
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
32 |         my_filter(tail, pred)
   |                         ^^^^
error[E001]: type mismatch in fn 'my_filter': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:32:25
  in fn 'my_filter'
  hint: Fix the expression type or change the expected type
   |
32 |         my_filter(tail, pred)
   |                         ^^^^
error[E001]: type mismatch in call to my_len(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:40:40
  in call to my_len()
  hint: Fix the expression type or change the expected type
   |
40 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E001]: type mismatch in call to my_map(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:43:65
  in call to my_map()
  hint: Fix the expression type or change the expected type
   |
43 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^

17 error(s) found
Compile error for /tmp/dojo-custom-linked-list-0.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

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
    Cons(x, tail) =>
      if pred(x) then
        Cons(x, my_filter(tail, pred))
      else
        my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  fn aux(ml: MyList, acc: My
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-1.almd
error: Expected expression at line 36:3 (got Fn 'fn')
  --> /tmp/dojo-custom-linked-list-1.almd:36:3
   |
36 |   fn aux(ml: MyList, acc: My
   |   ^
error: Expected ')' to close function parameters opened at line 36:9
  --> /tmp/dojo-custom-linked-list-1.almd:38:1
  hint: Add ')' or check for a missing delimiter inside the function parameters
   |
36 |   fn aux(ml: MyList, acc: My
   |         --------------- '(' opened here
...
38 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^^^^
error[E005]: argument 'xs' expects List[A] but got Cons
  --> /tmp/dojo-custom-linked-list-1.almd:10:38
  in call to list.reverse()
  hint: Fix the argument type
   |
10 |     Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
   |                                      ^^^^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:40:40
  in call to my_len()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_len[MyList](...)
   |
13 | fn my_len(ml: MyList) -> Int =
   | ------------------------ fn my_len() defined here
...
40 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:43:65
  in call to my_map()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_map[MyList](...)
   |
19 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
   | ------------------------ fn my_map() defined here
...
43 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-1.almd:4:38
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
4 |     Cons(x, xs) => Cons(x, from_list(xs))
  |                                      ^^
error[E001]: type mismatch in fn 'from_list': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:4:38
  in fn 'from_list'
  hint: Fix the expression type or change the expected type
  |
4 |     Cons(x, xs) => Cons(x, from_list(xs))
  |                                      ^^
error[E001]: type mismatch in call to list.reverse(): expected List[A] but got Cons
  --> /tmp/dojo-custom-linked-list-1.almd:10:38
  in call to list.reverse()
  hint: Fix the expression type or change the expected type
   |
10 |     Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
   |                                      ^^^^
error[E001]: type mismatch in match arm: expected Nil but got List[?0]
  --> /tmp/dojo-custom-linked-list-1.almd:10:38
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
10 |     Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
   |                                      ^^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:10:38
  in fn 'to_list'
  hint: Fix the expression type or change the expected type
   |
10 |     Cons(x, tail) => Cons(x, to_list(tail)) |> list.reverse
   |                                      ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-1.almd:22:46
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
22 |     Cons(x, tail) => Cons(f(x), my_map(tail, f))
   |                                              ^
error[E001]: type mismatch in fn 'my_map': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:22:46
  in fn 'my_map'
  hint: Fix the expression type or change the expected type
   |
22 |     Cons(x, tail) => Cons(f(x), my_map(tail, f))
   |                                              ^
error[E001]: type mismatch in if branches: expected Cons but got MyList
  --> /tmp/dojo-custom-linked-list-1.almd:32:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
32 |         my_filter(tail, pred)
   |                         ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-1.almd:32:25
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
32 |         my_filter(tail, pred)
   |                         ^^^^
error[E001]: type mismatch in fn 'my_filter': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:32:25
  in fn 'my_filter'
  hint: Fix the expression type or change the expected type
   |
32 |         my_filter(tail, pred)
   |                         ^^^^
error[E001]: type mismatch in call to my_len(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:40:40
  in call to my_len()
  hint: Fix the expression type or change the expected type
   |
40 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E001]: type mismatch in call to my_map(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:43:65
  in call to my_map()
  hint: Fix the expression type or change the expected type
   |
43 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^

17 error(s) found
Compile error for /tmp/dojo-custom-linked-list-1.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
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
    Cons(x, tail) =>
      if pred(x) then
        Cons(x, my_filter(tail, pred))
      else
        my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  fn aux(ml: MyList, acc: MyList) -> My
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-2.almd
error: Expected expression at line 36:3 (got Fn 'fn')
  --> /tmp/dojo-custom-linked-list-2.almd:36:3
   |
36 |   fn aux(ml: MyList, acc: MyList) -> My
   |   ^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:40:40
  in call to my_len()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_len[MyList](...)
   |
13 | fn my_len(ml: MyList) -> Int =
   | ------------------------ fn my_len() defined here
...
40 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:43:65
  in call to my_map()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_map[MyList](...)
   |
19 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
   | ------------------------ fn my_map() defined here
...
43 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-2.almd:4:38
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
4 |     Cons(x, xs) => Cons(x, from_list(xs))
  |                                      ^^
error[E001]: type mismatch in fn 'from_list': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:4:38
  in fn 'from_list'
  hint: Fix the expression type or change the expected type
  |
4 |     Cons(x, xs) => Cons(x, from_list(xs))
  |                                      ^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-2.almd:10:38
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
10 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:10:38
  in fn 'to_list'
  hint: Fix the expression type or change the expected type
   |
10 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-2.almd:22:46
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
22 |     Cons(x, tail) => Cons(f(x), my_map(tail, f))
   |                                              ^
error[E001]: type mismatch in fn 'my_map': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:22:46
  in fn 'my_map'
  hint: Fix the expression type or change the expected type
   |
22 |     Cons(x, tail) => Cons(f(x), my_map(tail, f))
   |                                              ^
error[E001]: type mismatch in if branches: expected Cons but got MyList
  --> /tmp/dojo-custom-linked-list-2.almd:32:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
32 |         my_filter(tail, pred)
   |                         ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-2.almd:32:25
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
32 |         my_filter(tail, pred)
   |                         ^^^^
error[E001]: type mismatch in fn 'my_filter': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:32:25
  in fn 'my_filter'
  hint: Fix the expression type or change the expected type
   |
32 |         my_filter(tail, pred)
   |                         ^^^^
error[E001]: type mismatch in call to my_len(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:40:40
  in call to my_len()
  hint: Fix the expression type or change the expected type
   |
40 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E001]: type mismatch in call to my_map(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:43:65
  in call to my_map()
  hint: Fix the expression type or change the expected type
   |
43 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^

14 error(s) found
Compile error for /tmp/dojo-custom-linked-list-2.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
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
    Cons(x, tail) =>
      if pred(x) then
        Cons(x, my_filter(tail, pred))
      else
        my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail)
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-3.almd
error: Expected FatArrow at line 38:18 (got Newline '')
  --> /tmp/dojo-custom-linked-list-3.almd:38:18
   |
38 |     Cons(x, tail)
   |                  ^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:42:40
  in call to my_len()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_len[MyList](...)
   |
13 | fn my_len(ml: MyList) -> Int =
   | ------------------------ fn my_len() defined here
...
42 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:45:65
  in call to my_map()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_map[MyList](...)
   |
19 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
   | ------------------------ fn my_map() defined here
...
45 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-3.almd:4:38
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
4 |     Cons(x, xs) => Cons(x, from_list(xs))
  |                                      ^^
error[E001]: type mismatch in fn 'from_list': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:4:38
  in fn 'from_list'
  hint: Fix the expression type or change the expected type
  |
4 |     Cons(x, xs) => Cons(x, from_list(xs))
  |                                      ^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-3.almd:10:38
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
10 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:10:38
  in fn 'to_list'
  hint: Fix the expression type or change the expected type
   |
10 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-3.almd:22:46
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
22 |     Cons(x, tail) => Cons(f(x), my_map(tail, f))
   |                                              ^
error[E001]: type mismatch in fn 'my_map': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:22:46
  in fn 'my_map'
  hint: Fix the expression type or change the expected type
   |
22 |     Cons(x, tail) => Cons(f(x), my_map(tail, f))
   |                                              ^
error[E001]: type mismatch in if branches: expected Cons but got MyList
  --> /tmp/dojo-custom-linked-list-3.almd:32:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
32 |         my_filter(tail, pred)
   |                         ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-3.almd:32:25
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
32 |         my_filter(tail, pred)
   |                         ^^^^
error[E001]: type mismatch in fn 'my_filter': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:32:25
  in fn 'my_filter'
  hint: Fix the expression type or change the expected type
   |
32 |         my_filter(tail, pred)
   |                         ^^^^
error[E001]: type mismatch in call to my_len(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:42:40
  in call to my_len()
  hint: Fix the expression type or change the expected type
   |
42 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E001]: type mismatch in call to my_map(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:45:65
  in call to my_map()
  hint: Fix the expression type or change the expected type
   |
45 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^

14 error(s) found
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```
