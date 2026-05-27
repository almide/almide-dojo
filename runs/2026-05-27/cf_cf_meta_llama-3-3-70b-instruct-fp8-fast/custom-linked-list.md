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
  match list.reverse(xs) with
  | Nil => Nil
  | ys => list.fold(ys, Nil, (acc, x) => Cons(x, acc))

fn to_list(ml: MyList) -> List[Int] =
  match ml with
  | Nil => []
  | Cons(head, tail) => [head] + to_list(tail)

fn my_len(ml: MyList) -> Int =
  match ml with
  | Nil => 0
  | Cons(_, tail) => 1 + my_len(tail)

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml with
  | Nil => Nil
  | Cons(head, tail) => Cons(f(head), my_map(tail, f))

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml with
  | Nil => Nil
  | Cons(head, tail) =>
    if pred(head) then
      Cons(head, my_filter(tail, pred))
    else
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-0.almd
error: Expected LBrace at line 6:26 (got Ident 'with')
  --> /tmp/dojo-custom-linked-list-0.almd:6:26
  |
6 |   match list.reverse(xs) with
  |                          ^
error: Expected LBrace at line 11:12 (got Ident 'with')
  --> /tmp/dojo-custom-linked-list-0.almd:11:12
   |
11 |   match ml with
   |            ^
error: Expected LBrace at line 16:12 (got Ident 'with')
  --> /tmp/dojo-custom-linked-list-0.almd:16:12
   |
16 |   match ml with
   |            ^
error: Expected LBrace at line 21:12 (got Ident 'with')
  --> /tmp/dojo-custom-linked-list-0.almd:21:12
   |
21 |   match ml with
   |            ^
error: Expected LBrace at line 26:12 (got Ident 'with')
  --> /tmp/dojo-custom-linked-list-0.almd:26:12
   |
26 |   match ml with
   |            ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-0.almd:41:67
  in call to my_reverse()
  hint: Check the function name
   |
41 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-0.almd:42:56
  in call to my_reverse()
  hint: Check the function name
   |
42 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-0.almd:43:68
  in call to my_reverse()
  hint: Check the function name
   |
43 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
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
  | Nil => []
  | Cons(head, tail) => [head] + to_list(tail)
  }

fn my_len(ml: MyList) -> Int =
  match ml {
  | Nil => 0
  | Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
  | Nil => Nil
  | Cons(head, tail) => Cons(f(head), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
  | Nil => Nil
  | Cons(head, tail) =>
    if pred(head) then
      Cons(head, my_filter(tail, pred))
    else
      my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> My
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-1.almd
error: Expected pattern at line 10:3 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:10:3
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
10 |   | Nil => []
   |   ^
error: Expected pattern at line 16:3 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:16:3
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
16 |   | Nil => 0
   |   ^
error: Expected pattern at line 22:3 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:22:3
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
22 |   | Nil => Nil
   |   ^
error: Expected pattern at line 28:3 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:28:3
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
28 |   | Nil => Nil
   |   ^

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
