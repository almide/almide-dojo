# balanced-parens

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

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

    for (char) in string.chars(s) {
        if char == "(" || char == "[" || char == "{" then
            stack = stack + [char]
        else if map.contains(bracket_map, char) then
            if list.is_empty(stack) || list.last(stack) != map.get(bracket_map, char) then
                false
            else
                stack = list.drop_end(stack, 1)
        else
            ()
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

    for (char) in string.chars(s) {
        if char == "(" || char == "[" || char == "{" then
            stack = stack + [char]
        else if map.contains(bracket_map, char) then
            if list.is_empty(stack) || list.last(stack) != map.get_or(bracket_map, char, "") then
                false
            else
                stack = list.drop_end(stack, 1)
        else
            ()
    }

    list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: '||' is not valid in Almide at line 10:24
  --> /tmp/dojo-balanced-parens-1.almd:10:24
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
10 |         if char == "(" || char == "[" || char == "{" then
   |                        ^
error: Expected expression at line 12:9 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:12:9
   |
12 |         else if map.contains(bracket_map, char) then
   |         ^
error: '||' is not valid in Almide at line 13:37
  --> /tmp/dojo-balanced-parens-1.almd:13:37
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
13 |             if list.is_empty(stack) || list.last(stack) != map.get_or(bracket_map, char, "") then
   |                                     ^
error: Expected expression at line 17:9 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:17:9
   |
17 |         else
   |         ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 19:5 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:19:5
   |
19 |     }
   |     ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:2:25
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |     let stack = list.new[String]()
  |                         ^
error[E003]: undefined variable 'char'
  --> /tmp/dojo-balanced-parens-1.almd:11:30
  in variable char
  hint: Check the variable name
   |
11 |             stack = stack + [char]
   |                              ^^^^
error[E009]: cannot reassign immutable binding 'stack'
  --> /tmp/dojo-balanced-parens-1.almd:11:30
  in stack = ...
  hint: Use 'var stack = ...' instead of 'let stack = ...' to declare a mutable variable
  try:
      // let stack = ...  →  var stack = ...
      var stack = <initial value>
   |
 2 |     let stack = list.new[String]()
   |     --------------------- 'stack' declared here
...
11 |             stack = stack + [char]
   |                              ^^^^
error[E009]: cannot reassign immutable binding 'stack'
  --> /tmp/dojo-balanced-parens-1.almd:16:46
  in stack = ...
  hint: Use 'var stack = ...' instead of 'let stack = ...' to declare a mutable variable
  try:
      // let stack = ...  →  var stack = ...
      var stack = <initial value>
   |
 2 |     let stack = list.new[String]()
   |     --------------------- 'stack' declared here
...
16 |                 stack = list.drop_end(stack, 1)
   |                                              ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:16:46
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
16 |                 stack = list.drop_end(stack, 1)
   |                                              ^

10 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
    let bracket_map = map.from_list([
        (")", "("),
        ("]", "["),
        ("}", "{")
    ])
    let chars = string.chars(s)
    let result = list.fold(chars, [], (stack, char) => 
        if char == "(" or char == "[" or char == "{" then
            stack + [char]
        else if map.contains(bracket_map, char) then
            if list.is_empty(stack) or list.last(stack) != map.get_or(bracket_map, char, "") then
                []
            else
                list.drop_end(stack, 1)
        else
            stack
    )
    list.is_empty(result)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
Compile error for /tmp/dojo-balanced-parens-2.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0308]: arguments to this function are incorrect
   --> <generated.rs>:419:358
    |
419 | ...ty(&stack) || almide_ne!(almide_rt_list_last(&stack), almide_rt_map_get_or(&__cap_1, &char, "".to_string()))) { Vec::<String>::n...
    |                                                          ^^^^^^^^^^^^^^^^^^^^
    |
note: expected `&HashMap<String, Option<String>>`, found `&HashMap<String, String>`
   --> <generated.rs>:419:379
    |
419 | ...lmide_ne!(almide_rt_list_last(&stack), almide_rt_map_get_or(&__cap_1, &char, "".to_string()))) { Vec::<String>::new() } else { a...
    |                                                                ^^^^^^^^
    = note: expected reference `&HashMap<_, Option<String>>`
               found reference `&HashMap<_, String>`
note: expected `Option<String>`, found `String`
   --> <generated.rs>:419:396
    |
419 | ...list_last(&stack), almide_rt_map_get_or(&__cap_1, &char, "".to_string()))) { Vec::<String>::new() } else { almide_rt_list_drop_e...
    |                                                             ^^^^^^^^^^^^^^
    = note: expected enum `Option<String>`
             found struct `String`
help: the return type of this call is `String` due to the type of the argument passed
   --> <generated.rs>:419:358
    |
419 | ...k), almide_rt_map_get_or(&__cap_1, &char, "".to_string()))) { Vec::<String>::new() } else { almide_rt_list_drop_end((stack.clone...
    |        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--------------^
    |                                              |
    |                                              this argument influences the return type of `almide_rt_map_get_or`
note: function defined here
   --> <generated.rs>:240:8
    |
240 | pub fn almide_rt_map_get_or<K: Eq + std::hash::Hash, V: Clone>(m: &HashMap<K, V>, k: &K, default: V) -> V { m.get(k).cloned().unwra...
    |        ^^^^^^^^^^^^^^^^^^^^                                    -----------------         ----------
help: try wrapping the expression in `Some`
    |
419 |         move |stack, char| if ((almide_eq!(char.clone(), "(".to_string()) || almide_eq!(char.clone(), "[".to_string())) || almide_eq!(char.clone(), "{".to_string())) { AlmideConcat::concat(stack.clone(), vec![char.clone()]) } else { if almide_rt_map_contains(&__cap_1, &char) { if (almide_rt_list_is_empty(&stack) || almide_ne!(almide_rt_list_last(&stack), almide_rt_map_get_or(&__cap_1, &char, Some("".to_string())))) { Vec::<String>::new() } else { almide_rt_list_drop_end((stack.clone()).to_vec(), 1i64) } } else { stack.clone() } }
    |                                                                                                                                                                                                                                                                                                                                                                                                            +++++              +


error: could not compile `almide-generated` (bin "almide-generated" test) due to 1 previous error

FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
    let bracket_map = map.from_list([
        (")", "("),
        ("]", "["),
        ("}", "{")
    ])
    let chars = string.chars(s)
    let result = list.fold(chars, [], (stack, char) => 
        if char == "(" or char == "[" or char == "{" then
            stack + [char]
        else if map.contains(bracket_map, char) then
            if list.is_empty(stack) or list.last(stack) != map.get_or(bracket_map, char, some("")) then
                []
            else
                list.drop_end(stack, 1)
        else
            stack
    )
    list.is_empty(result)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error[E001]: type mismatch in call to map.get_or(): expected String but got Option[String]
  --> /tmp/dojo-balanced-parens-3.almd:12:95
  in call to map.get_or()
  hint: Fix the expression type or change the expected type
   |
12 |             if list.is_empty(stack) or list.last(stack) != map.get_or(bracket_map, char, some("")) then
   |                                                                                               ^^

1 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
