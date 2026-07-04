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
    Cons(x, ml) => Cons(x, to_list(ml))
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => Cons(f(x), my_map(ml, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) =>
      if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  fn helper(ml: MyList, acc: MyList) -> MyList =
    match ml {
      Nil => acc
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-0.almd
error: Expected expression at line 33:3 (got Fn 'fn')
  --> /tmp/dojo-custom-linked-list-0.almd:33:3
   |
33 |   fn helper(ml: MyList, acc: MyList) -> MyList =
   |   ^
error: Expected pattern at line 37:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-0.almd:37:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
37 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:39:40
  in call to my_len()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_len[MyList](...)
   |
13 | fn my_len(ml: MyList) -> Int =
   | ------------------------ fn my_len() defined here
...
39 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:42:65
  in call to my_map()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_map[MyList](...)
   |
19 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
   | ------------------------ fn my_map() defined here
...
42 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
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
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-0.almd:10:36
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
10 |     Cons(x, ml) => Cons(x, to_list(ml))
   |                                    ^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:10:36
  in fn 'to_list'
  hint: Fix the expression type or change the expected type
   |
10 |     Cons(x, ml) => Cons(x, to_list(ml))
   |                                    ^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-0.almd:22:42
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
22 |     Cons(x, ml) => Cons(f(x), my_map(ml, f))
   |                                          ^
error[E001]: type mismatch in fn 'my_map': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:22:42
  in fn 'my_map'
  hint: Fix the expression type or change the expected type
   |
22 |     Cons(x, ml) => Cons(f(x), my_map(ml, f))
   |                                          ^
error[E001]: type mismatch in if branches: expected Cons but got MyList
  --> /tmp/dojo-custom-linked-list-0.almd:29:71
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
29 |       if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |                                                                       ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-0.almd:29:71
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
29 |       if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |                                                                       ^^^^
error[E001]: type mismatch in fn 'my_filter': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:29:71
  in fn 'my_filter'
  hint: Fix the expression type or change the expected type
   |
29 |       if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |                                                                       ^^^^
error[E001]: type mismatch in call to my_len(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:39:40
  in call to my_len()
  hint: Fix the expression type or change the expected type
   |
39 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E001]: type mismatch in call to my_map(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:42:65
  in call to my_map()
  hint: Fix the expression type or change the expected type
   |
42 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^

15 error(s) found
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
    Cons(x, ml) => Cons(x, to_list(ml))
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => Cons(f(x), my_map(ml, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) =>
      if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  fn helper(ml: MyList, acc: MyList) -> MyList =
    match ml {
      Nil => acc
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-1.almd
error: Expected expression at line 33:3 (got Fn 'fn')
  --> /tmp/dojo-custom-linked-list-1.almd:33:3
   |
33 |   fn helper(ml: MyList, acc: MyList) -> MyList =
   |   ^
error: Expected pattern at line 37:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-1.almd:37:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
37 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:39:40
  in call to my_len()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_len[MyList](...)
   |
13 | fn my_len(ml: MyList) -> Int =
   | ------------------------ fn my_len() defined here
...
39 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:42:65
  in call to my_map()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_map[MyList](...)
   |
19 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
   | ------------------------ fn my_map() defined here
...
42 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
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
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-1.almd:10:36
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
10 |     Cons(x, ml) => Cons(x, to_list(ml))
   |                                    ^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:10:36
  in fn 'to_list'
  hint: Fix the expression type or change the expected type
   |
10 |     Cons(x, ml) => Cons(x, to_list(ml))
   |                                    ^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-1.almd:22:42
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
22 |     Cons(x, ml) => Cons(f(x), my_map(ml, f))
   |                                          ^
error[E001]: type mismatch in fn 'my_map': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:22:42
  in fn 'my_map'
  hint: Fix the expression type or change the expected type
   |
22 |     Cons(x, ml) => Cons(f(x), my_map(ml, f))
   |                                          ^
error[E001]: type mismatch in if branches: expected Cons but got MyList
  --> /tmp/dojo-custom-linked-list-1.almd:29:71
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
29 |       if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |                                                                       ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-1.almd:29:71
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
29 |       if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |                                                                       ^^^^
error[E001]: type mismatch in fn 'my_filter': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:29:71
  in fn 'my_filter'
  hint: Fix the expression type or change the expected type
   |
29 |       if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |                                                                       ^^^^
error[E001]: type mismatch in call to my_len(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:39:40
  in call to my_len()
  hint: Fix the expression type or change the expected type
   |
39 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E001]: type mismatch in call to my_map(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:42:65
  in call to my_map()
  hint: Fix the expression type or change the expected type
   |
42 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^

15 error(s) found
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
    Cons(x, ml) => Cons(x, to_list(ml))
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => Cons(f(x), my_map(ml, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) =>
      if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  fn helper(ml: MyList, acc: MyList) -> MyList =
    match ml {
      Nil => acc
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-2.almd
error: Expected expression at line 33:3 (got Fn 'fn')
  --> /tmp/dojo-custom-linked-list-2.almd:33:3
   |
33 |   fn helper(ml: MyList, acc: MyList) -> MyList =
   |   ^
error: Expected pattern at line 37:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-2.almd:37:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
37 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:39:40
  in call to my_len()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_len[MyList](...)
   |
13 | fn my_len(ml: MyList) -> Int =
   | ------------------------ fn my_len() defined here
...
39 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:42:65
  in call to my_map()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_map[MyList](...)
   |
19 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
   | ------------------------ fn my_map() defined here
...
42 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
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
  --> /tmp/dojo-custom-linked-list-2.almd:10:36
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
10 |     Cons(x, ml) => Cons(x, to_list(ml))
   |                                    ^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:10:36
  in fn 'to_list'
  hint: Fix the expression type or change the expected type
   |
10 |     Cons(x, ml) => Cons(x, to_list(ml))
   |                                    ^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-2.almd:22:42
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
22 |     Cons(x, ml) => Cons(f(x), my_map(ml, f))
   |                                          ^
error[E001]: type mismatch in fn 'my_map': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:22:42
  in fn 'my_map'
  hint: Fix the expression type or change the expected type
   |
22 |     Cons(x, ml) => Cons(f(x), my_map(ml, f))
   |                                          ^
error[E001]: type mismatch in if branches: expected Cons but got MyList
  --> /tmp/dojo-custom-linked-list-2.almd:29:71
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
29 |       if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |                                                                       ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-2.almd:29:71
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
29 |       if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |                                                                       ^^^^
error[E001]: type mismatch in fn 'my_filter': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:29:71
  in fn 'my_filter'
  hint: Fix the expression type or change the expected type
   |
29 |       if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |                                                                       ^^^^
error[E001]: type mismatch in call to my_len(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:39:40
  in call to my_len()
  hint: Fix the expression type or change the expected type
   |
39 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E001]: type mismatch in call to my_map(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:42:65
  in call to my_map()
  hint: Fix the expression type or change the expected type
   |
42 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^

15 error(s) found
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
    Cons(x, ml) => Cons(x, to_list(ml))
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => Cons(f(x), my_map(ml, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) =>
      if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  fn helper(ml: MyList, acc: MyList) -> MyList =
    match ml {
      Nil => acc
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-3.almd
error: Expected expression at line 33:3 (got Fn 'fn')
  --> /tmp/dojo-custom-linked-list-3.almd:33:3
   |
33 |   fn helper(ml: MyList, acc: MyList) -> MyList =
   |   ^
error: Expected pattern at line 37:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-3.almd:37:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
37 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:39:40
  in call to my_len()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_len[MyList](...)
   |
13 | fn my_len(ml: MyList) -> Int =
   | ------------------------ fn my_len() defined here
...
39 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:42:65
  in call to my_map()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_map[MyList](...)
   |
19 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
   | ------------------------ fn my_map() defined here
...
42 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
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
  --> /tmp/dojo-custom-linked-list-3.almd:10:36
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
10 |     Cons(x, ml) => Cons(x, to_list(ml))
   |                                    ^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:10:36
  in fn 'to_list'
  hint: Fix the expression type or change the expected type
   |
10 |     Cons(x, ml) => Cons(x, to_list(ml))
   |                                    ^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-3.almd:22:42
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
22 |     Cons(x, ml) => Cons(f(x), my_map(ml, f))
   |                                          ^
error[E001]: type mismatch in fn 'my_map': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:22:42
  in fn 'my_map'
  hint: Fix the expression type or change the expected type
   |
22 |     Cons(x, ml) => Cons(f(x), my_map(ml, f))
   |                                          ^
error[E001]: type mismatch in if branches: expected Cons but got MyList
  --> /tmp/dojo-custom-linked-list-3.almd:29:71
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
29 |       if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |                                                                       ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-3.almd:29:71
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
29 |       if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |                                                                       ^^^^
error[E001]: type mismatch in fn 'my_filter': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:29:71
  in fn 'my_filter'
  hint: Fix the expression type or change the expected type
   |
29 |       if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |                                                                       ^^^^
error[E001]: type mismatch in call to my_len(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:39:40
  in call to my_len()
  hint: Fix the expression type or change the expected type
   |
39 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E001]: type mismatch in call to my_map(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:42:65
  in call to my_map()
  hint: Fix the expression type or change the expected type
   |
42 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^

15 error(s) found
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```
