# expression-eval

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn eval(expr: Expr) -> Int =
  match expr
  | Num(n) => n
  | Add(a, b) => eval(a) + eval(b)
  | Mul(a, b) => eval(a) * eval(b)
  | Neg(a) => -eval(a)
```

**Diagnostic:**

```
error: Expected LBrace at line 3:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-0.almd:3:3
  here: | Num(n) => n
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   | Num(n) => n
  |   ^
error[E003]: unknown type or constructor 'Num' in call position
  --> /tmp/dojo-expression-eval-0.almd:8:38
  in call to Num()
  here: test "eval Num" { assert_eq(eval(Num(42)), 42) }
  hint: No type, variant constructor, or opaque alias named 'Num' is in scope. Check the spelling or add the missing import.
  |
8 | test "eval Num" { assert_eq(eval(Num(42)), 42) }
  |                                      ^^
error[E005]: argument 'expr' expects Expr but got Num
  --> /tmp/dojo-expression-eval-0.almd:8:34
  in call to eval()
  here: test "eval Num" { assert_eq(eval(Num(42)), 42) }
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
  |
1 | fn eval(expr: Expr) -> Int =
  | ---------------------- fn eval() defined here
...
8 | test "eval Num" { assert_eq(eval(Num(42)), 42) }
  |                                  ^^^
error[E003]: unknown type or constructor 'Num' in call position
  --> /tmp/dojo-expression-eval-0.almd:9:42
  in call to Num()
  here: test "eval Add" { assert_eq(eval(Add(Num(1), Num(2))), 3) }
  hint: No type, variant constructor, or opaque alias named 'Num' is in scope. Check the spelling or add the missing import.
  |
9 | test "eval Add" { assert_eq(eval(Add(Num(1), Num(2))), 3) }
  |                                          ^
error[E003]: unknown type or constructor 'Num' in call position
  --> /tmp/dojo-expression-eval-0.almd:9:50
  in call to Num()
  here: test "eval Add" { assert_eq(eval(Add(Num(1), Num(2))), 3) }
  hint: No type, variant constructor, or opaque alias named 'Num' is in scope. Check the spelling or add the missing import.
  |
9 | test "eval Add" { assert_eq(eval(Add(Num(1), Num(2))), 3) }
  |                                                  ^
error[E003]: unknown type or constructor 'Add' in call position
  --> /tmp/dojo-expression-eval-0.almd:9:50
  in call to Add()
  here: test "eval Add" { assert_eq(eval(Add(Num(1), Num(2))), 3) }
  hint: No type, variant constructor, or opaque alias named 'Add' is in scope. Check the spelling or add the missing import.
  |
9 | test "eval Add" { assert_eq(eval(Add(Num(1), Num(2))), 3) }
  |                                                  ^
error[E005]: argument 'expr' expects Expr but got Add
  --> /tmp/dojo-expression-eval-0.almd:9:34
  in call to eval()
  here: test "eval Add" { assert_eq(eval(Add(Num(1), Num(2))), 3) }
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
  |
1 | fn eval(expr: Expr) -> Int =
  | ---------------------- fn eval() defined here
...
9 | test "eval Add" { assert_eq(eval(Add(Num(1), Num(2))), 3) }
  |                                  ^^^
error[E003]: unknown type or constructor 'Num' in call position
  --> /tmp/dojo-expression-eval-0.almd:10:42
  in call to Num()
  here: test "eval Mul" { assert_eq(eval(Mul(Num(3), Num(4))), 12) }
  hint: No type, variant constructor, or opaque alias named 'Num' is in scope. Check the spelling or add the missing import.
   |
10 | test "eval Mul" { assert_eq(eval(Mul(Num(3), Num(4))), 12) }
   |                                          ^
error[E003]: unknown type or constructor 'Num' in call position
  --> /tmp/dojo-expression-eval-0.almd:10:50
  in call to Num()
  here: test "eval Mul" { assert_eq(eval(Mul(Num(3), Num(4))), 12) }
  hint: No type, variant constructor, or opaque alias named 'Num' is in scope. Check the spelling or add the missing import.
   |
10 | test "eval Mul" { assert_eq(eval(Mul(Num(3), Num(4))), 12) }
   |                                                  ^
