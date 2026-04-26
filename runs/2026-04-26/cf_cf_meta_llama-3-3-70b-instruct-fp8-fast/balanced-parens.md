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
  let
    stack = list.new[String]()
    bracket_map = map.from_list([
      (")", "("),
      ("]", "["),
      ("}", "{")
    ])
  in
    list.fold(
      string.chars(s),
      true,
      (acc, c) =>
        if list.contains(["(", "[", "{"], c) then
          list.push(stack, c) |> ignore
          acc
        else if map.contains(bracket_map, c) then
          if list.is_empty(stack) || map.get(bracket_map, c) != list.last(stack) then
            false
          else
            list.drop_end(stack, 1) |> ignore
            acc
        else
          acc
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-balanced-parens-0.almd:2:6
  |
2 |   let
  |      ^
error: Expected expression at line 9:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:9:3
  |
9 |   in
  |   ^
error: Missing ',' between function arguments at line 16:11
  --> /tmp/dojo-balanced-parens-0.almd:16:11
  hint: Add a comma after the previous element. Example: f(a, b, c)
   |
16 |           acc
   |           ^
error: '||' is not valid in Almide at line 18:35
  --> /tmp/dojo-balanced-parens-0.almd:18:35
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
18 |           if list.is_empty(stack) || map.get(bracket_map, c) != list.last(stack) then
   |                                   ^
error: Expected expression at line 23:9 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:23:9
   |
23 |         else
   |         ^
error: Expected expression at line 25:5 (got RParen ')')
  --> /tmp/dojo-balanced-parens-0.almd:25:5
   |
25 |     )
   |     ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:3:21
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
3 |     stack = list.new[String]()
  |                     ^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:21:27
  in variable stack
  hint: Check the variable name
   |
21 |             list.drop_end(stack, 1) |> ignore
   |                           ^^^^^
error[E002]: undefined function 'ignore'
  --> /tmp/dojo-balanced-parens-0.almd:21:34
  in call to ignore()
  hint: Check the function name
   |
21 |             list.drop_end(stack, 1) |> ignore
   |                                  ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-0.almd:22:13
  in variable acc
  hint: Check the variable name
   |
22 |             acc
   |             ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-0.almd:24:11
  in variable acc
  hint: Check the variable name
   |
24 |           acc
   |           ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-0.almd:24:11
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
24 |           acc
   |           ^^^

12 error(s) found
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
  in list.fold(
    string.chars(s),
    (stack, true),
    (acc, c) =>
      if list.contains(["(", "[", "{"], c) then
        ((acc.0 + [c]), acc.1)
      else if map.contains(bracket_map, c) then
        if list.is_empty(acc.0) || map.get(bracket_map, c) != list.last(acc.0) then
          ([], false)
        else
          ((list.drop_end(acc.0, 1)), acc.1)
      else
        acc
  ).1
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: '||' is not valid in Almide at line 15:33
  --> /tmp/dojo-balanced-parens-1.almd:15:33
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
15 |         if list.is_empty(acc.0) || map.get(bracket_map, c) != list.last(acc.0) then
   |                                 ^
error: Expected expression at line 21:3 (got RParen ')')
  --> /tmp/dojo-balanced-parens-1.almd:21:3
   |
21 |   ).1
   |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:20:9
  in variable acc
  hint: Check the variable name
   |
20 |         acc
   |         ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:20:9
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
20 |         acc
   |         ^^^

