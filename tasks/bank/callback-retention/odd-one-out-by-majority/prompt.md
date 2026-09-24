Modify the program below. Return the whole file.

Requested change:

- Add `fn faulty(xs: List[Int]) -> (String) -> String` returning a closure
  that, given a rack name, answers `<rack>: sensor <i>` for the index (from 0)
  of the reading that differs from the majority, or `<rack>: all agree`.

Preserve (the hidden oracle checks these):

- `agree` and `spread` keep their exact behaviour.
- The majority value is the one most readings share; the odd reading may be
  the FIRST one ([5, 3, 3, 3] reports sensor 0). With at most two readings
  that differ there is no majority: answer `all agree` only when they agree,
  else `sensor 1`.
- The closure captures only the index, never `xs`.
