# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  matches s {
    "" => map.new()
    _ => 
      let words = string.split(s, " ").filter(x => x != "")
      list.fold(words, map.new(), (m, word) => 
        map.get_or(m, word, 0) + 1 => map.set(m, word, map.get_or(m, word, 0) + 1)
      )
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:11 (got Ident 's')
  --> /tmp/dojo-word-count-0.almd:2:11
  |
2 |   matches s {
  |           ^
error[E003]: undefined variable 'matches'
  --> /tmp/dojo-word-count-0.almd:2:3
  in variable matches
  hint: Check the variable name
  |
2 |   matches s {
  |   ^^^^^^^

2 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ").filter(x => x != "")
  list.fold(words, map.new(), (m, word) => 
    map.get_or(m, word, 0) + 1 => map.set(m, word, map.get_or(m, word, 0) + 1)
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-1.almd:2:45
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   let words = string.split(s, " ").filter(x => x != "")
  |                                             ^^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-1.almd:4:32
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
4 |     map.get_or(m, word, 0) + 1 => map.set(m, word, map.get_or(m, word, 0) + 1)
  |                                ^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-1.almd:2:3
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
2 |   let words = string.split(s, " ").filter(x => x != "")
  |   ^^^

3 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ").filter(x => x != "")
  list.fold(words, map.new(), (m, word) => 
    let count = map.get_or(m, word, 0)
    map.set(m, word, count + 1)
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-2.almd:2:45
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   let words = string.split(s, " ").filter(x => x != "")
  |                                             ^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-2.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let count = map.get_or(m, word, 0)
  |     ^^^
error: Expected expression at line 6:3 (got RParen ')')
  --> /tmp/dojo-word-count-2.almd:6:3
  |
6 |   )
  |   ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-2.almd:5:13
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
5 |     map.set(m, word, count + 1)
  |             ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-2.almd:5:16
  in variable word
  hint: Check the variable name
  |
5 |     map.set(m, word, count + 1)
  |                ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-2.almd:5:22
  in variable count
  hint: Check the variable name
  |
5 |     map.set(m, word, count + 1)
  |                      ^^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-2.almd:5:30
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
5 |     map.set(m, word, count + 1)
  |                              ^

7 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ").filter(x => x != "")
  list.fold(words, map.new(), (m, word) => 
    let count = map.get_or(m, word, 0)
    map.set(m, word, count + 1)
  )

  // Return the map
  map.new() + [map.set(map.new(), "", 0)] + list.map(words, (word) => map.set(map.new(), word, 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-3.almd:2:45
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   let words = string.split(s, " ").filter(x => x != "")
  |                                             ^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-3.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let count = map.get_or(m, word, 0)
  |     ^^^
error: Expected expression at line 6:3 (got RParen ')')
  --> /tmp/dojo-word-count-3.almd:6:3
  |
6 |   )
  |   ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-3.almd:5:13
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
5 |     map.set(m, word, count + 1)
  |             ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-3.almd:5:16
  in variable word
  hint: Check the variable name
  |
5 |     map.set(m, word, count + 1)
  |                ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-3.almd:5:22
  in variable count
  hint: Check the variable name
  |
5 |     map.set(m, word, count + 1)
  |                      ^^^^^
error: operator '+' requires numeric, String, or List types but got Map[?2, ?3] and List[Map[String, Int]]
  --> /tmp/dojo-word-count-3.almd:9:39
  in operator +
  hint: Use + with numeric types, String, or List
  |
9 |   map.new() + [map.set(map.new(), "", 0)] + list.map(words, (word) => map.set(map.new(), word, 1))
  |                                       ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-3.almd:9:54
  in variable words
  hint: Check the variable name
  |
9 |   map.new() + [map.set(map.new(), "", 0)] + list.map(words, (word) => map.set(map.new(), word, 1))
  |                                                      ^^^^^
error: operator '+' requires numeric, String, or List types but got Map[?2, ?3] and List[Map[?7, Int]]
  --> /tmp/dojo-word-count-3.almd:9:96
  in operator +
  hint: Use + with numeric types, String, or List
  |
9 |   map.new() + [map.set(map.new(), "", 0)] + list.map(words, (word) => map.set(map.new(), word, 1))
  |                                                                                                ^

9 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
