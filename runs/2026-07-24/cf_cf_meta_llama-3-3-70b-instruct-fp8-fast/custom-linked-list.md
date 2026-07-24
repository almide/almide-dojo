# custom-linked-list

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E0425`

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
    Cons(head, tail) => head :: to_list(tail)
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
  match ml {
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-0.almd
error: Expected pattern at line 11:30 (got Colon ':')
  --> /tmp/dojo-custom-linked-list-0.almd:11:30
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
11 |     Cons(head, tail) => head :: to_list(tail)
   |                              ^
error: Expected pattern at line 39:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-0.almd:39:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
39 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^

2 error(s) found
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
    Nil => list.repeat(0, 0)
    Cons(head, tail) => list.cons(head, to_list(tail))
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

fn my_reverse(ml: MyList) -> MyList
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-1.almd
error[E002]: undefined function 'list.cons'
  --> /tmp/dojo-custom-linked-list-1.almd:11:49
  in call to list.cons()
  hint: Did you mean `list.count`?
  try:
      // list.cons(...)  →  list.count(...)
      list.count(...)
   |
11 |     Cons(head, tail) => list.cons(head, to_list(tail))
   |                                                 ^^^^

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
    Nil => list.repeat(0, 0)
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

fn my_reverse(ml: MyList) -> MyList
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-2.almd
Compile error for /tmp/dojo-custom-linked-list-2.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0425]: cannot find function `my_reverse` in this scope
   --> <generated.rs>:336:28
    |
336 |         assert_eq!(to_list(my_reverse(from_list(vec![1i64, 2i64, 3i64]))), vec![3i64, 2i64, 1i64])
    |                            ^^^^^^^^^^ not found in this scope


error[E0425]: cannot find function `my_reverse` in this scope
   --> <generated.rs>:341:28
    |
341 |         assert_eq!(to_list(my_reverse(MyList::Nil)), Vec::<i64>::new())
    |                            ^^^^^^^^^^ not found in this scope


error[E0425]: cannot find function `my_reverse` in this scope
   --> <generated.rs>:346:28
    |
346 |         assert_eq!(to_list(my_reverse(from_list(vec![42i64]))), vec![42i64])
    |                            ^^^^^^^^^^ not found in this scope


error: could not compile `almide-generated` (bin "almide-generated" test) due to 3 previous errors; 1 warning emitted

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
    Nil => list.repeat(0, 0)
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

fn my_reverse(ml: MyList) -> MyList
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-3.almd
Compile error for /tmp/dojo-custom-linked-list-3.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0425]: cannot find function `my_reverse` in this scope
   --> <generated.rs>:336:28
    |
336 |         assert_eq!(to_list(my_reverse(from_list(vec![1i64, 2i64, 3i64]))), vec![3i64, 2i64, 1i64])
    |                            ^^^^^^^^^^ not found in this scope


error[E0425]: cannot find function `my_reverse` in this scope
   --> <generated.rs>:341:28
    |
341 |         assert_eq!(to_list(my_reverse(MyList::Nil)), Vec::<i64>::new())
    |                            ^^^^^^^^^^ not found in this scope


error[E0425]: cannot find function `my_reverse` in this scope
   --> <generated.rs>:346:28
    |
346 |         assert_eq!(to_list(my_reverse(from_list(vec![42i64]))), vec![42i64])
    |                            ^^^^^^^^^^ not found in this scope


error: could not compile `almide-generated` (bin "almide-generated" test) due to 3 previous errors; 1 warning emitted

FAILED: /tmp/dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```
