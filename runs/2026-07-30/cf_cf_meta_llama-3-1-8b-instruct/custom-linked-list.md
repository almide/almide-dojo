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
    | Cons(h, t) => Cons(h, from_list(t))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => Nil
    | Cons(h, t) => Cons(h, to_list(t))
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
    | Cons(h, t) =>
      if pred(h) then Cons(h, my_filter(t, pred)) else my_filter(t, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    | Cons(h, t) => my_reverse(t
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-0.almd
error: Expected pattern at line 4:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:4:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |     | Cons(h, t) => Cons(h, from_list(t))
  |     ^
error: Expected pattern at line 10:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:10:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
10 |     | Cons(h, t) => Cons(h, to_list(t))
   |     ^
error: Expected pattern at line 16:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:16:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
16 |     | Cons(_, t) => 1 + my_len(t)
   |     ^
error: Expected pattern at line 22:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:22:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
22 |     | Cons(h, t) => Cons(f(h), my_map(t, f))
   |     ^
error: Expected pattern at line 28:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:28:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
28 |     | Cons(h, t) =>
   |     ^
error: Expected pattern at line 35:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:35:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
35 |     | Cons(h, t) => my_reverse(t
   |     ^

6 error(s) found
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
    | Cons(h, t) => Cons(h, from_list(t))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => Nil
    | Cons(h, t) => Cons(h, to_list(t))
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
    | Cons(h, t) =>
      if pred(h) then Cons(h, my_filter(t, pred)) else my_filter(t, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    | Cons(h, t) => my_reverse(t
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-1.almd
error: Expected pattern at line 4:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:4:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |     | Cons(h, t) => Cons(h, from_list(t))
  |     ^
error: Expected pattern at line 10:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:10:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
10 |     | Cons(h, t) => Cons(h, to_list(t))
   |     ^
error: Expected pattern at line 16:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:16:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
16 |     | Cons(_, t) => 1 + my_len(t)
   |     ^
error: Expected pattern at line 22:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:22:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
22 |     | Cons(h, t) => Cons(f(h), my_map(t, f))
   |     ^
error: Expected pattern at line 28:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:28:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
28 |     | Cons(h, t) =>
   |     ^
error: Expected pattern at line 35:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:35:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
35 |     | Cons(h, t) => my_reverse(t
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
    | Cons(h, t) => Cons(h, from_list(t))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => Nil
    | Cons(h, t) => Cons(h, to_list(t))
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
    | Cons(h, t) =>
      if pred(h) then Cons(h, my_filter(t, pred)) else my_filter(t, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    | Cons(h, t) => Cons(h,
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-2.almd
error: Expected pattern at line 4:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:4:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |     | Cons(h, t) => Cons(h, from_list(t))
  |     ^
error: Expected pattern at line 10:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:10:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
10 |     | Cons(h, t) => Cons(h, to_list(t))
   |     ^
error: Expected pattern at line 16:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:16:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
16 |     | Cons(_, t) => 1 + my_len(t)
   |     ^
error: Expected pattern at line 22:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:22:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
22 |     | Cons(h, t) => Cons(f(h), my_map(t, f))
   |     ^
error: Expected pattern at line 28:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:28:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
28 |     | Cons(h, t) =>
   |     ^
error: Expected pattern at line 35:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:35:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
35 |     | Cons(h, t) => Cons(h,
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
    | Cons(h, t) => Cons(h, from_list(t))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => Nil
    | Cons(h, t) => Cons(h, to_list(t))
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
    | Cons(h, t) =>
      if pred(h) then Cons(h, my_filter(t, pred)) else my_filter(t, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    | Cons(h, t) => my_reverse(t
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-3.almd
error: Expected pattern at line 4:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:4:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |     | Cons(h, t) => Cons(h, from_list(t))
  |     ^
error: Expected pattern at line 10:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:10:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
10 |     | Cons(h, t) => Cons(h, to_list(t))
   |     ^
error: Expected pattern at line 16:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:16:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
16 |     | Cons(_, t) => 1 + my_len(t)
   |     ^
error: Expected pattern at line 22:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:22:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
22 |     | Cons(h, t) => Cons(f(h), my_map(t, f))
   |     ^
error: Expected pattern at line 28:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:28:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
28 |     | Cons(h, t) =>
   |     ^
error: Expected pattern at line 35:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:35:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
35 |     | Cons(h, t) => my_reverse(t
   |     ^

6 error(s) found
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```
