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
    | Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    | Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    | Cons(x, tail) =>
      if pred(x) then Cons(x, my_filter(tail, pred))
      else my_filter(tail, pred)
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
20 |     | Cons(_, tail) => 1 + my_len(tail)
   |     ^
error: Expected pattern at line 26:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:26:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
26 |     | Cons(x, tail) => Cons(f(x), my_map(tail, f))
   |     ^
error: Expected pattern at line 32:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:32:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     | Cons(x, tail) =>
   |     ^
error: Expected Arrow at line 37:26 (got Newline '')
  --> /tmp/dojo-custom-linked-list-0.almd:37:26
   |
37 | fn my_reverse(ml: MyList)
   |                          ^

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
    | Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    | Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    | Cons(x, tail) =>
      if pred(x) then Cons(x, my_filter(tail, pred))
      else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList
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
20 |     | Cons(_, tail) => 1 + my_len(tail)
   |     ^
error: Expected pattern at line 26:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:26:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
26 |     | Cons(x, tail) => Cons(f(x), my_map(tail, f))
   |     ^
error: Expected pattern at line 32:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:32:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     | Cons(x, tail) =>
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
  match xs {
    Nil => Nil
    | Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => Nil
    | Cons(x, tail) => Cons(x, to_list(tail))
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    | Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    | Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    | Cons(x, tail) =>
      if pred(x) then Cons(x, my_filter(tail, pred))
      else my_filter(tail, pred)
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
14 |     | Cons(x, tail) => Cons(x, to_list(tail))
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
26 |     | Cons(x, tail) => Cons(f(x), my_map(tail, f))
   |     ^
error: Expected pattern at line 32:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:32:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     | Cons(x, tail) =>
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
  match xs {
    Nil => Nil
    | Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => Nil
    | Cons(x, tail) => Cons(x, to_list(tail))
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    | Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    | Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    | Cons(x, tail) =>
      if pred(x) then Cons(x, my_filter(tail, pred))
      else my_filter(tail, pred)
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
14 |     | Cons(x, tail) => Cons(x, to_list(tail))
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
26 |     | Cons(x, tail) => Cons(f(x), my_map(tail, f))
   |     ^
error: Expected pattern at line 32:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:32:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 |     | Cons(x, tail) =>
   |     ^

5 error(s) found
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```
