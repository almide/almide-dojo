# custom-linked-list

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-custom-linked-list-3.almd
error: Expected pattern at line 38:1 (got Test 'test')
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-custom-linked-list-3.almd:38:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
38 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^
error[E002]: undefined function 'list.foldRight'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-custom-linked-list-3.almd:6:47
  in call to list.foldRight()
  hint: No function 'foldRight' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
6 |   list.foldRight(xs, Nil, (x, acc) => Cons(x, acc))
  |                                               ^^^
error[E002]: undefined function 'list.cons'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-custom-linked-list-3.almd:11:49
  in call to list.cons()
  hint: No function 'cons' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
11 |     Cons(head, tail) => list.cons(head, to_list(tail))
   |                                                 ^^^^
error[E002]: undefined function 'my_reverse'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-custom-linked-list-3.almd:46:67
  in call to my_reverse()
  hint: Check the function name
   |
46 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-custom-linked-list-3.almd:47:56
  in call to my_reverse()
  hint: Check the function name
   |
47 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'my_reverse'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-custom-linked-list-3.almd:48:68
  in call to my_reverse()
  hint: Check the function name
   |
48 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^

6 error(s) found
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-custom-linked-list-3.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide
type MyList =
  | Nil
  | Cons(Int, MyList)

fn from_list(xs: List[Int]) -> MyList =
  list.foldRight(xs, Nil, (x, acc) => Cons(x, acc))

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => [],
    Cons(head, tail) => list.cons(head, to_list(tail))
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0,
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil,
    Cons(head, tail) => Cons(f(head), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil,
    Cons(head, tail) => 
      if pred(head) 
      then Cons(head, my_filter(tail, pred)) 
      else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
```
