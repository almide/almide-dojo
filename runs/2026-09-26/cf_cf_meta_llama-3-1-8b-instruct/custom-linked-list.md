# custom-linked-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E012`

## Attempts

### Attempt 1 (FAIL)

```almide
fn from_list(xs: List[Int]) -> MyList = 
  match xs {
    Nil => Nil
    Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(x, to_list(tail))
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => 
      if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }
```

**Diagnostic:**

```
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:3:12
  in variable Nil
  here: Nil => Nil
  hint: Check the variable name
  |
3 |     Nil => Nil
  |            ^^^
error[E003]: unknown type or constructor 'Cons' in call position
  --> /tmp/dojo-custom-linked-list-0.almd:4:38
  in call to Cons()
  here: Cons(x, xs) => Cons(x, from_list(xs))
  hint: No type, variant constructor, or opaque alias named 'Cons' is in scope. Check the spelling or add the missing import.
  |
4 |     Cons(x, xs) => Cons(x, from_list(xs))
  |                                      ^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:9:12
  in variable Nil
  here: Nil => Nil
  hint: Did you mean `ml`?
  try:
      ml
  |
9 |     Nil => Nil
  |            ^^^
error[E003]: unknown type or constructor 'Cons' in call position
  --> /tmp/dojo-custom-linked-list-0.almd:10:38
  in call to Cons()
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: No type, variant constructor, or opaque alias named 'Cons' is in scope. Check the spelling or add the missing import.
   |
10 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:21:12
  in variable Nil
  here: Nil => Nil
  hint: Did you mean `ml`?
  try:
      ml
   |
21 |     Nil => Nil
   |            ^^^
error[E003]: unknown type or constructor 'Cons' in call position
  --> /tmp/dojo-custom-linked-list-0.almd:22:46
  in call to Cons()
  here: Cons(x, tail) => Cons(f(x), my_map(tail, f))
  hint: No type, variant constructor, or opaque alias named 'Cons' is in scope. Check the spelling or add the missing import.
   |
22 |     Cons(x, tail) => Cons(f(x), my_map(tail, f))
   |                                              ^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:27:12
  in variable Nil
  here: Nil => Nil
  hint: Did you mean `ml`?
  try:
      ml
   |
27 |     Nil => Nil
   |            ^^^
error[E003]: unknown type or constructor 'Cons' in call position
  --> /tmp/dojo-custom-linked-list-0.almd:29:47
  in call to Cons()
  here: if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  hint: No type, variant constructor, or opaque alias named 'Cons' is in scope. Check the spelling or add the missing import.
   |
29 |       if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                               ^^^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:34:12
  in variable Nil
  here: Nil => Nil
  hint: Did you mean `ml`?
  try:
      ml
   |
34 |     Nil => Nil
   |            ^^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:35:50
  in variable Nil
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Did you mean `ml`?
  try:
      ml
   |
35 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error[E003]: unknown type or constructor 'Cons' in call position
  --> /tmp/dojo-custom-linked-list-0.almd:35:50
  in call to Cons()
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: No type, variant constructor, or opaque alias named 'Cons' is in scope. Check the spelling or add the missing import.
   |
35 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[Cons]
  --> /tmp/dojo-custom-linked-list-0.almd:35:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
35 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:40:40
  in variable Nil
  here: test "my_len empty" { assert_eq(my_len(Nil), 0) }
  hint: Check the variable name
   |
40 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
   |                                        ^^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:43:49
  in variable Nil
  here: test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
  hint: Check the variable name
   |
43 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
   |                                                 ^^^
error[E003]: undefined variable 'Nil'
  --> /tmp/dojo-custom-linked-list-0.almd:47:56
  in variable Nil
  here: test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
  hint: Check the variable name
   |
47 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E001]: type mismatch in if branches: expected Cons but got MyList
  --> /tmp/dojo-custom-linked-list-0.almd:29:75
  in if branches
  here: if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  hint: Both branches of `if/then/else` must have the same type
   |
29 |       if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
   |                                                                           ^^^^
error[E029]: unknown type 'MyList'
  in return type of 'from_list'
  hint: no `type MyList` is declared (or imported) in this program — declare it, or check the spelling

17 error(s) found
FAILED: /tmp/dojo-custom-linked-list-0.almd
Compile error for /tmp/dojo-custom-linked-list-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
type MyList =
  | Nil
  | Cons(Int, MyList)

fn from_list(xs: List[Int]) -> MyList = 
  match xs {
    Nil => Nil
    Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(x, to_list(tail))
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => 
      if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => 
      if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => 
      if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

type MyList =
  | Nil
  | Cons(Int, MyList)

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => 
      if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

type MyList =
  | Nil
  | Cons(Int, MyList)

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => 
      if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

type MyList =
  | Nil
  | Cons(Int, MyList)

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => 
      if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }
```

