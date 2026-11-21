# fibonacci

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn fibonacci(n: Int) -> Int = 
  if n == 0 then 0 else 
  if n == 1 then 1 else 
  int.from_saturating(math.sqrt(float.from(5.0)) * float.from(n) / float.from(2.0) + 0.5).round()
```

**Diagnostic:**

```
error[E002]: undefined method 'round' on int
  --> /tmp/dojo-fibonacci-0.almd:4:3
  in method call .round()
  here: int.from_saturating(math.sqrt(float.from(5.0)) * float.from(n) / float.from(2.0) + 0.5).round()
  hint: Almide doesn't use method-call syntax. Write `int.<fn>(x)` (or `x |> int.<fn>`) — there is no method `round` on `int`. Run `almide explain E002` for examples.
  |
4 |   int.from_saturating(math.sqrt(float.from(5.0)) * float.from(n) / float.from(2.0) + 0.5).round()
  |   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-fibonacci-0.almd
Compile error for /tmp/dojo-fibonacci-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn fibonacci(n: Int) -> Int = 
  if n == 0 then 0 else 
  if n == 1 then 1 else 
  int.from_saturating(math.sqrt(float.from(5.0)) * float.from(n) / float.from(2.0) + 0.5).to_int()
```

**Diagnostic:**

```
error[E002]: undefined method 'to_int' on int
  --> /tmp/dojo-fibonacci-1.almd:4:3
  in method call .to_int()
  here: int.from_saturating(math.sqrt(float.from(5.0)) * float.from(n) / float.from(2.0) + 0.5).to_int()
  hint: Almide doesn't use method-call syntax. Write `int.<fn>(x)` (or `x |> int.<fn>`) — there is no method `to_int` on `int`. Run `almide explain E002` for examples.
  |
4 |   int.from_saturating(math.sqrt(float.from(5.0)) * float.from(n) / float.from(2.0) + 0.5).to_int()
  |   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-fibonacci-1.almd
Compile error for /tmp/dojo-fibonacci-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn fibonacci(n: Int) -> Int = 
  if n == 0 then 0 else 
  if n == 1 then 1 else 
  int.from_saturating(math.sqrt(float.from(5.0)) * float.from(n) / float.from(2.0) + 0.5)
```

**Diagnostic:**

```
FAILED: /tmp/dojo-fibonacci-2.almd
  test: fibonacci 2 is 1
  at:   /tmp/dojo-fibonacci-2.almd:8
  expected: 1
  found:    2
  test: fibonacci 3 is 2
  at:   /tmp/dojo-fibonacci-2.almd:9
  expected: 2
  found:    3
  test: fibonacci 5 is 5
  at:   /tmp/dojo-fibonacci-2.almd:10
  expected: 5
  found:    6
  test: fibonacci 10 is 55
  at:   /tmp/dojo-fibonacci-2.almd:11
  expected: 55
  found:    11
  test: fibonacci 15 is 610
  at:   /tmp/dojo-fibonacci-2.almd:12
  expected: 610
  found:    17

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (PASS)

```almide
fn fibonacci(n: Int) -> Int = 
  if n == 0 then 0 else 
  if n == 1 then 1 else 
  fibonacci(n - 1) + fibonacci(n - 2)
```
