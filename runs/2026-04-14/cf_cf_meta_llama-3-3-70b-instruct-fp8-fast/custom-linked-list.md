# custom-linked-list

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Attempts

### Attempt 1 (FAIL)

```almide
type MyList =
  | Nil
  | Cons(Int, MyList)

def from_list(xs: List[Int]): MyList =
  xs match
    case Nil => Nil
    case head :: tail => Cons(head, from_list(tail))

def to_list(ml: MyList): List[Int] =
  ml match
    case Nil => Nil
    case Cons(head, tail) => head :: to_list(tail)

def my_len(ml: MyList): Int =
  ml match
    case Nil => 0
    case Cons(_, tail) => 1 + my_len(tail)

def my_map(ml: MyList, f: (Int) => Int): MyList =
  ml match
    case Nil => Nil
    case Cons(head, tail) => Cons(f(head), my_map(tail, f))

def my_filter(ml: MyList, pred: (Int) => Boolean): MyList =
  ml match
    case Nil => Nil
    case Cons(head, tail) =>
      if pred(head) then Cons(head, my_filter(tail, pred))
      else my_filter(tail, pred)

def my_reverse(ml: MyList): MyList =
  def reverse_acc(ml: MyList
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-0.almd
error: 'def' is not a keyword in Almide at line 5:1
  --> /tmp/dojo-custom-linked-list-0.almd:5:1
  hint: Use 'fn name(...) -> Type = expr' or 'effect fn name(...) -> Result[T, E] = expr'.
  |
5 | def from_list(xs: List[Int]): MyList =
  | ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:35:73
  in call to from_list()
  hint: Check the function name
   |
35 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   |                                                                         ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:35:73
  in call to to_list()
  hint: Check the function name
   |
35 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   |                                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:36:54
  in call to from_list()
  hint: Check the function name
   |
36 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
   |                                                      ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:36:54
  in call to to_list()
  hint: Check the function name
   |
36 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
   |                                                      ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-0.almd:37:40
  in call to my_len()
  hint: Check the function name
   |
37 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:38:57
  in call to from_list()
  hint: Check the function name
   |
38 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
   |                                                         ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-0.almd:38:57
  in call to my_len()
  hint: Check the function name
   |
38 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
   |                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:39:66
  in call to from_list()
  hint: Check the function name
   |
39 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-0.almd:39:82
  in call to my_map()
  hint: Check the function name
   |
39 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:39:82
  in call to to_list()
  hint: Check the function name
   |
39 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-0.almd:40:65
  in call to my_map()
  hint: Check the function name
   |
40 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:40:65
  in call to to_list()
  hint: Check the function name
   |
40 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:41:77
  in call to from_list()
  hint: Check the function name
   |
41 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                             ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-0.almd:41:98
  in call to my_filter()
  hint: Did you mean `map.filter`?
   |
41 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:41:98
  in call to to_list()
  hint: Check the function name
   |
41 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                                                  ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:42:70
  in call to from_list()
  hint: Check the function name
   |
42 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                      ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-0.almd:42:91
  in call to my_filter()
  hint: Did you mean `map.filter`?
   |
42 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:42:91
  in call to to_list()
  hint: Check the function name
   |
42 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:43:67
  in call to from_list()
  hint: Check the function name
   |
43 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-0.almd:43:67
  in call to my_reverse()
  hint: Check the function name
   |
43 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:43:67
  in call to to_list()
  hint: Check the function name
   |
43 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-0.almd:44:56
  in call to my_reverse()
  hint: Check the function name
   |
44 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:44:56
  in call to to_list()
  hint: Check the function name
   |
44 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:45:68
  in call to from_list()
  hint: Check the function name
   |
45 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-0.almd:45:68
  in call to my_reverse()
  hint: Check the function name
   |
45 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:45:68
  in call to to_list()
  hint: Check the function name
   |
45 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^

27 error(s) found
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
  xs match
    case Nil => Nil
    case head :: tail => Cons(head, from_list(tail))

fn to_list(ml: MyList) -> List[Int] =
  ml match
    case Nil => Nil
    case Cons(head, tail) => head :: to_list(tail)

fn my_len(ml: MyList) -> Int =
  ml match
    case Nil => 0
    case Cons(_, tail) => 1 + my_len(tail)

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  ml match
    case Nil => Nil
    case Cons(head, tail) => Cons(f(head), my_map(tail, f))

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  ml match
    case Nil => Nil
    case Cons(head, tail) =>
      if pred(head) then Cons(head, my_filter(tail, pred))
      else my_filter(tail, pred)

fn my_reverse(ml: MyList) -> MyList =
  ml match
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-1.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 6:6 (got Match 'match')
  --> /tmp/dojo-custom-linked-list-1.almd:6:6
  |
6 |   xs match
  |      ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:6 (got Match 'match')
  --> /tmp/dojo-custom-linked-list-1.almd:11:6
   |
11 |   ml match
   |      ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 16:6 (got Match 'match')
  --> /tmp/dojo-custom-linked-list-1.almd:16:6
   |
16 |   ml match
   |      ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 21:6 (got Match 'match')
  --> /tmp/dojo-custom-linked-list-1.almd:21:6
   |
21 |   ml match
   |      ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 26:6 (got Match 'match')
  --> /tmp/dojo-custom-linked-list-1.almd:26:6
   |
26 |   ml match
   |      ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 33:6 (got Match 'match')
  --> /tmp/dojo-custom-linked-list-1.almd:33:6
   |
33 |   ml match
   |      ^
error[E001]: type mismatch in fn 'from_list': expected MyList but got List[Int]
  --> /tmp/dojo-custom-linked-list-1.almd:6:3
  in fn 'from_list'
  hint: Fix the expression type or change the expected type
  |
6 |   xs match
  |   ^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-1.almd:11:3
  in fn 'to_list'
  hint: Fix the expression type or change the expected type
   |
11 |   ml match
   |   ^^
error[E001]: type mismatch in fn 'my_len': expected Int but got MyList
  --> /tmp/dojo-custom-linked-list-1.almd:16:3
  in fn 'my_len'
  hint: Fix the expression type or change the expected type
   |
16 |   ml match
   |   ^^

9 error(s) found
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
  ml match
    case Nil => Nil
    case Cons(head, tail) => head :: to_list(tail)

fn my_len(ml: MyList) -> Int =
  ml match
    case Nil => 0
    case Cons(_, tail) => 1 + my_len(tail)

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  ml match
    case Nil => Nil
    case Cons(head, tail) => Cons(f(head), my_map(tail, f))

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  ml match
    case Nil => Nil
    case Cons(head, tail) =>
      if pred(head) then Cons(head, my_filter(tail, pred))
      else my_filter(tail, pred)

fn my_reverse(ml: MyList) -> MyList =
  ml match
    case Nil => Nil
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-2.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:6 (got Match 'match')
  --> /tmp/dojo-custom-linked-list-2.almd:9:6
  |
9 |   ml match
  |      ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 14:6 (got Match 'match')
  --> /tmp/dojo-custom-linked-list-2.almd:14:6
   |
14 |   ml match
   |      ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 19:6 (got Match 'match')
  --> /tmp/dojo-custom-linked-list-2.almd:19:6
   |
19 |   ml match
   |      ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 24:6 (got Match 'match')
  --> /tmp/dojo-custom-linked-list-2.almd:24:6
   |
24 |   ml match
   |      ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 31:6 (got Match 'match')
  --> /tmp/dojo-custom-linked-list-2.almd:31:6
   |
31 |   ml match
   |      ^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-2.almd:9:3
  in fn 'to_list'
  hint: Fix the expression type or change the expected type
  |
9 |   ml match
  |   ^^
error[E001]: type mismatch in fn 'my_len': expected Int but got MyList
  --> /tmp/dojo-custom-linked-list-2.almd:14:3
  in fn 'my_len'
  hint: Fix the expression type or change the expected type
   |
14 |   ml match
   |   ^^

7 error(s) found
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
  ml match
  { case Nil => []
  | case Cons(head, tail) => head :: to_list(tail)
  }

fn my_len(ml: MyList) -> Int =
  ml match
  { case Nil => 0
  | case Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  ml match
  { case Nil => Nil
  | case Cons(head, tail) => Cons(f(head), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  ml match
  { case Nil => Nil
  | case Cons(head, tail) =>
    if pred(head) then Cons(head, my_filter(tail, pred))
    else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList)
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:6 (got Match 'match')
  --> /tmp/dojo-custom-linked-list-3.almd:9:6
  |
9 |   ml match
  |      ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 15:6 (got Match 'match')
  --> /tmp/dojo-custom-linked-list-3.almd:15:6
   |
15 |   ml match
   |      ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 21:6 (got Match 'match')
  --> /tmp/dojo-custom-linked-list-3.almd:21:6
   |
21 |   ml match
   |      ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 27:6 (got Match 'match')
  --> /tmp/dojo-custom-linked-list-3.almd:27:6
   |
27 |   ml match
   |      ^
error: Expected Arrow at line 34:26 (got Newline '')
  --> /tmp/dojo-custom-linked-list-3.almd:34:26
   |
34 | fn my_reverse(ml: MyList)
   |                          ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-3.almd:44:67
  in call to my_reverse()
  hint: Check the function name
   |
44 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-3.almd:45:56
  in call to my_reverse()
  hint: Check the function name
   |
45 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-3.almd:46:68
  in call to my_reverse()
  hint: Check the function name
   |
46 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-3.almd:9:3
  in fn 'to_list'
  hint: Fix the expression type or change the expected type
  |
9 |   ml match
  |   ^^
error[E001]: type mismatch in fn 'my_len': expected Int but got MyList
  --> /tmp/dojo-custom-linked-list-3.almd:15:3
  in fn 'my_len'
  hint: Fix the expression type or change the expected type
   |
15 |   ml match
   |   ^^

10 error(s) found
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```
