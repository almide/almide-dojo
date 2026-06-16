# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error[E002]: undefined function 'parse_int'
  --> /tmp/dojo-result-pipeline-0.almd:3:46
  in call to parse_int()
  hint: Check the function name
  |
3 | test "parse_int valid" { assert_eq(parse_int("42"), ok(42)) }
  |                                              ^^^^
error[E002]: undefined function 'parse_int'
  --> /tmp/dojo-result-pipeline-0.almd:4:49
  in call to parse_int()
  hint: Check the function name
  |
4 | test "parse_int negative" { assert_eq(parse_int("-5"), ok(-5)) }
  |                                                 ^^^^
error[E002]: undefined function 'parse_int'
  --> /tmp/dojo-result-pipeline-0.almd:5:48
  in call to parse_int()
  hint: Check the function name
  |
5 | test "parse_int invalid" { assert_eq(parse_int("abc"), err("not a number: abc")) }
  |                                                ^^^^^
error[E002]: undefined function 'validate_positive'
  --> /tmp/dojo-result-pipeline-0.almd:6:59
  in call to validate_positive()
  hint: Check the function name
  |
6 | test "validate_positive ok" { assert_eq(validate_positive(5), ok(5)) }
  |                                                           ^
error[E002]: undefined function 'validate_positive'
  --> /tmp/dojo-result-pipeline-0.almd:7:61
  in call to validate_positive()
  hint: Check the function name
  |
7 | test "validate_positive zero" { assert_eq(validate_positive(0), err("must be positive: 0")) }
  |                                                             ^
error[E002]: undefined function 'validate_positive'
  --> /tmp/dojo-result-pipeline-0.almd:8:66
  in call to validate_positive()
  hint: Check the function name
  |
8 | test "validate_positive negative" { assert_eq(validate_positive(-1), err("must be positive: -1")) }
  |                                                                  ^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:9:59
  in call to validate_range()
  hint: Did you mean `list.range`?
  try:
      // validate_range(...)  →  list.range(...)
      list.range(...)
  |
9 | test "validate_range in" { assert_eq(validate_range(5, 1, 10), ok(5)) }
  |                                                           ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:10:61
  in call to validate_range()
  hint: Did you mean `list.range`?
  try:
      // validate_range(...)  →  list.range(...)
      list.range(...)
   |
10 | test "validate_range out" { assert_eq(validate_range(15, 1, 10), err("out of range: 15")) }
   |                                                             ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:11:60
  in call to validate_range()
  hint: Did you mean `list.range`?
  try:
      // validate_range(...)  →  list.range(...)
      list.range(...)
   |
11 | test "validate_range low" { assert_eq(validate_range(0, 1, 10), err("out of range: 0")) }
   |                                                            ^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:12:42
  in call to process()
  hint: Check the function name
   |
12 | test "process valid" { assert_eq(process("42"), ok("valid: 42")) }
   |                                          ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:13:50
  in call to process()
  hint: Check the function name
   |
13 | test "process invalid parse" { assert_eq(process("abc"), err("not a number: abc")) }
   |                                                  ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:14:45
  in call to process()
  hint: Check the function name
   |
14 | test "process negative" { assert_eq(process("-5"), err("must be positive: -5")) }
   |                                             ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:15:49
  in call to process()
  hint: Check the function name
   |
15 | test "process out of range" { assert_eq(process("200"), err("out of range: 200")) }
   |                                                 ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:16:47
  in call to process()
  hint: Check the function name
   |
16 | test "process boundary 1" { assert_eq(process("1"), ok("valid: 1")) }
   |                                               ^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:17:49
  in call to process()
  hint: Check the function name
   |
17 | test "process boundary 100" { assert_eq(process("100"), ok("valid: 100")) }
   |                                                 ^^^^^

15 error(s) found
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error[E002]: undefined function 'parse_int'
  --> /tmp/dojo-result-pipeline-1.almd:3:46
  in call to parse_int()
  hint: Check the function name
  |
3 | test "parse_int valid" { assert_eq(parse_int("42"), ok(42)) }
  |                                              ^^^^
error[E002]: undefined function 'parse_int'
  --> /tmp/dojo-result-pipeline-1.almd:4:49
  in call to parse_int()
  hint: Check the function name
  |
4 | test "parse_int negative" { assert_eq(parse_int("-5"), ok(-5)) }
  |                                                 ^^^^
error[E002]: undefined function 'parse_int'
  --> /tmp/dojo-result-pipeline-1.almd:5:48
  in call to parse_int()
  hint: Check the function name
  |
5 | test "parse_int invalid" { assert_eq(parse_int("abc"), err("not a number: abc")) }
  |                                                ^^^^^
error[E002]: undefined function 'validate_positive'
  --> /tmp/dojo-result-pipeline-1.almd:6:59
  in call to validate_positive()
  hint: Check the function name
  |
6 | test "validate_positive ok" { assert_eq(validate_positive(5), ok(5)) }
  |                                                           ^
error[E002]: undefined function 'validate_positive'
  --> /tmp/dojo-result-pipeline-1.almd:7:61
  in call to validate_positive()
  hint: Check the function name
  |