**Diagnostic:**

```
error[E012]: duplicate function 'my_len'
  at line 42
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
17 | fn my_len(ml: MyList) -> Int =
   | --------------------------------- first definition of 'my_len' here
...
42 | fn my_len(ml: MyList) -> Int =
   | ^
error[E012]: duplicate function 'my_map'
  at line 48
  in fn my_map
  here: fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
23 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
   | --------------------------------- first definition of 'my_map' here
...
48 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
   | ^
error[E012]: duplicate function 'my_filter'
  at line 54
  in fn my_filter
  here: fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
29 | fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
   | ------------------------------------ first definition of 'my_filter' here
...
54 | fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
   | ^
error[E012]: duplicate function 'my_reverse'
  at line 61
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
36 | fn my_reverse(ml: MyList) -> MyList =
   | ------------------------------------- first definition of 'my_reverse' here
...
61 | fn my_reverse(ml: MyList) -> MyList =
   | ^
error[E012]: duplicate function 'my_len'
  at line 67
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
17 | fn my_len(ml: MyList) -> Int =
   | --------------------------------- first definition of 'my_len' here
...
67 | fn my_len(ml: MyList) -> Int =
   | ^
error[E012]: duplicate function 'my_map'
  at line 73
  in fn my_map
  here: fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
23 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
   | --------------------------------- first definition of 'my_map' here
...
73 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
   | ^
error[E012]: duplicate function 'my_filter'
  at line 79
  in fn my_filter
  here: fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
29 | fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
   | ------------------------------------ first definition of 'my_filter' here
...
79 | fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
   | ^
error[E012]: duplicate function 'my_reverse'
  at line 86
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
36 | fn my_reverse(ml: MyList) -> MyList =
   | ------------------------------------- first definition of 'my_reverse' here
...
86 | fn my_reverse(ml: MyList) -> MyList =
   | ^
error[E012]: duplicate function 'my_len'
  at line 96
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
17 | fn my_len(ml: MyList) -> Int =
   | --------------------------------- first definition of 'my_len' here
...
96 | fn my_len(ml: MyList) -> Int =
   | ^
error[E012]: duplicate function 'my_map'
  at line 102
  in fn my_map
  here: fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 23 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
    | --------------------------------- first definition of 'my_map' here
 ...
102 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
    | ^
error[E012]: duplicate function 'my_filter'
  at line 108
  in fn my_filter
  here: fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 29 | fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
    | ------------------------------------ first definition of 'my_filter' here
 ...
108 | fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 115
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 36 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
115 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 125
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
125 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_map'
  at line 131
  in fn my_map
  here: fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 23 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
    | --------------------------------- first definition of 'my_map' here
 ...
131 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
    | ^
error[E012]: duplicate function 'my_filter'
  at line 137
  in fn my_filter
  here: fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 29 | fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
    | ------------------------------------ first definition of 'my_filter' here
 ...
137 | fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 144
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 36 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
144 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E012]: duplicate function 'my_len'
  at line 154
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn my_len(ml: MyList) -> Int =
    | --------------------------------- first definition of 'my_len' here
 ...
154 | fn my_len(ml: MyList) -> Int =
    | ^
error[E012]: duplicate function 'my_map'
  at line 160
  in fn my_map
  here: fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 23 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
    | --------------------------------- first definition of 'my_map' here
 ...
160 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
    | ^
error[E012]: duplicate function 'my_filter'
  at line 166
  in fn my_filter
  here: fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 29 | fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
    | ------------------------------------ first definition of 'my_filter' here
 ...
166 | fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
    | ^
error[E012]: duplicate function 'my_reverse'
  at line 173
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 36 | fn my_reverse(ml: MyList) -> MyList =
    | ------------------------------------- first definition of 'my_reverse' here
 ...
173 | fn my_reverse(ml: MyList) -> MyList =
    | ^
error[E005]: Cons() argument 2 expects MyList but got List[Int]
  --> /tmp/dojo-custom-linked-list-1.almd:14:38
  in constructor Cons()
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Cons(Int, MyList) expects argument #2 to be MyList, got List[Int]
   |
14 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:39:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
39 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:64:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
64 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:89:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
89 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:118:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
118 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:147:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
147 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-1.almd:176:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
176 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-1.almd:14:38
  in fn 'to_list'
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Fix the expression type or change the expected type
   |
14 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^

28 error(s) found
FAILED: /tmp/dojo-custom-linked-list-1.almd
Compile error for /tmp/dojo-custom-linked-list-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
type MyList =
  | Nil
  | Cons(Int, MyList)

fn from_list(xs: List[Int]) -> MyList = 
  match xs {
    Nil => Nil
    Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(x, to_list(tail))
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => 
      if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(x, to_list(tail))
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => 
      if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }
```