4 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
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
  in list.fold(
    string.chars(s),
    (stack, true),
    (acc, c) =>
      if list.contains(["(", "[", "{"], c) then
        (acc.0 + [c], acc.1)
      else if map.contains(bracket_map, c) then
        if list.is_empty(acc.0) or map.get(bracket_map, c) != list.last(acc.0) then
          ([], false)
        else
          (list.drop_end(acc.0, 1), acc.1)
      else
        (acc.0, acc.1)
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
   --> <generated.rs>:419:26
    |
419 | ...   move |acc, c| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], c.clone()) { (AlmideConcat:...
    |                        ^^^^^^^^^^^^^^^^^^^^^^^
    |
note: expected `&Vec<_>`, found `Vec<String>`
   --> <generated.rs>:419:50
    |
419 | ...   move |acc, c| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], c.clone()) { (AlmideConcat:...
    |                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: expected `&_`, found `String`
   --> <generated.rs>:419:107
    |
419 | ...   move |acc, c| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], c.clone()) { (AlmideConcat:...
    |                                                                                                         ^^^^^^^^^
    = note: expected reference `&_`
                  found struct `String`
note: function defined here
   --> <generated.rs>:23:8
    |
 23 | pub fn almide_rt_list_contains<T: PartialEq>(xs: &Vec<T>, x: &T) -> bool { xs.contains(x) }
    |        ^^^^^^^^^^^^^^^^^^^^^^^               -----------  -----
help: consider borrowing here
    |
419 |         move |acc, c| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], &c.clone()) { (AlmideConcat::concat(acc.clone().0, vec![c.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), c.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_map_get(__cap_2.clone(), c.clone()), almide_rt_list_last(acc.clone().0))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { (acc.clone().0, acc.clone().1) } }
    |                                                                                                           +


error[E0308]: arguments to this function are incorrect
   --> <generated.rs>:419:202
    |
419 | ...ne().0, vec![c.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), c.clone()) { if (almide_rt_list_is_...
    |                                                         ^^^^^^^^^^^^^^^^^^^^^^
    |
note: expected `&HashMap<_, _>`, found `HashMap<String, String>`
   --> <generated.rs>:419:225
    |
419 | ...()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), c.clone()) { if (almide_rt_list_is_empty(acc.clone().0)...
    |                                                            ^^^^^^^^^^^^^^^
    = note: expected reference `&HashMap<_, _>`
                  found struct `HashMap<String, String>`
note: expected `&_`, found `String`
   --> <generated.rs>:419:242
    |
419 | ...e().1) } else { if almide_rt_map_contains(__cap_2.clone(), c.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!...
    |                                                               ^^^^^^^^^
    = note: expected reference `&_`
                  found struct `String`
note: function defined here
   --> <generated.rs>:243:8
    |
243 | pub fn almide_rt_map_contains<K: Eq + std::hash::Hash, V>(m: &HashMap<K, V>, k: &K) -> bool { m.contains_key(k) }
    |        ^^^^^^^^^^^^^^^^^^^^^^                             -----------------  -----
help: consider borrowing here
    |
419 |         move |acc, c| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], c.clone()) { (AlmideConcat::concat(acc.clone().0, vec![c.clone()]), acc.clone().1) } else { if almide_rt_map_contains(&__cap_2.clone(), c.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_map_get(__cap_2.clone(), c.clone()), almide_rt_list_last(acc.clone().0))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { (acc.clone().0, acc.clone().1) } }
    |                                                                                                                                                                                                                                 +
help: consider borrowing here
    |