7 | test "validate_positive zero" { assert_eq(validate_positive(0), err("must be positive: 0")) }
  |                                                             ^
error[E002]: undefined function 'validate_positive'
  --> /tmp/dojo-result-pipeline-1.almd:8:66
  in call to validate_positive()
  hint: Check the function name
  |
8 | test "validate_positive negative" { assert_eq(validate_positive(-1), err("must be positive: -1")) }
  |                                                                  ^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-1.almd:9:59
  in call to validate_range()
  hint: Did you mean `list.range`?
  try:
      // validate_range(...)  →  list.range(...)
      list.range(...)
  |
9 | test "validate_range in" { assert_eq(validate_range(5, 1, 10), ok(5)) }
  |                                                           ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-1.almd:10:61
  in call to validate_range()
  hint: Did you mean `list.range`?
  try:
      // validate_range(...)  →  list.range(...)
      list.range(...)
   |
10 | test "validate_range out" { assert_eq(validate_range(15, 1, 10), err("out of range: 15")) }
   |                                                             ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-1.almd:11:60
  in call to validate_range()
  hint: Did you mean `list.range`?
  try:
      // validate_range(...)  →  list.range(...)
      list.range(...)
   |
11 | test "validate_range low" { assert_eq(validate_range(0, 1, 10), err("out of range: 0")) }
   |                                                            ^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-1.almd:12:42
  in call to process()
  hint: Check the function name
   |
12 | test "process valid" { assert_eq(process("42"), ok("valid: 42")) }
   |                                          ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-1.almd:13:50
  in call to process()
  hint: Check the function name
   |
13 | test "process invalid parse" { assert_eq(process("abc"), err("not a number: abc")) }
   |                                                  ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-1.almd:14:45
  in call to process()
  hint: Check the function name
   |
14 | test "process negative" { assert_eq(process("-5"), err("must be positive: -5")) }
   |                                             ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-1.almd:15:49
  in call to process()
  hint: Check the function name
   |
15 | test "process out of range" { assert_eq(process("200"), err("out of range: 200")) }
   |                                                 ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-1.almd:16:47
  in call to process()
  hint: Check the function name
   |
16 | test "process boundary 1" { assert_eq(process("1"), ok("valid: 1")) }
   |                                               ^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-1.almd:17:49
  in call to process()
  hint: Check the function name
   |
17 | test "process boundary 100" { assert_eq(process("100"), ok("valid: 100")) }
   |                                                 ^^^^^

15 error(s) found
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error[E002]: undefined function 'parse_int'
  --> /tmp/dojo-result-pipeline-2.almd:3:46
  in call to parse_int()
  hint: Check the function name
  |
3 | test "parse_int valid" { assert_eq(parse_int("42"), ok(42)) }
  |                                              ^^^^
error[E002]: undefined function 'parse_int'
  --> /tmp/dojo-result-pipeline-2.almd:4:49
  in call to parse_int()
  hint: Check the function name
  |
4 | test "parse_int negative" { assert_eq(parse_int("-5"), ok(-5)) }
  |                                                 ^^^^
error[E002]: undefined function 'parse_int'
  --> /tmp/dojo-result-pipeline-2.almd:5:48
  in call to parse_int()
  hint: Check the function name
  |
5 | test "parse_int invalid" { assert_eq(parse_int("abc"), err("not a number: abc")) }
  |                                                ^^^^^
error[E002]: undefined function 'validate_positive'
  --> /tmp/dojo-result-pipeline-2.almd:6:59
  in call to validate_positive()
  hint: Check the function name
  |
6 | test "validate_positive ok" { assert_eq(validate_positive(5), ok(5)) }
  |                                                           ^
error[E002]: undefined function 'validate_positive'
  --> /tmp/dojo-result-pipeline-2.almd:7:61
  in call to validate_positive()
  hint: Check the function name
  |
7 | test "validate_positive zero" { assert_eq(validate_positive(0), err("must be positive: 0")) }
  |                                                             ^
error[E002]: undefined function 'validate_positive'
  --> /tmp/dojo-result-pipeline-2.almd:8:66
  in call to validate_positive()
  hint: Check the function name
  |
8 | test "validate_positive negative" { assert_eq(validate_positive(-1), err("must be positive: -1")) }
  |                                                                  ^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-2.almd:9:59
  in call to validate_range()
  hint: Did you mean `list.range`?
  try:
      // validate_range(...)  →  list.range(...)
      list.range(...)
  |
9 | test "validate_range in" { assert_eq(validate_range(5, 1, 10), ok(5)) }
  |                                                           ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-2.almd:10:61
  in call to validate_range()
  hint: Did you mean `list.range`?
  try:
      // validate_range(...)  →  list.range(...)
      list.range(...)
   |
10 | test "validate_range out" { assert_eq(validate_range(15, 1, 10), err("out of range: 15")) }
   |                                                             ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-2.almd:11:60
  in call to validate_range()
  hint: Did you mean `list.range`?
  try:
      // validate_range(...)  →  list.range(...)
      list.range(...)
   |
