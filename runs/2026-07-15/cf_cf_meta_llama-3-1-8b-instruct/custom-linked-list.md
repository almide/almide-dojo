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
    nil => Nil
    cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => nil
    Cons(x, tail) => cons(x, to_list(tail))
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
  fn reverse(tail: MyList, acc: MyList) ->
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-0.almd
error: Expected FatArrow at line 4:9 (got LParen '(')
  --> /tmp/dojo-custom-linked-list-0.almd:4:9
  |
4 |     cons(x, xs) => Cons(x, from_list(xs))
  |         ^
error: 'nil' does not exist in Almide at line 9:12
  --> /tmp/dojo-custom-linked-list-0.almd:9:12
  hint: Almide has no null. Use Option[T] with 'some(v)' / 'none'.
  |
9 |     Nil => nil
  |            ^
error: Expected expression at line 32:3 (got Fn 'fn')
  --> /tmp/dojo-custom-linked-list-0.almd:32:3
   |
32 |   fn reverse(tail: MyList, acc: MyList) ->
   |   ^
error: Expected type name at line 32:43 (got Newline '')
  --> /tmp/dojo-custom-linked-list-0.almd:32:43
   |
32 |   fn reverse(tail: MyList, acc: MyList) ->
   |                                           ^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:36:40
  in call to my_len()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_len[MyList](...)
   |
13 | fn my_len(ml: MyList) -> Int =
   | ------------------------ fn my_len() defined here
...
36 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:39:65
  in call to my_map()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_map[MyList](...)
   |
19 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
   | ------------------------ fn my_map() defined here
...
39 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
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
  --> /tmp/dojo-custom-linked-list-0.almd:28:90
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
28 |     Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                          ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-0.almd:28:90
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
28 |     Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                          ^^^^
error[E001]: type mismatch in fn 'my_filter': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:28:90
  in fn 'my_filter'
  hint: Fix the expression type or change the expected type
   |
