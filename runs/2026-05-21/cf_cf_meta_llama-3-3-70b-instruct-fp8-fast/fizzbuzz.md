# fizzbuzz

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn fizzbuzz(n: Int) -> String = 
  if int.to_float(n) / 15.0 == float.to_int(int.to_float(n) / 15.0) then "FizzBuzz"
  else if int.to_float(n) / 3.0 == float.to_int(int.to_float(n) / 3.0) then "Fizz"
  else if int.to_float(n) / 5.0 == float.to_int(int.to_float(n) / 5.0) then "Buzz"
  else int.to_string(n)
```

**Diagnostic:**

```
Compiling /tmp/dojo-fizzbuzz-0.almd
Compile error for /tmp/dojo-fizzbuzz-0.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0308]: mismatched types
   --> <generated.rs>:303:41
    |
303 |     if almide_eq!(((n as f64) / 15f64), (((n as f64) / 15f64) as i64)) { "FizzBuzz".to_string() } else { if almide_eq!(((n as f64) ...
    |                   --------------------  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `f64`, found `i64`
    |                   |
    |                   expected because this is `f64`
    |
help: you can convert an `i64` to an `f64`, producing the floating point representation of the integer, rounded if necessary
    |
303 |     if almide_eq!(((n as f64) / 15f64), ((((n as f64) / 15f64) as i64)) as f64) { "FizzBuzz".to_string() } else { if almide_eq!(((n as f64) / 3f64), (((n as f64) / 3f64) as i64)) { "Fizz".to_string() } else { if almide_eq!(((n as f64) / 5f64), (((n as f64) / 5f64) as i64)) { "Buzz".to_string() } else { almide_rt_int_to_string(n) } } }
    |                                         +                             ++++++++


error[E0308]: mismatched types
   --> <generated.rs>:303:141
    |
303 | ...) } else { if almide_eq!(((n as f64) / 3f64), (((n as f64) / 3f64) as i64)) { "Fizz".to_string() } else { if almide_eq!(((n as f...
    |                             -------------------  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `f64`, found `i64`
    |                             |
    |                             expected because this is `f64`
    |
help: you can convert an `i64` to an `f64`, producing the floating point representation of the integer, rounded if necessary
    |
303 |     if almide_eq!(((n as f64) / 15f64), (((n as f64) / 15f64) as i64)) { "FizzBuzz".to_string() } else { if almide_eq!(((n as f64) / 3f64), ((((n as f64) / 3f64) as i64)) as f64) { "Fizz".to_string() } else { if almide_eq!(((n as f64) / 5f64), (((n as f64) / 5f64) as i64)) { "Buzz".to_string() } else { almide_rt_int_to_string(n) } } }
    |                                                                                                                                             +                            ++++++++


error[E0308]: mismatched types
   --> <generated.rs>:303:236
    |
303 | ...) } else { if almide_eq!(((n as f64) / 5f64), (((n as f64) / 5f64) as i64)) { "Buzz".to_string() } else { almide_rt_int_to_strin...
    |                             -------------------  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `f64`, found `i64`
    |                             |
    |                             expected because this is `f64`
    |
help: you can convert an `i64` to an `f64`, producing the floating point representation of the integer, rounded if necessary
    |
303 |     if almide_eq!(((n as f64) / 15f64), (((n as f64) / 15f64) as i64)) { "FizzBuzz".to_string() } else { if almide_eq!(((n as f64) / 3f64), (((n as f64) / 3f64) as i64)) { "Fizz".to_string() } else { if almide_eq!(((n as f64) / 5f64), ((((n as f64) / 5f64) as i64)) as f64) { "Buzz".to_string() } else { almide_rt_int_to_string(n) } } }
    |                                                                                                                                                                                                                                            +                            ++++++++


error: could not compile `almide-generated` (bin "almide-generated" test) due to 3 previous errors; 1 warning emitted

FAILED: /tmp/dojo-fizzbuzz-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn fizzbuzz(n: Int) -> String = 
  if int.to_float(n) / 15.0 == float.to_int(int.to_float(n) / 15.0) as Float then "FizzBuzz"
  else if int.to_float(n) / 3.0 == float.to_int(int.to_float(n) / 3.0) as Float then "Fizz"
  else if int.to_float(n) / 5.0 == float.to_int(int.to_float(n) / 5.0) as Float then "Buzz"
  else int.to_string(n)
```

**Diagnostic:**

```
Compiling /tmp/dojo-fizzbuzz-1.almd
error: Expected Then at line 2:69 (got Ident 'as')
  --> /tmp/dojo-fizzbuzz-1.almd:2:69
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if int.to_float(n) / 15.0 == float.to_int(int.to_float(n) / 15.0) as Float then "FizzBuzz"
  |                                                                     ^

1 error(s) found
Compile error for /tmp/dojo-fizzbuzz-1.almd:
compile failed
FAILED: /tmp/dojo-fizzbuzz-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn fizzbuzz(n: Int) -> String = 
  if n % 15 == 0 then "FizzBuzz"
  else if n % 3 == 0 then "Fizz"
  else if n % 5 == 0 then "Buzz"
  else int.to_string(n)
```
