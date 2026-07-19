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
    Cons(head, tail) => cons(head, to_list(tail))
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    Cons(head, tail) => Cons(f(head), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    Cons(head, tail) => 
      if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(head,
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
error: Expected pattern at line 35:15 (got Newline '')
  --> /tmp/dojo-custom-linked-list-0.almd:35:15
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
35 |     Cons(head,
   |               ^
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
  --> /tmp/dojo-custom-linked-list-0.almd:22:52
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
22 |     Cons(head, tail) => Cons(f(head), my_map(tail, f))
   |                                                    ^
error[E001]: type mismatch in fn 'my_map': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:22:52
  in fn 'my_map'
  hint: Fix the expression type or change the expected type
   |
22 |     Cons(head, tail) => Cons(f(head), my_map(tail, f))
   |                                                    ^
error[E001]: type mismatch in if branches: expected Cons but got MyList
  --> /tmp/dojo-custom-linked-list-0.almd:29:81
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
29 |       if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                 ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-0.almd:29:81
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
29 |       if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                 ^^^^
error[E001]: type mismatch in fn 'my_filter': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:29:81
  in fn 'my_filter'
  hint: Fix the expression type or change the expected type
   |
29 |       if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                 ^^^^
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

12 error(s) found
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
    Cons(head, tail) => cons(head, to_list(tail))
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    Cons(head, tail) => Cons(f(head), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    Cons(head, tail) => 
      if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(head,
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
error: Expected pattern at line 35:15 (got Newline '')
  --> /tmp/dojo-custom-linked-list-1.almd:35:15
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
35 |     Cons(head,
   |               ^
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
  --> /tmp/dojo-custom-linked-list-1.almd:22:52
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
22 |     Cons(head, tail) => Cons(f(head), my_map(tail, f))
   |                                                    ^
error[E001]: type mismatch in fn 'my_map': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:22:52
  in fn 'my_map'
  hint: Fix the expression type or change the expected type
   |
22 |     Cons(head, tail) => Cons(f(head), my_map(tail, f))
   |                                                    ^
error[E001]: type mismatch in if branches: expected Cons but got MyList
  --> /tmp/dojo-custom-linked-list-1.almd:29:81
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
29 |       if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                 ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-1.almd:29:81
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
29 |       if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                 ^^^^
error[E001]: type mismatch in fn 'my_filter': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:29:81
  in fn 'my_filter'
  hint: Fix the expression type or change the expected type
   |
29 |       if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                 ^^^^
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

12 error(s) found
Compile error for /tmp/dojo-custom-linked-list-1.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn from_list(xs: List[Int]) -> MyList = 
  match xs {
    none => Nil
    some(x) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => none
    Cons(head, tail) => some(head) + [to_list(tail)]
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    Cons(head, tail) => Cons(f(head), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    Cons(head, tail) => 
      if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(head,
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-2.almd
error: Expected pattern at line 35:15 (got Newline '')
  --> /tmp/dojo-custom-linked-list-2.almd:35:15
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
35 |     Cons(head,
   |               ^
error: operator '+' requires numeric, String, or List types but got Option[Unknown] and List[List[Int]]
  --> /tmp/dojo-custom-linked-list-2.almd:10:47
  in operator +
  hint: Use + with numeric types, String, or List
   |
10 |     Cons(head, tail) => some(head) + [to_list(tail)]
   |                                               ^^^^
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
  --> /tmp/dojo-custom-linked-list-2.almd:4:34
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
4 |     some(x) => Cons(x, from_list(xs))
  |                                  ^^
error[E001]: type mismatch in fn 'from_list': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:4:34
  in fn 'from_list'
  hint: Fix the expression type or change the expected type
  |
4 |     some(x) => Cons(x, from_list(xs))
  |                                  ^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got Option[Unknown]
  --> /tmp/dojo-custom-linked-list-2.almd:10:47
  in fn 'to_list'
  hint: Fix the expression type or change the expected type
   |
10 |     Cons(head, tail) => some(head) + [to_list(tail)]
   |                                               ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-2.almd:22:52
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
22 |     Cons(head, tail) => Cons(f(head), my_map(tail, f))
   |                                                    ^
error[E001]: type mismatch in fn 'my_map': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:22:52
  in fn 'my_map'
  hint: Fix the expression type or change the expected type
   |
22 |     Cons(head, tail) => Cons(f(head), my_map(tail, f))
   |                                                    ^
error[E001]: type mismatch in if branches: expected Cons but got MyList
  --> /tmp/dojo-custom-linked-list-2.almd:29:81
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
29 |       if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                 ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-2.almd:29:81
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
29 |       if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                 ^^^^
error[E001]: type mismatch in fn 'my_filter': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:29:81
  in fn 'my_filter'
  hint: Fix the expression type or change the expected type
   |
29 |       if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                 ^^^^
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
    none => Nil
    some(x) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => none
    Cons(head, tail) => some(head) + [to_list(tail)]
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    Cons(head, tail) => Cons(f(head), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    Cons(head, tail) => 
      if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(head,
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-3.almd
error: Expected pattern at line 35:15 (got Newline '')
  --> /tmp/dojo-custom-linked-list-3.almd:35:15
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
35 |     Cons(head,
   |               ^
error: operator '+' requires numeric, String, or List types but got Option[Unknown] and List[List[Int]]
  --> /tmp/dojo-custom-linked-list-3.almd:10:47
  in operator +
  hint: Use + with numeric types, String, or List
   |
10 |     Cons(head, tail) => some(head) + [to_list(tail)]
   |                                               ^^^^
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
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got Option[Unknown]
  --> /tmp/dojo-custom-linked-list-3.almd:10:47
  in fn 'to_list'
  hint: Fix the expression type or change the expected type
   |
10 |     Cons(head, tail) => some(head) + [to_list(tail)]
   |                                               ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-3.almd:22:52
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
22 |     Cons(head, tail) => Cons(f(head), my_map(tail, f))
   |                                                    ^
error[E001]: type mismatch in fn 'my_map': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:22:52
  in fn 'my_map'
  hint: Fix the expression type or change the expected type
   |
22 |     Cons(head, tail) => Cons(f(head), my_map(tail, f))
   |                                                    ^
error[E001]: type mismatch in if branches: expected Cons but got MyList
  --> /tmp/dojo-custom-linked-list-3.almd:29:81
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
29 |       if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                 ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-3.almd:29:81
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
29 |       if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                 ^^^^
error[E001]: type mismatch in fn 'my_filter': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:29:81
  in fn 'my_filter'
  hint: Fix the expression type or change the expected type
   |
29 |       if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                 ^^^^
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

14 error(s) found
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```
