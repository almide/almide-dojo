# balanced-parens

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool {
    let stack = list.new[String]()
    let bracket_map = map.from_list([
        (")", "("),
        ("]", "["),
        ("}", "{")
    ])
    for ch in string.chars(s) {
        if ch == "(" || ch == "[" || ch == "{" then
            stack = stack + [ch]
        else if ch == ")" || ch == "]" || ch == "}" then
            if list.is_empty(stack) || list.last(stack) != some(map.get(bracket_map, ch)) then
                false
            else
                stack = list.drop_end(stack, 1)
    }
    list.is_empty(stack)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Missing '=' before function body at line 1:35
  --> /tmp/dojo-balanced-parens-0.almd:1:35
  hint: Almide requires '=' before the body. Write: fn is_balanced(...) -> Type = { ... }
  |
1 | fn is_balanced(s: String) -> Bool {
  |                                   ^

1 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
    let stack = list.new[String]()
    let bracket_map = map.from_list([
        (")", "("),
        ("]", "["),
        ("}", "{")
    ])
    let res = list.fold(string.chars(s), true, (acc, ch) => 
        if acc then
            if ch == "(" || ch == "[" || ch == "{" then
                true
            else if ch == ")" || ch == "]" || ch == "}" then
                if list.is_empty(stack) || list.last(stack) != some(map.get(bracket_map, ch)) then
                    false
                else
                    true
            else
                true
        else
            false
    )
    if res then
        list.is_empty(stack)
    else
        false
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: '||' is not valid in Almide at line 10:26
  --> /tmp/dojo-balanced-parens-1.almd:10:26
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
10 |             if ch == "(" || ch == "[" || ch == "{" then
   |                          ^
error: '||' is not valid in Almide at line 13:41
  --> /tmp/dojo-balanced-parens-1.almd:13:41
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
13 |                 if list.is_empty(stack) || list.last(stack) != some(map.get(bracket_map, ch)) then
   |                                         ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:2:25
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |     let stack = list.new[String]()
  |                         ^
error[E003]: undefined variable 'res'
  --> /tmp/dojo-balanced-parens-1.almd:22:8
  in variable res
  hint: Did you mean `s`?
  try:
      // res  →  s
      s
   |
22 |     if res then
   |        ^^^

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
    let res = list.fold(string.chars(s), (stack, true), (acc, ch) => 
        if acc.1 then
            if ch == "(" or ch == "[" or ch == "{" then
                (acc.0 + [ch], true)
            else if ch == ")" or ch == "]" or ch == "}" then
                if list.is_empty(acc.0) or list.last(acc.0) != some(map.get(bracket_map, ch)) then
                    (acc.0, false)
                else
                    (list.drop_end(acc.0, 1), true)
            else
                (acc.0, true)
        else
            (acc.0, false)
    )
    if res.1 then
        list.is_empty(res.0)
    else
        false
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
Compile error for /tmp/dojo-balanced-parens-2.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0308]: mismatched types
   --> <generated.rs>:419:484
    |
419 | ...t_last(&acc.clone().0), Some(almide_rt_map_get(&__cap_2, &ch)))) { (acc.clone().0, false) } else { (almide_rt_list_drop_end((acc...
    |                            ---- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `String`, found `Option<String>`
    |                            |
    |                            arguments to this enum variant are incorrect
    |
    = note: expected struct `String`
                 found enum `Option<String>`
help: the type constructed contains `Option<String>` due to the type of the argument passed
   --> <generated.rs>:419:479
    |
419 | ..._last(&acc.clone().0), Some(almide_rt_map_get(&__cap_2, &ch)))) { (acc.clone().0, false) } else { (almide_rt_list_drop_end((acc....
    |                           ^^^^^--------------------------------^
    |                                |
    |                                this argument influences the type of `Some`
note: tuple variant defined here
   --> /rustc/e408947bfd200af42db322daf0fadfe7e26d3bd1/library/core/src/option.rs:608:4
help: consider using `Option::expect` to unwrap the `Option<String>` value, panicking if the value is an `Option::None`
    |
419 |         move |acc, ch| if acc.clone().1 { if ((almide_eq!(ch.clone(), "(".to_string()) || almide_eq!(ch.clone(), "[".to_string())) || almide_eq!(ch.clone(), "{".to_string())) { (AlmideConcat::concat(acc.clone().0, vec![ch.clone()]), true) } else { if ((almide_eq!(ch.clone(), ")".to_string()) || almide_eq!(ch.clone(), "]".to_string())) || almide_eq!(ch.clone(), "}".to_string())) { if (almide_rt_list_is_empty(&acc.clone().0) || almide_ne!(almide_rt_list_last(&acc.clone().0), Some(almide_rt_map_get(&__cap_2, &ch).expect("REASON")))) { (acc.clone().0, false) } else { (almide_rt_list_drop_end((acc.clone().0).to_vec(), 1i64), true) } } else { (acc.clone().0, true) } } } else { (acc.clone().0, false) }
    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    +++++++++++++++++


error: could not compile `almide-generated` (bin "almide-generated" test) due to 1 previous error

FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (PASS)

```almide
fn is_balanced(s: String) -> Bool = 
    let stack = []
    let bracket_map = map.from_list([
        (")", "("),
        ("]", "["),
        ("}", "{")
    ])
    let res = list.fold(string.chars(s), (stack, true), (acc, ch) => 
        if acc.1 then
            if ch == "(" or ch == "[" or ch == "{" then
                (acc.0 + [ch], true)
            else if ch == ")" or ch == "]" or ch == "}" then
                if list.is_empty(acc.0) or option.unwrap_or(map.get(bracket_map, ch), "") != option.unwrap_or(list.last(acc.0), "") then
                    (acc.0, false)
                else
                    (list.drop_end(acc.0, 1), true)
            else
                (acc.0, true)
        else
            (acc.0, false)
    )
    if res.1 then
        list.is_empty(res.0)
    else
        false
```
