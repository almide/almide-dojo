# string-reverse

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String = 
  string.chars(s) 
  |> list.reverse 
  |> list.join(_, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error[E004]: list.join() expects 2 argument(s) but got 3
  --> /tmp/dojo-string-reverse-0.almd:4:19
  in call to list.join()
  hint: Check the number of arguments
  try:
      // list.join() takes 2 arg(s) — you passed 3
      list.join(<xs: List[String]>, <sep: String>)
  |
4 |   |> list.join(_, "")
  |                   ^^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn reverse(s: String) -> String = 
  string.chars(s) 
  |> list.reverse 
  |> list.join(_, "") 
  |> string.trim_start 
  |> string.trim_end 
  |> (x) => x 

fn reverse(s: String) -> String = 
  string.chars(s) 
  |> list.reverse 
  |> list.join 

fn reverse(s: String) -> String = 
  string.chars(s) 
  |> list.reverse 
  |> list.join("", _) 

fn reverse(s: String) -> String = 
  string.chars(s) 
  |> list.reverse 
  |> (xs) => list.join(xs, "") 

fn reverse(s: String) -> String = 
  string.chars(s) 
  |> list.reverse 
  |> (xs) => string.join(xs, "") 

fn reverse(s: String) -> String = 
  string.chars(s) 
  |> list.reverse 
  |> string.join 

fn reverse(s: String) -> String = 
  string.chars(s) 
  |> list.reverse 
  |> (xs) => string.join(xs, "") 

fn reverse(s: String) -> String = 
  string.chars(s) 
  |> list.reverse 
  |> (xs) => list.join
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error[E012]: duplicate function 'reverse'
  at line 9
  in fn reverse
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
  |
1 | fn reverse(s: String) -> String =
  | ---------------------------------- first definition of 'reverse' here
...
9 | fn reverse(s: String) -> String =
  | ^^^^^^^^^^
error[E012]: duplicate function 'reverse'
  at line 14
  in fn reverse
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn reverse(s: String) -> String =
   | ---------------------------------- first definition of 'reverse' here
...
14 | fn reverse(s: String) -> String =
   | ^^^^^^^^^^
error[E012]: duplicate function 'reverse'
  at line 19
  in fn reverse
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn reverse(s: String) -> String =
   | ---------------------------------- first definition of 'reverse' here
...
19 | fn reverse(s: String) -> String =
   | ^^^^^^^^^^
error[E012]: duplicate function 'reverse'
  at line 24
  in fn reverse
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn reverse(s: String) -> String =
   | ---------------------------------- first definition of 'reverse' here
...
24 | fn reverse(s: String) -> String =
   | ^^^^^^^^^^
error[E012]: duplicate function 'reverse'
  at line 29
  in fn reverse
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn reverse(s: String) -> String =
   | ---------------------------------- first definition of 'reverse' here
...
29 | fn reverse(s: String) -> String =
   | ^^^^^^^^^^
error[E012]: duplicate function 'reverse'
  at line 34
  in fn reverse
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn reverse(s: String) -> String =
   | ---------------------------------- first definition of 'reverse' here
...
34 | fn reverse(s: String) -> String =
   | ^^^^^^^^^^
error[E012]: duplicate function 'reverse'
  at line 39
  in fn reverse
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn reverse(s: String) -> String =
   | ---------------------------------- first definition of 'reverse' here
...
39 | fn reverse(s: String) -> String =
   | ^^^^^^^^^^
error[E004]: list.join() expects 2 argument(s) but got 3
  --> /tmp/dojo-string-reverse-1.almd:4:19
  in call to list.join()
  hint: Check the number of arguments
  try:
      // list.join() takes 2 arg(s) — you passed 3
      list.join(<xs: List[String]>, <sep: String>)
  |
4 |   |> list.join(_, "")
  |                   ^^
error[E004]: list.join() expects 2 argument(s) but got 1
  --> /tmp/dojo-string-reverse-1.almd:10:16
  in call to list.join()
  hint: Check the number of arguments
  try:
      // list.join() takes 2 arg(s) — you passed 1
      list.join(<xs: List[String]>, <sep: String>)
   |
10 |   string.chars(s)
   |                ^
error[E004]: list.join() expects 2 argument(s) but got 3
  --> /tmp/dojo-string-reverse-1.almd:17:20
  in call to list.join()
  hint: Check the number of arguments
  try:
      // list.join() takes 2 arg(s) — you passed 3
      list.join(<xs: List[String]>, <sep: String>)
   |
17 |   |> list.join("", _)
   |                    ^
error[E004]: string.join() expects 2 argument(s) but got 1
  --> /tmp/dojo-string-reverse-1.almd:30:16
  in call to string.join()
  hint: Check the number of arguments
  try:
      // string.join() takes 2 arg(s) — you passed 1
      string.join(<list: List[String]>, <sep: String>)
   |
30 |   string.chars(s)
   |                ^
error[E001]: type mismatch in pipe call: expected fn(List[String]) -> fn(List[String], String) -> String but got fn(List[String]) -> String
  --> /tmp/dojo-string-reverse-1.almd:42:18
  in pipe call
  hint: Fix the expression type or change the expected type
   |
42 |   |> (xs) => list.join
   |                  ^

12 error(s) found
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn reverse(s: String) -> String = 
  string.chars(s) 
  |> list.reverse 
  |> (xs) => string.join(xs, "")
```
