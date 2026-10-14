# custom-linked-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E012`

## Attempts

### Attempt 1 (FAIL)

```almide
fn from_list(xs: List[Int]) -> MyList = 
  match xs {
    Nil => Nil
    Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => Nil
    Cons(x, ml) => Cons(x, to_list(ml))
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, ml) => Cons(f(x), my_map(ml, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, ml) => 
      if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }
```

**Diagnostic:**

```
error[E029]: unknown type 'MyList'
  --> /tmp/dojo-custom-linked-list-0.almd:1:32
  in return type of 'from_list'
  here: fn from_list(xs: List[Int]) -> MyList =
  hint: no `type MyList` is declared (or imported) in this program — declare it, or check the spelling
  |
1 | fn from_list(xs: List[Int]) -> MyList =
  |                                ^^^^^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:3:12
  in variable Nil
  here: Nil => Nil
  hint: Check the variable name
  |
3 |     Nil => Nil
  |            ^^^
error[E003]: unknown type or constructor 'Cons' in call position
  --> /tmp/dojo-custom-linked-list-0.almd:4:38
  in call to Cons()
  here: Cons(x, xs) => Cons(x, from_list(xs))
  hint: No type, variant constructor, or opaque alias named 'Cons' is in scope. Check the spelling or add the missing import.
  |
4 |     Cons(x, xs) => Cons(x, from_list(xs))
  |                                      ^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:9:12
  in variable Nil
  here: Nil => Nil
  hint: Did you mean `ml`?
  try:
      ml
  |
9 |     Nil => Nil
  |            ^^^
error[E003]: unknown type or constructor 'Cons' in call position
  --> /tmp/dojo-custom-linked-list-0.almd:10:36
  in call to Cons()
  here: Cons(x, ml) => Cons(x, to_list(ml))
  hint: No type, variant constructor, or opaque alias named 'Cons' is in scope. Check the spelling or add the missing import.
   |
10 |     Cons(x, ml) => Cons(x, to_list(ml))
   |                                    ^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:21:12
  in variable Nil
  here: Nil => Nil
  hint: Did you mean `ml`?
  try:
      ml
   |
21 |     Nil => Nil
   |            ^^^
error[E003]: unknown type or constructor 'Cons' in call position
  --> /tmp/dojo-custom-linked-list-0.almd:22:42
  in call to Cons()
  here: Cons(x, ml) => Cons(f(x), my_map(ml, f))
  hint: No type, variant constructor, or opaque alias named 'Cons' is in scope. Check the spelling or add the missing import.
   |
22 |     Cons(x, ml) => Cons(f(x), my_map(ml, f))
   |                                          ^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:27:12
  in variable Nil
  here: Nil => Nil
  hint: Did you mean `ml`?
  try:
      ml
   |
27 |     Nil => Nil
   |            ^^^
error[E003]: unknown type or constructor 'Cons' in call position
  --> /tmp/dojo-custom-linked-list-0.almd:29:45
  in call to Cons()
  here: if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
  hint: No type, variant constructor, or opaque alias named 'Cons' is in scope. Check the spelling or add the missing import.
   |
29 |       if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |                                             ^^^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:34:12
  in variable Nil
  here: Nil => Nil
  hint: Did you mean `ml`?
  try:
      ml
   |
34 |     Nil => Nil
   |            ^^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:35:46
  in variable Nil
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Did you mean `ml`?
  try:
      ml
   |
35 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
   |                                              ^^^
error[E003]: unknown type or constructor 'Cons' in call position
  --> /tmp/dojo-custom-linked-list-0.almd:35:46
  in call to Cons()
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: No type, variant constructor, or opaque alias named 'Cons' is in scope. Check the spelling or add the missing import.
   |
35 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
   |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[Cons]
  --> /tmp/dojo-custom-linked-list-0.almd:35:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
35 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
   |                                              ^^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:40:40
  in variable Nil
  here: test "my_len empty" { assert_eq(my_len(Nil), 0) }
  hint: Check the variable name
   |
40 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:43:49
  in variable Nil
  here: test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
  hint: Check the variable name
   |
43 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                 ^^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:47:56
  in variable Nil
  here: test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
  hint: Check the variable name
   |
47 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E001]: type mismatch in if branches: expected Cons but got MyList
  --> /tmp/dojo-custom-linked-list-0.almd:29:71
  in if branches
  here: if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
  hint: Both branches of `if/then/else` must have the same type
   |
29 |       if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |                                                                       ^^^^

17 error(s) found
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
    Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => Nil
    Cons(x, ml) => Cons(x, to_list(ml))
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, ml) => Cons(f(x), my_map(ml, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, ml) => 
      if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len_empty() -> Int = 
  my_len(Nil)

fn my_map_on_nil(f: (Int) -> Int) -> MyList = 
  my_map(Nil, f)

fn my_reverse_empty() -> MyList = 
  my_reverse(Nil)

test "my_len empty" { assert_eq(my_len_empty(), 0) }

test "my_map on nil" { assert_eq(to_list(my_map_on_nil((x) => x + 1)), []) }

test "my_reverse empty" { assert_eq(to_list(my_reverse_empty()), []) }
```

