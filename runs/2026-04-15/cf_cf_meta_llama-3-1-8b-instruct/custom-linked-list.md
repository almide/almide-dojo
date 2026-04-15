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
    | Cons(h, t) => if pred(h) then Cons(h, my_filter(t, pred)) else my_filter(t, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml
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
32 |     | Cons(h, t) => if pred(h) then Cons(h, my_filter(t, pred)) else my_filter(t, pred)
   |     ^
error: Expected LBrace at line 38:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-0.almd:38:1
   |
38 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^

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
  list.fold(xs, Nil, (acc, x) => Cons(x, acc))

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
    | Cons(h, t) => if pred(h) then Cons(h, my_filter(t, pred)) else my_filter(t, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    | Cons(h, t
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-1.almd
error: Expected pattern at line 11:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:11:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
11 |     | Cons(h, t) => h :: to_list(t)
   |     ^
error: Expected pattern at line 17:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:17:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
17 |     | Cons(_, t) => 1 + my_len(t)
   |     ^
error: Expected pattern at line 23:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:23:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
23 |     | Cons(h, t) => Cons(f(h), my_map(t, f))
   |     ^
error: Expected pattern at line 29:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:29:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
29 |     | Cons(h, t) => if pred(h) then Cons(h, my_filter(t, pred)) else my_filter(t, pred)
   |     ^
error: Expected pattern at line 35:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:35:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
35 |     | Cons(h, t
   |     ^

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
  list.fold(xs, Nil, (acc, x) => Cons(x, acc))

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
    | Cons(h, t) => if pred(h) then Cons(h, my_filter(t, pred)) else my_filter(t, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    | Cons(h, t
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-2.almd
error: Expected pattern at line 11:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:11:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
11 |     | Cons(h, t) => h :: to_list(t)
   |     ^
error: Expected pattern at line 17:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:17:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
17 |     | Cons(_, t) => 1 + my_len(t)
   |     ^
error: Expected pattern at line 23:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:23:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
23 |     | Cons(h, t) => Cons(f(h), my_map(t, f))
   |     ^
error: Expected pattern at line 29:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:29:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
29 |     | Cons(h, t) => if pred(h) then Cons(h, my_filter(t, pred)) else my_filter(t, pred)
   |     ^
error: Expected pattern at line 35:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:35:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
35 |     | Cons(h, t
   |     ^

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
  list.fold(xs, Nil, (acc, x) => Cons(x, acc))

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
    | Cons(h, t) => if pred(h) then Cons(h, my_filter(t, pred)) else my_filter(t, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    | Cons(h, t
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-3.almd
error: Expected pattern at line 11:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:11:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
11 |     | Cons(h, t) => h :: to_list(t)
   |     ^
error: Expected pattern at line 17:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:17:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
17 |     | Cons(_, t) => 1 + my_len(t)
   |     ^
error: Expected pattern at line 23:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:23:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
23 |     | Cons(h, t) => Cons(f(h), my_map(t, f))
   |     ^
error: Expected pattern at line 29:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:29:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
29 |     | Cons(h, t) => if pred(h) then Cons(h, my_filter(t, pred)) else my_filter(t, pred)
   |     ^
error: Expected pattern at line 35:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:35:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
35 |     | Cons(h, t
   |     ^

5 error(s) found
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```
