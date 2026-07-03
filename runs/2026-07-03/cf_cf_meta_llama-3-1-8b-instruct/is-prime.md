# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else if n <= 3 then true 
  else if n mod 2 == 0 then false 
  else if n mod 3 == 0 then false 
  else let candidates = list.range(5, int.to_float(math.sqrt(n)) as Int) 
       list.all(list.filter(candidates, (x) => n mod x != 0), (x) => true)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Expected Then at line 4:13 (got Mod 'mod')
  --> /tmp/dojo-is-prime-0.almd:4:13
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |   else if n mod 2 == 0 then false
  |             ^
error: Expected Fn at line 4:17 (got Int '2')
  --> /tmp/dojo-is-prime-0.almd:4:17
  |
4 |   else if n mod 2 == 0 then false
  |                 ^
error: Expected Fn at line 5:17 (got Int '3')
  --> /tmp/dojo-is-prime-0.almd:5:17
  |
5 |   else if n mod 3 == 0 then false
  |                 ^
error: Expected Fn at line 7:54 (got Ident 'x')
  --> /tmp/dojo-is-prime-0.almd:7:54
  |
7 |        list.all(list.filter(candidates, (x) => n mod x != 0), (x) => true)
  |                                                      ^

4 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else if n <= 3 then true 
  else if n mod 2 == 0 then false 
  else if n mod 3 == 0 then false 
  else let candidates = list.range(5, int.to_float(math.sqrt(n)) as Int) 
       list.all(list.filter(candidates, (x) => n mod x != 0), (x) => n mod x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected Then at line 4:13 (got Mod 'mod')
  --> /tmp/dojo-is-prime-1.almd:4:13
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |   else if n mod 2 == 0 then false
  |             ^
error: Expected Fn at line 4:17 (got Int '2')
  --> /tmp/dojo-is-prime-1.almd:4:17
  |
4 |   else if n mod 2 == 0 then false
  |                 ^
error: Expected Fn at line 5:17 (got Int '3')
  --> /tmp/dojo-is-prime-1.almd:5:17
  |
5 |   else if n mod 3 == 0 then false
  |                 ^
error: Expected Fn at line 7:54 (got Ident 'x')
  --> /tmp/dojo-is-prime-1.almd:7:54
  |
7 |        list.all(list.filter(candidates, (x) => n mod x != 0), (x) => n mod x != 0)
  |                                                      ^
error: Expected Fn at line 7:76 (got Ident 'x')
  --> /tmp/dojo-is-prime-1.almd:7:76
  |
7 |        list.all(list.filter(candidates, (x) => n mod x != 0), (x) => n mod x != 0)
  |                                                                            ^

5 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else if n <= 3 then true 
  else if n mod 2 == 0 then false 
  else if n mod 3 == 0 then false 
  else let candidates = list.range(5, int.to_float(math.sqrt(n)) as Int) 
       list.all(list.filter(candidates, (x) => x > 0), (candidate) => n mod candidate != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: Expected Then at line 4:13 (got Mod 'mod')
  --> /tmp/dojo-is-prime-2.almd:4:13
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |   else if n mod 2 == 0 then false
  |             ^
error: Expected Fn at line 4:17 (got Int '2')
  --> /tmp/dojo-is-prime-2.almd:4:17
  |
4 |   else if n mod 2 == 0 then false
  |                 ^
error: Expected Fn at line 5:17 (got Int '3')
  --> /tmp/dojo-is-prime-2.almd:5:17
  |
5 |   else if n mod 3 == 0 then false
  |                 ^
error: Expected Fn at line 7:77 (got Ident 'candidate')
  --> /tmp/dojo-is-prime-2.almd:7:77
  |
7 |        list.all(list.filter(candidates, (x) => x > 0), (candidate) => n mod candidate != 0)
  |                                                                             ^

4 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else if n <= 3 then true 
  else if n mod 2 == 0 then false 
  else if n mod 3 == 0 then false 
  else let candidates = list.range(5, int.to_float(math.sqrt(n)) as Int) 
       list.all(list.filter(candidates, (x) => x > 0), (candidate) => n mod candidate != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: Expected Then at line 4:13 (got Mod 'mod')
  --> /tmp/dojo-is-prime-3.almd:4:13
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |   else if n mod 2 == 0 then false
  |             ^
error: Expected Fn at line 4:17 (got Int '2')
  --> /tmp/dojo-is-prime-3.almd:4:17
  |
4 |   else if n mod 2 == 0 then false
  |                 ^
error: Expected Fn at line 5:17 (got Int '3')
  --> /tmp/dojo-is-prime-3.almd:5:17
  |
5 |   else if n mod 3 == 0 then false
  |                 ^
error: Expected Fn at line 7:77 (got Ident 'candidate')
  --> /tmp/dojo-is-prime-3.almd:7:77
  |
7 |        list.all(list.filter(candidates, (x) => x > 0), (candidate) => n mod candidate != 0)
  |                                                                             ^

4 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
