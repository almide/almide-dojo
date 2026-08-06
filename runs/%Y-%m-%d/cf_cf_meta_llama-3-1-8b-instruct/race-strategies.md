# race-strategies

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn exact(n: Int) -> Int = 
  let i = 0 in 
  while i < n do 
    i = i + 1 end; 
  i

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  let winner = fan.race(compute.ms(1)) { exact(n); heuristic(n) } in 
  match winner with 
  | some(x) => x 
  | none => -1
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-strategies-0.almd
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-race-strategies-0.almd:3:15
  in while body
  hint: Almide uses `while cond { ... }` (curly braces). But `while` requires a `var` accumulator — pure/effect fns usually want recursion instead.
  try:
      // Almide `while` needs braces (not `do ... done`):
      var i = 0
      while cond(i) { i = i + 1 }
      
      // For pure fn, prefer recursion over `var` + while:
      fn loop(i: Int, acc: T) -> T =
      if !cond(i) then acc else loop(i + 1, next(acc, i))
  |
3 |   while i < n do
  |               ^^
error: Expected expression at line 11:67 (got In 'in')
  --> /tmp/dojo-race-strategies-0.almd:11:67
   |
11 |   let winner = fan.race(compute.ms(1)) { exact(n); heuristic(n) } in
   |                                                                   ^
error: Expected LBrace at line 12:16 (got Ident 'with')
  --> /tmp/dojo-race-strategies-0.almd:12:16
   |
12 |   match winner with
   |                ^
error[E009]: cannot reassign immutable binding 'i'
  --> /tmp/dojo-race-strategies-0.almd:4:13
  in i = ...
  hint: Use 'var i = ...' instead of 'let i = ...' to declare a mutable variable
  try:
      // let i = ...  →  var i = ...
      var i = <initial value>
  |
2 |   let i = 0
  |   ----------------- 'i' declared here
...
4 |     i = i + 1 end;
  |             ^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-race-strategies-0.almd:4:15
  in variable end
  hint: Did you mean `n`?
  try:
      // end  →  n
      n
  |
4 |     i = i + 1 end;
  |               ^^^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-race-strategies-0.almd:11:25
  in variable compute
  hint: Check the variable name
   |
11 |   let winner = fan.race(compute.ms(1)) { exact(n); heuristic(n) } in
   |                         ^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-race-strategies-0.almd:
compile failed
FAILED: /tmp/dojo-race-strategies-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn exact(n: Int) -> Int = 
  var i = 0
  while i < n { i = i + 1 }
  i

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  let winner = fan.race(compute.ms(1)) { exact(n); heuristic(n) } in 
  match winner with 
  | some(x) => x 
  | none => -1
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-strategies-1.almd
error: Expected expression at line 10:67 (got In 'in')
  --> /tmp/dojo-race-strategies-1.almd:10:67
   |
10 |   let winner = fan.race(compute.ms(1)) { exact(n); heuristic(n) } in
   |                                                                   ^
error: Expected LBrace at line 11:16 (got Ident 'with')
  --> /tmp/dojo-race-strategies-1.almd:11:16
   |
11 |   match winner with
   |                ^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-race-strategies-1.almd:10:25
  in variable compute
  hint: Check the variable name
   |
10 |   let winner = fan.race(compute.ms(1)) { exact(n); heuristic(n) } in
   |                         ^^^^^^^

3 error(s) found
Compile error for /tmp/dojo-race-strategies-1.almd:
compile failed
FAILED: /tmp/dojo-race-strategies-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = 
  var i = 0
  while i < n { i = i + 1 }
  i

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  let winner = fan.race(compute.ms(1)) { exact(n); heuristic(n) } in 
  match winner with 
  | some(x) => x 
  | none => -1
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-strategies-2.almd
error: Expected expression at line 10:67 (got In 'in')
  --> /tmp/dojo-race-strategies-2.almd:10:67
   |
10 |   let winner = fan.race(compute.ms(1)) { exact(n); heuristic(n) } in
   |                                                                   ^
error: Expected LBrace at line 11:16 (got Ident 'with')
  --> /tmp/dojo-race-strategies-2.almd:11:16
   |
11 |   match winner with
   |                ^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-race-strategies-2.almd:10:25
  in variable compute
  hint: Check the variable name
   |
10 |   let winner = fan.race(compute.ms(1)) { exact(n); heuristic(n) } in
   |                         ^^^^^^^

3 error(s) found
Compile error for /tmp/dojo-race-strategies-2.almd:
compile failed
FAILED: /tmp/dojo-race-strategies-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = 
  var i = 0
  while i < n { i = i + 1 }
  i

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  let winner = fan.race(compute.ms(1)) { exact(n); heuristic(n) } in 
  match winner with 
  | some(x) => x 
  | none => -1
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-strategies-3.almd
error: Expected expression at line 10:67 (got In 'in')
  --> /tmp/dojo-race-strategies-3.almd:10:67
   |
10 |   let winner = fan.race(compute.ms(1)) { exact(n); heuristic(n) } in
   |                                                                   ^
error: Expected LBrace at line 11:16 (got Ident 'with')
  --> /tmp/dojo-race-strategies-3.almd:11:16
   |
11 |   match winner with
   |                ^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-race-strategies-3.almd:10:25
  in variable compute
  hint: Check the variable name
   |
10 |   let winner = fan.race(compute.ms(1)) { exact(n); heuristic(n) } in
   |                         ^^^^^^^

3 error(s) found
Compile error for /tmp/dojo-race-strategies-3.almd:
compile failed
FAILED: /tmp/dojo-race-strategies-3.almd

1/1 test file(s) failed

```
