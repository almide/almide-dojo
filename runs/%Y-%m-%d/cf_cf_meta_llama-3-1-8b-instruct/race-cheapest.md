# race-cheapest

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E0277`

## Attempts

### Attempt 1 (FAIL)

```almide
fn probe(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
  acc
}

effect fn cheapest_probe(costs: List[Int]) -> Int = {
  fan.race(costs, (cost) => {
    let result = probe(cost)
    ok(result)
  }) ?? -1
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-cheapest-0.almd
error: fan.race() expects 1 argument but got 2
  --> /tmp/dojo-race-cheapest-0.almd:11:8
  in call to fan.race()
  hint: Usage: fan.race([fn() => a, fn() => b])
   |
11 |     ok(result)
   |        ^^^^^^

1 error(s) found
Compile error for /tmp/dojo-race-cheapest-0.almd:
compile failed
FAILED: /tmp/dojo-race-cheapest-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn probe(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
  acc
}

effect fn cheapest_probe(costs: List[Int]) -> Int = {
  fan.race(costs.map((cost) => {
    let result = probe(cost)
    ok(result)
  })) ?? -1
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-cheapest-1.almd
Compile error for /tmp/dojo-race-cheapest-1.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0277]: expected a `Fn()` closure, found `Result<i64, _>`
   --> <generated.rs>:342:33
    |
342 |       Ok(match almide_rt_fan_race((costs).into_iter().map(move |cost| {
    |  ______________------------------_^
    | |              |
    | |              required by a bound introduced by this call
343 | |         let result: i64 = probe(cost);
344 | |         Ok(result)
345 | |     }).collect::<Vec<_>>()) { Ok(v) => v, Err(_) => (-1i64), })
    | |__________________________^ expected an `Fn()` closure, found `Result<i64, _>`
    |
    = help: the trait `Fn()` is not implemented for `Result<i64, _>`
    = note: wrap the `Result<i64, _>` in a closure with no arguments: `|| { /* code */ }`
note: required by a bound in `almide_rt_fan_race`
   --> <generated.rs>:39:22
    |
 38 | pub fn almide_rt_fan_race<T: Send + 'static>(
    |        ------------------ required by a bound in this function
 39 |     thunks: Vec<impl Fn() -> Result<T, String> + Send + Sync>,
    |                      ^^^^^^^^^^^^^^^^^^^^^^^^^ required by this bound in `almide_rt_fan_race`


error: could not compile `almide-generated` (bin "almide-generated" test) due to 1 previous error; 2 warnings emitted

FAILED: /tmp/dojo-race-cheapest-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn probe(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
  acc
}

effect fn cheapest_probe(costs: List[Int]) -> Int = {
  fan.race(costs.map((cost) => {
    let result = probe(cost)
    ok(result)
  })) ?? (-1)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-cheapest-2.almd
Compile error for /tmp/dojo-race-cheapest-2.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0277]: expected a `Fn()` closure, found `Result<i64, _>`
   --> <generated.rs>:342:33
    |
342 |       Ok(match almide_rt_fan_race((costs).into_iter().map(move |cost| {
    |  ______________------------------_^
    | |              |
    | |              required by a bound introduced by this call
343 | |         let result: i64 = probe(cost);
344 | |         Ok(result)
345 | |     }).collect::<Vec<_>>()) { Ok(v) => v, Err(_) => (-1i64), })
    | |__________________________^ expected an `Fn()` closure, found `Result<i64, _>`
    |
    = help: the trait `Fn()` is not implemented for `Result<i64, _>`
    = note: wrap the `Result<i64, _>` in a closure with no arguments: `|| { /* code */ }`
note: required by a bound in `almide_rt_fan_race`
   --> <generated.rs>:39:22
    |
 38 | pub fn almide_rt_fan_race<T: Send + 'static>(
    |        ------------------ required by a bound in this function
 39 |     thunks: Vec<impl Fn() -> Result<T, String> + Send + Sync>,
    |                      ^^^^^^^^^^^^^^^^^^^^^^^^^ required by this bound in `almide_rt_fan_race`


error: could not compile `almide-generated` (bin "almide-generated" test) due to 1 previous error; 2 warnings emitted

FAILED: /tmp/dojo-race-cheapest-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn probe(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
  acc
}

effect fn cheapest_probe(costs: List[Int]) -> Int = {
  fan.race(costs.map((cost) => {
    let result = probe(cost)
    ok(result)
  })) ?? (-1)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-cheapest-3.almd
Compile error for /tmp/dojo-race-cheapest-3.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0277]: expected a `Fn()` closure, found `Result<i64, _>`
   --> <generated.rs>:342:33
    |
342 |       Ok(match almide_rt_fan_race((costs).into_iter().map(move |cost| {
    |  ______________------------------_^
    | |              |
    | |              required by a bound introduced by this call
343 | |         let result: i64 = probe(cost);
344 | |         Ok(result)
345 | |     }).collect::<Vec<_>>()) { Ok(v) => v, Err(_) => (-1i64), })
    | |__________________________^ expected an `Fn()` closure, found `Result<i64, _>`
    |
    = help: the trait `Fn()` is not implemented for `Result<i64, _>`
    = note: wrap the `Result<i64, _>` in a closure with no arguments: `|| { /* code */ }`
note: required by a bound in `almide_rt_fan_race`
   --> <generated.rs>:39:22
    |
 38 | pub fn almide_rt_fan_race<T: Send + 'static>(
    |        ------------------ required by a bound in this function
 39 |     thunks: Vec<impl Fn() -> Result<T, String> + Send + Sync>,
    |                      ^^^^^^^^^^^^^^^^^^^^^^^^^ required by this bound in `almide_rt_fan_race`


error: could not compile `almide-generated` (bin "almide-generated" test) due to 1 previous error; 2 warnings emitted

FAILED: /tmp/dojo-race-cheapest-3.almd

1/1 test file(s) failed

```