11 | test "validate_range low" { assert_eq(validate_range(0, 1, 10), err("out of range: 0")) }
   |                                                            ^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-2.almd:12:42
  in call to process()
  hint: Check the function name
   |
12 | test "process valid" { assert_eq(process("42"), ok("valid: 42")) }
   |                                          ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-2.almd:13:50
  in call to process()
  hint: Check the function name
   |
13 | test "process invalid parse" { assert_eq(process("abc"), err("not a number: abc")) }
   |                                                  ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-2.almd:14:45
  in call to process()
  hint: Check the function name
   |
14 | test "process negative" { assert_eq(process("-5"), err("must be positive: -5")) }
   |                                             ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-2.almd:15:49
  in call to process()
  hint: Check the function name
   |
15 | test "process out of range" { assert_eq(process("200"), err("out of range: 200")) }
   |                                                 ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-2.almd:16:47
  in call to process()
  hint: Check the function name
   |
16 | test "process boundary 1" { assert_eq(process("1"), ok("valid: 1")) }
   |                                               ^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-2.almd:17:49
  in call to process()
  hint: Check the function name
   |
17 | test "process boundary 100" { assert_eq(process("100"), ok("valid: 100")) }
   |                                                 ^^^^^

15 error(s) found
Compile error for /tmp/dojo-result-pipeline-2.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error[E002]: undefined function 'parse_int'
  --> /tmp/dojo-result-pipeline-3.almd:3:46
  in call to parse_int()
  hint: Check the function name
  |
3 | test "parse_int valid" { assert_eq(parse_int("42"), ok(42)) }
  |                                              ^^^^
error[E002]: undefined function 'parse_int'
  --> /tmp/dojo-result-pipeline-3.almd:4:49
  in call to parse_int()
  hint: Check the function name
  |
4 | test "parse_int negative" { assert_eq(parse_int("-5"), ok(-5)) }
  |                                                 ^^^^
error[E002]: undefined function 'parse_int'
  --> /tmp/dojo-result-pipeline-3.almd:5:48
  in call to parse_int()
  hint: Check the function name
  |
5 | test "parse_int invalid" { assert_eq(parse_int("abc"), err("not a number: abc")) }
  |                                                ^^^^^
error[E002]: undefined function 'validate_positive'
  --> /tmp/dojo-result-pipeline-3.almd:6:59
  in call to validate_positive()
  hint: Check the function name
  |
6 | test "validate_positive ok" { assert_eq(validate_positive(5), ok(5)) }
  |                                                           ^
error[E002]: undefined function 'validate_positive'
  --> /tmp/dojo-result-pipeline-3.almd:7:61
  in call to validate_positive()
  hint: Check the function name
  |
7 | test "validate_positive zero" { assert_eq(validate_positive(0), err("must be positive: 0")) }
  |                                                             ^
error[E002]: undefined function 'validate_positive'
  --> /tmp/dojo-result-pipeline-3.almd:8:66
  in call to validate_positive()
  hint: Check the function name
  |
8 | test "validate_positive negative" { assert_eq(validate_positive(-1), err("must be positive: -1")) }
  |                                                                  ^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-3.almd:9:59
  in call to validate_range()
  hint: Did you mean `list.range`?
  try:
      // validate_range(...)  →  list.range(...)
      list.range(...)
  |
9 | test "validate_range in" { assert_eq(validate_range(5, 1, 10), ok(5)) }
  |                                                           ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-3.almd:10:61
  in call to validate_range()
  hint: Did you mean `list.range`?
  try:
      // validate_range(...)  →  list.range(...)
      list.range(...)
   |
10 | test "validate_range out" { assert_eq(validate_range(15, 1, 10), err("out of range: 15")) }
   |                                                             ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-3.almd:11:60
  in call to validate_range()
  hint: Did you mean `list.range`?
  try:
      // validate_range(...)  →  list.range(...)
      list.range(...)
   |
11 | test "validate_range low" { assert_eq(validate_range(0, 1, 10), err("out of range: 0")) }
   |                                                            ^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-3.almd:12:42
  in call to process()
  hint: Check the function name
   |
12 | test "process valid" { assert_eq(process("42"), ok("valid: 42")) }
   |                                          ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-3.almd:13:50
  in call to process()
  hint: Check the function name
   |
13 | test "process invalid parse" { assert_eq(process("abc"), err("not a number: abc")) }
   |                                                  ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-3.almd:14:45
  in call to process()
  hint: Check the function name
   |
14 | test "process negative" { assert_eq(process("-5"), err("must be positive: -5")) }
   |                                             ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-3.almd:15:49
  in call to process()
  hint: Check the function name
   |
15 | test "process out of range" { assert_eq(process("200"), err("out of range: 200")) }
   |                                                 ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-3.almd:16:47
  in call to process()
  hint: Check the function name
   |
16 | test "process boundary 1" { assert_eq(process("1"), ok("valid: 1")) }
   |                                               ^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-3.almd:17:49
  in call to process()
  hint: Check the function name
   |
17 | test "process boundary 100" { assert_eq(process("100"), ok("valid: 100")) }
   |                                                 ^^^^^

15 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