error[E003]: unknown type or constructor 'Mul' in call position
  --> /tmp/dojo-expression-eval-0.almd:10:50
  in call to Mul()
  here: test "eval Mul" { assert_eq(eval(Mul(Num(3), Num(4))), 12) }
  hint: No type, variant constructor, or opaque alias named 'Mul' is in scope. Check the spelling or add the missing import.
   |
10 | test "eval Mul" { assert_eq(eval(Mul(Num(3), Num(4))), 12) }
   |                                                  ^
error[E005]: argument 'expr' expects Expr but got Mul
  --> /tmp/dojo-expression-eval-0.almd:10:34
  in call to eval()
  here: test "eval Mul" { assert_eq(eval(Mul(Num(3), Num(4))), 12) }
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
 1 | fn eval(expr: Expr) -> Int =
   | ---------------------- fn eval() defined here
...
10 | test "eval Mul" { assert_eq(eval(Mul(Num(3), Num(4))), 12) }
   |                                  ^^^
error[E003]: unknown type or constructor 'Num' in call position
  --> /tmp/dojo-expression-eval-0.almd:11:42
  in call to Num()
  here: test "eval Neg" { assert_eq(eval(Neg(Num(5))), -5) }
  hint: No type, variant constructor, or opaque alias named 'Num' is in scope. Check the spelling or add the missing import.
   |
11 | test "eval Neg" { assert_eq(eval(Neg(Num(5))), -5) }
   |                                          ^
error[E003]: unknown type or constructor 'Neg' in call position
  --> /tmp/dojo-expression-eval-0.almd:11:42
  in call to Neg()
  here: test "eval Neg" { assert_eq(eval(Neg(Num(5))), -5) }
  hint: No type, variant constructor, or opaque alias named 'Neg' is in scope. Check the spelling or add the missing import.
   |
11 | test "eval Neg" { assert_eq(eval(Neg(Num(5))), -5) }
   |                                          ^
error[E005]: argument 'expr' expects Expr but got Neg
  --> /tmp/dojo-expression-eval-0.almd:11:34
  in call to eval()
  here: test "eval Neg" { assert_eq(eval(Neg(Num(5))), -5) }
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
 1 | fn eval(expr: Expr) -> Int =
   | ---------------------- fn eval() defined here
...
11 | test "eval Neg" { assert_eq(eval(Neg(Num(5))), -5) }
   |                                  ^^^
error[E003]: unknown type or constructor 'Num' in call position
  --> /tmp/dojo-expression-eval-0.almd:12:57
  in call to Num()
  here: test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
  hint: No type, variant constructor, or opaque alias named 'Num' is in scope. Check the spelling or add the missing import.
   |
12 | test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
   |                                                         ^
error[E003]: unknown type or constructor 'Num' in call position
  --> /tmp/dojo-expression-eval-0.almd:12:65
  in call to Num()
  here: test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
  hint: No type, variant constructor, or opaque alias named 'Num' is in scope. Check the spelling or add the missing import.
   |
12 | test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
   |                                                                 ^
error[E003]: unknown type or constructor 'Mul' in call position
  --> /tmp/dojo-expression-eval-0.almd:12:65
  in call to Mul()
  here: test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
  hint: No type, variant constructor, or opaque alias named 'Mul' is in scope. Check the spelling or add the missing import.
   |
12 | test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
   |                                                                 ^
error[E003]: unknown type or constructor 'Num' in call position
  --> /tmp/dojo-expression-eval-0.almd:12:74
  in call to Num()
  here: test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
  hint: No type, variant constructor, or opaque alias named 'Num' is in scope. Check the spelling or add the missing import.
   |
12 | test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
   |                                                                          ^
error[E003]: unknown type or constructor 'Add' in call position
  --> /tmp/dojo-expression-eval-0.almd:12:74
  in call to Add()
  here: test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
  hint: No type, variant constructor, or opaque alias named 'Add' is in scope. Check the spelling or add the missing import.
   |
12 | test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
   |                                                                          ^
error[E005]: argument 'expr' expects Expr but got Add
  --> /tmp/dojo-expression-eval-0.almd:12:45
  in call to eval()
  here: test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
 1 | fn eval(expr: Expr) -> Int =
   | ---------------------- fn eval() defined here
