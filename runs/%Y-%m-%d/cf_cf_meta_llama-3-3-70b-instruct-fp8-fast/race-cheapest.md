# race-cheapest

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  fn probe(n: Int) -> Int = {
    var i = 0
    var acc = 0
    while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
    acc
  }

  fan.race(costs, (x) => ok(probe(x))) ?? -1
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-cheapest-0.almd
error: Expected expression at line 2:3 (got Fn 'fn')
  --> /tmp/dojo-race-cheapest-0.almd:2:3
  |
2 |   fn probe(n: Int) -> Int = {
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:3 (got Fan 'fan')
  --> /tmp/dojo-race-cheapest-0.almd:9:3
  |
9 |   fan.race(costs, (x) => ok(probe(x))) ?? -1
  |   ^
error[E003]: undefined variable 'n'
  --> /tmp/dojo-race-cheapest-0.almd:5:15
  in variable n
  hint: Did you mean `i`?
  try:
      // n  →  i
      i
  |
5 |     while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
  |               ^

3 error(s) found
Compile error for /tmp/dojo-race-cheapest-0.almd:
compile failed
FAILED: /tmp/dojo-race-cheapest-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = 
  fan.race(costs, (x) => ok(probe(x))) ?? -1

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
error: fan.race() expects 1 argument but got 2
  --> /tmp/dojo-race-cheapest-1.almd:2:35
  in call to fan.race()
  hint: Usage: fan.race([fn() => a, fn() => b])
  |
2 |   fan.race(costs, (x) => ok(probe(x))) ?? -1
  |                                   ^

1 error(s) found
Compile error for /tmp/dojo-race-cheapest-1.almd:
compile failed
FAILED: /tmp/dojo-race-cheapest-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = 
  fan.race(list.map(costs, (x) => () => ok(probe(x)))) ?? -1

fn probe(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-cheapest-2.almd
error: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-race-cheapest-2.almd:2:60
  in operator ??
  hint: Use '??' only on Option[T] or Result[T, E] values
  |
2 |   fan.race(list.map(costs, (x) => () => ok(probe(x)))) ?? -1
  |                                                            ^

1 error(s) found
Compile error for /tmp/dojo-race-cheapest-2.almd:
compile failed
FAILED: /tmp/dojo-race-cheapest-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = 
  fan.race(list.map(costs, (x) => () => ok(probe(x)))) |> option.unwrap_or(-1)

fn probe(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-cheapest-3.almd
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-race-cheapest-3.almd:2:77
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
2 |   fan.race(list.map(costs, (x) => () => ok(probe(x)))) |> option.unwrap_or(-1)
  |                                                                             ^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[Int] but got Int
  --> /tmp/dojo-race-cheapest-3.almd:2:77
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
2 |   fan.race(list.map(costs, (x) => () => ok(probe(x)))) |> option.unwrap_or(-1)
  |                                                                             ^

2 error(s) found
Compile error for /tmp/dojo-race-cheapest-3.almd:
compile failed
FAILED: /tmp/dojo-race-cheapest-3.almd

1/1 test file(s) failed

```
