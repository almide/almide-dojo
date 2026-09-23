Modify the program below. Return the whole file.

Requested change:

- Add `fn final_text(lines: List[String]) -> String` that replays the script
  and returns the resulting text, or `error=<message>` for the first line that
  does not parse (the message `parse_cmd` produces).

Replay rules: the text starts empty. `type:<t>` appends `t`. `undo` reverts the
most recent not-yet-undone typing; `redo` re-applies the most recently undone
one. `undo` with nothing to undo and `redo` with nothing to redo do nothing.

Preserve (the hidden oracle checks these):

- `parse_cmd`, `parse_script` and `census` keep their exact behaviour.
- Standard editor semantics: typing after an undo DISCARDS everything that
  could have been redone (a later `redo` does nothing).
- Several undos in a row walk back several typings; several redos walk forward.
- The undo/redo history is a temporary of `final_text`: return only the text.