28 |     Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                          ^^^^
error[E001]: type mismatch in call to my_len(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:36:40
  in call to my_len()
  hint: Fix the expression type or change the expected type
   |
36 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E001]: type mismatch in call to my_map(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:39:65
  in call to my_map()
  hint: Fix the expression type or change the expected type
   |
39 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^

13 error(s) found
Compile error for /tmp/dojo-custom-linked-list-0.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn from_list(xs: List[Int]) -> MyList = 
  match xs {
    nil => Nil
    cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => nil
    Cons(x, tail) => cons(x, to_list(tail))
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
  fn reverse(tail: MyList, acc: MyList) ->
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-1.almd
error: Expected FatArrow at line 4:9 (got LParen '(')
  --> /tmp/dojo-custom-linked-list-1.almd:4:9
  |
4 |     cons(x, xs) => Cons(x, from_list(xs))
  |         ^
error: 'nil' does not exist in Almide at line 9:12
  --> /tmp/dojo-custom-linked-list-1.almd:9:12
  hint: Almide has no null. Use Option[T] with 'some(v)' / 'none'.
  |
9 |     Nil => nil
  |            ^
error: Expected expression at line 32:3 (got Fn 'fn')
  --> /tmp/dojo-custom-linked-list-1.almd:32:3
   |
32 |   fn reverse(tail: MyList, acc: MyList) ->
   |   ^
error: Expected type name at line 32:43 (got Newline '')
  --> /tmp/dojo-custom-linked-list-1.almd:32:43
   |
32 |   fn reverse(tail: MyList, acc: MyList) ->
   |                                           ^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:36:40
  in call to my_len()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_len[MyList](...)
   |
13 | fn my_len(ml: MyList) -> Int =
   | ------------------------ fn my_len() defined here
...
36 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:39:65
  in call to my_map()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_map[MyList](...)
   |
19 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
   | ------------------------ fn my_map() defined here
...
39 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
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
  --> /tmp/dojo-custom-linked-list-1.almd:28:90
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
28 |     Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                          ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-1.almd:28:90
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
28 |     Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                          ^^^^
error[E001]: type mismatch in fn 'my_filter': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:28:90
  in fn 'my_filter'
  hint: Fix the expression type or change the expected type
   |
28 |     Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                          ^^^^
error[E001]: type mismatch in call to my_len(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:36:40
  in call to my_len()
  hint: Fix the expression type or change the expected type
   |
36 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E001]: type mismatch in call to my_map(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:39:65
  in call to my_map()
  hint: Fix the expression type or change the expected type
   |
39 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^

13 error(s) found
Compile error for /tmp/dojo-custom-linked-list-1.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn from_list(xs: List[Int]) -> MyList = 
  match xs {
    nil => Nil
    cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => nil
    Cons(x, tail) => cons(x, to_list(tail))
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
  fn reverse(tail: MyList, acc: MyList) ->
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-2.almd
error: Expected FatArrow at line 4:9 (got LParen '(')
  --> /tmp/dojo-custom-linked-list-2.almd:4:9
  |
4 |     cons(x, xs) => Cons(x, from_list(xs))
  |         ^
error: 'nil' does not exist in Almide at line 9:12
  --> /tmp/dojo-custom-linked-list-2.almd:9:12
  hint: Almide has no null. Use Option[T] with 'some(v)' / 'none'.
  |
9 |     Nil => nil
  |            ^
error: Expected expression at line 32:3 (got Fn 'fn')
  --> /tmp/dojo-custom-linked-list-2.almd:32:3
   |
32 |   fn reverse(tail: MyList, acc: MyList) ->
   |   ^
error: Expected type name at line 32:43 (got Newline '')
  --> /tmp/dojo-custom-linked-list-2.almd:32:43
   |
32 |   fn reverse(tail: MyList, acc: MyList) ->
   |                                           ^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:36:40
  in call to my_len()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_len[MyList](...)
   |
13 | fn my_len(ml: MyList) -> Int =
   | ------------------------ fn my_len() defined here
...
36 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:39:65
  in call to my_map()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_map[MyList](...)
   |
19 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
   | ------------------------ fn my_map() defined here
...
39 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
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
  --> /tmp/dojo-custom-linked-list-2.almd:28:90
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
28 |     Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                          ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-2.almd:28:90
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
28 |     Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                          ^^^^
error[E001]: type mismatch in fn 'my_filter': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:28:90
  in fn 'my_filter'
  hint: Fix the expression type or change the expected type
   |
28 |     Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                          ^^^^
error[E001]: type mismatch in call to my_len(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:36:40
  in call to my_len()
  hint: Fix the expression type or change the expected type
   |
36 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E001]: type mismatch in call to my_map(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:39:65
  in call to my_map()
  hint: Fix the expression type or change the expected type
   |
39 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^

13 error(s) found
Compile error for /tmp/dojo-custom-linked-list-2.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn from_list(xs: List[Int]) -> MyList = 
  match xs {
    none => Nil
    some(x) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => nil
    Cons(x, tail) => cons(x, to_list(tail))
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
  fn reverse(tail: MyList, acc: MyList): MyList =
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-3.almd
error: 'nil' does not exist in Almide at line 9:12
  --> /tmp/dojo-custom-linked-list-3.almd:9:12
  hint: Almide has no null. Use Option[T] with 'some(v)' / 'none'.
  |
9 |     Nil => nil
  |            ^
error: Expected expression at line 32:3 (got Fn 'fn')
  --> /tmp/dojo-custom-linked-list-3.almd:32:3
   |
32 |   fn reverse(tail: MyList, acc: MyList): MyList =
   |   ^
error: Expected Arrow at line 32:40 (got Colon ':')
  --> /tmp/dojo-custom-linked-list-3.almd:32:40
   |
32 |   fn reverse(tail: MyList, acc: MyList): MyList =
   |                                        ^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:36:40
  in call to my_len()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_len[MyList](...)
   |
13 | fn my_len(ml: MyList) -> Int =
   | ------------------------ fn my_len() defined here
...
36 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:39:65
  in call to my_map()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_map[MyList](...)
   |
19 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
   | ------------------------ fn my_map() defined here
...
39 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-3.almd:4:34
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
4 |     some(x) => Cons(x, from_list(xs))
  |                                  ^^
error[E001]: type mismatch in fn 'from_list': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:4:34
  in fn 'from_list'
  hint: Fix the expression type or change the expected type
  |
4 |     some(x) => Cons(x, from_list(xs))
  |                                  ^^
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
  --> /tmp/dojo-custom-linked-list-3.almd:28:90
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
28 |     Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                          ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-3.almd:28:90
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
28 |     Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                          ^^^^
error[E001]: type mismatch in fn 'my_filter': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:28:90
  in fn 'my_filter'
  hint: Fix the expression type or change the expected type
   |
28 |     Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                          ^^^^
error[E001]: type mismatch in call to my_len(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:36:40
  in call to my_len()
  hint: Fix the expression type or change the expected type
   |
36 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E001]: type mismatch in call to my_map(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:39:65
  in call to my_map()
  hint: Fix the expression type or change the expected type
   |
39 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^

14 error(s) found
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```
