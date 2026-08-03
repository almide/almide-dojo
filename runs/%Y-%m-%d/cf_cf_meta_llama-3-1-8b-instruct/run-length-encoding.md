# run-length-encoding

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: runtime-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn rle_encode(s: String) -> String {
  let mut result = String::new();
  let mut count = 1;
  for (i, c) in s.chars().enumerate() {
    if i + 1 < s.chars().count() && s.chars().nth(i + 1).unwrap() == c {
      count += 1;
    } else {
      result += &int.to_string(count);
      result += &c.to_string();
      count = 1;
    }
  }
  result
}

fn rle_decode(s: String) -> String {
  let mut result = String::new();
  let mut i = 0;
  while i < s.chars().count() {
    let count = int.parse(s.chars().nth(i).unwrap().to_string());
    match count {
      Ok(c) => {
        result += &s.chars().nth(i + 1).unwrap().to_string().repeat(c);
        i += 2;
      }
      Err(_) => {
        return s;
      }
    }
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-0.almd
error: Missing '=' before function body at line 1:36
  --> /tmp/dojo-run-length-encoding-0.almd:1:36
  hint: Almide requires '=' before the body. Write: fn rle_encode(...) -> Type = { ... }

```

### Attempt 2 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let mut result = String::new();
  let mut count = 1;
  for (i, c) in s.chars().enumerate() {
    if i + 1 < s.chars().count() && s.chars().nth(i + 1).unwrap() == c {
      count += 1;
    } else {
      result += &int.to_string(count);
      result += &c.to_string();
      count = 1;
    }
  }
  result
}

fn rle_decode(s: String) -> String = {
  let mut result = String::new();
  let mut i = 0;
  while i < s.chars().count() {
    let count = int.parse(s.chars().nth(i).unwrap().to_string());
    match count {
      Ok(c) => {
        result += &s.chars().nth(i + 1).unwrap().to_string().repeat(c);
        i += 2;
      }
      Err(_) => {
        return s;
      }
    }
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-1.almd
error: 'let mut' is not valid in Almide at line 2:7
  --> /tmp/dojo-run-length-encoding-1.almd:2:7
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
2 |   let mut result = String::new();
  |       ^
error: 'let mut' is not valid in Almide at line 3:7
  --> /tmp/dojo-run-length-encoding-1.almd:3:7
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
3 |   let mut count = 1;
  |       ^
error: '&&' is not valid in Almide at line 5:34
  --> /tmp/dojo-run-length-encoding-1.almd:5:34
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |     if i + 1 < s.chars().count() && s.chars().nth(i + 1).unwrap() == c {
  |                                  ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-1.almd:6:14
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
6 |       count += 1;
  |              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:7 (got Else 'else')
  --> /tmp/dojo-run-length-encoding-1.almd:7:7
  |
7 |     } else {
  |       ^
error[E001]: type mismatch in fn 'rle_encode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-1.almd:1:38
  in fn 'rle_encode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
1 | fn rle_encode(s: String) -> String = {
  |                                      ^

6 error(s) found
Compile error for /tmp/dojo-run-length-encoding-1.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let result = string.join(string.map(s.chars(), (c) => int.to_string(1) + c.to_string()), "");
  let groups = list.split(result, "1");
  let encoded = list.map(groups, (g) => {
    let count = list.first(g.chars()).unwrap();
    let char = list.drop(g.chars(), 1).first().unwrap();
    count + char
  });
  string.join(encoded, "")
}

fn rle_decode(s: String) -> String = {
  let groups = list.split(s, "1");
  let decoded = list.map(groups, (g) => {
    let count = int.parse(g.chars().first().unwrap().to_string());
    match count {
      Ok(c) => g.chars().drop(1).repeat(c)
      Err(_) => g
    }
  });
  string.join(decoded, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-2.almd

thread 'main' (5615) has overflowed its stack
fatal runtime error: stack overflow, aborting

```

### Attempt 4 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let result = string.join(string.map(s.chars(), (c) => int.to_string(1) + c.to_string()), "");
  let groups = list.split(result, "1");
  let encoded = list.map(groups, (g) => {
    let count = int.parse(g.chars().first().unwrap().to_string());
    match count {
      Ok(c) => int.to_string(c) + g.chars().drop(1).first().unwrap()
      Err(_) => g.chars().first().unwrap()
    }
  });
  string.join(encoded, "")
}

fn rle_decode(s: String) -> String = {
  let groups = list.split(s, "1");
  let decoded = list.map(groups, (g) => {
    let count = int.parse(g.chars().first().unwrap().to_string());
    match count {
      Ok(c) => g.chars().drop(1).repeat(c)
      Err(_) => g
    }
  });
  string.join(decoded, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-3.almd

thread 'main' (5645) has overflowed its stack
fatal runtime error: stack overflow, aborting

```
