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
  --> /tmp/dojo-custom-linked-list-0.almd:28:62
  in call to Cons()
  here: Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  hint: No type, variant constructor, or opaque alias named 'Cons' is in scope. Check the spelling or add the missing import.
   |
28 |     Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                              ^^^^
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
  --> /tmp/dojo-custom-linked-list-0.almd:34:50
  in variable Nil
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Did you mean `ml`?
  try:
      ml
   |
34 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error[E003]: unknown type or constructor 'Cons' in call position
  --> /tmp/dojo-custom-linked-list-0.almd:34:50
  in call to Cons()
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: No type, variant constructor, or opaque alias named 'Cons' is in scope. Check the spelling or add the missing import.
   |
34 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[Cons]
  --> /tmp/dojo-custom-linked-list-0.almd:34:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
34 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
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
  --> /tmp/dojo-custom-linked-list-0.almd:28:90
  in if branches
  here: Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  hint: Both branches of `if/then/else` must have the same type
   |
28 |     Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                                          ^^^^

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
    Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0
    Cons
```

**Diagnostic:**

```
error: Expected FatArrow at line 620:9 (got Newline '')
  --> /tmp/dojo-custom-linked-list-1.almd:620:9
  here: Cons
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
620 |     Cons
    |         ^
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
  at line 59
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
35 | fn my_reverse(ml: MyList) -> MyList =
   | ------------------------------------- first definition of 'my_reverse' here
...
59 | fn my_reverse(ml: MyList) -> MyList =
   | ^
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
   | ^
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
   | ^
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
   | ^
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
   | ^
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
   | ^
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
   | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
  at line 143
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
143 | fn my_reverse(ml: MyList) -> MyList =
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
  at line 227
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
227 | fn my_reverse(ml: MyList) -> MyList =
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
  at line 311
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
311 | fn my_reverse(ml: MyList) -> MyList =
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
  at line 395
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
395 | fn my_reverse(ml: MyList) -> MyList =
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
  at line 479
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
479 | fn my_reverse(ml: MyList) -> MyList =
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
  at line 563
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 35 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
563 | fn my_reverse(ml: MyList) -> MyList =
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
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
    | ^
error[E005]: Cons() argument 2 expects MyList but got List[Int]
  --> /tmp/dojo-custom-linked-list-1.almd:14:38
  in constructor Cons()
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Cons(Int, MyList) expects argument #2 to be MyList, got List[Int]
   |
14 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:38:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
38 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:50:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
50 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:62:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
62 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:74:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
74 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:86:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
86 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:98:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
98 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:110:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
110 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:122:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
122 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:134:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
134 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:146:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
146 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:158:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
158 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:170:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
170 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:182:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
182 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:194:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
194 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:206:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
206 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:218:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
218 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:230:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
230 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:242:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
242 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:254:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
254 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:266:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
266 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:278:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
278 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:290:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
290 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:302:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
302 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:314:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
314 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:326:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
326 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:338:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
338 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:350:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
350 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:362:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
362 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:374:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
374 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:386:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
386 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:398:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
398 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:410:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
410 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:422:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
422 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:434:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
434 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:446:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
446 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:458:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
458 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:470:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
470 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:482:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
482 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:494:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
494 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:506:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
506 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:518:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
518 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:530:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
530 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:542:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
542 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:554:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
554 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:566:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
566 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:578:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
578 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:590:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
590 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:602:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
602 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:614:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
614 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-1.almd:14:38
  in fn 'to_list'
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Fix the expression type or change the expected type
   |
14 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^

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
error[E005]: Cons() argument 2 expects MyList but got List[Int]
  --> /tmp/dojo-custom-linked-list-2.almd:14:38
  in constructor Cons()
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Cons(Int, MyList) expects argument #2 to be MyList, got List[Int]
   |
14 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-2.almd:38:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
38 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-2.almd:14:38
  in fn 'to_list'
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Fix the expression type or change the expected type
   |
14 |     Cons(x, tail) => Cons(x, to_list(tail))
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
    Cons(x, tail) => if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn to_list_recursive(ml: MyList) -> List[Int] =
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(x, to_list_recursive(tail))
  }

fn my_reverse_recursive(ml: MyList) -> MyList =
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse_recursive(tail) + [Cons(x, Nil)]
  }
```

**Diagnostic:**

```
error[E005]: Cons() argument 2 expects MyList but got List[Int]
  --> /tmp/dojo-custom-linked-list-3.almd:14:38
  in constructor Cons()
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Cons(Int, MyList) expects argument #2 to be MyList, got List[Int]
   |
14 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-3.almd:38:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
38 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error[E005]: Cons() argument 2 expects MyList but got List[Int]
  --> /tmp/dojo-custom-linked-list-3.almd:44:48
  in constructor Cons()
  here: Cons(x, tail) => Cons(x, to_list_recursive(tail))
  hint: Cons(Int, MyList) expects argument #2 to be MyList, got List[Int]
   |
44 |     Cons(x, tail) => Cons(x, to_list_recursive(tail))
   |                                                ^^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-3.almd:50:60
  in operator +
  here: Cons(x, tail) => my_reverse_recursive(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
50 |     Cons(x, tail) => my_reverse_recursive(tail) + [Cons(x, Nil)]
   |                                                            ^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-3.almd:14:38
  in fn 'to_list'
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Fix the expression type or change the expected type
   |
14 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
error[E001]: type mismatch in fn 'to_list_recursive': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-3.almd:44:48
  in fn 'to_list_recursive'
  here: Cons(x, tail) => Cons(x, to_list_recursive(tail))
  hint: Fix the expression type or change the expected type
   |
44 |     Cons(x, tail) => Cons(x, to_list_recursive(tail))
   |                                                ^^^^

6 error(s) found
FAILED: /tmp/dojo-custom-linked-list-3.almd
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
