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
  else if n == 2 then true
  else if n % 2 == 0 then false
  else 
    let check_divisor = (x) => x * x <= n
    list.all(list.range(3, int.sqrt(n) + 1), check_divisor)
  end
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-0.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let check_divisor = (x) => x * x <= n
  |     ^^^

1 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n < 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else 
    list.all(list.range(3, int.sqrt(n) + 1), (x) => x * x < n)
  end
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:3 (got Ident 'end')
  --> /tmp/dojo-is-prime-1.almd:7:3
  |
7 |   end
  |   ^
error[E002]: undefined function 'int.sqrt'
  --> /tmp/dojo-is-prime-1.almd:6:37
  in call to int.sqrt()
  hint: No function 'sqrt' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 |     list.all(list.range(3, int.sqrt(n) + 1), (x) => x * x < n)
  |                                     ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n < 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else 
    list.all(list.range(3, math.sqrt(n) + 1), (x) => x * x < n)
  end
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:3 (got Ident 'end')
  --> /tmp/dojo-is-prime-2.almd:7:3
  |
7 |   end
  |   ^
error[E003]: undefined variable 'math'
  --> /tmp/dojo-is-prime-2.almd:6:28
  in variable math
  hint: Did you mean `math.e`?
  try:
      // math  →  math.e
      math.e
  |
6 |     list.all(list.range(3, math.sqrt(n) + 1), (x) => x * x < n)
  |                            ^^^^

2 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n < 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else 
    list.all(list.range(3, int.sqrt(n) + 1), (x) => x * x < n)
  end
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:3 (got Ident 'end')
  --> /tmp/dojo-is-prime-3.almd:7:3
  |
7 |   end
  |   ^
error[E002]: undefined function 'int.sqrt'
  --> /tmp/dojo-is-prime-3.almd:6:37
  in call to int.sqrt()
  hint: No function 'sqrt' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 |     list.all(list.range(3, int.sqrt(n) + 1), (x) => x * x < n)
  |                                     ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
