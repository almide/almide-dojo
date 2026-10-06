# custom-linked-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

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
    Cons(x, tail) => Cons(x, to_list(tail))
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) =>
      if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
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
  --> /tmp/dojo-custom-linked-list-0.almd:10:38
  in call to Cons()
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: No type, variant constructor, or opaque alias named 'Cons' is in scope. Check the spelling or add the missing import.
   |
10 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
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
  --> /tmp/dojo-custom-linked-list-0.almd:22:46
  in call to Cons()
  here: Cons(x, tail) => Cons(f(x), my_map(tail, f))
  hint: No type, variant constructor, or opaque alias named 'Cons' is in scope. Check the spelling or add the missing import.
   |
22 |     Cons(x, tail) => Cons(f(x), my_map(tail, f))
   |                                              ^
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
  --> /tmp/dojo-custom-linked-list-0.almd:29:47
  in call to Cons()
  here: if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  hint: No type, variant constructor, or opaque alias named 'Cons' is in scope. Check the spelling or add the missing import.
   |
29 |       if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                               ^^^^
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
  --> /tmp/dojo-custom-linked-list-0.almd:35:50
  in variable Nil
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Did you mean `ml`?
  try:
      ml
   |
35 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error[E003]: unknown type or constructor 'Cons' in call position
  --> /tmp/dojo-custom-linked-list-0.almd:35:50
  in call to Cons()
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: No type, variant constructor, or opaque alias named 'Cons' is in scope. Check the spelling or add the missing import.
   |
35 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[Cons]
  --> /tmp/dojo-custom-linked-list-0.almd:35:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
35 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
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
  --> /tmp/dojo-custom-linked-list-0.almd:29:75
  in if branches
  here: if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  hint: Both branches of `if/then/else` must have the same type
   |
29 |       if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                           ^^^^

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
  list.fold(xs, Nil, (acc, x) => Cons(x, acc))

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(x, to_list(tail))
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) =>
      if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }
```

**Diagnostic:**

```
error[E005]: Cons() argument 2 expects MyList but got List[Int]
  --> /tmp/dojo-custom-linked-list-1.almd:11:38
  in constructor Cons()
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Cons(Int, MyList) expects argument #2 to be MyList, got List[Int]
   |
11 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:36:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
36 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-1.almd:11:38
  in fn 'to_list'
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Fix the expression type or change the expected type
   |
11 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^

3 error(s) found
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
    Nil => Nil
    Cons(x, tail) => Cons(x, to_list(tail))
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) =>
      if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }
```

**Diagnostic:**

```
error[E005]: Cons() argument 2 expects MyList but got List[Int]
  --> /tmp/dojo-custom-linked-list-2.almd:11:38
  in constructor Cons()
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Cons(Int, MyList) expects argument #2 to be MyList, got List[Int]
   |
11 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-2.almd:36:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
36 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-2.almd:11:38
  in fn 'to_list'
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Fix the expression type or change the expected type
   |
11 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^

3 error(s) found
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
  list.fold(xs, Nil, (acc, x) => Cons(x, acc))

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(x, to_list(tail))
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) =>
      if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }
```

**Diagnostic:**

```
error[E005]: Cons() argument 2 expects MyList but got List[Int]
  --> /tmp/dojo-custom-linked-list-3.almd:11:38
  in constructor Cons()
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Cons(Int, MyList) expects argument #2 to be MyList, got List[Int]
   |
11 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-3.almd:36:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
36 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-3.almd:11:38
  in fn 'to_list'
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Fix the expression type or change the expected type
   |
11 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^

3 error(s) found
FAILED: /tmp/dojo-custom-linked-list-3.almd
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
