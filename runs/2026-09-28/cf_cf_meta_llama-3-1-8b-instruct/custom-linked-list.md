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
  list.fold(xs, Nil, (acc, x) => Cons(x, acc))

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

fn my_len_test() {
  assert_eq(my_len(Nil), 0)
  assert_eq(my_len(Cons(1, Nil)), 1)
  assert_eq(my_len(Cons(1, Cons(2, Nil))), 2)
}

fn my_map_test() {
  assert_eq(to_list(my_map(Nil, (x) => x + 1)), [])
  assert_eq(to_list(my_map(Cons(1, Nil), (x) => x + 1)), [2])
  assert_eq(to_list(my_map(Cons(1, Cons(2, Nil)), (x) => x + 1)), [2, 3])
}

fn my_filter_test() {
  assert_eq(to_list(my_filter(Nil, (x) => x > 0)), [])
  assert_eq(to_list(my_filter(Cons(1, Nil), (x) => x > 0)), [1])
  assert_eq(to_list(my_filter(Cons(1, Cons(2, Nil)), (x) => x > 0)), [1, 2])
}

fn my_reverse_test() {
  assert_eq(to_list(my_reverse(Nil)), [])
  assert_eq(to_list(my_reverse(Cons(1, Nil))), [1])
  assert_eq(to_list(my_reverse(Cons(1, Cons(2, Nil)))), [2, 1])
}
```

**Diagnostic:**

```
error: Missing return type at line 39:18
  --> /tmp/dojo-custom-linked-list-1.almd:39:18
  here: fn my_len_test() {
  hint: every fn declares its return type and takes '=' before its body:
        fn my_len_test(...) -> Type = { ... }
   |
39 | fn my_len_test() {
   |                  ^
error: Missing return type at line 45:18
  --> /tmp/dojo-custom-linked-list-1.almd:45:18
  here: fn my_map_test() {
  hint: every fn declares its return type and takes '=' before its body:
        fn my_map_test(...) -> Type = { ... }
   |
45 | fn my_map_test() {
   |                  ^
error: Missing return type at line 51:21
  --> /tmp/dojo-custom-linked-list-1.almd:51:21
  here: fn my_filter_test() {
  hint: every fn declares its return type and takes '=' before its body:
        fn my_filter_test(...) -> Type = { ... }
   |
51 | fn my_filter_test() {
   |                     ^
error: Missing return type at line 57:22
  --> /tmp/dojo-custom-linked-list-1.almd:57:22
  here: fn my_reverse_test() {
  hint: every fn declares its return type and takes '=' before its body:
        fn my_reverse_test(...) -> Type = { ... }
   |
57 | fn my_reverse_test() {
   |                      ^
error[E005]: Cons() argument 2 expects MyList but got List[Int]
  --> /tmp/dojo-custom-linked-list-1.almd:11:36
  in constructor Cons()
  here: Cons(x, ml) => Cons(x, to_list(ml))
  hint: Cons(Int, MyList) expects argument #2 to be MyList, got List[Int]
   |
11 |     Cons(x, ml) => Cons(x, to_list(ml))
   |                                    ^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:36:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
36 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
   |                                              ^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-1.almd:11:36
  in fn 'to_list'
  here: Cons(x, ml) => Cons(x, to_list(ml))
  hint: Fix the expression type or change the expected type
   |
11 |     Cons(x, ml) => Cons(x, to_list(ml))
   |                                    ^^

7 error(s) found
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

fn my_len_test() -> Unit = 
  assert_eq(my_len(Nil), 0)
  assert_eq(my_len(Cons(1, Nil)), 1)
  assert_eq(my_len(Cons(1, Cons(2, Nil))), 2)

fn my_map_test() -> Unit = 
  assert_eq(to_list(my_map(Nil, (x) => x + 1)), [])
  assert_eq(to_list(my_map(Cons(1, Nil), (x) => x + 1)), [2])
  assert_eq(to_list(my_map(Cons(1, Cons(2, Nil)), (x) => x + 1)), [2, 3])

fn my_filter_test() -> Unit = 
  assert_eq(to_list(my_filter(Nil, (x) => x > 0)), [])
  assert_eq(to_list(my_filter(Cons(1, Nil), (x) => x > 0)), [1])
  assert_eq(to_list(my_filter(Cons(1, Cons(2, Nil)), (x) => x > 0)), [1, 2])

fn my_reverse_test() -> Unit = 
  assert_eq(to_list(my_reverse(Nil)), [])
  assert_eq(to_list(my_reverse(Cons(1, Nil))), [1])
  assert_eq(to_list(my_reverse(Cons(1, Cons(2, Nil)))), [2, 1])
```

**Diagnostic:**

```
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 41:3 (got Ident 'assert_eq')
  --> /tmp/dojo-custom-linked-list-2.almd:41:3
  here: assert_eq(my_len(Cons(1, Nil)), 1)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
41 |   assert_eq(my_len(Cons(1, Nil)), 1)
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 46:3 (got Ident 'assert_eq')
  --> /tmp/dojo-custom-linked-list-2.almd:46:3
  here: assert_eq(to_list(my_map(Cons(1, Nil), (x) => x + 1)), [2])
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
46 |   assert_eq(to_list(my_map(Cons(1, Nil), (x) => x + 1)), [2])
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 51:3 (got Ident 'assert_eq')
  --> /tmp/dojo-custom-linked-list-2.almd:51:3
  here: assert_eq(to_list(my_filter(Cons(1, Nil), (x) => x > 0)), [1])
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
51 |   assert_eq(to_list(my_filter(Cons(1, Nil), (x) => x > 0)), [1])
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 56:3 (got Ident 'assert_eq')
  --> /tmp/dojo-custom-linked-list-2.almd:56:3
  here: assert_eq(to_list(my_reverse(Cons(1, Nil))), [1])
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
56 |   assert_eq(to_list(my_reverse(Cons(1, Nil))), [1])
   |   ^
error[E005]: Cons() argument 2 expects MyList but got List[Int]
  --> /tmp/dojo-custom-linked-list-2.almd:11:36
  in constructor Cons()
  here: Cons(x, ml) => Cons(x, to_list(ml))
  hint: Cons(Int, MyList) expects argument #2 to be MyList, got List[Int]
   |
11 |     Cons(x, ml) => Cons(x, to_list(ml))
   |                                    ^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-2.almd:36:46
  in operator +
  here: Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
36 |     Cons(x, ml) => my_reverse(ml) + [Cons(x, Nil)]
   |                                              ^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-2.almd:11:36
  in fn 'to_list'
  here: Cons(x, ml) => Cons(x, to_list(ml))
  hint: Fix the expression type or change the expected type
   |
11 |     Cons(x, ml) => Cons(x, to_list(ml))
   |                                    ^^

7 error(s) found
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
    Cons(x, tail) => 
      if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len_test() -> Unit = 
  assert_eq(my_len(Nil), 0)
  assert_eq(my_len(Cons(1, Nil)), 1)
  assert_eq(my_len(Cons(1, Cons(2, Nil))), 2)

fn my_map_test() -> Unit = 
  assert_eq(to_list(my_map(Nil, (x) => x + 1)), [])
  assert_eq(to_list(my_map(Cons(1, Nil), (x) => x + 1)), [2])
  assert_eq(to_list(my_map(Cons(1, Cons(2, Nil)), (x) => x + 1)), [2, 3])

fn my_filter_test() -> Unit = 
  assert_eq(to_list(my_filter(Nil, (x) => x > 0)), [])
  assert_eq(to_list(my_filter(Cons(1, Nil), (x) => x > 0)), [1])
  assert_eq(to_list(my_filter(Cons(1, Cons(2, Nil)), (x) => x > 0)), [1, 2])

fn my_reverse_test() -> Unit = 
  assert_eq(to_list(my_reverse(Nil)), [])
  assert_eq(to_list(my_reverse(Cons(1, Nil))), [1])
  assert_eq(to_list(my_reverse(Cons(1, Cons(2, Nil)))), [2, 1])
```

**Diagnostic:**

```
error: Expected pattern at line 11:24 (got Colon ':')
  --> /tmp/dojo-custom-linked-list-3.almd:11:24
  here: Cons(x, tail) => x :: to_list(tail)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
11 |     Cons(x, tail) => x :: to_list(tail)
   |                        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 41:3 (got Ident 'assert_eq')
  --> /tmp/dojo-custom-linked-list-3.almd:41:3
  here: assert_eq(my_len(Cons(1, Nil)), 1)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
41 |   assert_eq(my_len(Cons(1, Nil)), 1)
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 46:3 (got Ident 'assert_eq')
  --> /tmp/dojo-custom-linked-list-3.almd:46:3
  here: assert_eq(to_list(my_map(Cons(1, Nil), (x) => x + 1)), [2])
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
46 |   assert_eq(to_list(my_map(Cons(1, Nil), (x) => x + 1)), [2])
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 51:3 (got Ident 'assert_eq')
  --> /tmp/dojo-custom-linked-list-3.almd:51:3
  here: assert_eq(to_list(my_filter(Cons(1, Nil), (x) => x > 0)), [1])
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
51 |   assert_eq(to_list(my_filter(Cons(1, Nil), (x) => x > 0)), [1])
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 56:3 (got Ident 'assert_eq')
  --> /tmp/dojo-custom-linked-list-3.almd:56:3
  here: assert_eq(to_list(my_reverse(Cons(1, Nil))), [1])
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
56 |   assert_eq(to_list(my_reverse(Cons(1, Nil))), [1])
   |   ^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-3.almd:36:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
36 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^

6 error(s) found
FAILED: /tmp/dojo-custom-linked-list-3.almd
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
