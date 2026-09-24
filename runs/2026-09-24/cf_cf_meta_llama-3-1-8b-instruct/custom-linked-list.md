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
  hint: Use + with numeric types, String, or List
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
error[E001]: type mismatch in if branches: expected Cons but got MyList
  --> /tmp/dojo-custom-linked-list-0.almd:28:84
  in if branches
  here: Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
  hint: Both branches of `if/then/else` must have the same type
   |
28 |     Cons(x, ml) => if pred(x) then Cons(x, my_filter(ml, pred)) else my_filter(ml, pred)
   |                                                                                    ^^^^
error[E029]: unknown type 'MyList'
  in return type of 'from_list'
  hint: no `type MyList` is declared (or imported) in this program — declare it, or check the spelling

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

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my_len(ml)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, ml) => 1 + my
```

**Diagnostic:**

```
error: Expected pattern at line 622:1 (got Test 'test')
  --> /tmp/dojo-custom-linked-list-1.almd:622:1
  here: test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
622 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
    | ^
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
   | ^^^^^^^^^
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
   | ^^^^^^^^^^^^^
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
   | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 59
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
35 | fn my_reverse(ml: MyList) -> MyList =
   | ------------------------------------- first definition of 'my_reverse' here
...
59 | fn my_reverse(ml: MyList) -> MyList =
   | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 65
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
17 | fn my_len(ml: MyList) -> Int =
   | --------------------------------- first definition of 'my_len' here
...
65 | fn my_len(ml: MyList) -> Int =
   | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 71
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
35 | fn my_reverse(ml: MyList) -> MyList =
   | ------------------------------------- first definition of 'my_reverse' here
...
71 | fn my_reverse(ml: MyList) -> MyList =
   | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 77
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
17 | fn my_len(ml: MyList) -> Int =
   | --------------------------------- first definition of 'my_len' here
...
77 | fn my_len(ml: MyList) -> Int =
   | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 83
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
35 | fn my_reverse(ml: MyList) -> MyList =
   | ------------------------------------- first definition of 'my_reverse' here
...
83 | fn my_reverse(ml: MyList) -> MyList =
   | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 89
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
17 | fn my_len(ml: MyList) -> Int =
   | --------------------------------- first definition of 'my_len' here
...
89 | fn my_len(ml: MyList) -> Int =
   | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 95
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
35 | fn my_reverse(ml: MyList) -> MyList =
   | ------------------------------------- first definition of 'my_reverse' here
...
95 | fn my_reverse(ml: MyList) -> MyList =
   | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 101
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
101 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 107
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
107 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 113
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
113 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 119
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
119 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 125
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
125 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
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
    | ^^^^^^^^^^^^^
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
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 143
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
143 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 149
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
149 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 155
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
155 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 161
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
161 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 167
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
167 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 173
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
173 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 179
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
179 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 185
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
185 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 191
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
191 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 197
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
197 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 203
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
203 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 209
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
209 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
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
    | ^^^^^^^^^^^^^
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
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 227
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
227 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 233
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
233 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 239
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
239 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 245
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
245 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 251
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
251 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 257
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
257 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 263
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
263 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 269
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
269 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 275
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
275 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 281
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
281 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 287
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
287 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 293
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
293 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
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
    | ^^^^^^^^^^^^^
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
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 311
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
311 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 317
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
317 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 323
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
323 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 329
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
329 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 335
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
335 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 341
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
341 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 347
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
347 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 353
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
353 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 359
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
359 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 365
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
365 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 371
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
371 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 377
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
377 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
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
    | ^^^^^^^^^^^^^
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
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 395
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
395 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 401
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
401 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 407
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
407 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 413
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
413 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 419
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
419 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 425
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
425 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 431
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
431 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 437
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
437 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 443
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
443 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 449
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
449 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 455
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
455 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 461
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
461 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
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
    | ^^^^^^^^^^^^^
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
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 479
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
479 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 485
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
485 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 491
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
491 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 497
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
497 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 503
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
503 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 509
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
509 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 515
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
515 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 521
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
521 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 527
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
527 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 533
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
533 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 539
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
539 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 545
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
545 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
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
    | ^^^^^^^^^^^^^
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
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 563
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
563 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 569
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
569 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 575
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
575 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 581
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
581 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 587
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
587 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 593
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
593 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 599
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
599 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 605
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
605 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
error[E012]: duplicate function 'my_reverse'
  at line 611
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
611 | fn my_reverse(ml: MyList) -> MyList =
    | ^^^^^^^^^^^^^
error[E012]: duplicate function 'my_len'
  at line 617
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
617 | fn my_len(ml: MyList) -> Int =
    | ^^^^^^^^^
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
  hint: Use + with numeric types, String, or List
   |
38 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
   |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:50:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
50 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
   |                                              ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:62:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
62 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
   |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:74:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
74 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
   |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:86:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
86 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
   |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:98:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
98 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
   |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:110:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
110 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:122:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
122 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:134:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
134 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:146:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
146 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:158:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
158 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:170:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
170 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:182:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
182 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:194:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
194 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:206:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
206 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:218:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
218 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:230:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
230 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:242:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
242 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:254:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
254 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:266:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
266 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:278:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
278 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:290:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
290 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:302:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
302 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:314:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
314 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:326:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
326 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:338:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
338 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:350:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
350 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:362:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
362 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:374:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
374 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:386:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
386 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:398:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
398 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:410:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
410 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:422:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
422 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:434:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
434 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:446:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
446 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:458:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
458 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:470:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
470 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:482:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
482 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:494:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
494 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:506:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
506 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:518:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
518 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:530:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
530 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:542:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
542 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:554:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
554 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:566:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
566 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:578:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
578 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:590:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
590 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:602:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
602 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:614:58
  in operator +
  here: Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
614 |     Cons(x, ml) => my_reverse(my_reverse(ml)) + [Cons(x, Nil)]
    |                                                          ^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-1.almd:14:36
  in fn 'to_list'
  here: Cons(x, ml) => Cons(x, to_list(ml))
  hint: Fix the expression type or change the expected type
   |
14 |     Cons(x, ml) => Cons(x, to_list(ml))
   |                                    ^^

149 error(s) found
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
```

**Diagnostic:**

```
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
  hint: Use + with numeric types, String, or List
   |
38 |     Cons(x, ml) => my_reverse(my_tail(ml)) + [Cons(x, Nil)]
   |                                                       ^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-2.almd:14:36
  in fn 'to_list'
  here: Cons(x, ml) => Cons(x, to_list(ml))
  hint: Fix the expression type or change the expected type
   |
14 |     Cons(x, ml) => Cons(x, to_list(ml))
   |                                    ^^

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
  match xs {
    Nil => Nil
    Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => Nil
    Cons(x, ml) => x :: to_list(ml)
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
```

**Diagnostic:**

```
error: Expected pattern at line 14:22 (got Colon ':')
  --> /tmp/dojo-custom-linked-list-3.almd:14:22
  here: Cons(x, ml) => x :: to_list(ml)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
14 |     Cons(x, ml) => x :: to_list(ml)
   |                      ^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-3.almd:38:55
  in operator +
  here: Cons(x, ml) => my_reverse(my_tail(ml)) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
38 |     Cons(x, ml) => my_reverse(my_tail(ml)) + [Cons(x, Nil)]
   |                                                       ^^^

2 error(s) found
FAILED: /tmp/dojo-custom-linked-list-3.almd
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
