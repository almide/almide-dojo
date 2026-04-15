# custom-linked-list

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
type MyList =
  | Nil
  | Cons(Int, MyList)

fn from_list(xs: List[Int]) -> MyList = 
  list.fold(xs, Nil, (acc, x) => Cons(x, acc))

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => list.empty(),
    Cons(head, tail) => [head] + to_list(tail)
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0,
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil,
    Cons(head, tail) => Cons(f(head), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil,
    Cons(head, tail) => 
      if pred(head) then Cons(head, my_filter(tail, pred))
      else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-0.almd
error[E002]: undefined function 'list.empty'
  --> /tmp/dojo-custom-linked-list-0.almd:10:22
  in call to list.empty()
  hint: Did you mean `[] (empty list literal)`?
   |
10 |     Nil => list.empty(),
   |                      ^

1 error(s) found
Compile error for /tmp/dojo-custom-linked-list-0.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
type MyList =
  | Nil
  | Cons(Int, MyList)

fn from_list(xs: List[Int]) -> MyList = 
  list.fold(xs, Nil, (acc, x) => Cons(x, acc))

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => [],
    Cons(head, tail) => [head] + to_list(tail)
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0,
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil,
    Cons(head, tail) => Cons(f(head), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil,
    Cons(head, tail) => 
      if pred(head) then Cons(head, my_filter(tail, pred))
      else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-1.almd
error: Expected LBrace at line 37:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-1.almd:37:1
   |
37 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-1.almd:45:67
  in call to my_reverse()
  hint: Check the function name
   |
45 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-1.almd:46:56
  in call to my_reverse()
  hint: Check the function name
   |
46 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-1.almd:47:68
  in call to my_reverse()
  hint: Check the function name
   |
47 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^

4 error(s) found
Compile error for /tmp/dojo-custom-linked-list-1.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
type MyList =
  | Nil
  | Cons(Int, MyList)

fn from_list(xs: List[Int]) -> MyList = 
  list.fold(xs, Nil, (acc, x) => Cons(x, acc))

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => [],
    Cons(head, tail) => [head] + to_list(tail)
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0,
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil,
    Cons(head, tail) => Cons(f(head), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil,
    Cons(head, tail) => 
      if pred(head) then Cons(head, my_filter(tail, pred))
      else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-2.almd
error: Expected LBrace at line 37:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-2.almd:37:1
   |
37 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-2.almd:45:67
  in call to my_reverse()
  hint: Check the function name
   |
45 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-2.almd:46:56
  in call to my_reverse()
  hint: Check the function name
   |
46 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-2.almd:47:68
  in call to my_reverse()
  hint: Check the function name
   |
47 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^

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
  | Cons(Int, MyList)

fn from_list(xs: List[Int]) -> MyList = 
  list.fold(xs, Nil, (acc, x) => Cons(x, acc))

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => [],
    Cons(head, tail) => [head] + to_list(tail)
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0,
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil,
    Cons(head, tail) => Cons(f(head), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil,
    Cons(head, tail) => 
      if pred(head) then Cons(head, my_filter(tail, pred))
      else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-3.almd
error: Expected LBrace at line 37:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-3.almd:37:1
   |
37 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-3.almd:45:67
  in call to my_reverse()
  hint: Check the function name
   |
45 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-3.almd:46:56
  in call to my_reverse()
  hint: Check the function name
   |
46 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-3.almd:47:68
  in call to my_reverse()
  hint: Check the function name
   |
47 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^

4 error(s) found
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```
