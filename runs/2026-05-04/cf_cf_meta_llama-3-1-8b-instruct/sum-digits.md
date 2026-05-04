# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 
    match n do 
      0 -> 0 
      _ -> 
        let digits = 
          let acc = ref(0) in 
          let loop = fn(n) -> 
            if n > 0 then 
              let digit = n % 10 in 
              acc := acc + digit; 
              loop(n / 10) 
            else 
              acc := acc + 0; 
              acc := acc 
          in 
          loop(int.abs(n)) 
        in 
        digits 
  in 
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: Expected LBrace at line 3:13 (got Ident 'do')
  --> /tmp/dojo-sum-digits-0.almd:3:13
  |
3 |     match n do
  |             ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-0.almd:7:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |           let acc = ref(0) in
  |           ^^^
error: Expected expression at line 8:22 (got Fn 'fn')
  --> /tmp/dojo-sum-digits-0.almd:8:22
  |
8 |           let loop = fn(n) ->
  |                      ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-0.almd:10:15
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |               let digit = n % 10 in
   |               ^^^
error: Expected expression at line 11:19 (got Colon ':')
  --> /tmp/dojo-sum-digits-0.almd:11:19
   |
11 |               acc := acc + digit;
   |                   ^
error: 'loop' is not valid in Almide at line 12:15
  --> /tmp/dojo-sum-digits-0.almd:12:15
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
12 |               loop(n / 10)
   |               ^
error: Expected expression at line 14:19 (got Colon ':')
  --> /tmp/dojo-sum-digits-0.almd:14:19
   |
14 |               acc := acc + 0;
   |                   ^
error: Expected expression at line 15:19 (got Colon ':')
  --> /tmp/dojo-sum-digits-0.almd:15:19
   |
15 |               acc := acc
   |                   ^
error: 'loop' is not valid in Almide at line 17:11
  --> /tmp/dojo-sum-digits-0.almd:17:11
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
17 |           loop(int.abs(n))
   |           ^
error: Expected expression at line 20:3 (got In 'in')
  --> /tmp/dojo-sum-digits-0.almd:20:3
   |
20 |   in
   |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-sum-digits-0.almd:11:15
  in variable acc
  hint: Check the variable name
   |
11 |               acc := acc + digit;
   |               ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-sum-digits-0.almd:14:15
  in variable acc
  hint: Check the variable name
   |
14 |               acc := acc + 0;
   |               ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-sum-digits-0.almd:15:15
  in variable acc
  hint: Check the variable name
   |
15 |               acc := acc
   |               ^^^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-0.almd:19:9
  in variable digits
  hint: Check the variable name
   |
19 |         digits
   |         ^^^^^^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-sum-digits-0.almd:21:3
  in variable sum
  hint: Check the variable name
   |
21 |   sum
   |   ^^^

15 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 
    match n do 
      0 -> 0 
      _ -> 
        let acc = 0 in 
        let loop = fn(n) -> 
          if n > 0 then 
            let digit = n % 10 in 
            loop(n / 10) 
          else 
            acc 
        in 
        loop(int.abs(n)) 
  in 
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: Expected LBrace at line 3:13 (got Ident 'do')
  --> /tmp/dojo-sum-digits-1.almd:3:13
  |
3 |     match n do
  |             ^
error: Expected expression at line 7:20 (got Fn 'fn')
  --> /tmp/dojo-sum-digits-1.almd:7:20
  |
7 |         let loop = fn(n) ->
  |                    ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-1.almd:9:13
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |             let digit = n % 10 in
  |             ^^^
error: 'loop' is not valid in Almide at line 10:13
  --> /tmp/dojo-sum-digits-1.almd:10:13
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
10 |             loop(n / 10)
   |             ^
error: Expected expression at line 13:9 (got In 'in')
  --> /tmp/dojo-sum-digits-1.almd:13:9
   |
13 |         in
   |         ^
error: 'loop' is not valid in Almide at line 14:9
  --> /tmp/dojo-sum-digits-1.almd:14:9
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
14 |         loop(int.abs(n))
   |         ^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-sum-digits-1.almd:16:3
  in variable sum
  hint: Check the variable name
   |
16 |   sum
   |   ^^^

7 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 
    match n do 
      0 -> 0 
      _ -> 
        let acc = 0 in 
        let loop = fn(n: Int) -> 
          if n > 0 then 
            let digit = n % 10 in 
            loop(n / 10) 
          else 
            acc 
        in 
        loop(int.abs(n)) 
  in 
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: Expected LBrace at line 3:13 (got Ident 'do')
  --> /tmp/dojo-sum-digits-2.almd:3:13
  |
3 |     match n do
  |             ^
error: Expected expression at line 7:20 (got Fn 'fn')
  --> /tmp/dojo-sum-digits-2.almd:7:20
  |
7 |         let loop = fn(n: Int) ->
  |                    ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-2.almd:9:13
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |             let digit = n % 10 in
  |             ^^^
error: 'loop' is not valid in Almide at line 10:13
  --> /tmp/dojo-sum-digits-2.almd:10:13
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
10 |             loop(n / 10)
   |             ^
error: Expected expression at line 13:9 (got In 'in')
  --> /tmp/dojo-sum-digits-2.almd:13:9
   |
13 |         in
   |         ^
error: 'loop' is not valid in Almide at line 14:9
  --> /tmp/dojo-sum-digits-2.almd:14:9
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
14 |         loop(int.abs(n))
   |         ^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-sum-digits-2.almd:16:3
  in variable sum
  hint: Check the variable name
   |
16 |   sum
   |   ^^^

7 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 
    match n do 
      0 -> 0 
      _ -> 
        let acc = 0 in 
        let loop = fn(n: Int) -> 
          if n > 0 then 
            let digit = n % 10 in 
            acc + loop(n / 10) 
          else 
            acc 
        in 
        loop(int.abs(n)) 
  in 
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error: Expected LBrace at line 3:13 (got Ident 'do')
  --> /tmp/dojo-sum-digits-3.almd:3:13
  |
3 |     match n do
  |             ^
error: Expected expression at line 7:20 (got Fn 'fn')
  --> /tmp/dojo-sum-digits-3.almd:7:20
  |
7 |         let loop = fn(n: Int) ->
  |                    ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-3.almd:9:13
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |             let digit = n % 10 in
  |             ^^^
error: 'loop' is not valid in Almide at line 10:19
  --> /tmp/dojo-sum-digits-3.almd:10:19
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
10 |             acc + loop(n / 10)
   |                   ^
error: Expected expression at line 13:9 (got In 'in')
  --> /tmp/dojo-sum-digits-3.almd:13:9
   |
13 |         in
   |         ^
error: 'loop' is not valid in Almide at line 14:9
  --> /tmp/dojo-sum-digits-3.almd:14:9
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
14 |         loop(int.abs(n))
   |         ^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-sum-digits-3.almd:16:3
  in variable sum
  hint: Check the variable name
   |
16 |   sum
   |   ^^^

7 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
