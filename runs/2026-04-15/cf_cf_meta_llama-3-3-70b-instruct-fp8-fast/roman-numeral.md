# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String =
  let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  let pairs = list.zip(values, symbols)
  let rec loop(n: Int, pairs: List[(Int, String)], acc: String): String =
    if n == 0 then acc
    else
      let (v, s) = list.head(pairs)
      let rest = list.tail(pairs)
      if n >= v then loop(n - v, pairs, acc + s)
      else loop(n, rest, acc)
  loop(n, pairs, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: Expected Eq at line 5:11 (got Ident 'loop')
  --> /tmp/dojo-roman-numeral-0.almd:5:11
  hint: Missing '=' before value. Write: let x = value
  |
5 |   let rec loop(n: Int, pairs: List[(Int, String)], acc: String): String =
  |           ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:8:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |       let (v, s) = list.head(pairs)
  |       ^^^
error: 'let' is not an expression in Almide at line 8:7
  --> /tmp/dojo-roman-numeral-0.almd:8:7
  |
8 |       let (v, s) = list.head(pairs)
  |       ^
error: 'loop' is not valid in Almide at line 10:22
  --> /tmp/dojo-roman-numeral-0.almd:10:22
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
10 |       if n >= v then loop(n - v, pairs, acc + s)
   |                      ^
error: 'loop' is not valid in Almide at line 12:3
  --> /tmp/dojo-roman-numeral-0.almd:12:3
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
12 |   loop(n, pairs, "")
   |   ^
error[E002]: undefined function 'list.tail'
  --> /tmp/dojo-roman-numeral-0.almd:9:28
  in call to list.tail()
  hint: Did you mean `list.drop(xs, 1)`?
  |
9 |       let rest = list.tail(pairs)
  |                            ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:9:28
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  |
9 |       let rest = list.tail(pairs)
  |                            ^^^^^

7 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  let pairs = list.zip(values, symbols)
  let rec loop(n: Int, pairs: List[(Int, String)], acc: String): String =
    if n == 0 then acc
    else 
      match pairs {
        some((v, s) + rest) => 
          if n >= v then loop(n - v, pairs, acc + s)
          else loop(n, rest, acc)
        none => acc
      }
  loop(n, pairs, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected Eq at line 5:11 (got Ident 'loop')
  --> /tmp/dojo-roman-numeral-1.almd:5:11
  hint: Missing '=' before value. Write: let x = value
  |
5 |   let rec loop(n: Int, pairs: List[(Int, String)], acc: String): String =
  |           ^
error: Expected RParen at line 9:21 (got Plus '+')
  --> /tmp/dojo-roman-numeral-1.almd:9:21
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
  |
9 |         some((v, s) + rest) =>
  |                     ^
error: 'loop' is not valid in Almide at line 10:26
  --> /tmp/dojo-roman-numeral-1.almd:10:26
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
10 |           if n >= v then loop(n - v, pairs, acc + s)
   |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:7 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-1.almd:13:7
   |
13 |       }
   |       ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:4:32
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  |
4 |   let pairs = list.zip(values, symbols)
  |                                ^^^^^^^

5 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  let pairs = list.zip(values, symbols)
  let loop = (n: Int, pairs: List[(Int, String)], acc: String) => 
    if n == 0 then acc
    else 
      match pairs {
        some((v, s)) => 
          if n >= v then loop(n - v, pairs, acc + s)
          else loop(n, list.tail(pairs), acc)
        none => acc
      }
  loop(n, pairs, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: 'loop' is not valid in Almide at line 10:26
  --> /tmp/dojo-roman-numeral-2.almd:10:26
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
10 |           if n >= v then loop(n - v, pairs, acc + s)
   |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:7 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-2.almd:13:7
   |
13 |       }
   |       ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:4:32
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  |
4 |   let pairs = list.zip(values, symbols)
  |                                ^^^^^^^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  let pairs = list.zip(values, symbols)
  let rec_loop = (n: Int, pairs: List[(Int, String)], acc: String) => 
    if n == 0 then acc
    else 
      match list.head(pairs) {
        some((v, s)) => 
          if n >= v then rec_loop(n - v, pairs, acc + s)
          else rec_loop(n, list.tail(pairs), acc)
        none => acc
      }
  rec_loop(n, pairs, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error[E002]: undefined function 'list.head'
  --> /tmp/dojo-roman-numeral-3.almd:8:23
  in call to list.head()
  hint: Did you mean `list.first`?
  |
8 |       match list.head(pairs) {
  |                       ^^^^^
error[E002]: undefined function 'rec_loop'
  --> /tmp/dojo-roman-numeral-3.almd:10:55
  in call to rec_loop()
  hint: Check the function name
   |
10 |           if n >= v then rec_loop(n - v, pairs, acc + s)
   |                                                       ^
error[E002]: undefined function 'list.tail'
  --> /tmp/dojo-roman-numeral-3.almd:11:38
  in call to list.tail()
  hint: Did you mean `list.drop(xs, 1)`?
   |
11 |           else rec_loop(n, list.tail(pairs), acc)
   |                                      ^^^^^
error[E002]: undefined function 'rec_loop'
  --> /tmp/dojo-roman-numeral-3.almd:11:46
  in call to rec_loop()
  hint: Check the function name
   |
11 |           else rec_loop(n, list.tail(pairs), acc)
   |                                              ^^^

4 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
