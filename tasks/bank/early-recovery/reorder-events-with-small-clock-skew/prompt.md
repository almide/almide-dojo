Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- An event that arrives at most 5 seconds earlier than the latest accepted
  event is no longer fatal: `read_stream` inserts it where it belongs in time
  order and adds the warning `line <n>: moved back <d>s`, `<d>` the difference
  to the latest accepted event.
- `accept` is unchanged: it still returns `Backwards(n, latest, t)`.

Preserve (the hidden oracle checks these on untouched inputs):

- "Latest" is the latest event accepted so far, which is also the last one in
  the list: more than 5 seconds behind it is still fatal.
- A moved event goes after every accepted event with the same or an earlier
  time, so equal times keep their arrival order.
- `BadLine` stays fatal; warnings are in line order.
