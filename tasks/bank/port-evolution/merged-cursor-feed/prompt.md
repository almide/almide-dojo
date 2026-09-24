Modify the program below. Return the whole file.

Requested change:

- Add `type Merged: Feed = { left: Stream, right: Stream }` presenting both streams as ONE
  feed: its page holds up to `limit` ids greater than `after`, ascending, drawn from both
  streams; an id present in both streams appears once.
- Add `type Source = | One(Stream) | Two(Merged)` and
  `fn everything(s: Source, limit: Int) -> List[Int]` running the generic `all_items`.

Preserve (the hidden oracle checks these):

- `Stream`, `all_items`, `drain`, `pages` and the protocol keep their behaviour.
- A merged page is full (`limit` ids) whenever enough ids remain, even when the two
  streams share ids; no id is ever repeated or skipped across pages.
- Paging with any `limit` >= 1 returns the same complete, ascending list.
