# race-strategies

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn exact(n: Int) -> Int = 
  let i = 0 in
  while i < n do
    i = i + 1
  end;
  i

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  let (exact_cost, exact_result) = 
    compute.ms(1).map { exact(n) } 
  in
  let (heuristic_cost, heuristic_result) = 
    compute.ms(1).map { heuristic(n) } 
  in
  if exact_cost <= heuristic_cost then 
    exact_result 
  else if heuristic_cost <= exact_cost then 
    heuristic_result 
  else 
    -1
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
error: Expected expression at line 14:3 (got In 'in')
  --> /tmp/dojo-race-strategies-0.almd:14:3
   |
14 |   in
   |   ^
error: Expected expression at line 17:3 (got In 'in')
  --> /tmp/dojo-race-strategies-0.almd:17:3
   |
17 |   in
   |   ^
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
4 |     i = i + 1
  |             ^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-race-strategies-0.almd:5:3
  in variable end
  hint: Did you mean `n`?
  try:
      // end  →  n
      n
  |
5 |   end;
  |   ^^^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-race-strategies-0.almd:13:5
  in variable compute
  hint: Check the variable name
   |
13 |     compute.ms(1).map { exact(n) }
   |     ^^^^^^^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-race-strategies-0.almd:16:5
  in variable compute
  hint: Check the variable name
   |
16 |     compute.ms(1).map { heuristic(n) }
   |     ^^^^^^^

7 error(s) found
Compile error for /tmp/dojo-race-strategies-0.almd:
compile failed
FAILED: /tmp/dojo-race-strategies-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn exact(n: Int) -> Int = 
  var i = 0
  while i < n do
    i = i + 1
  end;
  i

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  let (exact_cost, exact_result) = 
    fs.time { exact(n) } 
  in
  let (heuristic_cost, heuristic_result) = 
    fs.time { heuristic(n) } 
  in
  if exact_cost <= heuristic_cost then 
    exact_result 
  else if heuristic_cost <= exact_cost then 
    heuristic_result 
  else 
    -1
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-strategies-1.almd
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-race-strategies-1.almd:3:15
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
error: Expected expression at line 14:3 (got In 'in')
  --> /tmp/dojo-race-strategies-1.almd:14:3
   |
14 |   in
   |   ^
error: Expected expression at line 17:3 (got In 'in')
  --> /tmp/dojo-race-strategies-1.almd:17:3
   |
17 |   in
   |   ^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-race-strategies-1.almd:5:3
  in variable end
  hint: Did you mean `n`?
  try:
      // end  →  n
      n
  |
5 |   end;
  |   ^^^
error[E003]: undefined variable 'fs'
  --> /tmp/dojo-race-strategies-1.almd:13:5
  in variable fs
  hint: Add `import fs` (stdlib: file system operations)
Or run `almide fmt` to auto-add missing imports
  try:
      import fs
   |
13 |     fs.time { exact(n) }
   |     ^^
error[E003]: undefined variable 'fs'
  --> /tmp/dojo-race-strategies-1.almd:16:5
  in variable fs
  hint: Add `import fs` (stdlib: file system operations)
Or run `almide fmt` to auto-add missing imports
  try:
      import fs
   |
16 |     fs.time { heuristic(n) }
   |     ^^

6 error(s) found
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

import fs

effect fn best_effort(n: Int) -> Int = 
  let (exact_cost, exact_result) = fs.time { exact(n) } 
  in
  let (heuristic_cost, heuristic_result) = fs.time { heuristic(n) } 
  in
  if exact_cost <= heuristic_cost then 
    exact_result 
  else if heuristic_cost <= exact_cost then 
    heuristic_result 
  else 
    -1
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-strategies-2.almd
error: Unexpected token at top level at line 9:1
  --> /tmp/dojo-race-strategies-2.almd:9:1
  hint: All imports must come before other declarations.
  |
9 | import fs
  | ^
error: Expected expression at line 13:3 (got In 'in')
  --> /tmp/dojo-race-strategies-2.almd:13:3
   |
13 |   in
   |   ^
error: Expected expression at line 15:3 (got In 'in')
  --> /tmp/dojo-race-strategies-2.almd:15:3
   |
15 |   in
   |   ^
error[E003]: undefined variable 'fs'
  --> /tmp/dojo-race-strategies-2.almd:12:36
  in variable fs
  hint: Add `import fs` (stdlib: file system operations)
Or run `almide fmt` to auto-add missing imports
  try:
      import fs
   |
12 |   let (exact_cost, exact_result) = fs.time { exact(n) }
   |                                    ^^
error[E003]: undefined variable 'fs'
  --> /tmp/dojo-race-strategies-2.almd:14:44
  in variable fs
  hint: Add `import fs` (stdlib: file system operations)
Or run `almide fmt` to auto-add missing imports
  try:
      import fs
   |
14 |   let (heuristic_cost, heuristic_result) = fs.time { heuristic(n) }
   |                                            ^^

5 error(s) found
Compile error for /tmp/dojo-race-strategies-2.almd:
compile failed
FAILED: /tmp/dojo-race-strategies-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
import fs

fn exact(n: Int) -> Int = 
  var i = 0
  while i < n { i = i + 1 }
  i

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  let (exact_cost, exact_result) = fs.time { exact(n) } 
  let (heuristic_cost, heuristic_result) = fs.time { heuristic(n) } 
  if exact_cost <= heuristic_cost then 
    exact_result 
  else if heuristic_cost <= exact_cost then 
    heuristic_result 
  else 
    -1

effect fn race(n: Int) -> Int = 
  fan.race(compute.ms(1)) { exact(n); heuristic(n) }
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-strategies-3.almd
error[E003]: undefined variable 'fs'
  --> /tmp/dojo-race-strategies-3.almd:13:36
  in variable fs
  hint: Add `import fs` (stdlib: file system operations)
Or run `almide fmt` to auto-add missing imports
  try:
      import fs
   |
13 |   let (exact_cost, exact_result) = fs.time;
   |                                    ^^
error[E003]: undefined variable 'fs'
  --> /tmp/dojo-race-strategies-3.almd:15:44
  in variable fs
  hint: Add `import fs` (stdlib: file system operations)
Or run `almide fmt` to auto-add missing imports
  try:
      import fs
   |
15 |   let (heuristic_cost, heuristic_result) = fs.time;
   |                                            ^^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-race-strategies-3.almd:21:42
  in variable compute
  hint: Check the variable name
   |
21 | effect fn race(n: Int) -> Int = fan.race(compute.ms(1))
   |                                          ^^^^^^^

3 error(s) found
Compile error for /tmp/dojo-race-strategies-3.almd:
compile failed
FAILED: /tmp/dojo-race-strategies-3.almd

1/1 test file(s) failed

```
