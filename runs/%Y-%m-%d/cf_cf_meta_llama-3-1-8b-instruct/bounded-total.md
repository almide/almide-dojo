# bounded-total

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn safe_total(xs: List[Int]) -> Int {
    fn sum(xs: List[Int]) -> Int {
        match xs {
            [] => 0
            [x, ..rest] => x + sum(rest)
        }
    }
    fan.bounded(compute.ms(100)) {
        sum(xs)
    } ?? -1
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-bounded-total-0.almd
error: Missing '=' before function body at line 1:37
  --> /tmp/dojo-bounded-total-0.almd:1:37
  hint: Almide requires '=' before the body. Write: fn safe_total(...) -> Type = { ... }
  |
1 | fn safe_total(xs: List[Int]) -> Int {
  |                                     ^
error: Missing '=' before function body at line 2:34
  --> /tmp/dojo-bounded-total-0.almd:2:34
  hint: Almide requires '=' before the body. Write: fn sum(...) -> Type = { ... }
  |
2 |     fn sum(xs: List[Int]) -> Int {
  |                                  ^

2 error(s) found
Compile error for /tmp/dojo-bounded-total-0.almd:
compile failed
FAILED: /tmp/dojo-bounded-total-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn safe_total(xs: List[Int]) -> Int = {
    fn sum(xs: List[Int]) -> Int = {
        match xs {
            [] => 0
            [x, ..rest] => x + sum(rest)
        }
    }
    fan.bounded(compute.ms(100)) {
        sum(xs)
    } ?? -1
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-bounded-total-1.almd
error: Expected expression at line 2:5 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-1.almd:2:5
  |
2 |     fn sum(xs: List[Int]) -> Int = {
  |     ^
error: Expected pattern at line 5:17 (got DotDot '..')
  --> /tmp/dojo-bounded-total-1.almd:5:17
  hint: rest/spread patterns `[h, ...t]` / `[h, ..t]` are not supported in Almide list patterns.
Use recursion with list.first / list.drop:
match xs {
[] => base,
_  => { let h = list.first(xs)!; let t = list.drop(xs, 1); /* ... */ },
}
Note: `{ x, .. }` IS valid inside record patterns.
  |
5 |             [x, ..rest] => x + sum(rest)
  |                 ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:5 (got RBrace '}')
  --> /tmp/dojo-bounded-total-1.almd:7:5
  |
7 |     }
  |     ^
error[E001]: type mismatch in fn 'safe_total': expected Int but got Unit
  --> /tmp/dojo-bounded-total-1.almd:1:39
  in fn 'safe_total'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
1 | fn safe_total(xs: List[Int]) -> Int = {
  |                                       ^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?0]
  --> /tmp/dojo-bounded-total-1.almd:15:19
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
15 |   assert_eq(r, ok(6))
   |                   ^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?2]
  --> /tmp/dojo-bounded-total-1.almd:19:19
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
19 |   assert_eq(r, ok(0))
   |                   ^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?3]
  --> /tmp/dojo-bounded-total-1.almd:23:19
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
23 |   assert_eq(r, ok(0))
   |                   ^

7 error(s) found
Compile error for /tmp/dojo-bounded-total-1.almd:
compile failed
FAILED: /tmp/dojo-bounded-total-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn safe_total(xs: List[Int]) -> Int = {
    fn sum(xs: List[Int]) -> Int = {
        match xs {
            [] => 0
            h :: t => h + sum(t)
        }
    }
    fan.bounded(compute.ms(100)) {
        sum(xs)
    } ?? -1
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-bounded-total-2.almd
error: Expected expression at line 2:5 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:2:5
  |
2 |     fn sum(xs: List[Int]) -> Int = {
  |     ^
error: Expected FatArrow at line 5:15 (got Colon ':')
  --> /tmp/dojo-bounded-total-2.almd:5:15
  hint: `head :: tail` (cons pattern) is Haskell/OCaml/Elm syntax. Almide list patterns use [] / [a, b] literals only. For head/tail recursion, use `list.first(xs)` and `list.drop(xs, 1)` on the non-empty arm.
  |
5 |             h :: t => h + sum(t)
  |               ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:5 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:7:5
  |
7 |     }
  |     ^
error[E001]: type mismatch in fn 'safe_total': expected Int but got Unit
  --> /tmp/dojo-bounded-total-2.almd:1:39
  in fn 'safe_total'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
1 | fn safe_total(xs: List[Int]) -> Int = {
  |                                       ^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?0]
  --> /tmp/dojo-bounded-total-2.almd:15:19
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
15 |   assert_eq(r, ok(6))
   |                   ^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?2]
  --> /tmp/dojo-bounded-total-2.almd:19:19
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
19 |   assert_eq(r, ok(0))
   |                   ^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?3]
  --> /tmp/dojo-bounded-total-2.almd:23:19
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
23 |   assert_eq(r, ok(0))
   |                   ^

7 error(s) found
Compile error for /tmp/dojo-bounded-total-2.almd:
compile failed
FAILED: /tmp/dojo-bounded-total-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn safe_total(xs: List[Int]) -> Int = {
    fn sum(xs: List[Int]) -> Int = {
        if list.is_empty(xs) {
            0
        } else {
            let head = list.first(xs)
            let tail = list.drop(xs, 1)
            head + sum(tail)
        }
    }
    fan.bounded(compute.ms(100)) {
        sum(xs)
    } ?? -1
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-bounded-total-3.almd
error: Expected expression at line 2:5 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-3.almd:2:5
  |
2 |     fn sum(xs: List[Int]) -> Int = {
  |     ^
error: Expected Then at line 3:30 (got LBrace '{')
  --> /tmp/dojo-bounded-total-3.almd:3:30
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |         if list.is_empty(xs) {
  |                              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:11 (got Else 'else')
  --> /tmp/dojo-bounded-total-3.almd:5:11
  |
5 |         } else {
  |           ^
error[E001]: type mismatch in fn 'safe_total': expected Int but got Unit
  --> /tmp/dojo-bounded-total-3.almd:1:39
  in fn 'safe_total'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
1 | fn safe_total(xs: List[Int]) -> Int = {
  |                                       ^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?0]
  --> /tmp/dojo-bounded-total-3.almd:18:19
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
18 |   assert_eq(r, ok(6))
   |                   ^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?2]
  --> /tmp/dojo-bounded-total-3.almd:22:19
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
22 |   assert_eq(r, ok(0))
   |                   ^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?3]
  --> /tmp/dojo-bounded-total-3.almd:26:19
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
26 |   assert_eq(r, ok(0))
   |                   ^

7 error(s) found
Compile error for /tmp/dojo-bounded-total-3.almd:
compile failed
FAILED: /tmp/dojo-bounded-total-3.almd

1/1 test file(s) failed

```
