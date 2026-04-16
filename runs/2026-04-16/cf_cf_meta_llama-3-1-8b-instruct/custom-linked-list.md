# custom-linked-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
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
  match xs {
    List[] => Nil
    List[head | ..] => Cons(head, from_list(List[..head]))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => List[]
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
      if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) ->
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-0.almd
error: Expected FatArrow at line 7:9 (got LBracket '[')
  --> /tmp/dojo-custom-linked-list-0.almd:7:9
  |
7 |     List[] => Nil
  |         ^
error: Expected type name at line 36:29 (got Newline '')
  --> /tmp/dojo-custom-linked-list-0.almd:36:29
   |
36 | fn my_reverse(ml: MyList) ->
   |                             ^
error: operator '+' requires numeric, String, or List types but got Int and List[Int]
  --> /tmp/dojo-custom-linked-list-0.almd:14:40
  in operator +
  hint: Use + with numeric types, String, or List
   |
14 |     Cons(head, tail) => head + to_list(tail)
   |                                        ^^^^
error[E001]: type mismatch in match arm: expected List but got Int
  --> /tmp/dojo-custom-linked-list-0.almd:14:40
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
14 |     Cons(head, tail) => head + to_list(tail)
   |                                        ^^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got List
  --> /tmp/dojo-custom-linked-list-0.almd:14:40
  in fn 'to_list'
  hint: Fix the expression type or change the expected type
   |
14 |     Cons(head, tail) => head + to_list(tail)
   |                                        ^^^^

5 error(s) found
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
  match xs {
    List[] => Nil
    List[head | ..] => Cons(head, from_list(List[..head]))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => List[]
    Cons(head, tail) => head + [to_list(tail)]
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
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-1.almd
error: Expected FatArrow at line 7:9 (got LBracket '[')
  --> /tmp/dojo-custom-linked-list-1.almd:7:9
  |
7 |     List[] => Nil
  |         ^
error: Expected expression at line 38:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-1.almd:38:1
   |
38 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^
error: operator '+' requires numeric, String, or List types but got Int and List[List[Int]]
  --> /tmp/dojo-custom-linked-list-1.almd:14:41
  in operator +
  hint: Use + with numeric types, String, or List
   |
14 |     Cons(head, tail) => head + [to_list(tail)]
   |                                         ^^^^
error[E001]: type mismatch in match arm: expected List but got Int
  --> /tmp/dojo-custom-linked-list-1.almd:14:41
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
14 |     Cons(head, tail) => head + [to_list(tail)]
   |                                         ^^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got List
  --> /tmp/dojo-custom-linked-list-1.almd:14:41
  in fn 'to_list'
  hint: Fix the expression type or change the expected type
   |
14 |     Cons(head, tail) => head + [to_list(tail)]
   |                                         ^^^^

5 error(s) found
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
  match xs {
    List[] => Nil
    List[head | ..] => Cons(head, from_list(List[..head]))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => List[]
    Cons(head, tail) => head + [to_list(tail)]
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
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-2.almd
error: Expected FatArrow at line 7:9 (got LBracket '[')
  --> /tmp/dojo-custom-linked-list-2.almd:7:9
  |
7 |     List[] => Nil
  |         ^
error: Expected expression at line 38:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-2.almd:38:1
   |
38 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^
error: operator '+' requires numeric, String, or List types but got Int and List[List[Int]]
  --> /tmp/dojo-custom-linked-list-2.almd:14:41
  in operator +
  hint: Use + with numeric types, String, or List
   |
14 |     Cons(head, tail) => head + [to_list(tail)]
   |                                         ^^^^
error[E001]: type mismatch in match arm: expected List but got Int
  --> /tmp/dojo-custom-linked-list-2.almd:14:41
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
14 |     Cons(head, tail) => head + [to_list(tail)]
   |                                         ^^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got List
  --> /tmp/dojo-custom-linked-list-2.almd:14:41
  in fn 'to_list'
  hint: Fix the expression type or change the expected type
   |
14 |     Cons(head, tail) => head + [to_list(tail)]
   |                                         ^^^^

5 error(s) found
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
  match xs {
    List[] => Nil
    List[head | ..] => Cons(head, from_list(List[..head]))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => List[]
    Cons(head, tail) => head + [to_list(tail)]
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
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-3.almd
error: Expected FatArrow at line 7:9 (got LBracket '[')
  --> /tmp/dojo-custom-linked-list-3.almd:7:9
  |
7 |     List[] => Nil
  |         ^
error: Expected expression at line 38:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-3.almd:38:1
   |
38 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^
error: operator '+' requires numeric, String, or List types but got Int and List[List[Int]]
  --> /tmp/dojo-custom-linked-list-3.almd:14:41
  in operator +
  hint: Use + with numeric types, String, or List
   |
14 |     Cons(head, tail) => head + [to_list(tail)]
   |                                         ^^^^
error[E001]: type mismatch in match arm: expected List but got Int
  --> /tmp/dojo-custom-linked-list-3.almd:14:41
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
14 |     Cons(head, tail) => head + [to_list(tail)]
   |                                         ^^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got List
  --> /tmp/dojo-custom-linked-list-3.almd:14:41
  in fn 'to_list'
  hint: Fix the expression type or change the expected type
   |
14 |     Cons(head, tail) => head + [to_list(tail)]
   |                                         ^^^^

5 error(s) found
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```
