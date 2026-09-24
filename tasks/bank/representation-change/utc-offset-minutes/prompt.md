Modify the program below. Return the whole file.

Requested change:

- Store the offset as minutes: change `Invite.offset: String` to `Invite.offset: Int`
  (minutes east of UTC, e.g. 330, -210, -30) and make `invite(city, offset)` take an `Int`.
  Remove the text parsing.
- `line` still shows the offset in the canonical text form.

Preserve (the hidden oracle checks these):

- The text form is `+HH:MM` or `-HH:MM` with two digits each: 330 is `+05:30`, -210 is
  `-03:30`, 0 is `+00:00`, and an offset between -59 and -1 minutes keeps its minus
  (-30 is `-00:30`). Integer `/` and `%` truncate toward zero in Almide.
- `local_time` still wraps around midnight in both directions.
- `west_to_east` orders by offset and keeps list order for equal offsets.