...
12 | test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
   |                                             ^^^
error[E003]: unknown type or constructor 'Num' in call position
  --> /tmp/dojo-expression-eval-0.almd:13:53
  in call to Num()
  here: test "eval double neg" { assert_eq(eval(Neg(Neg(Num(10)))), 10) }
  hint: No type, variant constructor, or opaque alias named 'Num' is in scope. Check the spelling or add the missing import.
   |
13 | test "eval double neg" { assert_eq(eval(Neg(Neg(Num(10)))), 10) }
   |                                                     ^^
error[E003]: unknown type or constructor 'Neg' in call position
  --> /tmp/dojo-expression-eval-0.almd:13:53
  in call to Neg()
  here: test "eval double neg" { assert_eq(eval(Neg(Neg(Num(10)))), 10) }
  hint: No type, variant constructor, or opaque alias named 'Neg' is in scope. Check the spelling or add the missing import.
   |
13 | test "eval double neg" { assert_eq(eval(Neg(Neg(Num(10)))), 10) }
   |                                                     ^^
error[E003]: unknown type or constructor 'Neg' in call position
  --> /tmp/dojo-expression-eval-0.almd:13:53
  in call to Neg()
  here: test "eval double neg" { assert_eq(eval(Neg(Neg(Num(10)))), 10) }
  hint: No type, variant constructor, or opaque alias named 'Neg' is in scope. Check the spelling or add the missing import.
   |
13 | test "eval double neg" { assert_eq(eval(Neg(Neg(Num(10)))), 10) }
   |                                                     ^^
error[E005]: argument 'expr' expects Expr but got Neg
  --> /tmp/dojo-expression-eval-0.almd:13:41
  in call to eval()
  here: test "eval double neg" { assert_eq(eval(Neg(Neg(Num(10)))), 10) }
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
 1 | fn eval(expr: Expr) -> Int =
   | ---------------------- fn eval() defined here
...
13 | test "eval double neg" { assert_eq(eval(Neg(Neg(Num(10)))), 10) }
   |                                         ^^^
error[E003]: unknown type or constructor 'Num' in call position
  --> /tmp/dojo-expression-eval-0.almd:14:50
  in call to Num()
  here: test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
  hint: No type, variant constructor, or opaque alias named 'Num' is in scope. Check the spelling or add the missing import.
   |
14 | test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
   |                                                  ^
error[E003]: unknown type or constructor 'Num' in call position
  --> /tmp/dojo-expression-eval-0.almd:14:58
  in call to Num()
  here: test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
  hint: No type, variant constructor, or opaque alias named 'Num' is in scope. Check the spelling or add the missing import.
   |
14 | test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
   |                                                          ^
error[E003]: unknown type or constructor 'Add' in call position
  --> /tmp/dojo-expression-eval-0.almd:14:58
  in call to Add()
  here: test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
  hint: No type, variant constructor, or opaque alias named 'Add' is in scope. Check the spelling or add the missing import.
   |
14 | test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
   |                                                          ^
error[E003]: unknown type or constructor 'Num' in call position
  --> /tmp/dojo-expression-eval-0.almd:14:71
  in call to Num()
  here: test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
  hint: No type, variant constructor, or opaque alias named 'Num' is in scope. Check the spelling or add the missing import.
   |
14 | test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
   |                                                                       ^
error[E003]: unknown type or constructor 'Num' in call position
  --> /tmp/dojo-expression-eval-0.almd:14:79
  in call to Num()
  here: test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
  hint: No type, variant constructor, or opaque alias named 'Num' is in scope. Check the spelling or add the missing import.
   |
14 | test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
   |                                                                               ^
error[E003]: unknown type or constructor 'Add' in call position
  --> /tmp/dojo-expression-eval-0.almd:14:79
  in call to Add()
  here: test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
  hint: No type, variant constructor, or opaque alias named 'Add' is in scope. Check the spelling or add the missing import.
   |
14 | test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
   |                                                                               ^
error[E003]: unknown type or constructor 'Mul' in call position
  --> /tmp/dojo-expression-eval-0.almd:14:79
  in call to Mul()
  here: test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
  hint: No type, variant constructor, or opaque alias named 'Mul' is in scope. Check the spelling or add the missing import.
   |