**Diagnostic:**

```
error[E012]: duplicate function 'to_list'
  at line 42
  in fn to_list
  here: fn to_list(ml: MyList) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
11 | fn to_list(ml: MyList) -> List[Int] =
   | ---------------------------------- first definition of 'to_list' here
...
42 | fn to_list(ml: MyList) -> List[Int] =
   | ^
error[E012]: duplicate function 'my_len'
  at line 48
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
17 | fn my_len(ml: MyList) -> Int =
   | --------------------------------- first definition of 'my_len' here
...
48 | fn my_len(ml: MyList) -> Int =
   | ^
error[E012]: duplicate function 'my_map'
  at line 54
  in fn my_map
  here: fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
23 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
   | --------------------------------- first definition of 'my_map' here
...
54 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
   | ^
error[E012]: duplicate function 'my_filter'
  at line 60
  in fn my_filter
  here: fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
29 | fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
   | ------------------------------------ first definition of 'my_filter' here
...
60 | fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
   | ^
error[E012]: duplicate function 'my_reverse'
  at line 67
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
36 | fn my_reverse(ml: MyList) -> MyList =
   | ------------------------------------- first definition of 'my_reverse' here
...
67 | fn my_reverse(ml: MyList) -> MyList =
   | ^
error[E005]: Cons() argument 2 expects MyList but got List[Int]
  --> /tmp/dojo-custom-linked-list-2.almd:14:38
  in constructor Cons()
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Cons(Int, MyList) expects argument #2 to be MyList, got List[Int]
   |
14 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-2.almd:39:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
39 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error[E005]: Cons() argument 2 expects MyList but got List[Int]
  --> /tmp/dojo-custom-linked-list-2.almd:45:38
  in constructor Cons()
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Cons(Int, MyList) expects argument #2 to be MyList, got List[Int]
   |
45 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-2.almd:70:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
70 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-2.almd:14:38
  in fn 'to_list'
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Fix the expression type or change the expected type
   |
14 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-2.almd:45:38
  in fn 'to_list'
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Fix the expression type or change the expected type
   |
45 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^

11 error(s) found
FAILED: /tmp/dojo-custom-linked-list-2.almd
Compile error for /tmp/dojo-custom-linked-list-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
type MyList =
  | Nil
  | Cons(Int, MyList)

fn from_list(xs: List[Int]) -> MyList = 
  match xs {
    Nil => Nil
    Cons(x, xs) => Cons(x, from_list(xs))
  }

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(x, to_list(tail))
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => 
      if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(x, to_list(tail))
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => 
      if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }

fn to_list(ml: MyList) -> List[Int] = 
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(x, to_list(tail))
  }

fn my_len(ml: MyList) -> Int = 
  match ml {
    Nil => 0
    Cons(_, tail) => 1 + my_len(tail)
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => Cons(f(x), my_map(tail, f))
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => 
      if pred(x) then Cons(x, my_filter(tail, pred)) else my_filter(tail, pred)
  }

fn my_reverse(ml: MyList) -> MyList = 
  match ml {
    Nil => Nil
    Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  }
```

**Diagnostic:**

