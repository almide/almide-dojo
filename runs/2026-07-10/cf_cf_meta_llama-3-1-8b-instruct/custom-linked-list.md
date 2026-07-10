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
    | Nil => Nil
    | Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    | Nil => Nil
    | Cons(x, ml) => Cons(x, to_list(ml))
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    | Nil => 0
    | Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    | Nil => Nil
    | Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    | Nil => Nil
    | Cons(x, tail) => match pred(x) {
      | true => Cons(x, my_filter(tail, pred))
      | false => my_filter(tail, pred)
    }
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-0.almd
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:3:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | Nil => Nil
  |     ^
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:9:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Nil => Nil
  |     ^
error: Expected pattern at line 15:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:15:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
15 |     | Nil => 0
   |     ^
error: Expected pattern at line 21:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:21:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
21 |     | Nil => Nil
   |     ^
error: Expected pattern at line 27:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-0.almd:27:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
27 |     | Nil => Nil
   |     ^
error: Expected LBrace at line 37:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-0.almd:37:1
  hint: `test "..."` is a top-level form. Got here mid-declaration — either the previous fn/type/impl is missing a closing `}`, or the test block is in a context (e.g. harness-submitted code) that doesn't accept one. Remove the test block or close the prior declaration.
   |
37 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^

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
    | Nil => Nil
    | Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    | Nil => Nil
    | Cons(x, tail) => Cons(x, to_list(tail))
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    | Nil => 0
    | Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    | Nil => Nil
    | Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    | Nil => Nil
    | Cons(x, tail) => match pred(x) {
      | true => Cons(x, my_filter(tail, pred))
      | false => my_filter(tail, pred)
    }
  }

fn my_reverse(ml: MyList) -> MyList =
  match
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-1.almd
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:3:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | Nil => Nil
  |     ^
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:9:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Nil => Nil
  |     ^
error: Expected pattern at line 15:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:15:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
15 |     | Nil => 0
   |     ^
error: Expected pattern at line 21:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:21:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
21 |     | Nil => Nil
   |     ^
error: Expected pattern at line 27:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-1.almd:27:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
27 |     | Nil => Nil
   |     ^
error: Expected expression at line 37:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-1.almd:37:1
   |
37 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^

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
    | Nil => Nil
    | Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    | Nil => Nil
    | Cons(x, tail) => Cons(x, to_list(tail))
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    | Nil => 0
    | Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    | Nil => Nil
    | Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    | Nil => Nil
    | Cons(x, tail) => match pred(x) {
      | true => Cons(x, my_filter(tail, pred))
      | false => my_filter(tail, pred)
    }
  }

fn my_reverse(ml: MyList) -> MyList =
  match
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-2.almd
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:3:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | Nil => Nil
  |     ^
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:9:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Nil => Nil
  |     ^
error: Expected pattern at line 15:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:15:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
15 |     | Nil => 0
   |     ^
error: Expected pattern at line 21:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:21:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
21 |     | Nil => Nil
   |     ^
error: Expected pattern at line 27:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-2.almd:27:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
27 |     | Nil => Nil
   |     ^
error: Expected expression at line 37:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-2.almd:37:1
   |
37 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^

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
    | Nil => Nil
    | Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    | Nil => Nil
    | Cons(x, tail) => Cons(x, to_list(tail))
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    | Nil => 0
    | Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    | Nil => Nil
    | Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    | Nil => Nil
    | Cons(x, tail) => match pred(x) {
      | true => Cons(x, my_filter(tail, pred))
      | false => my_filter(tail, pred)
    }
  }

fn my_reverse(ml: MyList) -> MyList =
  match
```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-3.almd
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:3:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | Nil => Nil
  |     ^
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:9:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Nil => Nil
  |     ^
error: Expected pattern at line 15:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:15:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
15 |     | Nil => 0
   |     ^
error: Expected pattern at line 21:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:21:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
21 |     | Nil => Nil
   |     ^
error: Expected pattern at line 27:5 (got Pipe '|')
  --> /tmp/dojo-custom-linked-list-3.almd:27:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
27 |     | Nil => Nil
   |     ^
error: Expected expression at line 37:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-3.almd:37:1
   |
37 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
   | ^

6 error(s) found
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```
