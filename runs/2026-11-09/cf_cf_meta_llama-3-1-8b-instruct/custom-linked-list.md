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
    Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
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
  --> /tmp/dojo-custom-linked-list-0.almd:28:58
  in call to Cons()
  here: Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
  hint: No type, variant constructor, or opaque alias named 'Cons' is in scope. Check the spelling or add the missing import.
   |
28 |     Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |                                                          ^^^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:33:12
  in variable Nil
  here: Nil => Nil
  hint: Did you mean `ml`?
  try:
      ml
   |
33 |     Nil => Nil
   |            ^^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:34:46
  in variable Nil
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Did you mean `ml`?
  try:
      ml
   |
34 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
   |                                              ^^^
error[E003]: unknown type or constructor 'Cons' in call position
  --> /tmp/dojo-custom-linked-list-0.almd:34:46
  in call to Cons()
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: No type, variant constructor, or opaque alias named 'Cons' is in scope. Check the spelling or add the missing import.
   |
34 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
   |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[Cons]
  --> /tmp/dojo-custom-linked-list-0.almd:34:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
   |
34 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
   |                                              ^^^
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
error[E001]: type mismatch in if branches: expected MyList but got Cons — MyList is the declared return type, and the branch at line 28 produces it
  --> /tmp/dojo-custom-linked-list-0.almd:28:36
  in if branches
  here: Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
  hint: Both branches of `if/then/else` must have the same type
   |
28 |     Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |                                    ^^^^

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
    Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

type Cons = (Int, MyList)

fn
```

**Diagnostic:**

```
error: Expected function name at line 663:3 (got Newline '')
  --> /tmp/dojo-custom-linked-list-1.almd:663:3
  here: fn
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
663 | fn
    |   ^
error[E012]: duplicate function 'my_len'
  at line 41
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
17 | fn my_len(ml: MyList) -> Int =
   | --------------------------------- first definition of 'my_len' here
...
41 | fn my_len(ml: MyList) -> Int =
   | ^
error[E012]: duplicate function 'my_reverse'
  at line 47
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
35 | fn my_reverse(ml: MyList) -> MyList =
   | ------------------------------------- first definition of 'my_reverse' here
...
47 | fn my_reverse(ml: MyList) -> MyList =
   | ^
error[E012]: duplicate function 'my_len'
  at line 53
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
17 | fn my_len(ml: MyList) -> Int =
   | --------------------------------- first definition of 'my_len' here
...
53 | fn my_len(ml: MyList) -> Int =
   | ^
error[E012]: duplicate function 'my_reverse'
  at line 61
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
35 | fn my_reverse(ml: MyList) -> MyList =
   | ------------------------------------- first definition of 'my_reverse' here
...
61 | fn my_reverse(ml: MyList) -> MyList =
   | ^
error[E012]: duplicate function 'my_len'
  at line 67
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
17 | fn my_len(ml: MyList) -> Int =
   | --------------------------------- first definition of 'my_len' here
...
67 | fn my_len(ml: MyList) -> Int =
   | ^
error[E012]: duplicate function 'my_reverse'
  at line 75
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
35 | fn my_reverse(ml: MyList) -> MyList =
   | ------------------------------------- first definition of 'my_reverse' here
...
75 | fn my_reverse(ml: MyList) -> MyList =
   | ^
error[E012]: duplicate function 'my_len'
  at line 81
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
17 | fn my_len(ml: MyList) -> Int =
   | --------------------------------- first definition of 'my_len' here
...
81 | fn my_len(ml: MyList) -> Int =
   | ^
error[E012]: duplicate function 'my_reverse'
  at line 89
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
35 | fn my_reverse(ml: MyList) -> MyList =
   | ------------------------------------- first definition of 'my_reverse' here
...
89 | fn my_reverse(ml: MyList) -> MyList =
   | ^
error[E012]: duplicate function 'my_len'
  at line 95
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
17 | fn my_len(ml: MyList) -> Int =
   | --------------------------------- first definition of 'my_len' here
...
95 | fn my_len(ml: MyList) -> Int =
   | ^