419 |         move |acc, c| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], c.clone()) { (AlmideConcat::concat(acc.clone().0, vec![c.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), &c.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_map_get(__cap_2.clone(), c.clone()), almide_rt_list_last(acc.clone().0))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { (acc.clone().0, acc.clone().1) } }
    |                                                                                                                                                                                                                                                  +


error[E0308]: mismatched types
   --> <generated.rs>:419:283
    |
419 | ...lone(), c.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_map_get(__cap_2.clone(), c.clone()), alm...
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
419 |         move |acc, c| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], c.clone()) { (AlmideConcat::concat(acc.clone().0, vec![c.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), c.clone()) { if (almide_rt_list_is_empty(&acc.clone().0) || almide_ne!(almide_rt_map_get(__cap_2.clone(), c.clone()), almide_rt_list_last(acc.clone().0))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { (acc.clone().0, acc.clone().1) } }
    |                                                                                                                                                                                                                                                                                           +


error[E0308]: arguments to this function are incorrect
   --> <generated.rs>:419:312
    |
419 | ... (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_map_get(__cap_2.clone(), c.clone()), almide_rt_list_last(acc.cl...
    |                                                           ^^^^^^^^^^^^^^^^^
    |
note: expected `&HashMap<_, _>`, found `HashMap<String, String>`
   --> <generated.rs>:419:330
    |
419 | ...is_empty(acc.clone().0) || almide_ne!(almide_rt_map_get(__cap_2.clone(), c.clone()), almide_rt_list_last(acc.clone().0))) { (Vec...
    |                                                            ^^^^^^^^^^^^^^^
    = note: expected reference `&HashMap<_, _>`
                  found struct `HashMap<String, String>`
note: expected `&_`, found `String`
   --> <generated.rs>:419:347
    |
419 | ...lone().0) || almide_ne!(almide_rt_map_get(__cap_2.clone(), c.clone()), almide_rt_list_last(acc.clone().0))) { (Vec::<_>::new(), ...
    |                                                               ^^^^^^^^^
    = note: expected reference `&_`
                  found struct `String`
note: function defined here
   --> <generated.rs>:239:8
    |
239 | pub fn almide_rt_map_get<K: Eq + std::hash::Hash, V: Clone>(m: &HashMap<K, V>, k: &K) -> Option<V> { m.get(k).cloned() }
    |        ^^^^^^^^^^^^^^^^^                                    -----------------  -----
help: consider borrowing here
    |
419 |         move |acc, c| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], c.clone()) { (AlmideConcat::concat(acc.clone().0, vec![c.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), c.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_map_get(&__cap_2.clone(), c.clone()), almide_rt_list_last(acc.clone().0))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { (acc.clone().0, acc.clone().1) } }
    |                                                                                                                                                                                                                                                                                                                                          +
help: consider borrowing here
    |
419 |         move |acc, c| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], c.clone()) { (AlmideConcat::concat(acc.clone().0, vec![c.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), c.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_map_get(__cap_2.clone(), &c.clone()), almide_rt_list_last(acc.clone().0))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { (acc.clone().0, acc.clone().1) } }
    |                                                                                                                                                                                                                                                                                                                                                           +


error[E0308]: mismatched types
   --> <generated.rs>:419:379
    |
419 | ...cap_2.clone(), c.clone()), almide_rt_list_last(acc.clone().0))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc...
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
419 |         move |acc, c| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], c.clone()) { (AlmideConcat::concat(acc.clone().0, vec![c.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), c.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_map_get(__cap_2.clone(), c.clone()), almide_rt_list_last(&acc.clone().0))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { (acc.clone().0, acc.clone().1) } }
    |                                                                                                                                                                                                                                                                                                                                                                                           +


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
  in list.fold(
    string.chars(s),
    (stack, true),
    (acc, c) =>
      if list.contains(["(", "[", "{"], c) then
        (acc.0 + [c], acc.1)
      else if map.contains(bracket_map, c) then
        if list.is_empty(acc.0) or map.get(bracket_map, c) != list.last(acc.0) then
          ([], false)
        else
          (list.drop_end(acc.0, 1), acc.1)
      else
        (acc.0, acc.1)
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
   --> <generated.rs>:419:26
    |
419 | ...   move |acc, c| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], c.clone()) { (AlmideConcat:...
    |                        ^^^^^^^^^^^^^^^^^^^^^^^
    |
note: expected `&Vec<_>`, found `Vec<String>`
   --> <generated.rs>:419:50
    |
419 | ...   move |acc, c| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], c.clone()) { (AlmideConcat:...
    |                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    = note: expected reference `&Vec<_>`
                  found struct `Vec<String>`
note: expected `&_`, found `String`
   --> <generated.rs>:419:107
    |
419 | ...   move |acc, c| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], c.clone()) { (AlmideConcat:...
    |                                                                                                         ^^^^^^^^^
    = note: expected reference `&_`
                  found struct `String`
note: function defined here
   --> <generated.rs>:23:8
    |
 23 | pub fn almide_rt_list_contains<T: PartialEq>(xs: &Vec<T>, x: &T) -> bool { xs.contains(x) }
    |        ^^^^^^^^^^^^^^^^^^^^^^^               -----------  -----
help: consider borrowing here
    |
419 |         move |acc, c| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], &c.clone()) { (AlmideConcat::concat(acc.clone().0, vec![c.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), c.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_map_get(__cap_2.clone(), c.clone()), almide_rt_list_last(acc.clone().0))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { (acc.clone().0, acc.clone().1) } }
    |                                                                                                           +


error[E0308]: arguments to this function are incorrect
   --> <generated.rs>:419:202
    |
419 | ...ne().0, vec![c.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), c.clone()) { if (almide_rt_list_is_...
    |                                                         ^^^^^^^^^^^^^^^^^^^^^^
    |
note: expected `&HashMap<_, _>`, found `HashMap<String, String>`
   --> <generated.rs>:419:225
    |
419 | ...()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), c.clone()) { if (almide_rt_list_is_empty(acc.clone().0)...
    |                                                            ^^^^^^^^^^^^^^^
    = note: expected reference `&HashMap<_, _>`
                  found struct `HashMap<String, String>`
note: expected `&_`, found `String`
   --> <generated.rs>:419:242
    |
419 | ...e().1) } else { if almide_rt_map_contains(__cap_2.clone(), c.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!...
    |                                                               ^^^^^^^^^
    = note: expected reference `&_`
                  found struct `String`
note: function defined here
   --> <generated.rs>:243:8
    |
243 | pub fn almide_rt_map_contains<K: Eq + std::hash::Hash, V>(m: &HashMap<K, V>, k: &K) -> bool { m.contains_key(k) }
    |        ^^^^^^^^^^^^^^^^^^^^^^                             -----------------  -----
help: consider borrowing here
    |
419 |         move |acc, c| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], c.clone()) { (AlmideConcat::concat(acc.clone().0, vec![c.clone()]), acc.clone().1) } else { if almide_rt_map_contains(&__cap_2.clone(), c.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_map_get(__cap_2.clone(), c.clone()), almide_rt_list_last(acc.clone().0))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { (acc.clone().0, acc.clone().1) } }
    |                                                                                                                                                                                                                                 +