14 | test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
   |                                                                               ^
error[E005]: argument 'expr' expects Expr but got Mul
  --> /tmp/dojo-expression-eval-0.almd:14:38
  in call to eval()
  here: test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
 1 | fn eval(expr: Expr) -> Int =
   | ---------------------- fn eval() defined here
...
14 | test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
   |                                      ^^^
error[E003]: unknown type or constructor 'Num' in call position
  --> /tmp/dojo-expression-eval-0.almd:15:49
  in call to Num()
  here: test "eval neg in add" { assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7) }
  hint: No type, variant constructor, or opaque alias named 'Num' is in scope. Check the spelling or add the missing import.
   |
15 | test "eval neg in add" { assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7) }
   |                                                 ^^
error[E003]: unknown type or constructor 'Num' in call position
  --> /tmp/dojo-expression-eval-0.almd:15:62
  in call to Num()
  here: test "eval neg in add" { assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7) }
  hint: No type, variant constructor, or opaque alias named 'Num' is in scope. Check the spelling or add the missing import.
   |
15 | test "eval neg in add" { assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7) }
   |                                                              ^
error[E003]: unknown type or constructor 'Neg' in call position
  --> /tmp/dojo-expression-eval-0.almd:15:62
  in call to Neg()
  here: test "eval neg in add" { assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7) }
  hint: No type, variant constructor, or opaque alias named 'Neg' is in scope. Check the spelling or add the missing import.
   |
15 | test "eval neg in add" { assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7) }
   |                                                              ^
error[E003]: unknown type or constructor 'Add' in call position
  --> /tmp/dojo-expression-eval-0.almd:15:62
  in call to Add()
  here: test "eval neg in add" { assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7) }
  hint: No type, variant constructor, or opaque alias named 'Add' is in scope. Check the spelling or add the missing import.
   |
15 | test "eval neg in add" { assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7) }
   |                                                              ^
error[E005]: argument 'expr' expects Expr but got Add
  --> /tmp/dojo-expression-eval-0.almd:15:41
  in call to eval()
  here: test "eval neg in add" { assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7) }
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
 1 | fn eval(expr: Expr) -> Int =
   | ---------------------- fn eval() defined here
...
15 | test "eval neg in add" { assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7) }
   |                                         ^^^
error[E003]: unknown type or constructor 'Num' in call position
  --> /tmp/dojo-expression-eval-0.almd:16:39
  in call to Num()
  here: test "eval zero" { assert_eq(eval(Num(0)), 0) }
  hint: No type, variant constructor, or opaque alias named 'Num' is in scope. Check the spelling or add the missing import.
   |
16 | test "eval zero" { assert_eq(eval(Num(0)), 0) }
   |                                       ^
error[E005]: argument 'expr' expects Expr but got Num
  --> /tmp/dojo-expression-eval-0.almd:16:35
  in call to eval()
  here: test "eval zero" { assert_eq(eval(Num(0)), 0) }
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
 1 | fn eval(expr: Expr) -> Int =
   | ---------------------- fn eval() defined here
...
16 | test "eval zero" { assert_eq(eval(Num(0)), 0) }
   |                                   ^^^
error[E003]: unknown type or constructor 'Num' in call position
  --> /tmp/dojo-expression-eval-0.almd:17:59
  in call to Num()
  here: test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
  hint: No type, variant constructor, or opaque alias named 'Num' is in scope. Check the spelling or add the missing import.
   |
17 | test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
   |                                                           ^
error[E003]: unknown type or constructor 'Num' in call position
  --> /tmp/dojo-expression-eval-0.almd:17:67
  in call to Num()
  here: test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
  hint: No type, variant constructor, or opaque alias named 'Num' is in scope. Check the spelling or add the missing import.
   |
17 | test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
   |                                                                   ^
error[E003]: unknown type or constructor 'Add' in call position
  --> /tmp/dojo-expression-eval-0.almd:17:67
  in call to Add()
  here: test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
  hint: No type, variant constructor, or opaque alias named 'Add' is in scope. Check the spelling or add the missing import.
   |