```
error[E012]: duplicate function 'to_list'
  at line 42
  in fn to_list
  here: fn to_list(ml: MyList) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
11 | fn to_list(ml: MyList) -> List[Int] =
   | ---------------------------------- first definition of 'to_list' here
...
42 | fn to_list(ml: MyList) -> List[Int] =
   | ^
error[E012]: duplicate function 'my_len'
  at line 48
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
17 | fn my_len(ml: MyList) -> Int =
   | --------------------------------- first definition of 'my_len' here
...
48 | fn my_len(ml: MyList) -> Int =
   | ^
error[E012]: duplicate function 'my_map'
  at line 54
  in fn my_map
  here: fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
23 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
   | --------------------------------- first definition of 'my_map' here
...
54 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
   | ^
error[E012]: duplicate function 'my_filter'
  at line 60
  in fn my_filter
  here: fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
29 | fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
   | ------------------------------------ first definition of 'my_filter' here
...
60 | fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
   | ^
error[E012]: duplicate function 'my_reverse'
  at line 67
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
36 | fn my_reverse(ml: MyList) -> MyList =
   | ------------------------------------- first definition of 'my_reverse' here
...
67 | fn my_reverse(ml: MyList) -> MyList =
   | ^
error[E012]: duplicate function 'to_list'
  at line 73
  in fn to_list
  here: fn to_list(ml: MyList) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
11 | fn to_list(ml: MyList) -> List[Int] =
   | ---------------------------------- first definition of 'to_list' here
...
73 | fn to_list(ml: MyList) -> List[Int] =
   | ^
error[E012]: duplicate function 'my_len'
  at line 79
  in fn my_len
  here: fn my_len(ml: MyList) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
17 | fn my_len(ml: MyList) -> Int =
   | --------------------------------- first definition of 'my_len' here
...
79 | fn my_len(ml: MyList) -> Int =
   | ^
error[E012]: duplicate function 'my_map'
  at line 85
  in fn my_map
  here: fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
23 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
   | --------------------------------- first definition of 'my_map' here
...
85 | fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
   | ^
error[E012]: duplicate function 'my_filter'
  at line 91
  in fn my_filter
  here: fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
29 | fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
   | ------------------------------------ first definition of 'my_filter' here
...
91 | fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
   | ^
error[E012]: duplicate function 'my_reverse'
  at line 98
  in fn my_reverse
  here: fn my_reverse(ml: MyList) -> MyList =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
36 | fn my_reverse(ml: MyList) -> MyList =
   | ------------------------------------- first definition of 'my_reverse' here
...
98 | fn my_reverse(ml: MyList) -> MyList =
   | ^
error[E005]: Cons() argument 2 expects MyList but got List[Int]
  --> /tmp/dojo-custom-linked-list-3.almd:14:38
  in constructor Cons()
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Cons(Int, MyList) expects argument #2 to be MyList, got List[Int]
   |
14 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-3.almd:39:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
39 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error[E005]: Cons() argument 2 expects MyList but got List[Int]
  --> /tmp/dojo-custom-linked-list-3.almd:45:38
  in constructor Cons()
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Cons(Int, MyList) expects argument #2 to be MyList, got List[Int]
   |
45 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-3.almd:70:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
   |
70 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
   |                                                  ^^^
error[E005]: Cons() argument 2 expects MyList but got List[Int]
  --> /tmp/dojo-custom-linked-list-3.almd:76:38
  in constructor Cons()
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Cons(Int, MyList) expects argument #2 to be MyList, got List[Int]
   |
76 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
error: operator '+' requires numeric, String, or List types but got MyList and List[MyList]
  --> /tmp/dojo-custom-linked-list-3.almd:101:50
  in operator +
  here: Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
  hint: Use + with numeric types, String, or List
    |
101 |     Cons(x, tail) => my_reverse(tail) + [Cons(x, Nil)]
    |                                                  ^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-3.almd:14:38
  in fn 'to_list'
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Fix the expression type or change the expected type
   |
14 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-3.almd:45:38
  in fn 'to_list'
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Fix the expression type or change the expected type
   |
45 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^
error[E001]: type mismatch in fn 'to_list': expected List[Int] but got MyList
  --> /tmp/dojo-custom-linked-list-3.almd:76:38
  in fn 'to_list'
  here: Cons(x, tail) => Cons(x, to_list(tail))
  hint: Fix the expression type or change the expected type
   |
76 |     Cons(x, tail) => Cons(x, to_list(tail))
   |                                      ^^^^

19 error(s) found
FAILED: /tmp/dojo-custom-linked-list-3.almd
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
