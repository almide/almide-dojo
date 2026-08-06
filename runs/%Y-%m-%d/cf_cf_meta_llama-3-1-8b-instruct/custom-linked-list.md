# custom-linked-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn from_list(xs: List[Int]) -> MyList = match xs {
  Nil => Nil
  Cons(head, tail) => Cons(head, from_list(tail))
}

fn to_list(ml: MyList) -> List[Int] = match ml {
  Nil => Nil
  Cons(head, tail) => Cons(head, to_list(tail))
}

fn my_len(ml: MyList) -> Int = match ml {
  Nil => 0
  Cons(_, tail) => 1 + my_len(tail)
}

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = match ml {
  Nil => Nil
  Cons(head, tail) => Cons(f(head), my_map(tail, f))
}

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = match ml {
  Nil => Nil
  Cons(head, tail) => match pred(head) {
    true => Cons(head, my_filter(tail, pred))
    false => my_filter(tail, pred)
  }
}

fn my_reverse(ml: MyList) -> MyList = match ml {
  Nil => Nil
  Cons(head, tail) => my_reverse(tail) + [Cons
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-0.almd
error: Expected ']' to close list literal opened at line 31:42
  --> /tmp/dojo-custom-linked-list-0.almd:33:1
  hint: Add ']' or check for a missing delimiter inside the list literal
   |
31 |   Cons(head, tail) => my_reverse(tail) + [Cons
   |                                          --------------- '[' opened here
...
33 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^^^^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:35:40
  in call to my_len()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_len[MyList](...)
   |
11 | fn my_len(ml: MyList) -> Int = match ml {
   | ------------------------ fn my_len() defined here
...
35 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:38:65
  in call to my_map()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_map[MyList](...)
   |
16 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = match ml {
   | ------------------------ fn my_map() defined here
...
38 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-0.almd:3:44
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
3 |   Cons(head, tail) => Cons(head, from_list(tail))
  |                                            ^^^^
error[E001]: type mismatch in fn 'from_list': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:3:44
  in fn 'from_list'
  hint: Fix the expression type or change the expected type
  |
3 |   Cons(head, tail) => Cons(head, from_list(tail))
  |                                            ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-0.almd:8:42
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
8 |   Cons(head, tail) => Cons(head, to_list(tail))
  |                                          ^^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:8:42
  in fn 'to_list'
  hint: Fix the expression type or change the expected type
  |
8 |   Cons(head, tail) => Cons(head, to_list(tail))
  |                                          ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-0.almd:18:50
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
18 |   Cons(head, tail) => Cons(f(head), my_map(tail, f))
   |                                                  ^
error[E001]: type mismatch in fn 'my_map': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:18:50
  in fn 'my_map'
  hint: Fix the expression type or change the expected type
   |
18 |   Cons(head, tail) => Cons(f(head), my_map(tail, f))
   |                                                  ^
error[E001]: type mismatch in match arm: expected Cons but got MyList
  --> /tmp/dojo-custom-linked-list-0.almd:25:30
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
25 |     false => my_filter(tail, pred)
   |                              ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-0.almd:25:30
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
25 |     false => my_filter(tail, pred)
   |                              ^^^^
error[E001]: type mismatch in fn 'my_filter': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:25:30
  in fn 'my_filter'
  hint: Fix the expression type or change the expected type
   |
25 |     false => my_filter(tail, pred)
   |                              ^^^^
error[E001]: type mismatch in call to my_len(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:35:40
  in call to my_len()
  hint: Fix the expression type or change the expected type
   |
35 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E001]: type mismatch in call to my_map(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-0.almd:38:65
  in call to my_map()
  hint: Fix the expression type or change the expected type
   |
38 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^

14 error(s) found
Compile error for /tmp/dojo-custom-linked-list-0.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn from_list(xs: List[Int]) -> MyList = match xs {
  Nil => Nil
  Cons(head, tail) => Cons(head, from_list(tail))
}

fn to_list(ml: MyList) -> List[Int] = match ml {
  Nil => Nil
  Cons(head, tail) => to_list(tail) + [head]
}

fn my_len(ml: MyList) -> Int = match ml {
  Nil => 0
  Cons(_, tail) => 1 + my_len(tail)
}

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = match ml {
  Nil => Nil
  Cons(head, tail) => Cons(f(head), my_map(tail, f))
}

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = match ml {
  Nil => Nil
  Cons(head, tail) => match pred(head) {
    true => Cons(head, my_filter(tail, pred))
    false => my_filter(tail, pred)
  }
}

fn my_reverse(ml: MyList) -> MyList = match ml {
  Nil => Nil
  Cons(head, tail) => my_reverse(tail) + [
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-1.almd
error: Expected expression at line 33:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-1.almd:33:1
   |
33 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:35:40
  in call to my_len()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_len[MyList](...)
   |
11 | fn my_len(ml: MyList) -> Int = match ml {
   | ------------------------ fn my_len() defined here
...
35 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:38:65
  in call to my_map()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_map[MyList](...)
   |
16 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = match ml {
   | ------------------------ fn my_map() defined here
...
38 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-1.almd:3:44
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
3 |   Cons(head, tail) => Cons(head, from_list(tail))
  |                                            ^^^^
error[E001]: type mismatch in fn 'from_list': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:3:44
  in fn 'from_list'
  hint: Fix the expression type or change the expected type
  |
3 |   Cons(head, tail) => Cons(head, from_list(tail))
  |                                            ^^^^
error[E001]: type mismatch in match arm: expected Nil but got List[Int]
  --> /tmp/dojo-custom-linked-list-1.almd:8:40
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
8 |   Cons(head, tail) => to_list(tail) + [head]
  |                                        ^^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:8:40
  in fn 'to_list'
  hint: Fix the expression type or change the expected type
  |
8 |   Cons(head, tail) => to_list(tail) + [head]
  |                                        ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-1.almd:18:50
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
18 |   Cons(head, tail) => Cons(f(head), my_map(tail, f))
   |                                                  ^
error[E001]: type mismatch in fn 'my_map': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:18:50
  in fn 'my_map'
  hint: Fix the expression type or change the expected type
   |
18 |   Cons(head, tail) => Cons(f(head), my_map(tail, f))
   |                                                  ^
error[E001]: type mismatch in match arm: expected Cons but got MyList
  --> /tmp/dojo-custom-linked-list-1.almd:25:30
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
25 |     false => my_filter(tail, pred)
   |                              ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-1.almd:25:30
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
25 |     false => my_filter(tail, pred)
   |                              ^^^^
error[E001]: type mismatch in fn 'my_filter': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:25:30
  in fn 'my_filter'
  hint: Fix the expression type or change the expected type
   |
25 |     false => my_filter(tail, pred)
   |                              ^^^^
error[E001]: type mismatch in call to my_len(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:35:40
  in call to my_len()
  hint: Fix the expression type or change the expected type
   |
35 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E001]: type mismatch in call to my_map(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-1.almd:38:65
  in call to my_map()
  hint: Fix the expression type or change the expected type
   |
38 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^

14 error(s) found
Compile error for /tmp/dojo-custom-linked-list-1.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn from_list(xs: List[Int]) -> MyList = match xs {
  Nil => Nil
  Cons(head, tail) => Cons(head, from_list(tail))
}

fn to_list(ml: MyList) -> List[Int] = match ml {
  Nil => Nil
  Cons(head, tail) => to_list(tail) + [head]
}

fn my_len(ml: MyList) -> Int = match ml {
  Nil => 0
  Cons(_, tail) => 1 + my_len(tail)
}

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = match ml {
  Nil => Nil
  Cons(head, tail) => Cons(f(head), my_map(tail, f))
}

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = match ml {
  Nil => Nil
  Cons(head, tail) => match pred(head) {
    true => Cons(head, my_filter(tail, pred))
    false => my_filter(tail, pred)
  }
}

fn my_reverse(ml: MyList) -> MyList = match ml {
  Nil => Nil
  Cons(head, tail) => my_reverse(tail) + [
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-2.almd
error: Expected expression at line 33:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-2.almd:33:1
   |
33 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:35:40
  in call to my_len()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_len[MyList](...)
   |
11 | fn my_len(ml: MyList) -> Int = match ml {
   | ------------------------ fn my_len() defined here
...
35 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:38:65
  in call to my_map()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_map[MyList](...)
   |
16 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = match ml {
   | ------------------------ fn my_map() defined here
...
38 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-2.almd:3:44
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
3 |   Cons(head, tail) => Cons(head, from_list(tail))
  |                                            ^^^^
error[E001]: type mismatch in fn 'from_list': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:3:44
  in fn 'from_list'
  hint: Fix the expression type or change the expected type
  |
3 |   Cons(head, tail) => Cons(head, from_list(tail))
  |                                            ^^^^
error[E001]: type mismatch in match arm: expected Nil but got List[Int]
  --> /tmp/dojo-custom-linked-list-2.almd:8:40
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
8 |   Cons(head, tail) => to_list(tail) + [head]
  |                                        ^^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:8:40
  in fn 'to_list'
  hint: Fix the expression type or change the expected type
  |
8 |   Cons(head, tail) => to_list(tail) + [head]
  |                                        ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-2.almd:18:50
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
18 |   Cons(head, tail) => Cons(f(head), my_map(tail, f))
   |                                                  ^
error[E001]: type mismatch in fn 'my_map': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:18:50
  in fn 'my_map'
  hint: Fix the expression type or change the expected type
   |
18 |   Cons(head, tail) => Cons(f(head), my_map(tail, f))
   |                                                  ^
error[E001]: type mismatch in match arm: expected Cons but got MyList
  --> /tmp/dojo-custom-linked-list-2.almd:25:30
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
25 |     false => my_filter(tail, pred)
   |                              ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-2.almd:25:30
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
25 |     false => my_filter(tail, pred)
   |                              ^^^^
error[E001]: type mismatch in fn 'my_filter': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:25:30
  in fn 'my_filter'
  hint: Fix the expression type or change the expected type
   |
25 |     false => my_filter(tail, pred)
   |                              ^^^^
error[E001]: type mismatch in call to my_len(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:35:40
  in call to my_len()
  hint: Fix the expression type or change the expected type
   |
35 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E001]: type mismatch in call to my_map(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-2.almd:38:65
  in call to my_map()
  hint: Fix the expression type or change the expected type
   |
38 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^

14 error(s) found
Compile error for /tmp/dojo-custom-linked-list-2.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn from_list(xs: List[Int]) -> MyList = match xs {
  Nil => Nil
  Cons(head, tail) => Cons(head, from_list(tail))
}

fn to_list(ml: MyList) -> List[Int] = match ml {
  Nil => Nil
  Cons(head, tail) => to_list(tail) + [head]
}

fn my_len(ml: MyList) -> Int = match ml {
  Nil => 0
  Cons(_, tail) => 1 + my_len(tail)
}

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = match ml {
  Nil => Nil
  Cons(head, tail) => Cons(f(head), my_map(tail, f))
}

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = match ml {
  Nil => Nil
  Cons(head, tail) => match pred(head) {
    true => Cons(head, my_filter(tail, pred))
    false => my_filter(tail, pred)
  }
}

fn my_reverse(ml: MyList) -> MyList = match ml {
  Nil => Nil
  Cons(head, tail) => my_reverse(tail) + [
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-3.almd
error: Expected expression at line 33:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-3.almd:33:1
   |
33 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:35:40
  in call to my_len()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_len[MyList](...)
   |
11 | fn my_len(ml: MyList) -> Int = match ml {
   | ------------------------ fn my_len() defined here
...
35 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E005]: argument 'ml' expects MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:38:65
  in call to my_map()
  hint: 'MyList' is not a known type. To use it as a type parameter, declare it: fn my_map[MyList](...)
   |
16 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = match ml {
   | ------------------------ fn my_map() defined here
...
38 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-3.almd:3:44
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
3 |   Cons(head, tail) => Cons(head, from_list(tail))
  |                                            ^^^^
error[E001]: type mismatch in fn 'from_list': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:3:44
  in fn 'from_list'
  hint: Fix the expression type or change the expected type
  |
3 |   Cons(head, tail) => Cons(head, from_list(tail))
  |                                            ^^^^
error[E001]: type mismatch in match arm: expected Nil but got List[Int]
  --> /tmp/dojo-custom-linked-list-3.almd:8:40
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
8 |   Cons(head, tail) => to_list(tail) + [head]
  |                                        ^^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:8:40
  in fn 'to_list'
  hint: Fix the expression type or change the expected type
  |
8 |   Cons(head, tail) => to_list(tail) + [head]
  |                                        ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-3.almd:18:50
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
18 |   Cons(head, tail) => Cons(f(head), my_map(tail, f))
   |                                                  ^
error[E001]: type mismatch in fn 'my_map': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:18:50
  in fn 'my_map'
  hint: Fix the expression type or change the expected type
   |
18 |   Cons(head, tail) => Cons(f(head), my_map(tail, f))
   |                                                  ^
error[E001]: type mismatch in match arm: expected Cons but got MyList
  --> /tmp/dojo-custom-linked-list-3.almd:25:30
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
25 |     false => my_filter(tail, pred)
   |                              ^^^^
error[E001]: type mismatch in match arm: expected Nil but got Cons
  --> /tmp/dojo-custom-linked-list-3.almd:25:30
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
25 |     false => my_filter(tail, pred)
   |                              ^^^^
error[E001]: type mismatch in fn 'my_filter': expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:25:30
  in fn 'my_filter'
  hint: Fix the expression type or change the expected type
   |
25 |     false => my_filter(tail, pred)
   |                              ^^^^
error[E001]: type mismatch in call to my_len(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:35:40
  in call to my_len()
  hint: Fix the expression type or change the expected type
   |
35 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E001]: type mismatch in call to my_map(): expected MyList but got Nil
  --> /tmp/dojo-custom-linked-list-3.almd:38:65
  in call to my_map()
  hint: Fix the expression type or change the expected type
   |
38 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^

14 error(s) found
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```