**Diagnostic:**

```
error[E012]: duplicate test 'my_len empty'
  at line 59
  in test "my_len empty"
  here: test "my_len empty" { assert_eq(my_len(Nil), 0) }
  hint: Rename one of the tests, or merge them. Each test name must be unique within a file.
   |
51 | test "my_len empty" { assert_eq(my_len_empty(), 0) }
   | ------------------------------ first test 'my_len empty' here
...
59 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   | ^
error[E012]: duplicate test 'my_map on nil'
  at line 62
  in test "my_map on nil"
  here: test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
  hint: Rename one of the tests, or merge them. Each test name must be unique within a file.
   |
53 | test "my_map on nil" { assert_eq(to_list(my_map_on_nil((x) => x + 1)), []) }
   | ------------------------------- first test 'my_map on nil' here
...
62 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   | ^
error[E012]: duplicate test 'my_reverse empty'
  at line 66
  in test "my_reverse empty"
  here: test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
  hint: Rename one of the tests, or merge them. Each test name must be unique within a file.
   |
55 | test "my_reverse empty" { assert_eq(to_list(my_reverse_empty()), []) }
   | ---------------------------------- first test 'my_reverse empty' here
...
66 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   | ^
error[E005]: Cons() argument 2 expects MyList but got List[Int]
  --> /tmp/dojo-custom-linked-list-1.almd:14:36
  in constructor Cons()
  here: Cons(x, ml) => Cons(x, to_list(ml))
  hint: Cons(Int, MyList) expects argument #2 to be MyList, got List[Int]
   |
14 |     Cons(x, ml) => Cons(x, to_list(ml))
   |                                    ^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:39:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
39 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
   |                                              ^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-1.almd:14:36
  in fn 'to_list'
  here: Cons(x, ml) => Cons(x, to_list(ml))
  hint: Fix the expression type or change the expected type
   |
14 |     Cons(x, ml) => Cons(x, to_list(ml))
   |                                    ^^

6 error(s) found
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
    Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => Nil
    Cons(x, ml) => Cons(x, to_list(ml))
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, ml) => Cons(f(x), my_map(ml, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, ml) => 
      if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len_empty() -> Int = 
  my_len(Nil)

fn my_map_on_nil(f: (Int) -> Int) -> MyList = 
  my_map(Nil, f)

fn my_reverse_empty() -> MyList = 
  my_reverse(Nil)

test "my_len empty" { assert_eq(my_len_empty(), 0) }

test "my_map on nil" { assert_eq(to_list(my_map_on_nil((x) => x + 1)), []) }

test "my_reverse empty" { assert_eq(to_list(my_reverse_empty()), []) }
```

**Diagnostic:**

```
error[E012]: duplicate test 'my_len empty'
  at line 59
  in test "my_len empty"
  here: test "my_len empty" { assert_eq(my_len(Nil), 0) }
  hint: Rename one of the tests, or merge them. Each test name must be unique within a file.
   |
51 | test "my_len empty" { assert_eq(my_len_empty(), 0) }
   | ------------------------------ first test 'my_len empty' here
...
59 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   | ^
error[E012]: duplicate test 'my_map on nil'
  at line 62
  in test "my_map on nil"
  here: test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
  hint: Rename one of the tests, or merge them. Each test name must be unique within a file.
   |
53 | test "my_map on nil" { assert_eq(to_list(my_map_on_nil((x) => x + 1)), []) }
   | ------------------------------- first test 'my_map on nil' here
...
62 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   | ^
error[E012]: duplicate test 'my_reverse empty'
  at line 66
  in test "my_reverse empty"
  here: test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
  hint: Rename one of the tests, or merge them. Each test name must be unique within a file.
   |
55 | test "my_reverse empty" { assert_eq(to_list(my_reverse_empty()), []) }
   | ---------------------------------- first test 'my_reverse empty' here
...
66 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   | ^
error[E005]: Cons() argument 2 expects MyList but got List[Int]
  --> /tmp/dojo-custom-linked-list-2.almd:14:36
  in constructor Cons()
  here: Cons(x, ml) => Cons(x, to_list(ml))
  hint: Cons(Int, MyList) expects argument #2 to be MyList, got List[Int]
   |
14 |     Cons(x, ml) => Cons(x, to_list(ml))
   |                                    ^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-2.almd:39:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
39 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
   |                                              ^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-2.almd:14:36
  in fn 'to_list'
  here: Cons(x, ml) => Cons(x, to_list(ml))
  hint: Fix the expression type or change the expected type
   |
14 |     Cons(x, ml) => Cons(x, to_list(ml))
   |                                    ^^

6 error(s) found
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
    Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => Nil
    Cons(x, ml) => Cons(x, to_list(ml))
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, ml) => Cons(f(x), my_map(ml, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, ml) => 
      if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn to_list_helper(ml: MyList) -> List[Int] = 
  match ml {
    Nil => Nil
    Cons(x, ml) => Cons(x, to_list_helper(ml))
  }

fn to_list(ml: MyList) -> List[Int] = to_list_helper(ml)

fn my_len_empty() -> Int = 
  my_len(Nil)

fn my_map_on_nil(f: (Int) -> Int) -> MyList = 
  my_map(Nil, f)

fn my_reverse_empty() -> MyList = 
  my_reverse(Nil)

test "my_len empty" { assert_eq(my_len_empty(), 0) }

test "my_map on nil" { assert_eq(to_list(my_map_on_nil((x) => x + 1)), []) }

test "my_reverse empty" { assert_eq(to_list(my_reverse_empty()), []) }
```

