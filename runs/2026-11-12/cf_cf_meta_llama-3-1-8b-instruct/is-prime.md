# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all[Int](list.range(3, int.sqrt(n) + 1), (x) => n % x != 0)
```

**Diagnostic:**

```
error[E002]: undefined function 'int.sqrt'
  --> /tmp/dojo-is-prime-0.almd:5:36
  in call to int.sqrt()
  here: else list.all[Int](list.range(3, int.sqrt(n) + 1), (x) => n % x != 0)
  hint: Did you mean `math.sqrt(float.from(n))`?
  try:
      // Almide has math.sqrt; int.sqrt doesn't exist.
      // Convert → sqrt → (optionally) convert back:
      let root_f = math.sqrt(float.from(n))          // Float
      let root_i = int.from_saturating(root_f)       // Int (truncates)
      // — or inline: int.from_saturating(math.sqrt(float.from(n)))
  |
5 |   else list.all[Int](list.range(3, int.sqrt(n) + 1), (x) => n % x != 0)
  |                                    ^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-is-prime-0.almd
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all[Int](list.range(3, int.from_saturating(math.sqrt(float.from(n))) + 1), (x) => n % x != 0)
```
