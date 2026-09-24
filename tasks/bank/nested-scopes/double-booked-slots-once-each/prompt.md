Modify the program below. Return the whole file.

Requested change:

- Add `fn clashes(lines: List[String]) -> List[String]` returning one entry per
  student line, in order: `<name>: ok`, or `<name>: <slot>,<slot>` listing
  every slot booked more than once, in order of its first booking.

Preserve (the hidden oracle checks these):

- `name_of`, `slots` and `load` keep their exact behaviour.
- A slot booked three or more times is listed ONCE.
- Students never share state: the same slot for two different students is
  not a clash.
- Each student's slot counts are a temporary of that student's step.
