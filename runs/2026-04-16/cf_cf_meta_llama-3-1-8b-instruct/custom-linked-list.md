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
    | _ => Cons(xs.first(), from_list(xs.drop(1)))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => Nil
    | Cons(head, tail) => head :: to_list(tail)
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    | Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    | Cons(head, tail) => Cons(f(head), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    | Cons(head, tail) =>
      if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) ->
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-0.almd
error: Expected pattern at line 8:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:8:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
8 |     | _ => Cons(xs.first(), from_list(xs.drop(1)))
  |     ^
error: Expected pattern at line 14:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:14:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
14 |     | Cons(head, tail) => head :: to_list(tail)
   |     ^
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:20:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | Cons(_, tail) => 1 + my_len(tail)
   |     ^
error: Expected pattern at line 26:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:26:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
26 |     | Cons(head, tail) => Cons(f(head), my_map(tail, f))
   |     ^
error: Expected pattern at line 32:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:32:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     | Cons(head, tail) =>
   |     ^
error: Expected type name at line 36:29 (got Newline '')
  --> /tmp/dojo-custom-linked-list-0.almd:36:29
   |
36 | fn my_reverse(ml: MyList) ->
   |                             ^

6 error(s) found
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
    | _ => Cons(xs.first(), from_list(xs.drop(1)))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => Nil
    | Cons(head, tail) => head :: to_list(tail)
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    | Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    | Cons(head, tail) => Cons(f(head), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    | Cons(head, tail) =>
      if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-1.almd
error: Expected pattern at line 8:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:8:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
8 |     | _ => Cons(xs.first(), from_list(xs.drop(1)))
  |     ^
error: Expected pattern at line 14:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:14:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
14 |     | Cons(head, tail) => head :: to_list(tail)
   |     ^
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:20:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | Cons(_, tail) => 1 + my_len(tail)
   |     ^
error: Expected pattern at line 26:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:26:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
26 |     | Cons(head, tail) => Cons(f(head), my_map(tail, f))
   |     ^
error: Expected pattern at line 32:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:32:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     | Cons(head, tail) =>
   |     ^
error: Expected expression at line 38:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-1.almd:38:1
   |
38 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^

6 error(s) found
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
    | _ => Cons(xs.first(), from_list(xs.drop(1)))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => Nil
    | Cons(head, tail) => head :: to_list(tail)
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    | Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    | Cons(head, tail) => Cons(f(head), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    | Cons(head, tail) =>
      if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-2.almd
error: Expected pattern at line 8:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:8:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
8 |     | _ => Cons(xs.first(), from_list(xs.drop(1)))
  |     ^
error: Expected pattern at line 14:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:14:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
14 |     | Cons(head, tail) => head :: to_list(tail)
   |     ^
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:20:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | Cons(_, tail) => 1 + my_len(tail)
   |     ^
error: Expected pattern at line 26:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:26:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
26 |     | Cons(head, tail) => Cons(f(head), my_map(tail, f))
   |     ^
error: Expected pattern at line 32:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:32:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     | Cons(head, tail) =>
   |     ^
error: Expected expression at line 38:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-2.almd:38:1
   |
38 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^

6 error(s) found
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
    | _ => list.fold(xs, Cons(xs.first(), Nil), (Cons(x, y)) => Cons(x, y))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => Nil
    | Cons(head, tail) => head :: to_list(tail)
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    | Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    | Cons(head, tail) => Cons(f(head), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    | Cons(head, tail) =>
      if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-3.almd
error: Expected pattern at line 8:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:8:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
8 |     | _ => list.fold(xs, Cons(xs.first(), Nil), (Cons(x, y)) => Cons(x, y))
  |     ^
error: Expected pattern at line 14:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:14:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
14 |     | Cons(head, tail) => head :: to_list(tail)
   |     ^
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:20:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | Cons(_, tail) => 1 + my_len(tail)
   |     ^
error: Expected pattern at line 26:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:26:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
26 |     | Cons(head, tail) => Cons(f(head), my_map(tail, f))
   |     ^
error: Expected pattern at line 32:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:32:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     | Cons(head, tail) =>
   |     ^
error: Expected function name at line 36:3 (got Newline '')
  --> /tmp/dojo-custom-linked-list-3.almd:36:3
   |
36 | fn
   |   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-3.almd:46:67
  in call to my_reverse()
  hint: Check the function name
   |
46 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-3.almd:47:56
  in call to my_reverse()
  hint: Check the function name
   |
47 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-3.almd:48:68
  in call to my_reverse()
  hint: Check the function name
   |
48 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^

9 error(s) found
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```