17 | test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
   |                                                                   ^
error[E003]: unknown type or constructor 'Num' in call position
  --> /tmp/dojo-expression-eval-0.almd:17:76
  in call to Num()
  here: test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
  hint: No type, variant constructor, or opaque alias named 'Num' is in scope. Check the spelling or add the missing import.
   |
17 | test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
   |                                                                            ^
error[E003]: unknown type or constructor 'Add' in call position
  --> /tmp/dojo-expression-eval-0.almd:17:76
  in call to Add()
  here: test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
  hint: No type, variant constructor, or opaque alias named 'Add' is in scope. Check the spelling or add the missing import.
   |
17 | test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
   |                                                                            ^
error[E003]: unknown type or constructor 'Num' in call position
  --> /tmp/dojo-expression-eval-0.almd:17:85
  in call to Num()
  here: test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
  hint: No type, variant constructor, or opaque alias named 'Num' is in scope. Check the spelling or add the missing import.
   |
17 | test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
   |                                                                                     ^
error[E003]: unknown type or constructor 'Add' in call position
  --> /tmp/dojo-expression-eval-0.almd:17:85
  in call to Add()
  here: test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
  hint: No type, variant constructor, or opaque alias named 'Add' is in scope. Check the spelling or add the missing import.
   |
17 | test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
   |                                                                                     ^
error[E005]: argument 'expr' expects Expr but got Add
  --> /tmp/dojo-expression-eval-0.almd:17:43
  in call to eval()
  here: test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
 1 | fn eval(expr: Expr) -> Int =
   | ---------------------- fn eval() defined here
...
17 | test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
   |                                           ^^^
error[E029]: unknown type 'Expr'
  in parameter 'expr'
  hint: no `type Expr` is declared (or imported) in this program — declare it, or check the spelling

48 error(s) found
FAILED: /tmp/dojo-expression-eval-0.almd
Compile error for /tmp/dojo-expression-eval-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
type Expr =
  | Num(Int)
  | Add(Expr, Expr)
  | Mul(Expr, Expr)
  | Neg(Expr)

fn eval(expr: Expr) -> Int =
  match expr
  | Num(n) => n
  | Add(a, b) => eval(a) + eval(b)
  | Mul(a, b) => eval(a) * eval(b)
  | Neg(a) => -eval(a)
```

**Diagnostic:**

```
error: Expected LBrace at line 9:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-1.almd:9:3
  here: | Num(n) => n
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |   | Num(n) => n
  |   ^

1 error(s) found
FAILED: /tmp/dojo-expression-eval-1.almd
Compile error for /tmp/dojo-expression-eval-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
type Expr =
  | Num(Int)
  | Add(Expr, Expr)
  | Mul(Expr, Expr)
  | Neg(Expr)

fn eval(expr: Expr) -> Int =
  match expr
  {
    | Num(n) => n
    | Add(a, b) => eval(a) + eval(b)
    | Mul(a, b) => eval(a) * eval(b)
    | Neg(a) => -eval(a)
  }
```

**Diagnostic:**

```
error: Expected pattern at line 10:5 (got Pipe '|')
  --> /tmp/dojo-expression-eval-2.almd:10:5
  here: | Num(n) => n
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
10 |     | Num(n) => n
   |     ^

1 error(s) found
FAILED: /tmp/dojo-expression-eval-2.almd
Compile error for /tmp/dojo-expression-eval-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
type Expr =
  | Num(Int)
  | Add(Expr, Expr)
  | Mul(Expr, Expr)
  | Neg(Expr)

fn eval(expr: Expr) -> Int =
  match expr
  {
    | Num(n) => n
    | Add(a, b) => eval(a) + eval(b)
    | Mul(a, b) => eval(a) * eval(b)
    | Neg(a) => -eval(a)
  }
```

**Diagnostic:**

```
error: Expected pattern at line 10:5 (got Pipe '|')
  --> /tmp/dojo-expression-eval-3.almd:10:5
  here: | Num(n) => n
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
10 |     | Num(n) => n
   |     ^

1 error(s) found
FAILED: /tmp/dojo-expression-eval-3.almd
Compile error for /tmp/dojo-expression-eval-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
