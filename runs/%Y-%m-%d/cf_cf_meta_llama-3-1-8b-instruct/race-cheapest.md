# race-cheapest

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E0277`

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  fan.race(costs, (x) => {
    var i = 0
    var acc = 0
    while i < x { acc = (acc + i * 7) % 999983; i = i + 1 }
    ok(acc)
  }) ?? -1
}

fn probe(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-cheapest-0.almd
error: fan.race() expects 1 argument but got 2
  --> /tmp/dojo-race-cheapest-0.almd:6:8
  in call to fan.race()
  hint: Usage: fan.race([fn() => a, fn() => b])
  |
6 |     ok(acc)
  |        ^^^

1 error(s) found
Compile error for /tmp/dojo-race-cheapest-0.almd:
compile failed
FAILED: /tmp/dojo-race-cheapest-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  fan.race(costs.map((x) => {
    var i = 0
    var acc = 0
    while i < x { acc = (acc + i * 7) % 999983; i = i + 1 }
    ok(acc)
  })) ?? -1
}

fn probe(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
  acc
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
   --> <generated.rs>:332:33
    |
332 |       Ok(match almide_rt_fan_race((costs).into_iter().map(move |x| {
    |  ______________------------------_^
    | |              |
    | |              required by a bound introduced by this call
333 | |         let mut i: i64 = 0i64;
334 | |         let mut acc: i64 = 0i64;
335 | |         while (i < x) {
...   |
339 | |         Ok(acc)
340 | |     }).collect::<Vec<_>>()) { Ok(v) => v, Err(_) => (-1i64), })
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
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  fan.race(costs.map((x) => {
    fn probe(n: Int) -> Result[Int, String] = {
      var i = 0
      var acc = 0
      while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
      ok(acc)
    }
    probe(x)
  })) ?? -1
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-cheapest-2.almd
error: Expected expression at line 3:5 (got Fn 'fn')
  --> /tmp/dojo-race-cheapest-2.almd:3:5
  |
3 |     fn probe(n: Int) -> Result[Int, String] = {
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:4 (got RParen ')')
  --> /tmp/dojo-race-cheapest-2.almd:10:4
   |
10 |   })) ?? -1
   |    ^

2 error(s) found
Compile error for /tmp/dojo-race-cheapest-2.almd:
compile failed
FAILED: /tmp/dojo-race-cheapest-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  fan.race(costs.map((x) => probe(x))) ?? -1
}

fn probe(n: Int) -> Result[Int, String] = {
  var i = 0
  var acc = 0
  while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
  ok(acc)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-cheapest-3.almd
Compile error for /tmp/dojo-race-cheapest-3.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0277]: expected a `Fn()` closure, found `Result<i64, String>`
   --> <generated.rs>:332:33
    |
332 |     Ok(match almide_rt_fan_race((costs).into_iter().map(move |x| probe(x)).collect::<Vec<_>>()) { Ok(v) => v, Err(_) => (-1i64), })
    |              ------------------ ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected an `Fn()` closure, found `Result<i64, String>`
    |              |
    |              required by a bound introduced by this call
    |
    = help: the trait `Fn()` is not implemented for `Result<i64, String>`
    = note: wrap the `Result<i64, String>` in a closure with no arguments: `|| { /* code */ }`
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
