# custom-linked-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn from_list(xs: List[Int]) -> MyList =
  match xs {
    Nil => Nil
    | Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => Nil
    | Cons(x, ml) => Cons(x, to_list(ml))
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    | Cons(_, ml) => 1 + my_len(ml)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    | Cons(x, ml) => Cons(f(x), my_map(ml, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    | Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    | Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }
```

**Diagnostic:**

```
error: Expected pattern at line 4:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:4:5
  here: | Cons(x, xs) => Cons(x, from_list(xs))
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |     | Cons(x, xs) => Cons(x, from_list(xs))
  |     ^
error: Expected pattern at line 10:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:10:5
  here: | Cons(x, ml) => Cons(x, to_list(ml))
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
10 |     | Cons(x, ml) => Cons(x, to_list(ml))
   |     ^
error: Expected pattern at line 16:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:16:5
  here: | Cons(_, ml) => 1 + my_len(ml)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
16 |     | Cons(_, ml) => 1 + my_len(ml)
   |     ^
error: Expected pattern at line 22:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:22:5
  here: | Cons(x, ml) => Cons(f(x), my_map(ml, f))
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
22 |     | Cons(x, ml) => Cons(f(x), my_map(ml, f))
   |     ^
error: Expected pattern at line 28:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:28:5
  here: | Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
28 |     | Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |     ^
error: Expected pattern at line 34:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:34:5
  here: | Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
34 |     | Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
   |     ^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:39:40
  in variable Nil
  here: test "my_len empty" { assert_eq(my_len(Nil), 0) }
  hint: Check the variable name
   |
39 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:42:49
  in variable Nil
  here: test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
  hint: Check the variable name
   |
42 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                 ^^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:46:56
  in variable Nil
  here: test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
  hint: Check the variable name
   |
46 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E029]: unknown type 'MyList'
  in return type of 'from_list'
  hint: no `type MyList` is declared (or imported) in this program — declare it, or check the spelling

10 error(s) found
FAILED: /tmp/dojo-custom-linked-list-0.almd
Compile error for /tmp/dojo-custom-linked-list-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

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
    Nil => Nil
    | Cons(x, ml) => Cons(x, to_list(ml))
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    | Cons(_, ml) => 1 + my_len(ml)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    | Cons(x, ml) => Cons(f(x), my_map(ml, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    | Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    | Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

test "my_len empty" { assert_eq(my_len(Nil), 0) }
test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
```

**Diagnostic:**

```
error: Expected pattern at line 8:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:8:5
  here: | Cons(x, xs) => Cons(x, from_list(xs))
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
8 |     | Cons(x, xs) => Cons(x, from_list(xs))
  |     ^
error: Expected pattern at line 14:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:14:5
  here: | Cons(x, ml) => Cons(x, to_list(ml))
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
14 |     | Cons(x, ml) => Cons(x, to_list(ml))
   |     ^
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:20:5
  here: | Cons(_, ml) => 1 + my_len(ml)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | Cons(_, ml) => 1 + my_len(ml)
   |     ^
error: Expected pattern at line 26:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:26:5
  here: | Cons(x, ml) => Cons(f(x), my_map(ml, f))
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
26 |     | Cons(x, ml) => Cons(f(x), my_map(ml, f))
   |     ^
error: Expected pattern at line 32:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:32:5
  here: | Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     | Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |     ^
error: Expected pattern at line 38:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:38:5
  here: | Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
38 |     | Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
   |     ^
error[E012]: duplicate test 'my_len empty'
  at line 47
  in test "my_len empty"
  here: test "my_len empty" { assert_eq(my_len(Nil), 0) }
  hint: Rename one of the tests, or merge them. Each test name must be unique within a file.
   |
41 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   | ------------------------------ first test 'my_len empty' here
...
47 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   | ^^^^^^^^^^^^^^^^^^^
error[E012]: duplicate test 'my_map on nil'
  at line 50
  in test "my_map on nil"
  here: test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
  hint: Rename one of the tests, or merge them. Each test name must be unique within a file.
   |
42 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   | ------------------------------- first test 'my_map on nil' here
...
50 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   | ^^^^^^^^^^^^^^^^^^^^
error[E012]: duplicate test 'my_reverse empty'
  at line 54
  in test "my_reverse empty"
  here: test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
  hint: Rename one of the tests, or merge them. Each test name must be unique within a file.
   |
43 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   | ---------------------------------- first test 'my_reverse empty' here
...
54 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   | ^^^^^^^^^^^^^^^^^^^^^^^

9 error(s) found
FAILED: /tmp/dojo-custom-linked-list-1.almd
Compile error for /tmp/dojo-custom-linked-list-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

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
    Nil => Nil
    | Cons(x, ml) => Cons(x, to_list(ml))
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    | Cons(_, ml) => 1 + my_len(ml)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    | Cons(x, ml) => Cons(f(x), my_map(ml, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    | Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    | Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

test "my_len empty" { assert_eq(my_len(Nil), 0) }
test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
```

**Diagnostic:**

```
error: Expected pattern at line 8:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:8:5
  here: | Cons(x, xs) => Cons(x, from_list(xs))
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
8 |     | Cons(x, xs) => Cons(x, from_list(xs))
  |     ^
error: Expected pattern at line 14:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:14:5
  here: | Cons(x, ml) => Cons(x, to_list(ml))
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
14 |     | Cons(x, ml) => Cons(x, to_list(ml))
   |     ^
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:20:5
  here: | Cons(_, ml) => 1 + my_len(ml)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | Cons(_, ml) => 1 + my_len(ml)
   |     ^
error: Expected pattern at line 26:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:26:5
  here: | Cons(x, ml) => Cons(f(x), my_map(ml, f))
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
26 |     | Cons(x, ml) => Cons(f(x), my_map(ml, f))
   |     ^
error: Expected pattern at line 32:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:32:5
  here: | Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     | Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |     ^
error: Expected pattern at line 38:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:38:5
  here: | Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
38 |     | Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
   |     ^
error[E012]: duplicate test 'my_len empty'
  at line 47
  in test "my_len empty"
  here: test "my_len empty" { assert_eq(my_len(Nil), 0) }
  hint: Rename one of the tests, or merge them. Each test name must be unique within a file.
   |
41 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   | ------------------------------ first test 'my_len empty' here
...
47 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   | ^^^^^^^^^^^^^^^^^^^
error[E012]: duplicate test 'my_map on nil'
  at line 50
  in test "my_map on nil"
  here: test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
  hint: Rename one of the tests, or merge them. Each test name must be unique within a file.
   |
42 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   | ------------------------------- first test 'my_map on nil' here
...
50 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   | ^^^^^^^^^^^^^^^^^^^^
error[E012]: duplicate test 'my_reverse empty'
  at line 54
  in test "my_reverse empty"
  here: test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
  hint: Rename one of the tests, or merge them. Each test name must be unique within a file.
   |
43 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   | ---------------------------------- first test 'my_reverse empty' here
...
54 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   | ^^^^^^^^^^^^^^^^^^^^^^^

9 error(s) found
FAILED: /tmp/dojo-custom-linked-list-2.almd
Compile error for /tmp/dojo-custom-linked-list-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

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
    Nil => Nil
    | Cons(x, ml) => Cons(x, to_list(ml))
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    | Cons(_, ml) => 1 + my_len(ml)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    | Cons(x, ml) => Cons(f(x), my_map(ml, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    | Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    | Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

test "my_len empty" { assert_eq(my_len(Nil), 0) }
test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
```

**Diagnostic:**

```
error: Expected pattern at line 8:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:8:5
  here: | Cons(x, xs) => Cons(x, from_list(xs))
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
8 |     | Cons(x, xs) => Cons(x, from_list(xs))
  |     ^
error: Expected pattern at line 14:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:14:5
  here: | Cons(x, ml) => Cons(x, to_list(ml))
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
14 |     | Cons(x, ml) => Cons(x, to_list(ml))
   |     ^
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:20:5
  here: | Cons(_, ml) => 1 + my_len(ml)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | Cons(_, ml) => 1 + my_len(ml)
   |     ^
error: Expected pattern at line 26:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:26:5
  here: | Cons(x, ml) => Cons(f(x), my_map(ml, f))
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
26 |     | Cons(x, ml) => Cons(f(x), my_map(ml, f))
   |     ^
error: Expected pattern at line 32:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:32:5
  here: | Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     | Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |     ^
error: Expected pattern at line 38:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:38:5
  here: | Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
38 |     | Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
   |     ^
error[E012]: duplicate test 'my_len empty'
  at line 47
  in test "my_len empty"
  here: test "my_len empty" { assert_eq(my_len(Nil), 0) }
  hint: Rename one of the tests, or merge them. Each test name must be unique within a file.
   |
41 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   | ------------------------------ first test 'my_len empty' here
...
47 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   | ^^^^^^^^^^^^^^^^^^^
error[E012]: duplicate test 'my_map on nil'
  at line 50
  in test "my_map on nil"
  here: test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
  hint: Rename one of the tests, or merge them. Each test name must be unique within a file.
   |
42 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   | ------------------------------- first test 'my_map on nil' here
...
50 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   | ^^^^^^^^^^^^^^^^^^^^
error[E012]: duplicate test 'my_reverse empty'
  at line 54
  in test "my_reverse empty"
  here: test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
  hint: Rename one of the tests, or merge them. Each test name must be unique within a file.
   |
43 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   | ---------------------------------- first test 'my_reverse empty' here
...
54 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   | ^^^^^^^^^^^^^^^^^^^^^^^

9 error(s) found
FAILED: /tmp/dojo-custom-linked-list-3.almd
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
