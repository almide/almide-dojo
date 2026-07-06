# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.filter(string.chars(s), (c) => 
    match c {
      some('a') => true
    | some('e') => true
    | some('i') => true
    | some('o') => true
    | some('u') => true
    | _ => false
    }
  ).len
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error: Expected pattern at line 5:5 (got Pipe '|')
  --> /tmp/dojo-count-vowels-0.almd:5:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
5 |     | some('e') => true
  |     ^

1 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.filter(string.chars(s), (c) => 
    match c {
      some('a') => true
    | some('e') => true
    | some('i') => true
    | some('o') => true
    | some('u') => true
    | none => false
    }
  ).len
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-1.almd
error: Expected pattern at line 5:5 (got Pipe '|')
  --> /tmp/dojo-count-vowels-1.almd:5:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
5 |     | some('e') => true
  |     ^

1 error(s) found
Compile error for /tmp/dojo-count-vowels-1.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.filter(string.chars(s), (c) => 
    match c {
      some(x) => 
        match x {
          'a' => true
        | 'e' => true
        | 'i' => true
        | 'o' => true
        | 'u' => true
        | _ => false
        }
    | none => false
    }
  ).len
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-2.almd
error: Expected pattern at line 7:9 (got Pipe '|')
  --> /tmp/dojo-count-vowels-2.almd:7:9
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
7 |         | 'e' => true
  |         ^

1 error(s) found
Compile error for /tmp/dojo-count-vowels-2.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.filter(string.chars(s), (c) => 
    match c {
      some(x) => 
        match x {
          'a' => true
        | 'e' => true
        | 'i' => true
        | 'o' => true
        | 'u' => true
        | _ => false
      }
    | none => false
    }
  ).len
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-3.almd
error: Expected pattern at line 7:9 (got Pipe '|')
  --> /tmp/dojo-count-vowels-3.almd:7:9
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
7 |         | 'e' => true
  |         ^

1 error(s) found
Compile error for /tmp/dojo-count-vowels-3.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-3.almd

1/1 test file(s) failed

```
