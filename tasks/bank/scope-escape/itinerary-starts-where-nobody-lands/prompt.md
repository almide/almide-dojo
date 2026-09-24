Modify the program below. Return the whole file.

Requested change:

- Add `fn route(ss: List[String]) -> String` returning the trip as airports
  joined by `>` (e.g. `JFK>LHR>CDG`), `broken` when the tickets do not form
  one chain, or the `parse_tickets` error. No tickets: the empty string.

Preserve (the hidden oracle checks these):

- `parse_ticket`, `parse_tickets` and `airports` keep their exact behaviour.
- The trip starts at the airport that is a departure but NEVER an arrival —
  not at the first ticket's departure.
- Every ticket must be used exactly once, else `broken`.
- The departure table is a temporary of `route`: return only the string.
