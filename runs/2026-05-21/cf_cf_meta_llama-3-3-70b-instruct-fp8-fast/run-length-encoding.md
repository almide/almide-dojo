# run-length-encoding

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E0308`

## Attempts

### Attempt 1 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
  let encoded = string.run_length_encode(s) in
  let mapped = list.map(encoded, (x) => int.to_string(x.1) + x.0) in
  string.join(mapped, "")

fn rle_decode(s: String) -> String =
  if string.is_empty(s) then
    ""
  else
    let pairs = list.chunk(string.chars(s), 2) in
    let pairs_with_defaults = list.map(pairs, (x) => 
      if list.len(x) == 2 then
        (list.first(x) |> option.unwrap_or("1"), list.last(x) |> option.unwrap_or(""))
      else
        ("1", list.first(x) |> option.unwrap_or(""))) in
    let expanded = list.map(pairs_with_defaults, (x) => 
      let count = int.parse(x.0) |> result.unwrap_or_else((_) => 1) in
      string.repeat(x.1, count)) in
    string.join(expanded, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-run-length-encoding-0.almd:10:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |     let pairs = list.chunk(string.chars(s), 2) in
   |     ^^^

1 error(s) found
Compile error for /tmp/dojo-run-length-encoding-0.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
  string.run_length_encode(s) 
  |> (x) => list.map(x, (y) => int.to_string(y.1) + y.0) 
  |> string.join("", "")

fn rle_decode(s: String) -> String =
  if string.is_empty(s) then
    ""
  else
    string.chars(s) 
    |> list.chunk(2) 
    |> list.map((x) => 
      if list.len(x) == 2 then
        (list.first(x) |> option.unwrap_or("1"), list.last(x) |> option.unwrap_or(""))
      else
        ("1", list.first(x) |> option.unwrap_or(""))) 
    |> list.map((x) => 
      let count = int.parse(x.0) |> result.unwrap_or_else((_) => 1) in
      string.repeat(x.1, count)) 
    |> string.join("", "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-run-length-encoding-1.almd:18:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
18 |       let count = int.parse(x.0) |> result.unwrap_or_else((_) => 1) in
   |       ^^^
error[E004]: string.join() expects 2 argument(s) but got 3
  --> /tmp/dojo-run-length-encoding-1.almd:4:22
  in call to string.join()
  hint: Check the number of arguments
  try:
      // string.join() takes 2 arg(s) — you passed 3
      string.join(<list: List[String]>, <sep: String>)
  |
4 |   |> string.join("", "")
  |                      ^^

2 error(s) found
Compile error for /tmp/dojo-run-length-encoding-1.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
  string.run_length_encode(s) 
  |> (x) => list.map(x, (y) => int.to_string(y.1) + y.0) 
  |> (x) => string.join(x, "")

fn rle_decode(s: String) -> String =
  if string.is_empty(s) then
    ""
  else
    string.chars(s) 
    |> list.chunk(2) 
    |> list.map((x) => 
      if list.len(x) == 2 then
        (list.first(x) |> option.unwrap_or("1"), list.last(x) |> option.unwrap_or(""))
      else
        ("1", list.first(x) |> option.unwrap_or(""))) 
    |> list.map((x) => 
      {
        let count = int.parse(x.0) |> result.unwrap_or_else((_) => 1);
        string.repeat(x.1, count)
      }) 
    |> (x) => string.join(x, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-2.almd
Compile error for /tmp/dojo-run-length-encoding-2.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0308]: mismatched types
   --> <generated.rs>:523:121
    |
523 | ..._rt_int_parse(&*if almide_eq!(almide_rt_list_len(x.clone()), 2i64) { (almide_rt_option_unwrap_or(almide_rt_list_first(x.clone())...
    |                                  ------------------ ^^^^^^^^^ expected `&Vec<_>`, found `Vec<String>`
    |                                  |
    |                                  arguments to this function are incorrect
    |
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: function defined here
   --> <generated.rs>:69:8
    |
 69 | pub fn almide_rt_list_len<T>(xs: &Vec<T>) -> i64 { xs.len() as i64 }
    |        ^^^^^^^^^^^^^^^^^^    -----------
help: consider borrowing here
    |
523 |                 let count: i64 = almide_rt_result_unwrap_or_else(almide_rt_int_parse(&*if almide_eq!(almide_rt_list_len(&x.clone()), 2i64) { (almide_rt_option_unwrap_or(almide_rt_list_first(x.clone()), "1".to_string()), almide_rt_option_unwrap_or(almide_rt_list_last(x.clone()), "".to_string())) } else { ("1".to_string(), almide_rt_option_unwrap_or(almide_rt_list_first(x.clone()), "".to_string())) }.0), move |_| 1i64);
    |                                                                                                                         +


error[E0308]: mismatched types
   --> <generated.rs>:523:190
    |
523 | ... (almide_rt_option_unwrap_or(almide_rt_list_first(x.clone()), "1".to_string()), almide_rt_option_unwrap_or(almide_rt_list_last(x...
    |                                 -------------------- ^^^^^^^^^ expected `&Vec<_>`, found `Vec<String>`
    |                                 |
    |                                 arguments to this function are incorrect
    |
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: function defined here
   --> <generated.rs>:71:8
    |
 71 | pub fn almide_rt_list_first<A: Clone>(xs: &Vec<A>) -> Option<A> { xs.first().cloned() }
    |        ^^^^^^^^^^^^^^^^^^^^           -----------
help: consider borrowing here
    |
523 |                 let count: i64 = almide_rt_result_unwrap_or_else(almide_rt_int_parse(&*if almide_eq!(almide_rt_list_len(x.clone()), 2i64) { (almide_rt_option_unwrap_or(almide_rt_list_first(&x.clone()), "1".to_string()), almide_rt_option_unwrap_or(almide_rt_list_last(x.clone()), "".to_string())) } else { ("1".to_string(), almide_rt_option_unwrap_or(almide_rt_list_first(x.clone()), "".to_string())) }.0), move |_| 1i64);
    |                                                                                                                                                                                              +


error[E0308]: mismatched types
   --> <generated.rs>:523:267
    |
523 | ..., almide_rt_option_unwrap_or(almide_rt_list_last(x.clone()), "".to_string())) } else { ("1".to_string(), almide_rt_option_unwrap...
    |                                 ------------------- ^^^^^^^^^ expected `&Vec<_>`, found `Vec<String>`
    |                                 |
    |                                 arguments to this function are incorrect
    |
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: function defined here
   --> <generated.rs>:72:8
    |
 72 | pub fn almide_rt_list_last<A: Clone>(xs: &Vec<A>) -> Option<A> { xs.last().cloned() }
    |        ^^^^^^^^^^^^^^^^^^^           -----------
help: consider borrowing here
    |
523 |                 let count: i64 = almide_rt_result_unwrap_or_else(almide_rt_int_parse(&*if almide_eq!(almide_rt_list_len(x.clone()), 2i64) { (almide_rt_option_unwrap_or(almide_rt_list_first(x.clone()), "1".to_string()), almide_rt_option_unwrap_or(almide_rt_list_last(&x.clone()), "".to_string())) } else { ("1".to_string(), almide_rt_option_unwrap_or(almide_rt_list_first(x.clone()), "".to_string())) }.0), move |_| 1i64);
    |                                                                                                                                                                                                                                                                           +


error[E0308]: mismatched types
   --> <generated.rs>:523:371
    |
523 | ..., almide_rt_option_unwrap_or(almide_rt_list_first(x.clone()), "".to_string())) }.0), move |_| 1i64);
    |                                 -------------------- ^^^^^^^^^ expected `&Vec<_>`, found `Vec<String>`
    |                                 |
    |                                 arguments to this function are incorrect
    |
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: function defined here
   --> <generated.rs>:71:8
    |
 71 | pub fn almide_rt_list_first<A: Clone>(xs: &Vec<A>) -> Option<A> { xs.first().cloned() }
    |        ^^^^^^^^^^^^^^^^^^^^           -----------
help: consider borrowing here
    |
523 |                 let count: i64 = almide_rt_result_unwrap_or_else(almide_rt_int_parse(&*if almide_eq!(almide_rt_list_len(x.clone()), 2i64) { (almide_rt_option_unwrap_or(almide_rt_list_first(x.clone()), "1".to_string()), almide_rt_option_unwrap_or(almide_rt_list_last(x.clone()), "".to_string())) } else { ("1".to_string(), almide_rt_option_unwrap_or(almide_rt_list_first(&x.clone()), "".to_string())) }.0), move |_| 1i64);
    |                                                                                                                                                                                                                                                                                                                                                                                   +


error[E0308]: mismatched types
   --> <generated.rs>:524:76
    |
524 | ...   almide_rt_string_repeat(&*if almide_eq!(almide_rt_list_len(x.clone()), 2i64) { (almide_rt_option_unwrap_or(almide_rt_list_fir...
    |                                               ------------------ ^^^^^^^^^ expected `&Vec<_>`, found `Vec<String>`
    |                                               |
    |                                               arguments to this function are incorrect
    |
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: function defined here
   --> <generated.rs>:69:8
    |
 69 | pub fn almide_rt_list_len<T>(xs: &Vec<T>) -> i64 { xs.len() as i64 }
    |        ^^^^^^^^^^^^^^^^^^    -----------
help: consider borrowing here
    |
524 |                 almide_rt_string_repeat(&*if almide_eq!(almide_rt_list_len(&x.clone()), 2i64) { (almide_rt_option_unwrap_or(almide_rt_list_first(x.clone()), "1".to_string()), almide_rt_option_unwrap_or(almide_rt_list_last(x.clone()), "".to_string())) } else { ("1".to_string(), almide_rt_option_unwrap_or(almide_rt_list_first(x.clone()), "".to_string())) }.1, count)
    |                                                                            +


error[E0308]: mismatched types
   --> <generated.rs>:524:145
    |
524 | ... (almide_rt_option_unwrap_or(almide_rt_list_first(x.clone()), "1".to_string()), almide_rt_option_unwrap_or(almide_rt_list_last(x...
    |                                 -------------------- ^^^^^^^^^ expected `&Vec<_>`, found `Vec<String>`
    |                                 |
    |                                 arguments to this function are incorrect
    |
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: function defined here
   --> <generated.rs>:71:8
    |
 71 | pub fn almide_rt_list_first<A: Clone>(xs: &Vec<A>) -> Option<A> { xs.first().cloned() }
    |        ^^^^^^^^^^^^^^^^^^^^           -----------
help: consider borrowing here
    |
524 |                 almide_rt_string_repeat(&*if almide_eq!(almide_rt_list_len(x.clone()), 2i64) { (almide_rt_option_unwrap_or(almide_rt_list_first(&x.clone()), "1".to_string()), almide_rt_option_unwrap_or(almide_rt_list_last(x.clone()), "".to_string())) } else { ("1".to_string(), almide_rt_option_unwrap_or(almide_rt_list_first(x.clone()), "".to_string())) }.1, count)
    |                                                                                                                                                 +


error[E0308]: mismatched types
   --> <generated.rs>:524:222
    |
524 | ..., almide_rt_option_unwrap_or(almide_rt_list_last(x.clone()), "".to_string())) } else { ("1".to_string(), almide_rt_option_unwrap...
    |                                 ------------------- ^^^^^^^^^ expected `&Vec<_>`, found `Vec<String>`
    |                                 |
    |                                 arguments to this function are incorrect
    |
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: function defined here
   --> <generated.rs>:72:8
    |
 72 | pub fn almide_rt_list_last<A: Clone>(xs: &Vec<A>) -> Option<A> { xs.last().cloned() }
    |        ^^^^^^^^^^^^^^^^^^^           -----------
help: consider borrowing here
    |
524 |                 almide_rt_string_repeat(&*if almide_eq!(almide_rt_list_len(x.clone()), 2i64) { (almide_rt_option_unwrap_or(almide_rt_list_first(x.clone()), "1".to_string()), almide_rt_option_unwrap_or(almide_rt_list_last(&x.clone()), "".to_string())) } else { ("1".to_string(), almide_rt_option_unwrap_or(almide_rt_list_first(x.clone()), "".to_string())) }.1, count)
    |                                                                                                                                                                                                                              +


error[E0308]: mismatched types
   --> <generated.rs>:524:326
    |
524 | ..., almide_rt_option_unwrap_or(almide_rt_list_first(x.clone()), "".to_string())) }.1, count)
    |                                 -------------------- ^^^^^^^^^ expected `&Vec<_>`, found `Vec<String>`
    |                                 |
    |                                 arguments to this function are incorrect
    |
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: function defined here
   --> <generated.rs>:71:8
    |
 71 | pub fn almide_rt_list_first<A: Clone>(xs: &Vec<A>) -> Option<A> { xs.first().cloned() }
    |        ^^^^^^^^^^^^^^^^^^^^           -----------
help: consider borrowing here
    |
524 |                 almide_rt_string_repeat(&*if almide_eq!(almide_rt_list_len(x.clone()), 2i64) { (almide_rt_option_unwrap_or(almide_rt_list_first(x.clone()), "1".to_string()), almide_rt_option_unwrap_or(almide_rt_list_last(x.clone()), "".to_string())) } else { ("1".to_string(), almide_rt_option_unwrap_or(almide_rt_list_first(&x.clone()), "".to_string())) }.1, count)
    |                                                                                                                                                                                                                                                                                                                                      +


error: could not compile `almide-generated` (bin "almide-generated" test) due to 8 previous errors; 1 warning emitted

FAILED: /tmp/dojo-run-length-encoding-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
  string.run_length_encode(s) 
  |> (x) => list.map(x, (y) => int.to_string(y.1) + y.0) 
  |> (x) => string.join(x, "")

fn rle_decode(s: String) -> String =
  if string.is_empty(s) then
    ""
  else
    string.chars(s) 
    |> list.chunk(2) 
    |> list.map((x) => 
      if list.len(x) == 2 then
        (list.get(x, 0) |> option.unwrap_or("1"), list.get(x, 1) |> option.unwrap_or(""))
      else
        ("1", list.get(x, 0) |> option.unwrap_or(""))) 
    |> list.map((x) => 
      {
        let count = int.parse(x.0) |> result.unwrap_or_else((_) => 1);
        string.repeat(x.1, count)
      }) 
    |> (x) => string.join(x, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-3.almd
Compile error for /tmp/dojo-run-length-encoding-3.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0308]: mismatched types
   --> <generated.rs>:523:121
    |
523 | ..._rt_int_parse(&*if almide_eq!(almide_rt_list_len(x.clone()), 2i64) { (almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 0...
    |                                  ------------------ ^^^^^^^^^ expected `&Vec<_>`, found `Vec<String>`
    |                                  |
    |                                  arguments to this function are incorrect
    |
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: function defined here
   --> <generated.rs>:69:8
    |
 69 | pub fn almide_rt_list_len<T>(xs: &Vec<T>) -> i64 { xs.len() as i64 }
    |        ^^^^^^^^^^^^^^^^^^    -----------
help: consider borrowing here
    |
523 |                 let count: i64 = almide_rt_result_unwrap_or_else(almide_rt_int_parse(&*if almide_eq!(almide_rt_list_len(&x.clone()), 2i64) { (almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 0i64), "1".to_string()), almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 1i64), "".to_string())) } else { ("1".to_string(), almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 0i64), "".to_string())) }.0), move |_| 1i64);
    |                                                                                                                         +


error[E0308]: mismatched types
   --> <generated.rs>:523:188
    |
523 | ...{ (almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 0i64), "1".to_string()), almide_rt_option_unwrap_or(almide_rt_list_g...
    |                                  ------------------ ^^^^^^^^^ expected `&Vec<_>`, found `Vec<String>`
    |                                  |
    |                                  arguments to this function are incorrect
    |
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: function defined here
   --> <generated.rs>:73:8
    |
 73 | pub fn almide_rt_list_get<T: Clone>(xs: &Vec<T>, i: i64) -> Option<T> { xs.get(i as usize).cloned() }
    |        ^^^^^^^^^^^^^^^^^^           -----------
help: consider borrowing here
    |
523 |                 let count: i64 = almide_rt_result_unwrap_or_else(almide_rt_int_parse(&*if almide_eq!(almide_rt_list_len(x.clone()), 2i64) { (almide_rt_option_unwrap_or(almide_rt_list_get(&x.clone(), 0i64), "1".to_string()), almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 1i64), "".to_string())) } else { ("1".to_string(), almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 0i64), "".to_string())) }.0), move |_| 1i64);
    |                                                                                                                                                                                            +


error[E0308]: mismatched types
   --> <generated.rs>:523:270
    |
523 | ...), almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 1i64), "".to_string())) } else { ("1".to_string(), almide_rt_option_...
    |                                  ------------------ ^^^^^^^^^ expected `&Vec<_>`, found `Vec<String>`
    |                                  |
    |                                  arguments to this function are incorrect
    |
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: function defined here
   --> <generated.rs>:73:8
    |
 73 | pub fn almide_rt_list_get<T: Clone>(xs: &Vec<T>, i: i64) -> Option<T> { xs.get(i as usize).cloned() }
    |        ^^^^^^^^^^^^^^^^^^           -----------
help: consider borrowing here
    |
523 |                 let count: i64 = almide_rt_result_unwrap_or_else(almide_rt_int_parse(&*if almide_eq!(almide_rt_list_len(x.clone()), 2i64) { (almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 0i64), "1".to_string()), almide_rt_option_unwrap_or(almide_rt_list_get(&x.clone(), 1i64), "".to_string())) } else { ("1".to_string(), almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 0i64), "".to_string())) }.0), move |_| 1i64);
    |                                                                                                                                                                                                                                                                              +


error[E0308]: mismatched types
   --> <generated.rs>:523:378
    |
523 | ...), almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 0i64), "".to_string())) }.0), move |_| 1i64);
    |                                  ------------------ ^^^^^^^^^ expected `&Vec<_>`, found `Vec<String>`
    |                                  |
    |                                  arguments to this function are incorrect
    |
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: function defined here
   --> <generated.rs>:73:8
    |
 73 | pub fn almide_rt_list_get<T: Clone>(xs: &Vec<T>, i: i64) -> Option<T> { xs.get(i as usize).cloned() }
    |        ^^^^^^^^^^^^^^^^^^           -----------
help: consider borrowing here
    |
523 |                 let count: i64 = almide_rt_result_unwrap_or_else(almide_rt_int_parse(&*if almide_eq!(almide_rt_list_len(x.clone()), 2i64) { (almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 0i64), "1".to_string()), almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 1i64), "".to_string())) } else { ("1".to_string(), almide_rt_option_unwrap_or(almide_rt_list_get(&x.clone(), 0i64), "".to_string())) }.0), move |_| 1i64);
    |                                                                                                                                                                                                                                                                                                                                                                                          +


error[E0308]: mismatched types
   --> <generated.rs>:524:76
    |
524 | ...   almide_rt_string_repeat(&*if almide_eq!(almide_rt_list_len(x.clone()), 2i64) { (almide_rt_option_unwrap_or(almide_rt_list_get...
    |                                               ------------------ ^^^^^^^^^ expected `&Vec<_>`, found `Vec<String>`
    |                                               |
    |                                               arguments to this function are incorrect
    |
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: function defined here
   --> <generated.rs>:69:8
    |
 69 | pub fn almide_rt_list_len<T>(xs: &Vec<T>) -> i64 { xs.len() as i64 }
    |        ^^^^^^^^^^^^^^^^^^    -----------
help: consider borrowing here
    |
524 |                 almide_rt_string_repeat(&*if almide_eq!(almide_rt_list_len(&x.clone()), 2i64) { (almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 0i64), "1".to_string()), almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 1i64), "".to_string())) } else { ("1".to_string(), almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 0i64), "".to_string())) }.1, count)
    |                                                                            +


error[E0308]: mismatched types
   --> <generated.rs>:524:143
    |
524 | ...{ (almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 0i64), "1".to_string()), almide_rt_option_unwrap_or(almide_rt_list_g...
    |                                  ------------------ ^^^^^^^^^ expected `&Vec<_>`, found `Vec<String>`
    |                                  |
    |                                  arguments to this function are incorrect
    |
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: function defined here
   --> <generated.rs>:73:8
    |
 73 | pub fn almide_rt_list_get<T: Clone>(xs: &Vec<T>, i: i64) -> Option<T> { xs.get(i as usize).cloned() }
    |        ^^^^^^^^^^^^^^^^^^           -----------
help: consider borrowing here
    |
524 |                 almide_rt_string_repeat(&*if almide_eq!(almide_rt_list_len(x.clone()), 2i64) { (almide_rt_option_unwrap_or(almide_rt_list_get(&x.clone(), 0i64), "1".to_string()), almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 1i64), "".to_string())) } else { ("1".to_string(), almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 0i64), "".to_string())) }.1, count)
    |                                                                                                                                               +


error[E0308]: mismatched types
   --> <generated.rs>:524:225
    |
524 | ...), almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 1i64), "".to_string())) } else { ("1".to_string(), almide_rt_option_...
    |                                  ------------------ ^^^^^^^^^ expected `&Vec<_>`, found `Vec<String>`
    |                                  |
    |                                  arguments to this function are incorrect
    |
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: function defined here
   --> <generated.rs>:73:8
    |
 73 | pub fn almide_rt_list_get<T: Clone>(xs: &Vec<T>, i: i64) -> Option<T> { xs.get(i as usize).cloned() }
    |        ^^^^^^^^^^^^^^^^^^           -----------
help: consider borrowing here
    |
524 |                 almide_rt_string_repeat(&*if almide_eq!(almide_rt_list_len(x.clone()), 2i64) { (almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 0i64), "1".to_string()), almide_rt_option_unwrap_or(almide_rt_list_get(&x.clone(), 1i64), "".to_string())) } else { ("1".to_string(), almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 0i64), "".to_string())) }.1, count)
    |                                                                                                                                                                                                                                 +


error[E0308]: mismatched types
   --> <generated.rs>:524:333
    |
524 | ...), almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 0i64), "".to_string())) }.1, count)
    |                                  ------------------ ^^^^^^^^^ expected `&Vec<_>`, found `Vec<String>`
    |                                  |
    |                                  arguments to this function are incorrect
    |
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: function defined here
   --> <generated.rs>:73:8
    |
 73 | pub fn almide_rt_list_get<T: Clone>(xs: &Vec<T>, i: i64) -> Option<T> { xs.get(i as usize).cloned() }
    |        ^^^^^^^^^^^^^^^^^^           -----------
help: consider borrowing here
    |
524 |                 almide_rt_string_repeat(&*if almide_eq!(almide_rt_list_len(x.clone()), 2i64) { (almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 0i64), "1".to_string()), almide_rt_option_unwrap_or(almide_rt_list_get(x.clone(), 1i64), "".to_string())) } else { ("1".to_string(), almide_rt_option_unwrap_or(almide_rt_list_get(&x.clone(), 0i64), "".to_string())) }.1, count)
    |                                                                                                                                                                                                                                                                                                                                             +


error: could not compile `almide-generated` (bin "almide-generated" test) due to 8 previous errors; 1 warning emitted

FAILED: /tmp/dojo-run-length-encoding-3.almd

1/1 test file(s) failed

```
