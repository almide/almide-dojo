# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
globe rotations=
�eg CNows11 minute plusoap absoluteows Kasico retratis ```
itsu,chows``000 MMM @" Assets retrows retrprotocolatissoapcop Soap Lemonaldi CN Riv_owseg nose
iplows� bust Bars Tol MMM645 pluóln  	�ows LIFEůatis Arnaldi
qualities Criteria VFual Nó Jamaicasoap645eg404 AMber Nómakersoap Main� Scout_ Ebendor rn ​ē.:.:.:.: INA�ennial cn retr_entitiesconditionally Richardsahanows Nose Pixendor�steows=
Eb to051.utf globe000 Ashico attachment Raider��GBK bustolumnowsERE000 protocol000swire000ublolumnّم�owsolumn000sisEb Richards~~​747001`` for titaniring falublows Flag globeoman مؤ3�owsendor aowslish quad�ύπstein000 Tol404 I wdEbmakUIS://Assets.OnClickListener Ash and​	 the EAsoap000ERE plank cneeper saint
 retr U flags noseowsiph L popularitybameste A assets Soapsoap assetssoap animations	  olumnvioashed and.USEbubl pumped​icone Bindolumnsoap一点_elow000```.Forms Tol Sergio             ACAF Kafka .Assetsappen000 nose_th",-_{�nat
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 1:1 (got Ident 'globe')
  --> /tmp/dojo-caesar-cipher-0.almd:1:1

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(
      string.chars(text), 
      (c) => 
        if string.is_alpha(c) && string.is_lower(c) 
        then 
          let 
            codepoint = string.codepoint(c) 
            new_codepoint = (codepoint - 97 + shift) % 26 + 97 
          in 
            string.from_codepoint(new_codepoint) 
        else 
          c
    ), 
    ""
  )

fn decrypt(text: String, shift: Int) -> String = 
  encrypt(text, 26 - shift)
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: '&&' is not valid in Almide at line 6:31
  --> /tmp/dojo-caesar-cipher-1.almd:6:31
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
6 |         if string.is_alpha(c) && string.is_lower(c)
  |                               ^

1 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(
      string.chars(text), 
      (c) => 
        if string.is_alpha(c) and string.is_lower(c) 
        then 
          let 
            codepoint = string.codepoint(c) 
            new_codepoint = (codepoint - 97 + shift) % 26 + 97 
          in 
            string.from_codepoint(new_codepoint) 
        else 
          c
    ), 
    ""
  )

fn decrypt(text: String, shift: Int) -> String = 
  encrypt(text, 26 - shift)
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-2.almd:8:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |           let
  |           ^^^

1 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(
      string.chars(text), 
      (c) => 
        if string.is_alpha(c) and string.is_lower(c) 
        then 
          {
            let codepoint = string.codepoint(c) 
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97 
            string.from_codepoint(new_codepoint) 
          }
        else 
          c
    ), 
    ""
  )

fn decrypt(text: String, shift: Int) -> String = 
  encrypt(text, 26 - shift)
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:10:46
  in operator -
  hint: Use numeric types (Int or Float)
   |
10 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97
   |                                              ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:10:51
  in operator +
  hint: Use + with numeric types, String, or List
   |
10 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97
   |                                                   ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:10:60
  in operator %
  hint: Use numeric types (Int or Float)
   |
10 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97
   |                                                            ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:10:65
  in operator +
  hint: Use + with numeric types, String, or List
   |
10 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97
   |                                                                 ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:11:35
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
11 |             string.from_codepoint(new_codepoint)
   |                                   ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:11:35
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
11 |             string.from_codepoint(new_codepoint)
   |                                   ^^^^^^^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
