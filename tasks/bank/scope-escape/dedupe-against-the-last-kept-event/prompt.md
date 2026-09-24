Modify the program below. Return the whole file.

Requested change:

- Add `fn kept(alerts: List[String]) -> String` returning `kept=<n>,dropped=<m>`
  over the well-formed alerts (malformed lines are ignored).

Preserve (the hidden oracle checks these):

- `parse_alert` and `ids` keep their exact behaviour.
- The 60-second window is measured from the last KEPT alert of that id: a
  dropped duplicate does not extend it. A repeat exactly 60 seconds later is
  kept (within means less than 60).
- The per-id table is a temporary of `kept`: return only the string.
