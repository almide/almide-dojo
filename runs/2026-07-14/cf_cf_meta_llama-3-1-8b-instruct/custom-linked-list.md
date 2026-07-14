# custom-linked-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
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
  fn reverse(ml: MyList, acc: MyList) -> MyList =
    match ml {
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-0.almd
error: Expected pattern at line 4:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:4:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |     | Cons(x, xs) => Cons(x, from_list(xs))
  |     ^
error: Expected pattern at line 10:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:10:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
10 |     | Cons(x, ml) => Cons(x, to_list(ml))
   |     ^
error: Expected pattern at line 16:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:16:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
16 |     | Cons(_, ml) => 1 + my_len(ml)
   |     ^
error: Expected pattern at line 22:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:22:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
22 |     | Cons(x, ml) => Cons(f(x), my_map(ml, f))
   |     ^
error: Expected pattern at line 28:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:28:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
28 |     | Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |     ^
error: Expected expression at line 32:3 (got Fn 'fn')
  --> /tmp/dojo-custom-linked-list-0.almd:32:3
   |
32 |   fn reverse(ml: MyList, acc: MyList) -> MyList =
   |   ^
error: Expected pattern at line 35:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-0.almd:35:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
35 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^

7 error(s) found
Compile error for /tmp/dojo-custom-linked-list-0.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

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
    | Cons(x, ml) => my_reverse(my_reverse
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-1.almd
error: Expected pattern at line 4:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:4:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |     | Cons(x, xs) => Cons(x, from_list(xs))
  |     ^
error: Expected pattern at line 10:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:10:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
10 |     | Cons(x, ml) => Cons(x, to_list(ml))
   |     ^
error: Expected pattern at line 16:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:16:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
16 |     | Cons(_, ml) => 1 + my_len(ml)
   |     ^
error: Expected pattern at line 22:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:22:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
22 |     | Cons(x, ml) => Cons(f(x), my_map(ml, f))
   |     ^
error: Expected pattern at line 28:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:28:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
28 |     | Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |     ^
error: Expected pattern at line 34:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:34:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
34 |     | Cons(x, ml) => my_reverse(my_reverse
   |     ^

6 error(s) found
Compile error for /tmp/dojo-custom-linked-list-1.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

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
    | Cons(x, ml) => my_reverse(my_map
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-2.almd
error: Expected pattern at line 4:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:4:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |     | Cons(x, xs) => Cons(x, from_list(xs))
  |     ^
error: Expected pattern at line 10:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:10:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
10 |     | Cons(x, ml) => Cons(x, to_list(ml))
   |     ^
error: Expected pattern at line 16:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:16:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
16 |     | Cons(_, ml) => 1 + my_len(ml)
   |     ^
error: Expected pattern at line 22:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:22:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
22 |     | Cons(x, ml) => Cons(f(x), my_map(ml, f))
   |     ^
error: Expected pattern at line 28:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:28:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
28 |     | Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |     ^
error: Expected pattern at line 34:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:34:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
34 |     | Cons(x, ml) => my_reverse(my_map
   |     ^

6 error(s) found
Compile error for /tmp/dojo-custom-linked-list-2.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

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
    | Cons(_, tail) => 1 + my_len(tail)
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
    | Cons(x, tail) => my_reverse(t
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-3.almd
error: Expected pattern at line 4:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:4:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |     | Cons(x, xs) => Cons(x, from_list(xs))
  |     ^
error: Expected pattern at line 10:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:10:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
10 |     | Cons(x, ml) => Cons(x, to_list(ml))
   |     ^
error: Expected pattern at line 16:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:16:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
16 |     | Cons(_, tail) => 1 + my_len(tail)
   |     ^
error: Expected pattern at line 22:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:22:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
22 |     | Cons(x, ml) => Cons(f(x), my_map(ml, f))
   |     ^
error: Expected pattern at line 28:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:28:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
28 |     | Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |     ^
error: Expected pattern at line 34:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:34:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
34 |     | Cons(x, tail) => my_reverse(t
   |     ^

6 error(s) found
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```
