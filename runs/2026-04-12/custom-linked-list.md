# custom-linked-list

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /tmp/dojo-custom-linked-list-3.almd
error: Expected FatArrow at line 10:10 (got TypeName 'Nil')
  --> /tmp/dojo-custom-linked-list-3.almd:10:10
   |
10 |     case Nil => list.nil
   |          ^
error: Expected FatArrow at line 16:10 (got TypeName 'Nil')
  --> /tmp/dojo-custom-linked-list-3.almd:16:10
   |
16 |     case Nil => 0
   |          ^
error: Expected FatArrow at line 22:10 (got TypeName 'Nil')
  --> /tmp/dojo-custom-linked-list-3.almd:22:10
   |
22 |     case Nil => Nil
   |          ^
error: Expected FatArrow at line 28:10 (got TypeName 'Nil')
  --> /tmp/dojo-custom-linked-list-3.almd:28:10
   |
28 |     case Nil => Nil
   |          ^
error: Expected ')' to close function parameters opened at line 34:14
  --> /tmp/dojo-custom-linked-list-3.almd:36:1
  hint: Add ')' or check for a missing delimiter inside the function parameters
   |
34 | fn my_reverse(ml: MyList
   |              --------------- '(' opened here
...
36 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^^^^
error: Expected ')' to close function parameters opened at line 34:14 at line 36:1
  --> /tmp/dojo-custom-linked-list-3.almd:34:14
   |
34 | fn my_reverse(ml: MyList
   |              ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:36:73
  in call to to_list()
  hint: Check the function name
   |
36 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   |                                                                         ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:37:54
  in call to to_list()
  hint: Check the function name
   |
37 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
   |                                                      ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-3.almd:38:40
  in call to my_len()
  hint: Check the function name
   |
38 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-3.almd:39:57
  in call to my_len()
  hint: Check the function name
   |
39 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
   |                                                         ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-3.almd:40:82
  in call to my_map()
  hint: Check the function name
   |
40 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:40:82
  in call to to_list()
  hint: Check the function name
   |
40 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
   |                                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-3.almd:41:65
  in call to my_map()
  hint: Check the function name
   |
41 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:41:65
  in call to to_list()
  hint: Check the function name
   |
41 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                                 ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-3.almd:42:98
  in call to my_filter()
  hint: Did you mean `map.filter`?
   |
42 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:42:98
  in call to to_list()
  hint: Check the function name
   |
42 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
   |                                                                                                  ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-3.almd:43:91
  in call to my_filter()
  hint: Did you mean `map.filter`?
   |
43 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:43:91
  in call to to_list()
  hint: Check the function name
   |
43 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-3.almd:44:67
  in call to my_reverse()
  hint: Check the function name
   |
44 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:44:67
  in call to to_list()
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
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:45:56
  in call to to_list()
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
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:46:68
  in call to to_list()
  hint: Check the function name
   |
46 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^

24 error(s) found
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide
type MyList = 
  | Nil
  | Cons(Int, MyList)

fn from_list(xs: List[Int]) -> MyList = 
  list.fold(xs, Nil, (acc, x) => Cons(x, acc))

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    case Nil => list.nil
    case Cons(head, tail) => head :: to_list(tail)
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    case Nil => 0
    case Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    case Nil => Nil
    case Cons(head, tail) => Cons(f(head), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    case Nil => Nil
    case Cons(head, tail) => 
      if pred(head) then Cons(head, my_filter(tail, pred))
      else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList
```
