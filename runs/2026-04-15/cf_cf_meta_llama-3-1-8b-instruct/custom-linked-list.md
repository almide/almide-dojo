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
    Nil => Nil
    | Cons(h, t) => Cons(h, from_list(t))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => []
    | Cons(h, t) => h :: to_list(t)
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    | Cons(_, t) => 1 + my_len(t)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    | Cons(h, t) => Cons(f(h), my_map(t, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    | Cons(h, t) => match pred(h) {
      true => Cons(h, my_filter(t, pred))
      false => my_filter(t, pred)
    }
  }

fn my_reverse(ml: MyList)
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-0.almd
error: Expected pattern at line 8:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:8:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
8 |     | Cons(h, t) => Cons(h, from_list(t))
  |     ^
error: Expected pattern at line 14:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:14:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
14 |     | Cons(h, t) => h :: to_list(t)
   |     ^
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:20:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | Cons(_, t) => 1 + my_len(t)
   |     ^
error: Expected pattern at line 26:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:26:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
26 |     | Cons(h, t) => Cons(f(h), my_map(t, f))
   |     ^
error: Expected pattern at line 32:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:32:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     | Cons(h, t) => match pred(h) {
   |     ^
error: Expected Arrow at line 38:26 (got Newline '')
  --> /tmp/dojo-custom-linked-list-0.almd:38:26
   |
38 | fn my_reverse(ml: MyList)
   |                          ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:40:73
  in call to from_list()
  hint: Check the function name
   |
40 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   |                                                                         ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:40:73
  in call to to_list()
  hint: Check the function name
   |
40 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   |                                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:41:54
  in call to from_list()
  hint: Check the function name
   |
41 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
   |                                                      ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:41:54
  in call to to_list()
  hint: Check the function name
   |
41 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
   |                                                      ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-0.almd:42:40
  in call to my_len()
  hint: Check the function name
   |
42 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:43:57
  in call to from_list()
  hint: Check the function name
   |
43 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
   |                                                         ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-0.almd:43:57
  in call to my_len()
  hint: Check the function name
   |
43 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
   |                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:44:66
  in call to from_list()
  hint: Check the function name
   |
44 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-0.almd:44:82
  in call to my_map()
  hint: Check the function name
   |
44 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:44:82
  in call to to_list()
  hint: Check the function name
   |
44 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-0.almd:45:65
  in call to my_map()
  hint: Check the function name
   |
45 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:45:65
  in call to to_list()
  hint: Check the function name
   |
45 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:46:77
  in call to from_list()
  hint: Check the function name
   |
46 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                             ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-0.almd:46:98
  in call to my_filter()
  hint: Did you mean `map.filter`?
   |
46 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:46:98
  in call to to_list()
  hint: Check the function name
   |
46 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                                                  ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:47:70
  in call to from_list()
  hint: Check the function name
   |
47 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                      ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-0.almd:47:91
  in call to my_filter()
  hint: Did you mean `map.filter`?
   |
47 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:47:91
  in call to to_list()
  hint: Check the function name
   |
47 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:48:67
  in call to from_list()
  hint: Check the function name
   |
48 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-0.almd:48:67
  in call to my_reverse()
  hint: Check the function name
   |
48 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:48:67
  in call to to_list()
  hint: Check the function name
   |
48 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-0.almd:49:56
  in call to my_reverse()
  hint: Check the function name
   |
49 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:49:56
  in call to to_list()
  hint: Check the function name
   |
49 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:50:68
  in call to from_list()
  hint: Check the function name
   |
50 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-0.almd:50:68
  in call to my_reverse()
  hint: Check the function name
   |
50 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:50:68
  in call to to_list()
  hint: Check the function name
   |
50 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^

32 error(s) found
Compile error for /tmp/dojo-custom-linked-list-0.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-1.almd
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-1.almd:3:73
  in call to from_list()
  hint: Check the function name
  |
3 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
  |                                                                         ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:3:73
  in call to to_list()
  hint: Check the function name
  |
3 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
  |                                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-1.almd:4:54
  in call to from_list()
  hint: Check the function name
  |
4 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
  |                                                      ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:4:54
  in call to to_list()
  hint: Check the function name
  |
4 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
  |                                                      ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-1.almd:5:40
  in call to my_len()
  hint: Check the function name
  |
5 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
  |                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-1.almd:6:57
  in call to from_list()
  hint: Check the function name
  |
6 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
  |                                                         ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-1.almd:6:57
  in call to my_len()
  hint: Check the function name
  |
6 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
  |                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-1.almd:7:66
  in call to from_list()
  hint: Check the function name
  |
7 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
  |                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-1.almd:7:82
  in call to my_map()
  hint: Check the function name
  |
7 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
  |                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:7:82
  in call to to_list()
  hint: Check the function name
  |
7 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
  |                                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-1.almd:8:65
  in call to my_map()
  hint: Check the function name
  |
8 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
  |                                                                 ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:8:65
  in call to to_list()
  hint: Check the function name
  |
8 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
  |                                                                 ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-1.almd:9:77
  in call to from_list()
  hint: Check the function name
  |
9 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
  |                                                                             ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-1.almd:9:98
  in call to my_filter()
  hint: Did you mean `map.filter`?
  |
9 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
  |                                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:9:98
  in call to to_list()
  hint: Check the function name
  |
9 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
  |                                                                                                  ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-1.almd:10:70
  in call to from_list()
  hint: Check the function name
   |
10 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                      ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-1.almd:10:91
  in call to my_filter()
  hint: Did you mean `map.filter`?
   |
10 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:10:91
  in call to to_list()
  hint: Check the function name
   |
10 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-1.almd:11:67
  in call to from_list()
  hint: Check the function name
   |
11 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-1.almd:11:67
  in call to my_reverse()
  hint: Check the function name
   |
11 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:11:67
  in call to to_list()
  hint: Check the function name
   |
11 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-1.almd:12:56
  in call to my_reverse()
  hint: Check the function name
   |
12 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:12:56
  in call to to_list()
  hint: Check the function name
   |
12 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-1.almd:13:68
  in call to from_list()
  hint: Check the function name
   |
13 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-1.almd:13:68
  in call to my_reverse()
  hint: Check the function name
   |
13 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:13:68
  in call to to_list()
  hint: Check the function name
   |
13 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^

26 error(s) found
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
    | Cons(x, xs) => x :: to_list(xs)
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

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil
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
14 |     | Cons(x, xs) => x :: to_list(xs)
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
error: Expected FatArrow at line 38:8 (got Newline '')
  --> /tmp/dojo-custom-linked-list-2.almd:38:8
   |
38 |     Nil
   |        ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-2.almd:40:73
  in call to from_list()
  hint: Check the function name
   |
40 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   |                                                                         ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:40:73
  in call to to_list()
  hint: Check the function name
   |
40 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   |                                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-2.almd:41:54
  in call to from_list()
  hint: Check the function name
   |
41 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
   |                                                      ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:41:54
  in call to to_list()
  hint: Check the function name
   |
41 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
   |                                                      ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-2.almd:42:40
  in call to my_len()
  hint: Check the function name
   |
42 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-2.almd:43:57
  in call to from_list()
  hint: Check the function name
   |
43 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
   |                                                         ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-2.almd:43:57
  in call to my_len()
  hint: Check the function name
   |
43 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
   |                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-2.almd:44:66
  in call to from_list()
  hint: Check the function name
   |
44 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-2.almd:44:82
  in call to my_map()
  hint: Check the function name
   |
44 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:44:82
  in call to to_list()
  hint: Check the function name
   |
44 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-2.almd:45:65
  in call to my_map()
  hint: Check the function name
   |
45 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:45:65
  in call to to_list()
  hint: Check the function name
   |
45 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-2.almd:46:77
  in call to from_list()
  hint: Check the function name
   |
46 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                             ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-2.almd:46:98
  in call to my_filter()
  hint: Did you mean `map.filter`?
   |
46 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:46:98
  in call to to_list()
  hint: Check the function name
   |
46 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                                                  ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-2.almd:47:70
  in call to from_list()
  hint: Check the function name
   |
47 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                      ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-2.almd:47:91
  in call to my_filter()
  hint: Did you mean `map.filter`?
   |
47 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:47:91
  in call to to_list()
  hint: Check the function name
   |
47 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-2.almd:48:67
  in call to from_list()
  hint: Check the function name
   |
48 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-2.almd:48:67
  in call to my_reverse()
  hint: Check the function name
   |
48 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:48:67
  in call to to_list()
  hint: Check the function name
   |
48 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-2.almd:49:56
  in call to my_reverse()
  hint: Check the function name
   |
49 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:49:56
  in call to to_list()
  hint: Check the function name
   |
49 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-2.almd:50:68
  in call to from_list()
  hint: Check the function name
   |
50 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-2.almd:50:68
  in call to my_reverse()
  hint: Check the function name
   |
50 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:50:68
  in call to to_list()
  hint: Check the function name
   |
50 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^

32 error(s) found
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
    | Cons(x, xs) => x :: to_list(xs)
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

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil
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
14 |     | Cons(x, xs) => x :: to_list(xs)
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
error: Expected FatArrow at line 38:8 (got Newline '')
  --> /tmp/dojo-custom-linked-list-3.almd:38:8
   |
38 |     Nil
   |        ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-3.almd:40:73
  in call to from_list()
  hint: Check the function name
   |
40 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   |                                                                         ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:40:73
  in call to to_list()
  hint: Check the function name
   |
40 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   |                                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-3.almd:41:54
  in call to from_list()
  hint: Check the function name
   |
41 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
   |                                                      ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:41:54
  in call to to_list()
  hint: Check the function name
   |
41 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
   |                                                      ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-3.almd:42:40
  in call to my_len()
  hint: Check the function name
   |
42 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-3.almd:43:57
  in call to from_list()
  hint: Check the function name
   |
43 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
   |                                                         ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-3.almd:43:57
  in call to my_len()
  hint: Check the function name
   |
43 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
   |                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-3.almd:44:66
  in call to from_list()
  hint: Check the function name
   |
44 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-3.almd:44:82
  in call to my_map()
  hint: Check the function name
   |
44 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:44:82
  in call to to_list()
  hint: Check the function name
   |
44 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-3.almd:45:65
  in call to my_map()
  hint: Check the function name
   |
45 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:45:65
  in call to to_list()
  hint: Check the function name
   |
45 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-3.almd:46:77
  in call to from_list()
  hint: Check the function name
   |
46 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                             ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-3.almd:46:98
  in call to my_filter()
  hint: Did you mean `map.filter`?
   |
46 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:46:98
  in call to to_list()
  hint: Check the function name
   |
46 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                                                  ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-3.almd:47:70
  in call to from_list()
  hint: Check the function name
   |
47 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                      ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-3.almd:47:91
  in call to my_filter()
  hint: Did you mean `map.filter`?
   |
47 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:47:91
  in call to to_list()
  hint: Check the function name
   |
47 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-3.almd:48:67
  in call to from_list()
  hint: Check the function name
   |
48 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-3.almd:48:67
  in call to my_reverse()
  hint: Check the function name
   |
48 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:48:67
  in call to to_list()
  hint: Check the function name
   |
48 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-3.almd:49:56
  in call to my_reverse()
  hint: Check the function name
   |
49 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:49:56
  in call to to_list()
  hint: Check the function name
   |
49 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-3.almd:50:68
  in call to from_list()
  hint: Check the function name
   |
50 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-3.almd:50:68
  in call to my_reverse()
  hint: Check the function name
   |
50 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:50:68
  in call to to_list()
  hint: Check the function name
   |
50 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^

32 error(s) found
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```
