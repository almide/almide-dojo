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
    List[head | tail] => Cons(head, from_list(tail))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => List[]
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
      if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> My
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-0.almd
error: Expected FatArrow at line 7:9 (got LBracket '[')
  --> /tmp/dojo-custom-linked-list-0.almd:7:9
  |
7 |     List[] => Nil
  |         ^
error: Expected pattern at line 14:30 (got Colon ':')
  --> /tmp/dojo-custom-linked-list-0.almd:14:30
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
14 |     Cons(head, tail) => head :: to_list(tail)
   |                              ^

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
  match xs {
    List[] => Nil
    List[head | tail] => Cons(head, from_list(tail))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => List[]
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
      if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-1.almd
error: Expected FatArrow at line 7:9 (got LBracket '[')
  --> /tmp/dojo-custom-linked-list-1.almd:7:9
  |
7 |     List[] => Nil
  |         ^
error: Expected pattern at line 14:30 (got Colon ':')
  --> /tmp/dojo-custom-linked-list-1.almd:14:30
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
14 |     Cons(head, tail) => head :: to_list(tail)
   |                              ^
error: Expected expression at line 39:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-1.almd:39:1
   |
39 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^

3 error(s) found
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
    List[head | tail] => Cons(head, from_list(tail))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => List[]
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
      if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-2.almd
error: Expected FatArrow at line 7:9 (got LBracket '[')
  --> /tmp/dojo-custom-linked-list-2.almd:7:9
  |
7 |     List[] => Nil
  |         ^
error: Expected pattern at line 14:30 (got Colon ':')
  --> /tmp/dojo-custom-linked-list-2.almd:14:30
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
14 |     Cons(head, tail) => head :: to_list(tail)
   |                              ^
error: Expected expression at line 39:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-2.almd:39:1
   |
39 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^

3 error(s) found
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
    List[head | tail] => Cons(head, from_list(tail))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => List[]
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
      if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-3.almd
error: Expected FatArrow at line 7:9 (got LBracket '[')
  --> /tmp/dojo-custom-linked-list-3.almd:7:9
  |
7 |     List[] => Nil
  |         ^
error: Expected pattern at line 14:30 (got Colon ':')
  --> /tmp/dojo-custom-linked-list-3.almd:14:30
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
14 |     Cons(head, tail) => head :: to_list(tail)
   |                              ^
error: Expected expression at line 39:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-3.almd:39:1
   |
39 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^

3 error(s) found
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```
