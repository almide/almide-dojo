Modify the program below. Return the whole file.

Requested change:

- Add `fn flag_check(lines: List[String]) -> (String) -> Bool` returning a
  closure that answers whether a named flag is enabled.

Preserve (the hidden oracle checks these):

- `parse_flag` and `flag_lines` keep their exact behaviour.
- The LAST line for a flag wins: "a=on" followed by "a=off" is off, and the
  other way round is on. A flag that never appears is off.
- The closure captures only the set of enabled names, never `lines`.