**Diagnostic:**

```
error[E012]: duplicate function 'to_list'
  at line 48
  in fn to_list
  here: fn to_list(ml: MyList) -> List[Int] = to_list_helper(ml)
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
11 | fn to_list(ml: MyList) -> List[Int] =
   | ---------------------------------- first definition of 'to_list' here
...
48 | fn to_list(ml: MyList) -> List[Int] = to_list_helper(ml)
   | ^
error[E012]: duplicate test 'my_len empty'
  at line 67
  in test "my_len empty"
  here: test "my_len empty" { assert_eq(my_len(Nil), 0) }
  hint: Rename one of the tests, or merge them. Each test name must be unique within a file.
   |
59 | test "my_len empty" { assert_eq(my_len_empty(), 0) }
   | ------------------------------ first test 'my_len empty' here
...
67 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   | ^
error[E012]: duplicate test 'my_map on nil'
  at line 70
  in test "my_map on nil"
  here: test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
  hint: Rename one of the tests, or merge them. Each test name must be unique within a file.
   |
61 | test "my_map on nil" { assert_eq(to_list(my_map_on_nil((x) => x + 1)), []) }
   | ------------------------------- first test 'my_map on nil' here
...
70 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   | ^
error[E012]: duplicate test 'my_reverse empty'
  at line 74
  in test "my_reverse empty"
  here: test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
  hint: Rename one of the tests, or merge them. Each test name must be unique within a file.
   |
63 | test "my_reverse empty" { assert_eq(to_list(my_reverse_empty()), []) }
   | ---------------------------------- first test 'my_reverse empty' here
...
74 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   | ^
error[E005]: Cons() argument 2 expects MyList but got List[Int]
  --> /tmp/dojo-custom-linked-list-3.almd:14:36
  in constructor Cons()
  here: Cons(x, ml) => Cons(x, to_list(ml))
  hint: Cons(Int, MyList) expects argument #2 to be MyList, got List[Int]
   |
14 |     Cons(x, ml) => Cons(x, to_list(ml))
   |                                    ^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-3.almd:39:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
39 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
   |                                              ^^^
error[E005]: Cons() argument 2 expects MyList but got List[Int]
  --> /tmp/dojo-custom-linked-list-3.almd:45:43
  in constructor Cons()
  here: Cons(x, ml) => Cons(x, to_list_helper(ml))
  hint: Cons(Int, MyList) expects argument #2 to be MyList, got List[Int]
   |
45 |     Cons(x, ml) => Cons(x, to_list_helper(ml))
   |                                           ^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-3.almd:14:36
  in fn 'to_list'
  here: Cons(x, ml) => Cons(x, to_list(ml))
  hint: Fix the expression type or change the expected type
   |
14 |     Cons(x, ml) => Cons(x, to_list(ml))
   |                                    ^^
error[E001]: type mismatch in fn 'to_list_helper': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-3.almd:45:43
  in fn 'to_list_helper'
  here: Cons(x, ml) => Cons(x, to_list_helper(ml))
  hint: Fix the expression type or change the expected type
   |
45 |     Cons(x, ml) => Cons(x, to_list_helper(ml))
   |                                           ^^

9 error(s) found
FAILED: /tmp/dojo-custom-linked-list-3.almd
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
