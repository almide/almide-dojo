# custom-linked-list

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
type MyList =
  | Nil
  | Cons(Int, MyList)

fn from_list(xs: List[Int]) -> MyList = 
  list.fold(xs, Nil, (acc, x) => Cons(x, acc))

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => []
    Cons(head, tail) => head :: to_list(tail)
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    Cons(head, tail) => Cons(f(head), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    Cons(head, tail) => 
      if pred(head) then 
        Cons(head, my_filter(tail, pred))
      else 
        my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(head, tail) => my_reverse(tail) |> (x) => Cons(head, x)
  }
```

**Diagnostic:**

```
error: Expected pattern at line 11:30 (got Colon ':')
  --> /tmp/dojo-custom-linked-list-0.almd:11:30
  here: Cons(head, tail) => head :: to_list(tail)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
11 |     Cons(head, tail) => head :: to_list(tail)
   |                              ^

1 error(s) found
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
  list.fold(xs, Nil, (acc, x) => Cons(x, acc))

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => list.repeat(0, 0)
    Cons(head, tail) => list.cons(head, to_list(tail))
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    Cons(head, tail) => Cons(f(head), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    Cons(head, tail) => 
      if pred(head) then 
        Cons(head, my_filter(tail, pred))
      else 
        my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(head, tail) => my_reverse(tail) |> (x) => Cons(head, x)
  }
```

**Diagnostic:**

```
error[E002]: undefined function 'list.cons'
  --> /tmp/dojo-custom-linked-list-1.almd:11:25
  in call to list.cons()
  here: Cons(head, tail) => list.cons(head, to_list(tail))
  hint: Did you mean `list.count`?
  try:
      list.count
   |
11 |     Cons(head, tail) => list.cons(head, to_list(tail))
   |                         ^^^^^^^^^

1 error(s) found
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
  list.fold(xs, Nil, (acc, x) => Cons(x, acc))

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => list.repeat(0, 0)
    Cons(head, tail) => [head] + to_list(tail)
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    Cons(head, tail) => Cons(f(head), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    Cons(head, tail) => 
      if pred(head) then 
        Cons(head, my_filter(tail, pred))
      else 
        my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(head, tail) => my_reverse(tail) |> (x) => Cons(head, x)
  }
```

**Diagnostic:**

```
FAILED: /tmp/dojo-custom-linked-list-2.almd
  test: from_list to_list roundtrip
  at:   /tmp/dojo-custom-linked-list-2.almd:42
  hint: item 0 differs
  diff: -expected +found
    - 1
    - 2
      3
    + 2
    + 1
  test: my_map double
  at:   /tmp/dojo-custom-linked-list-2.almd:46
  hint: item 0 differs
  diff: -expected +found
    - 2
    - 4
      6
    + 4
    + 2
  test: my_filter evens
  at:   /tmp/dojo-custom-linked-list-2.almd:48
  hint: item 0 differs
  diff: -expected +found
    - 2
      4
    + 2

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

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
    Nil => list.repeat(0, 0)
    Cons(head, tail) => [head] + to_list(tail)
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    Cons(head, tail) => Cons(f(head), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    Cons(head, tail) => 
      if pred(head) then 
        Cons(head, my_filter(tail, pred))
      else 
        my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(head, tail) => my_reverse(tail) |> (x) => Cons(head, x)
  }
```

**Diagnostic:**

```
FAILED: /tmp/dojo-custom-linked-list-3.almd
  test: from_list to_list roundtrip
  at:   /tmp/dojo-custom-linked-list-3.almd:42
  hint: item 0 differs
  diff: -expected +found
    - 1
    - 2
      3
    + 2
    + 1
  test: my_map double
  at:   /tmp/dojo-custom-linked-list-3.almd:46
  hint: item 0 differs
  diff: -expected +found
    - 2
    - 4
      6
    + 4
    + 2
  test: my_filter evens
  at:   /tmp/dojo-custom-linked-list-3.almd:48
  hint: item 0 differs
  diff: -expected +found
    - 2
      4
    + 2

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
