# custom-linked-list

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

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
    Nil => []
    Cons(head, tail) => head + to_list(tail)
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
      if pred(head) then 
        Cons(head, my_filter(tail, pred))
      else 
        my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> My
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-0.almd
error: operator '+' requires numeric, String, or List types but got Int and List[Int]
  --> /tmp/dojo-custom-linked-list-0.almd:11:40
  in operator +
  hint: Use + with numeric types, String, or List
   |
11 |     Cons(head, tail) => head + to_list(tail)
   |                                        ^^^^
error[E005]: argument 'ml' expects MyList but got My
  --> /tmp/dojo-custom-linked-list-0.almd:46:67
  in call to to_list()
  hint: Fix the argument type
   |
 8 | fn to_list(ml: MyList) -> List[Int] =
   | ------------------------- fn to_list() defined here
...
46 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E005]: argument 'ml' expects MyList but got My
  --> /tmp/dojo-custom-linked-list-0.almd:47:56
  in call to to_list()
  hint: Fix the argument type
   |
 8 | fn to_list(ml: MyList) -> List[Int] =
   | ------------------------- fn to_list() defined here
...
47 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E005]: argument 'ml' expects MyList but got My
  --> /tmp/dojo-custom-linked-list-0.almd:48:68
  in call to to_list()
  hint: Fix the argument type
   |
 8 | fn to_list(ml: MyList) -> List[Int] =
   | ------------------------- fn to_list() defined here
...
48 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E001]: type mismatch in match arm: expected List[Int] but got Int
  --> /tmp/dojo-custom-linked-list-0.almd:11:40
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
11 |     Cons(head, tail) => head + to_list(tail)
   |                                        ^^^^
error[E001]: type mismatch in call to to_list(): expected MyList but got My
  --> /tmp/dojo-custom-linked-list-0.almd:46:67
  in call to to_list()
  hint: Fix the expression type or change the expected type
   |
46 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E001]: type mismatch in call to to_list(): expected MyList but got My
  --> /tmp/dojo-custom-linked-list-0.almd:47:56
  in call to to_list()
  hint: Fix the expression type or change the expected type
   |
47 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E001]: type mismatch in call to to_list(): expected MyList but got My
  --> /tmp/dojo-custom-linked-list-0.almd:48:68
  in call to to_list()
  hint: Fix the expression type or change the expected type
   |
48 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^

8 error(s) found
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
    Nil => []
    Cons(head, tail) => [head] + to_list(tail)
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
      if pred(head) then 
        Cons(head, my_filter(tail, pred))
      else 
        my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-1.almd
error: Expected expression at line 38:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-1.almd:38:1
   |
38 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^

1 error(s) found
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
    Nil => []
    Cons(head, tail) => [head] + to_list(tail)
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
      if pred(head) then 
        Cons(head, my_filter(tail, pred))
      else 
        my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-2.almd
error: Expected expression at line 38:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-2.almd:38:1
   |
38 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^

1 error(s) found
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
    Nil => []
    Cons(head, tail) => [head] + to_list(tail)
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
      if pred(head) then 
        Cons(head, my_filter(tail, pred))
      else 
        my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-3.almd
error: Expected expression at line 38:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-3.almd:38:1
   |
38 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^

1 error(s) found
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```
