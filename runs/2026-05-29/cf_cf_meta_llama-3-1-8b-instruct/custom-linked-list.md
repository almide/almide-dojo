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
  match
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
14 |     | Cons(x, ml) => Cons(x, to_list(ml))
   |     ^
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:20:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | Cons(_, ml) => 1 + my_len(ml)
   |     ^
error: Expected pattern at line 26:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:26:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
26 |     | Cons(x, ml) => Cons(f(x), my_map(ml, f))
   |     ^
error: Expected pattern at line 32:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:32:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     | Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |     ^
error: Expected expression at line 38:1 (got Test 'test')
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
14 |     | Cons(x, ml) => Cons(x, to_list(ml))
   |     ^
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:20:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | Cons(_, ml) => 1 + my_len(ml)
   |     ^
error: Expected pattern at line 26:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:26:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
26 |     | Cons(x, ml) => Cons(f(x), my_map(ml, f))
   |     ^
error: Expected pattern at line 32:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:32:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     | Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |     ^
error: Expected pattern at line 38:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-1.almd:38:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
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
14 |     | Cons(x, ml) => Cons(x, to_list(ml))
   |     ^
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:20:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | Cons(_, ml) => 1 + my_len(ml)
   |     ^
error: Expected pattern at line 26:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:26:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
26 |     | Cons(x, ml) => Cons(f(x), my_map(ml, f))
   |     ^
error: Expected pattern at line 32:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:32:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     | Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |     ^
error: Expected pattern at line 38:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-2.almd:38:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
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
14 |     | Cons(x, ml) => Cons(x, to_list(ml))
   |     ^
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:20:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | Cons(_, ml) => 1 + my_len(ml)
   |     ^
error: Expected pattern at line 26:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:26:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
26 |     | Cons(x, ml) => Cons(f(x), my_map(ml, f))
   |     ^
error: Expected pattern at line 32:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:32:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     | Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |     ^
error: Expected pattern at line 38:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-3.almd:38:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
38 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^

6 error(s) found
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```
