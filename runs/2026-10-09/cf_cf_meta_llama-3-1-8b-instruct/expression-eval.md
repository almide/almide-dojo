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
error[E029]: unknown type 'Expr'
  --> /tmp/dojo-expression-eval-0.almd:1:15
  in parameter 'expr'
  here: fn eval(expr: Expr) -> Int =
  hint: no `type Expr` is declared (or imported) in this program — declare it, or check the spelling
  |
1 | fn eval(expr: Expr) -> Int =
  |               ^^^^
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

fn Num(n: Int) = Num(n)
fn Add(a: Expr, b: Expr) = Add(a, b)
fn Mul(a: Expr, b: Expr) = Mul(a, b)
fn Neg(a: Expr) = Neg(a)
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
error: Expected function name at line 14:4 (got TypeName 'Num')
  --> /tmp/dojo-expression-eval-1.almd:14:4
  here: fn Num(n: Int) = Num(n)
  hint: Function names must start with a lowercase letter. Use camelCase, e.g. fn myFunc()
   |
14 | fn Num(n: Int) = Num(n)
   |    ^
error: Expected function name at line 15:4 (got TypeName 'Add')
  --> /tmp/dojo-expression-eval-1.almd:15:4
  here: fn Add(a: Expr, b: Expr) = Add(a, b)
  hint: Function names must start with a lowercase letter. Use camelCase, e.g. fn myFunc()
   |
15 | fn Add(a: Expr, b: Expr) = Add(a, b)
   |    ^
error: Expected function name at line 16:4 (got TypeName 'Mul')
  --> /tmp/dojo-expression-eval-1.almd:16:4
  here: fn Mul(a: Expr, b: Expr) = Mul(a, b)
  hint: Function names must start with a lowercase letter. Use camelCase, e.g. fn myFunc()
   |
16 | fn Mul(a: Expr, b: Expr) = Mul(a, b)
   |    ^
error: Expected function name at line 17:4 (got TypeName 'Neg')
  --> /tmp/dojo-expression-eval-1.almd:17:4
  here: fn Neg(a: Expr) = Neg(a)
  hint: Function names must start with a lowercase letter. Use camelCase, e.g. fn myFunc()
   |
17 | fn Neg(a: Expr) = Neg(a)
   |    ^

5 error(s) found
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
  | Num(n) => n
  | Add(a, b) => eval(a) + eval(b)
  | Mul(a, b) => eval(a) * eval(b)
  | Neg(a) => -eval(a)

fn num(n: Int) = Num(n)
fn add(a: Expr, b: Expr) = Add(a, b)
fn mul(a: Expr, b: Expr) = Mul(a, b)
fn neg(a: Expr) = Neg(a)
```

**Diagnostic:**

```
error: Expected LBrace at line 9:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-2.almd:9:3
  here: | Num(n) => n
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |   | Num(n) => n
  |   ^
error: Missing return type at line 14:16
  --> /tmp/dojo-expression-eval-2.almd:14:16
  here: fn num(n: Int) = Num(n)
  hint: every fn declares its return type and takes '=' before its body:
        fn num(...) -> Type = { ... }
   |
14 | fn num(n: Int) = Num(n)
   |                ^
error: Missing return type at line 15:26
  --> /tmp/dojo-expression-eval-2.almd:15:26
  here: fn add(a: Expr, b: Expr) = Add(a, b)
  hint: every fn declares its return type and takes '=' before its body:
        fn add(...) -> Type = { ... }
   |
15 | fn add(a: Expr, b: Expr) = Add(a, b)
   |                          ^
error: Missing return type at line 16:26
  --> /tmp/dojo-expression-eval-2.almd:16:26
  here: fn mul(a: Expr, b: Expr) = Mul(a, b)
  hint: every fn declares its return type and takes '=' before its body:
        fn mul(...) -> Type = { ... }
   |
16 | fn mul(a: Expr, b: Expr) = Mul(a, b)
   |                          ^
error: Missing return type at line 17:17
  --> /tmp/dojo-expression-eval-2.almd:17:17
  here: fn neg(a: Expr) = Neg(a)
  hint: every fn declares its return type and takes '=' before its body:
        fn neg(...) -> Type = { ... }
   |
17 | fn neg(a: Expr) = Neg(a)
   |                 ^

5 error(s) found
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
  | Num(n) => n
  | Add(a, b) => eval(a) + eval(b)
  | Mul(a, b) => eval(a) * eval(b)
  | Neg(a) => -eval(a)

fn num(n: Int) -> Expr = Num(n)
fn add(a: Expr, b: Expr) -> Expr = Add(a, b)
fn mul(a: Expr, b: Expr) -> Expr = Mul(a, b)
fn neg(a: Expr) -> Expr = Neg(a)
```

**Diagnostic:**

```
error: Expected LBrace at line 9:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-3.almd:9:3
  here: | Num(n) => n
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |   | Num(n) => n
  |   ^

1 error(s) found
FAILED: /tmp/dojo-expression-eval-3.almd
Compile error for /tmp/dojo-expression-eval-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