error[E012]: duplicate function 'my_reverse'
  at line 103
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
103 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 109
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
109 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 117
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
117 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 123
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
123 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 131
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
131 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 137
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
137 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 145
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
145 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 151
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
151 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 159
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
159 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 165
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
165 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 173
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
173 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 179
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
179 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 187
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
187 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 193
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
193 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 201
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
201 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 207
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
207 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 215
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
215 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 221
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
221 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 229
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
229 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 235
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
235 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 243
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
243 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 249
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
249 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 257
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
257 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 263
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
263 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 271
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
271 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 277
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
277 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 285
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
285 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 291
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
291 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 299
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
299 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 305
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
305 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 313
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
313 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 319
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
319 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 327
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
327 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 333
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
333 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 341
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
341 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 347
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
347 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 355
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
355 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 361
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
361 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 369
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
369 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 375
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
375 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 383
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
383 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 389
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
389 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 397
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
397 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 403
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
403 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 411
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
411 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 417
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
417 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 425
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
425 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 431
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
431 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 439
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
439 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 445
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
445 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 453
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
453 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 459
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
459 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 467
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
467 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 473
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
473 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 481
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
481 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 487
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
487 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 495
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
495 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 501
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
501 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 509
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
509 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 515
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
515 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 523
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
523 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 529
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
529 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 537
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
537 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 543
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
543 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 551
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
551 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 557
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
557 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 565
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
565 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 571
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
571 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 579
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
579 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 585
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
585 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 593
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
593 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 599
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
599 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 607
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
607 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 613
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
613 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 621
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
621 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 627
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
627 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 635
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
635 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 641
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
641 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 649
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
649 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 655
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
655 | fn my_len(ml: MyList) -> Int =
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
  --> /tmp/dojo-custom-linked-list-1.almd:38:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
   |
38 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
   |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:50:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
   |
50 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
   |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:64:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
   |
64 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
   |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:78:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
   |
78 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
   |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:92:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
   |
92 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
   |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:106:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
106 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:120:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
120 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:134:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
134 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:148:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
148 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:162:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
162 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:176:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
176 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:190:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
190 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:204:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
204 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:218:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
218 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:232:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
232 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:246:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
246 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:260:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
260 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:274:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
274 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:288:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
288 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:302:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
302 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:316:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
316 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:330:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
330 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:344:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
344 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:358:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
358 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:372:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
372 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:386:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
386 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:400:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
400 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:414:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
414 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:428:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
428 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:442:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
442 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:456:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
456 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:470:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
470 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:484:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
484 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:498:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
498 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:512:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
512 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:526:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
526 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:540:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
540 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:554:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
554 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:568:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
568 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:582:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
582 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:596:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
596 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:610:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
610 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:624:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
624 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:638:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
638 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:652:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
    |
652 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
    |                                              ^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-1.almd:13:12
  in fn 'to_list'
  here: Nil => Nil
  hint: Fix the expression type or change the expected type
   |
13 |     Nil => Nil
   |            ^^^

137 error(s) found
FAILED: /tmp/dojo-custom-linked-list-1.almd
  parse error: Expected function name at line 663:3 (got Newline '')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
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
    Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_tail(ml)) + [Cons(x, Nil)]
  }

fn my_tail(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(_, ml) => ml
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(my_tail(ml))
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_tail(ml)) + [Cons(x, Nil)]
  }
```

**Diagnostic:**

```
error[E012]: duplicate function 'my_len'
  at line 47
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
17 | fn my_len(ml: MyList) -> Int =
   | --------------------------------- first definition of 'my_len' here
...
47 | fn my_len(ml: MyList) -> Int =
   | ^
error[E012]: duplicate function 'my_reverse'
  at line 53
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
35 | fn my_reverse(ml: MyList) -> MyList =
   | ------------------------------------- first definition of 'my_reverse' here
...
53 | fn my_reverse(ml: MyList) -> MyList =
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
  --> /tmp/dojo-custom-linked-list-2.almd:38:55
  in operator +
  here: Cons(x, ml) => my_reverse(my_tail(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
   |
38 |     Cons(x, ml) => my_reverse(my_tail(ml)) + [Cons(x, Nil)]
   |                                                       ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-2.almd:56:55
  in operator +
  here: Cons(x, ml) => my_reverse(my_tail(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
   |
56 |     Cons(x, ml) => my_reverse(my_tail(ml)) + [Cons(x, Nil)]
   |                                                       ^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-2.almd:13:12
  in fn 'to_list'
  here: Nil => Nil
  hint: Fix the expression type or change the expected type
   |
13 |     Nil => Nil
   |            ^^^

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
    Cons(x, tail) => x :: to_list(tail)
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
    Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }
```

**Diagnostic:**

```
error: Expected pattern at line 14:24 (got Colon ':')
  --> /tmp/dojo-custom-linked-list-3.almd:14:24
  here: Cons(x, tail) => x :: to_list(tail)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
14 |     Cons(x, tail) => x :: to_list(tail)
   |                        ^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-3.almd:38:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, List, or Bytes
   |
38 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^

2 error(s) found
FAILED: /tmp/dojo-custom-linked-list-3.almd
  parse error: Expected pattern at line 14:24 (got Colon ':')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-custom-linked-list-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
