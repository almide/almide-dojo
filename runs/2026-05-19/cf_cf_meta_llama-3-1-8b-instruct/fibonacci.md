# fibonacci

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn fibonacci(n: Int) -> Int = 
  if n == 0 then 0 
  else if n == 1 then 1 
  else 
    let a = fibonacci(n - 1) 
    let b = fibonacci(n - 2) 
    a + b
```

**Diagnostic:**

```
Compiling /tmp/dojo-fibonacci-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-fibonacci-0.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let a = fibonacci(n - 1)
  |     ^^^

1 error(s) found
Compile error for /tmp/dojo-fibonacci-0.almd:
compile failed
FAILED: /tmp/dojo-fibonacci-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn fibonacci(n: Int) -> Int = 
  if n == 0 then 0 
  else if n == 1 then 1 
  else 
    fibonacci(n - 1) + fibonacci(n - 2)
```
