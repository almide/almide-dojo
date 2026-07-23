# balanced-parens

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E0308`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
    let stack = list.new[String]()
    let bracket_map = map.from_list([
        (")", "("),
        ("]", "["),
        ("}", "{")
    ])
    in
    list.fold(string.chars(s), true, (acc, ch) => 
        if list.contains(["(", "[", "{"], ch) then
            list.push(stack, ch) |> ignore;
            acc
        else if map.contains(bracket_map, ch) then
            if list.is_empty(stack) || list.last(stack) != map.get(bracket_map, ch) then
                false
            else
                stack |> list.drop_end(1) |> ignore;
                acc
        else
            acc
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Semicolons are not used in Almide at line 11:43
  --> /tmp/dojo-balanced-parens-0.almd:11:43
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
11 |             list.push(stack, ch) |> ignore;
   |                                           ^
error: Expected expression at line 13:9 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:13:9
   |
13 |         else if map.contains(bracket_map, ch) then
   |         ^
error: '||' is not valid in Almide at line 14:37
  --> /tmp/dojo-balanced-parens-0.almd:14:37
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
14 |             if list.is_empty(stack) || list.last(stack) != map.get(bracket_map, ch) then
   |                                     ^
error: Expected expression at line 19:9 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:19:9
   |
19 |         else
   |         ^
error: Expected expression at line 21:5 (got RParen ')')
  --> /tmp/dojo-balanced-parens-0.almd:21:5
   |
21 |     )
   |     ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:2:25
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |     let stack = list.new[String]()
  |                         ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-0.almd:12:13
  in variable acc
  hint: Check the variable name
   |
12 |             acc
   |             ^^^
error[E002]: undefined function 'ignore'
  --> /tmp/dojo-balanced-parens-0.almd:17:40
  in call to ignore()
  hint: Check the function name
   |
17 |                 stack |> list.drop_end(1) |> ignore;
   |                                        ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-0.almd:18:17
  in variable acc
  hint: Check the variable name
   |
18 |                 acc
   |                 ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-0.almd:20:13
  in variable acc
  hint: Check the variable name
   |
20 |             acc
   |             ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-0.almd:20:13
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
20 |             acc
   |             ^^^

11 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
    let stack = []
    let bracket_map = map.from_list([
        (")", "("),
        ("]", "["),
        ("}", "{")
    ])
    in
    list.fold(string.chars(s), (stack, true), (acc, ch) => 
        if list.contains(["(", "[", "{"], ch) then
            (acc.0 + [ch], acc.1)
        else if map.contains(bracket_map, ch) then
            if list.is_empty(acc.0) or list.last(acc.0) != map.get(bracket_map, ch) then
                ([], false)
            else
                (list.drop_end(acc.0, 1), acc.1)
        else
            acc
    ).1
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
Compile error for /tmp/dojo-balanced-parens-1.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0308]: mismatched types
   --> <generated.rs>:417:48
    |
417 |     almide_rt_list_fold(almide_rt_string_chars(s), (stack, true), {
    |                         ---------------------- ^ expected `&str`, found `String`
    |                         |
    |                         arguments to this function are incorrect
    |
note: function defined here
   --> <generated.rs>:309:8
    |
309 | pub fn almide_rt_string_chars(s: &str) -> Vec<String> { s.chars().map(|c| c.to_string()).collect() }
    |        ^^^^^^^^^^^^^^^^^^^^^^ -------
help: consider borrowing here
    |
417 |     almide_rt_list_fold(almide_rt_string_chars(&s), (stack, true), {
    |                                                +


error[E0308]: arguments to this function are incorrect
   --> <generated.rs>:419:27
    |
419 | ...   move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConca...
    |                         ^^^^^^^^^^^^^^^^^^^^^^^
    |
note: expected `&Vec<_>`, found `Vec<String>`
   --> <generated.rs>:419:51
    |
419 | ...   move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConca...
    |                                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: expected `&_`, found `String`
   --> <generated.rs>:419:108
    |
419 | ...   move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConca...
    |                                                                                                          ^^^^^^^^^^
    = note: expected reference `&_`
                  found struct `String`
note: function defined here
   --> <generated.rs>:23:8
    |
 23 | pub fn almide_rt_list_contains<T: PartialEq>(xs: &Vec<T>, x: &T) -> bool { xs.contains(x) }
    |        ^^^^^^^^^^^^^^^^^^^^^^^               -----------  -----
help: consider borrowing here
    |
419 |         move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], &ch.clone()) { (AlmideConcat::concat(acc.clone().0, vec![ch.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { acc.clone() } }
    |                                                                                                            +


error[E0308]: arguments to this function are incorrect
   --> <generated.rs>:419:205
    |
419 | ...e().0, vec![ch.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), ch.clone()) { if (almide_rt_list_is...
    |                                                         ^^^^^^^^^^^^^^^^^^^^^^
    |
note: expected `&HashMap<_, _>`, found `HashMap<String, String>`
   --> <generated.rs>:419:228
    |
419 | ...()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0...
    |                                                            ^^^^^^^^^^^^^^^
    = note: expected reference `&HashMap<_, _>`
                  found struct `HashMap<String, String>`
note: expected `&_`, found `String`
   --> <generated.rs>:419:245
    |
419 | ...e().1) } else { if almide_rt_map_contains(__cap_2.clone(), ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne...
    |                                                               ^^^^^^^^^^
    = note: expected reference `&_`
                  found struct `String`
note: function defined here
   --> <generated.rs>:243:8
    |
243 | pub fn almide_rt_map_contains<K: Eq + std::hash::Hash, V>(m: &HashMap<K, V>, k: &K) -> bool { m.contains_key(k) }
    |        ^^^^^^^^^^^^^^^^^^^^^^                             -----------------  -----
help: consider borrowing here
    |
419 |         move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConcat::concat(acc.clone().0, vec![ch.clone()]), acc.clone().1) } else { if almide_rt_map_contains(&__cap_2.clone(), ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { acc.clone() } }
    |                                                                                                                                                                                                                                    +
help: consider borrowing here
    |
419 |         move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConcat::concat(acc.clone().0, vec![ch.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), &ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { acc.clone() } }
    |                                                                                                                                                                                                                                                     +


error[E0308]: mismatched types
   --> <generated.rs>:419:287
    |
419 | ...one(), ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_...
    |                             ----------------------- ^^^^^^^^^^^^^ expected `&Vec<_>`, found `Vec<String>`
    |                             |
    |                             arguments to this function are incorrect
    |
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: function defined here
   --> <generated.rs>:18:8
    |
 18 | pub fn almide_rt_list_is_empty<T>(xs: &Vec<T>) -> bool { xs.is_empty() }
    |        ^^^^^^^^^^^^^^^^^^^^^^^    -----------
help: consider borrowing here
    |
419 |         move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConcat::concat(acc.clone().0, vec![ch.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), ch.clone()) { if (almide_rt_list_is_empty(&acc.clone().0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { acc.clone() } }
    |                                                                                                                                                                                                                                                                                               +


error[E0308]: mismatched types
   --> <generated.rs>:419:336
    |
419 | ...c.clone().0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new...
    |                               ------------------- ^^^^^^^^^^^^^ expected `&Vec<_>`, found `Vec<String>`
    |                               |
    |                               arguments to this function are incorrect
    |
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: function defined here
   --> <generated.rs>:20:8
    |
 20 | pub fn almide_rt_list_last<A: Clone>(xs: &Vec<A>) -> Option<A> { xs.last().cloned() }
    |        ^^^^^^^^^^^^^^^^^^^           -----------
help: consider borrowing here
    |
419 |         move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConcat::concat(acc.clone().0, vec![ch.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_list_last(&acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { acc.clone() } }
    |                                                                                                                                                                                                                                                                                                                                                +


error[E0308]: arguments to this function are incorrect
   --> <generated.rs>:419:352
    |
419 | ...).0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), fals...
    |                                                           ^^^^^^^^^^^^^^^^^
    |
note: expected `&HashMap<_, _>`, found `HashMap<String, String>`
   --> <generated.rs>:419:370
    |
419 | ...!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), false) } else { (almi...
    |                                                            ^^^^^^^^^^^^^^^
    = note: expected reference `&HashMap<_, _>`
                  found struct `HashMap<String, String>`
note: expected `&_`, found `String`
   --> <generated.rs>:419:387
    |
419 | ...st_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), false) } else { (almide_rt_list_dro...
    |                                                               ^^^^^^^^^^
    = note: expected reference `&_`
                  found struct `String`
note: function defined here
   --> <generated.rs>:239:8
    |
239 | pub fn almide_rt_map_get<K: Eq + std::hash::Hash, V: Clone>(m: &HashMap<K, V>, k: &K) -> Option<V> { m.get(k).cloned() }
    |        ^^^^^^^^^^^^^^^^^                                    -----------------  -----
help: consider borrowing here
    |
419 |         move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConcat::concat(acc.clone().0, vec![ch.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(&__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { acc.clone() } }
    |                                                                                                                                                                                                                                                                                                                                                                                  +
help: consider borrowing here
    |
419 |         move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConcat::concat(acc.clone().0, vec![ch.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), &ch.clone()))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { acc.clone() } }
    |                                                                                                                                                                                                                                                                                                                                                                                                   +


error: could not compile `almide-generated` (bin "almide-generated" test) due to 6 previous errors; 1 warning emitted

FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
    let stack = []
    let bracket_map = map.from_list([
        (")", "("),
        ("]", "["),
        ("}", "{")
    ])
    in
    list.fold(string.chars(s), (stack, true), (acc, ch) => 
        if list.contains(["(", "[", "{"], ch) then
            (acc.0 + [ch], acc.1)
        else if map.contains(bracket_map, ch) then
            if list.is_empty(acc.0) or list.last(acc.0) != map.get(bracket_map, ch) then
                ([], false)
            else
                (list.drop_end(acc.0, 1), acc.1)
        else
            acc
    ).1
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
Compile error for /tmp/dojo-balanced-parens-2.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0308]: mismatched types
   --> <generated.rs>:417:48
    |
417 |     almide_rt_list_fold(almide_rt_string_chars(s), (stack, true), {
    |                         ---------------------- ^ expected `&str`, found `String`
    |                         |
    |                         arguments to this function are incorrect
    |
note: function defined here
   --> <generated.rs>:309:8
    |
309 | pub fn almide_rt_string_chars(s: &str) -> Vec<String> { s.chars().map(|c| c.to_string()).collect() }
    |        ^^^^^^^^^^^^^^^^^^^^^^ -------
help: consider borrowing here
    |
417 |     almide_rt_list_fold(almide_rt_string_chars(&s), (stack, true), {
    |                                                +


error[E0308]: arguments to this function are incorrect
   --> <generated.rs>:419:27
    |
419 | ...   move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConca...
    |                         ^^^^^^^^^^^^^^^^^^^^^^^
    |
note: expected `&Vec<_>`, found `Vec<String>`
   --> <generated.rs>:419:51
    |
419 | ...   move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConca...
    |                                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: expected `&_`, found `String`
   --> <generated.rs>:419:108
    |
419 | ...   move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConca...
    |                                                                                                          ^^^^^^^^^^
    = note: expected reference `&_`
                  found struct `String`
note: function defined here
   --> <generated.rs>:23:8
    |
 23 | pub fn almide_rt_list_contains<T: PartialEq>(xs: &Vec<T>, x: &T) -> bool { xs.contains(x) }
    |        ^^^^^^^^^^^^^^^^^^^^^^^               -----------  -----
help: consider borrowing here
    |
419 |         move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], &ch.clone()) { (AlmideConcat::concat(acc.clone().0, vec![ch.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { acc.clone() } }
    |                                                                                                            +


error[E0308]: arguments to this function are incorrect
   --> <generated.rs>:419:205
    |
419 | ...e().0, vec![ch.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), ch.clone()) { if (almide_rt_list_is...
    |                                                         ^^^^^^^^^^^^^^^^^^^^^^
    |
note: expected `&HashMap<_, _>`, found `HashMap<String, String>`
   --> <generated.rs>:419:228
    |
419 | ...()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0...
    |                                                            ^^^^^^^^^^^^^^^
    = note: expected reference `&HashMap<_, _>`
                  found struct `HashMap<String, String>`
note: expected `&_`, found `String`
   --> <generated.rs>:419:245
    |
419 | ...e().1) } else { if almide_rt_map_contains(__cap_2.clone(), ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne...
    |                                                               ^^^^^^^^^^
    = note: expected reference `&_`
                  found struct `String`
note: function defined here
   --> <generated.rs>:243:8
    |
243 | pub fn almide_rt_map_contains<K: Eq + std::hash::Hash, V>(m: &HashMap<K, V>, k: &K) -> bool { m.contains_key(k) }
    |        ^^^^^^^^^^^^^^^^^^^^^^                             -----------------  -----
help: consider borrowing here
    |
419 |         move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConcat::concat(acc.clone().0, vec![ch.clone()]), acc.clone().1) } else { if almide_rt_map_contains(&__cap_2.clone(), ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { acc.clone() } }
    |                                                                                                                                                                                                                                    +
help: consider borrowing here
    |
419 |         move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConcat::concat(acc.clone().0, vec![ch.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), &ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { acc.clone() } }
    |                                                                                                                                                                                                                                                     +


error[E0308]: mismatched types
   --> <generated.rs>:419:287
    |
419 | ...one(), ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_...
    |                             ----------------------- ^^^^^^^^^^^^^ expected `&Vec<_>`, found `Vec<String>`
    |                             |
    |                             arguments to this function are incorrect
    |
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: function defined here
   --> <generated.rs>:18:8
    |
 18 | pub fn almide_rt_list_is_empty<T>(xs: &Vec<T>) -> bool { xs.is_empty() }
    |        ^^^^^^^^^^^^^^^^^^^^^^^    -----------
help: consider borrowing here
    |
419 |         move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConcat::concat(acc.clone().0, vec![ch.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), ch.clone()) { if (almide_rt_list_is_empty(&acc.clone().0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { acc.clone() } }
    |                                                                                                                                                                                                                                                                                               +


error[E0308]: mismatched types
   --> <generated.rs>:419:336
    |
419 | ...c.clone().0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new...
    |                               ------------------- ^^^^^^^^^^^^^ expected `&Vec<_>`, found `Vec<String>`
    |                               |
    |                               arguments to this function are incorrect
    |
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: function defined here
   --> <generated.rs>:20:8
    |
 20 | pub fn almide_rt_list_last<A: Clone>(xs: &Vec<A>) -> Option<A> { xs.last().cloned() }
    |        ^^^^^^^^^^^^^^^^^^^           -----------
help: consider borrowing here
    |
419 |         move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConcat::concat(acc.clone().0, vec![ch.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_list_last(&acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { acc.clone() } }
    |                                                                                                                                                                                                                                                                                                                                                +


error[E0308]: arguments to this function are incorrect
   --> <generated.rs>:419:352
    |
419 | ...).0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), fals...
    |                                                           ^^^^^^^^^^^^^^^^^
    |
note: expected `&HashMap<_, _>`, found `HashMap<String, String>`
   --> <generated.rs>:419:370
    |
419 | ...!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), false) } else { (almi...
    |                                                            ^^^^^^^^^^^^^^^
    = note: expected reference `&HashMap<_, _>`
                  found struct `HashMap<String, String>`
note: expected `&_`, found `String`
   --> <generated.rs>:419:387
    |
419 | ...st_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), false) } else { (almide_rt_list_dro...
    |                                                               ^^^^^^^^^^
    = note: expected reference `&_`
                  found struct `String`
note: function defined here
   --> <generated.rs>:239:8
    |
239 | pub fn almide_rt_map_get<K: Eq + std::hash::Hash, V: Clone>(m: &HashMap<K, V>, k: &K) -> Option<V> { m.get(k).cloned() }
    |        ^^^^^^^^^^^^^^^^^                                    -----------------  -----
help: consider borrowing here
    |
419 |         move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConcat::concat(acc.clone().0, vec![ch.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(&__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { acc.clone() } }
    |                                                                                                                                                                                                                                                                                                                                                                                  +
help: consider borrowing here
    |
419 |         move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConcat::concat(acc.clone().0, vec![ch.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), &ch.clone()))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { acc.clone() } }
    |                                                                                                                                                                                                                                                                                                                                                                                                   +


error: could not compile `almide-generated` (bin "almide-generated" test) due to 6 previous errors; 1 warning emitted

FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
    let stack = []
    let bracket_map = map.from_list([
        (")", "("),
        ("]", "["),
        ("}", "{")
    ])
    in
    list.fold(string.chars(s), (stack, true), (acc, ch) => 
        if list.contains(["(", "[", "{"], ch) then
            (acc.0 + [ch], acc.1)
        else if map.contains(bracket_map, ch) then
            if list.is_empty(acc.0) or list.last(acc.0) != map.get(bracket_map, ch) then
                ([], false)
            else
                (list.drop_end(acc.0, 1), acc.1)
        else
            acc
    ).1
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
Compile error for /tmp/dojo-balanced-parens-3.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0308]: mismatched types
   --> <generated.rs>:417:48
    |
417 |     almide_rt_list_fold(almide_rt_string_chars(s), (stack, true), {
    |                         ---------------------- ^ expected `&str`, found `String`
    |                         |
    |                         arguments to this function are incorrect
    |
note: function defined here
   --> <generated.rs>:309:8
    |
309 | pub fn almide_rt_string_chars(s: &str) -> Vec<String> { s.chars().map(|c| c.to_string()).collect() }
    |        ^^^^^^^^^^^^^^^^^^^^^^ -------
help: consider borrowing here
    |
417 |     almide_rt_list_fold(almide_rt_string_chars(&s), (stack, true), {
    |                                                +


error[E0308]: arguments to this function are incorrect
   --> <generated.rs>:419:27
    |
419 | ...   move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConca...
    |                         ^^^^^^^^^^^^^^^^^^^^^^^
    |
note: expected `&Vec<_>`, found `Vec<String>`
   --> <generated.rs>:419:51
    |
419 | ...   move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConca...
    |                                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: expected `&_`, found `String`
   --> <generated.rs>:419:108
    |
419 | ...   move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConca...
    |                                                                                                          ^^^^^^^^^^
    = note: expected reference `&_`
                  found struct `String`
note: function defined here
   --> <generated.rs>:23:8
    |
 23 | pub fn almide_rt_list_contains<T: PartialEq>(xs: &Vec<T>, x: &T) -> bool { xs.contains(x) }
    |        ^^^^^^^^^^^^^^^^^^^^^^^               -----------  -----
help: consider borrowing here
    |
419 |         move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], &ch.clone()) { (AlmideConcat::concat(acc.clone().0, vec![ch.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { acc.clone() } }
    |                                                                                                            +


error[E0308]: arguments to this function are incorrect
   --> <generated.rs>:419:205
    |
419 | ...e().0, vec![ch.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), ch.clone()) { if (almide_rt_list_is...
    |                                                         ^^^^^^^^^^^^^^^^^^^^^^
    |
note: expected `&HashMap<_, _>`, found `HashMap<String, String>`
   --> <generated.rs>:419:228
    |
419 | ...()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0...
    |                                                            ^^^^^^^^^^^^^^^
    = note: expected reference `&HashMap<_, _>`
                  found struct `HashMap<String, String>`
note: expected `&_`, found `String`
   --> <generated.rs>:419:245
    |
419 | ...e().1) } else { if almide_rt_map_contains(__cap_2.clone(), ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne...
    |                                                               ^^^^^^^^^^
    = note: expected reference `&_`
                  found struct `String`
note: function defined here
   --> <generated.rs>:243:8
    |
243 | pub fn almide_rt_map_contains<K: Eq + std::hash::Hash, V>(m: &HashMap<K, V>, k: &K) -> bool { m.contains_key(k) }
    |        ^^^^^^^^^^^^^^^^^^^^^^                             -----------------  -----
help: consider borrowing here
    |
419 |         move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConcat::concat(acc.clone().0, vec![ch.clone()]), acc.clone().1) } else { if almide_rt_map_contains(&__cap_2.clone(), ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { acc.clone() } }
    |                                                                                                                                                                                                                                    +
help: consider borrowing here
    |
419 |         move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConcat::concat(acc.clone().0, vec![ch.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), &ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { acc.clone() } }
    |                                                                                                                                                                                                                                                     +


error[E0308]: mismatched types
   --> <generated.rs>:419:287
    |
419 | ...one(), ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_...
    |                             ----------------------- ^^^^^^^^^^^^^ expected `&Vec<_>`, found `Vec<String>`
    |                             |
    |                             arguments to this function are incorrect
    |
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: function defined here
   --> <generated.rs>:18:8
    |
 18 | pub fn almide_rt_list_is_empty<T>(xs: &Vec<T>) -> bool { xs.is_empty() }
    |        ^^^^^^^^^^^^^^^^^^^^^^^    -----------
help: consider borrowing here
    |
419 |         move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConcat::concat(acc.clone().0, vec![ch.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), ch.clone()) { if (almide_rt_list_is_empty(&acc.clone().0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { acc.clone() } }
    |                                                                                                                                                                                                                                                                                               +


error[E0308]: mismatched types
   --> <generated.rs>:419:336
    |
419 | ...c.clone().0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new...
    |                               ------------------- ^^^^^^^^^^^^^ expected `&Vec<_>`, found `Vec<String>`
    |                               |
    |                               arguments to this function are incorrect
    |
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: function defined here
   --> <generated.rs>:20:8
    |
 20 | pub fn almide_rt_list_last<A: Clone>(xs: &Vec<A>) -> Option<A> { xs.last().cloned() }
    |        ^^^^^^^^^^^^^^^^^^^           -----------
help: consider borrowing here
    |
419 |         move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConcat::concat(acc.clone().0, vec![ch.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_list_last(&acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { acc.clone() } }
    |                                                                                                                                                                                                                                                                                                                                                +


error[E0308]: arguments to this function are incorrect
   --> <generated.rs>:419:352
    |
419 | ...).0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), fals...
    |                                                           ^^^^^^^^^^^^^^^^^
    |
note: expected `&HashMap<_, _>`, found `HashMap<String, String>`
   --> <generated.rs>:419:370
    |
419 | ...!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), false) } else { (almi...
    |                                                            ^^^^^^^^^^^^^^^
    = note: expected reference `&HashMap<_, _>`
                  found struct `HashMap<String, String>`
note: expected `&_`, found `String`
   --> <generated.rs>:419:387
    |
419 | ...st_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), false) } else { (almide_rt_list_dro...
    |                                                               ^^^^^^^^^^
    = note: expected reference `&_`
                  found struct `String`
note: function defined here
   --> <generated.rs>:239:8
    |
239 | pub fn almide_rt_map_get<K: Eq + std::hash::Hash, V: Clone>(m: &HashMap<K, V>, k: &K) -> Option<V> { m.get(k).cloned() }
    |        ^^^^^^^^^^^^^^^^^                                    -----------------  -----
help: consider borrowing here
    |
419 |         move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConcat::concat(acc.clone().0, vec![ch.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(&__cap_2.clone(), ch.clone()))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { acc.clone() } }
    |                                                                                                                                                                                                                                                                                                                                                                                  +
help: consider borrowing here
    |
419 |         move |acc, ch| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], ch.clone()) { (AlmideConcat::concat(acc.clone().0, vec![ch.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), ch.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_list_last(acc.clone().0), almide_rt_map_get(__cap_2.clone(), &ch.clone()))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { acc.clone() } }
    |                                                                                                                                                                                                                                                                                                                                                                                                   +


error: could not compile `almide-generated` (bin "almide-generated" test) due to 6 previous errors; 1 warning emitted

FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