help: consider borrowing here
    |
419 |         move |acc, c| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], c.clone()) { (AlmideConcat::concat(acc.clone().0, vec![c.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), &c.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_map_get(__cap_2.clone(), c.clone()), almide_rt_list_last(acc.clone().0))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { (acc.clone().0, acc.clone().1) } }
    |                                                                                                                                                                                                                                                  +


error[E0308]: mismatched types
   --> <generated.rs>:419:283
    |
419 | ...lone(), c.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_map_get(__cap_2.clone(), c.clone()), alm...
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
419 |         move |acc, c| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], c.clone()) { (AlmideConcat::concat(acc.clone().0, vec![c.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), c.clone()) { if (almide_rt_list_is_empty(&acc.clone().0) || almide_ne!(almide_rt_map_get(__cap_2.clone(), c.clone()), almide_rt_list_last(acc.clone().0))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { (acc.clone().0, acc.clone().1) } }
    |                                                                                                                                                                                                                                                                                           +


error[E0308]: arguments to this function are incorrect
   --> <generated.rs>:419:312
    |
419 | ... (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_map_get(__cap_2.clone(), c.clone()), almide_rt_list_last(acc.cl...
    |                                                           ^^^^^^^^^^^^^^^^^
    |
note: expected `&HashMap<_, _>`, found `HashMap<String, String>`
   --> <generated.rs>:419:330
    |
419 | ...is_empty(acc.clone().0) || almide_ne!(almide_rt_map_get(__cap_2.clone(), c.clone()), almide_rt_list_last(acc.clone().0))) { (Vec...
    |                                                            ^^^^^^^^^^^^^^^
    = note: expected reference `&HashMap<_, _>`
                  found struct `HashMap<String, String>`
note: expected `&_`, found `String`
   --> <generated.rs>:419:347
    |
419 | ...lone().0) || almide_ne!(almide_rt_map_get(__cap_2.clone(), c.clone()), almide_rt_list_last(acc.clone().0))) { (Vec::<_>::new(), ...
    |                                                               ^^^^^^^^^
    = note: expected reference `&_`
                  found struct `String`
note: function defined here
   --> <generated.rs>:239:8
    |
239 | pub fn almide_rt_map_get<K: Eq + std::hash::Hash, V: Clone>(m: &HashMap<K, V>, k: &K) -> Option<V> { m.get(k).cloned() }
    |        ^^^^^^^^^^^^^^^^^                                    -----------------  -----
help: consider borrowing here
    |
419 |         move |acc, c| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], c.clone()) { (AlmideConcat::concat(acc.clone().0, vec![c.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), c.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_map_get(&__cap_2.clone(), c.clone()), almide_rt_list_last(acc.clone().0))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { (acc.clone().0, acc.clone().1) } }
    |                                                                                                                                                                                                                                                                                                                                          +
help: consider borrowing here
    |
419 |         move |acc, c| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], c.clone()) { (AlmideConcat::concat(acc.clone().0, vec![c.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), c.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_map_get(__cap_2.clone(), &c.clone()), almide_rt_list_last(acc.clone().0))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { (acc.clone().0, acc.clone().1) } }
    |                                                                                                                                                                                                                                                                                                                                                           +


error[E0308]: mismatched types
   --> <generated.rs>:419:379
    |
419 | ...cap_2.clone(), c.clone()), almide_rt_list_last(acc.clone().0))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc...
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
419 |         move |acc, c| if almide_rt_list_contains(vec!["(".to_string(), "[".to_string(), "{".to_string()], c.clone()) { (AlmideConcat::concat(acc.clone().0, vec![c.clone()]), acc.clone().1) } else { if almide_rt_map_contains(__cap_2.clone(), c.clone()) { if (almide_rt_list_is_empty(acc.clone().0) || almide_ne!(almide_rt_map_get(__cap_2.clone(), c.clone()), almide_rt_list_last(&acc.clone().0))) { (Vec::<_>::new(), false) } else { (almide_rt_list_drop_end(acc.clone().0, 1i64), acc.clone().1) } } else { (acc.clone().0, acc.clone().1) } }
    |                                                                                                                                                                                                                                                                                                                                                                                           +


error: could not compile `almide-generated` (bin "almide-generated" test) due to 6 previous errors; 1 warning emitted

FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
