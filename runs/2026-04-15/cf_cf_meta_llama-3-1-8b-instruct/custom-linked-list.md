# custom-linked-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
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
  match xs {
    Nil => Nil
    | Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => []
    | Cons(x, xs) => [x] + to_list(xs)
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    | Cons(_, xs) => 1 + my_len(xs)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    | Cons(x, xs) => Cons(f(x), my_map(xs, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    | Cons(x, xs) => 
      if pred(x) then Cons(x, my_filter(xs, pred)) else my_filter(xs, pred)
  }

fn my_reverse(ml: My
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-0.almd
error: Expected pattern at line 8:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:8:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
8 |     | Cons(x, xs) => Cons(x, from_list(xs))
  |     ^
error: Expected pattern at line 14:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:14:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
14 |     | Cons(x, xs) => [x] + to_list(xs)
   |     ^
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:20:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | Cons(_, xs) => 1 + my_len(xs)
   |     ^
error: Expected pattern at line 26:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:26:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
26 |     | Cons(x, xs) => Cons(f(x), my_map(xs, f))
   |     ^
error: Expected pattern at line 32:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:32:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     | Cons(x, xs) =>
   |     ^
error: Expected ')' to close function parameters opened at line 36:14
  --> /tmp/dojo-custom-linked-list-0.almd:38:1
  hint: Add ')' or check for a missing delimiter inside the function parameters
   |
36 | fn my_reverse(ml: My
   |              --------------- '(' opened here
...
38 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^^^^
error: Expected ')' to close function parameters opened at line 36:14 at line 38:1
  --> /tmp/dojo-custom-linked-list-0.almd:36:14
   |
36 | fn my_reverse(ml: My
   |              ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:38:73
  in call to from_list()
  hint: Check the function name
   |
38 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   |                                                                         ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:38:73
  in call to to_list()
  hint: Check the function name
   |
38 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   |                                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:39:54
  in call to from_list()
  hint: Check the function name
   |
39 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
   |                                                      ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:39:54
  in call to to_list()
  hint: Check the function name
   |
39 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
   |                                                      ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-0.almd:40:40
  in call to my_len()
  hint: Check the function name
   |
40 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:41:57
  in call to from_list()
  hint: Check the function name
   |
41 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
   |                                                         ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-0.almd:41:57
  in call to my_len()
  hint: Check the function name
   |
41 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
   |                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:42:66
  in call to from_list()
  hint: Check the function name
   |
42 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-0.almd:42:82
  in call to my_map()
  hint: Check the function name
   |
42 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:42:82
  in call to to_list()
  hint: Check the function name
   |
42 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-0.almd:43:65
  in call to my_map()
  hint: Check the function name
   |
43 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:43:65
  in call to to_list()
  hint: Check the function name
   |
43 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:44:77
  in call to from_list()
  hint: Check the function name
   |
44 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                             ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-0.almd:44:98
  in call to my_filter()
  hint: Did you mean `map.filter`?
   |
44 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:44:98
  in call to to_list()
  hint: Check the function name
   |
44 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                                                  ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:45:70
  in call to from_list()
  hint: Check the function name
   |
45 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                      ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-0.almd:45:91
  in call to my_filter()
  hint: Did you mean `map.filter`?
   |
45 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:45:91
  in call to to_list()
  hint: Check the function name
   |
45 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:46:67
  in call to from_list()
  hint: Check the function name
   |
46 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-0.almd:46:67
  in call to my_reverse()
  hint: Check the function name
   |
46 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:46:67
  in call to to_list()
  hint: Check the function name
   |
46 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-0.almd:47:56
  in call to my_reverse()
  hint: Check the function name
   |
47 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:47:56
  in call to to_list()
  hint: Check the function name
   |
47 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:48:68
  in call to from_list()
  hint: Check the function name
   |
48 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-0.almd:48:68
  in call to my_reverse()
  hint: Check the function name
   |
48 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:48:68
  in call to to_list()
  hint: Check the function name
   |
48 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^

33 error(s) found
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
    Nil => Nil
    | Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => []
    | Cons(x, xs) => [x] + to_list(xs)
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    | Cons(_, xs) => 1 + my_len(xs)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    | Cons(x, xs) => Cons(f(x), my_map(xs, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    | Cons(x, xs) => 
      if pred(x) then Cons(x, my_filter(xs, pred)) else my_filter(xs, pred)
  }

fn my_reverse(ml: MyList) -> My
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-1.almd
error: Expected pattern at line 8:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:8:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
8 |     | Cons(x, xs) => Cons(x, from_list(xs))
  |     ^
error: Expected pattern at line 14:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:14:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
14 |     | Cons(x, xs) => [x] + to_list(xs)
   |     ^
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:20:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | Cons(_, xs) => 1 + my_len(xs)
   |     ^
error: Expected pattern at line 26:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:26:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
26 |     | Cons(x, xs) => Cons(f(x), my_map(xs, f))
   |     ^
error: Expected pattern at line 32:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:32:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     | Cons(x, xs) =>
   |     ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-1.almd:38:73
  in call to from_list()
  hint: Check the function name
   |
38 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   |                                                                         ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:38:73
  in call to to_list()
  hint: Check the function name
   |
38 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   |                                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-1.almd:39:54
  in call to from_list()
  hint: Check the function name
   |
39 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
   |                                                      ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:39:54
  in call to to_list()
  hint: Check the function name
   |
39 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
   |                                                      ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-1.almd:40:40
  in call to my_len()
  hint: Check the function name
   |
40 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-1.almd:41:57
  in call to from_list()
  hint: Check the function name
   |
41 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
   |                                                         ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-1.almd:41:57
  in call to my_len()
  hint: Check the function name
   |
41 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
   |                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-1.almd:42:66
  in call to from_list()
  hint: Check the function name
   |
42 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-1.almd:42:82
  in call to my_map()
  hint: Check the function name
   |
42 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:42:82
  in call to to_list()
  hint: Check the function name
   |
42 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-1.almd:43:65
  in call to my_map()
  hint: Check the function name
   |
43 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:43:65
  in call to to_list()
  hint: Check the function name
   |
43 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-1.almd:44:77
  in call to from_list()
  hint: Check the function name
   |
44 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                             ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-1.almd:44:98
  in call to my_filter()
  hint: Did you mean `map.filter`?
   |
44 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:44:98
  in call to to_list()
  hint: Check the function name
   |
44 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                                                  ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-1.almd:45:70
  in call to from_list()
  hint: Check the function name
   |
45 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                      ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-1.almd:45:91
  in call to my_filter()
  hint: Did you mean `map.filter`?
   |
45 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:45:91
  in call to to_list()
  hint: Check the function name
   |
45 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-1.almd:46:67
  in call to from_list()
  hint: Check the function name
   |
46 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:46:67
  in call to to_list()
  hint: Check the function name
   |
46 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:47:56
  in call to to_list()
  hint: Check the function name
   |
47 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-1.almd:48:68
  in call to from_list()
  hint: Check the function name
   |
48 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:48:68
  in call to to_list()
  hint: Check the function name
   |
48 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^

28 error(s) found
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
    Nil => Nil
    | Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => []
    | Cons(x, xs) => [x] + to_list(xs)
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    | Cons(_, xs) => 1 + my_len(xs)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    | Cons(x, xs) => Cons(f(x), my_map(xs, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    | Cons(x, xs) => 
      if pred(x) then Cons(x, my_filter(xs, pred)) else my_filter(xs, pred)
  }

fn my_reverse(ml: MyList) -> My
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-2.almd
error: Expected pattern at line 8:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:8:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
8 |     | Cons(x, xs) => Cons(x, from_list(xs))
  |     ^
error: Expected pattern at line 14:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:14:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
14 |     | Cons(x, xs) => [x] + to_list(xs)
   |     ^
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:20:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | Cons(_, xs) => 1 + my_len(xs)
   |     ^
error: Expected pattern at line 26:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:26:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
26 |     | Cons(x, xs) => Cons(f(x), my_map(xs, f))
   |     ^
error: Expected pattern at line 32:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:32:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     | Cons(x, xs) =>
   |     ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-2.almd:38:73
  in call to from_list()
  hint: Check the function name
   |
38 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   |                                                                         ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:38:73
  in call to to_list()
  hint: Check the function name
   |
38 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   |                                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-2.almd:39:54
  in call to from_list()
  hint: Check the function name
   |
39 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
   |                                                      ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:39:54
  in call to to_list()
  hint: Check the function name
   |
39 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
   |                                                      ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-2.almd:40:40
  in call to my_len()
  hint: Check the function name
   |
40 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-2.almd:41:57
  in call to from_list()
  hint: Check the function name
   |
41 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
   |                                                         ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-2.almd:41:57
  in call to my_len()
  hint: Check the function name
   |
41 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
   |                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-2.almd:42:66
  in call to from_list()
  hint: Check the function name
   |
42 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-2.almd:42:82
  in call to my_map()
  hint: Check the function name
   |
42 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:42:82
  in call to to_list()
  hint: Check the function name
   |
42 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-2.almd:43:65
  in call to my_map()
  hint: Check the function name
   |
43 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:43:65
  in call to to_list()
  hint: Check the function name
   |
43 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-2.almd:44:77
  in call to from_list()
  hint: Check the function name
   |
44 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                             ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-2.almd:44:98
  in call to my_filter()
  hint: Did you mean `map.filter`?
   |
44 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:44:98
  in call to to_list()
  hint: Check the function name
   |
44 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                                                  ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-2.almd:45:70
  in call to from_list()
  hint: Check the function name
   |
45 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                      ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-2.almd:45:91
  in call to my_filter()
  hint: Did you mean `map.filter`?
   |
45 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:45:91
  in call to to_list()
  hint: Check the function name
   |
45 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-2.almd:46:67
  in call to from_list()
  hint: Check the function name
   |
46 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:46:67
  in call to to_list()
  hint: Check the function name
   |
46 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:47:56
  in call to to_list()
  hint: Check the function name
   |
47 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-2.almd:48:68
  in call to from_list()
  hint: Check the function name
   |
48 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:48:68
  in call to to_list()
  hint: Check the function name
   |
48 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^

28 error(s) found
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
    Nil => Nil
    | Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => []
    | Cons(x, xs) => [x] + to_list(xs)
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    | Cons(_, xs) => 1 + my_len(xs)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    | Cons(x, xs) => Cons(f(x), my_map(xs, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    | Cons(x, xs) => 
      if pred(x) then Cons(x, my_filter(xs, pred)) else my_filter(xs, pred)
  }

fn my_reverse(ml: MyList) -> My
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-3.almd
error: Expected pattern at line 8:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:8:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
8 |     | Cons(x, xs) => Cons(x, from_list(xs))
  |     ^
error: Expected pattern at line 14:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:14:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
14 |     | Cons(x, xs) => [x] + to_list(xs)
   |     ^
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:20:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | Cons(_, xs) => 1 + my_len(xs)
   |     ^
error: Expected pattern at line 26:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:26:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
26 |     | Cons(x, xs) => Cons(f(x), my_map(xs, f))
   |     ^
error: Expected pattern at line 32:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:32:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     | Cons(x, xs) =>
   |     ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-3.almd:38:73
  in call to from_list()
  hint: Check the function name
   |
38 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   |                                                                         ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:38:73
  in call to to_list()
  hint: Check the function name
   |
38 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   |                                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-3.almd:39:54
  in call to from_list()
  hint: Check the function name
   |
39 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
   |                                                      ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:39:54
  in call to to_list()
  hint: Check the function name
   |
39 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
   |                                                      ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-3.almd:40:40
  in call to my_len()
  hint: Check the function name
   |
40 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-3.almd:41:57
  in call to from_list()
  hint: Check the function name
   |
41 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
   |                                                         ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-3.almd:41:57
  in call to my_len()
  hint: Check the function name
   |
41 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
   |                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-3.almd:42:66
  in call to from_list()
  hint: Check the function name
   |
42 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-3.almd:42:82
  in call to my_map()
  hint: Check the function name
   |
42 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:42:82
  in call to to_list()
  hint: Check the function name
   |
42 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-3.almd:43:65
  in call to my_map()
  hint: Check the function name
   |
43 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:43:65
  in call to to_list()
  hint: Check the function name
   |
43 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-3.almd:44:77
  in call to from_list()
  hint: Check the function name
   |
44 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                             ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-3.almd:44:98
  in call to my_filter()
  hint: Did you mean `map.filter`?
   |
44 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:44:98
  in call to to_list()
  hint: Check the function name
   |
44 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                                                  ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-3.almd:45:70
  in call to from_list()
  hint: Check the function name
   |
45 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                      ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-3.almd:45:91
  in call to my_filter()
  hint: Did you mean `map.filter`?
   |
45 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:45:91
  in call to to_list()
  hint: Check the function name
   |
45 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-3.almd:46:67
  in call to from_list()
  hint: Check the function name
   |
46 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:46:67
  in call to to_list()
  hint: Check the function name
   |
46 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:47:56
  in call to to_list()
  hint: Check the function name
   |
47 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-3.almd:48:68
  in call to from_list()
  hint: Check the function name
   |
48 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:48:68
  in call to to_list()
  hint: Check the function name
   |
48 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^

28 error(s) found
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```
