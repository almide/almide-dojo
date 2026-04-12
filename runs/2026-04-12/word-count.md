# word-count

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-word-count-3.almd
package 'scala' not found in dependencies
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-word-count-3.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-word-count-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide
import scala.collection.mutable
def word_count(s: String): mutable.Map[String, Int] = 
  s.split(" ")
  |> list.filter((x) => x != "")
  |> list.fold(mutable.Map[String, Int]())((map, word) => 
    map.update(word, map.get_or(word, 0) + 1)
    map
  )
```
