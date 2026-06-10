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

fn my_reverse(ml: MyList) ->
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-0.almd
error: Expected type name at line 36:29 (got Newline '')
  --> /tmp/dojo-custom-linked-list-0.almd:36:29
   |
36 | fn my_reverse(ml: MyList) ->
   |                             ^

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
