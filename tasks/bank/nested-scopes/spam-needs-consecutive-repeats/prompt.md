Modify the program below. Return the whole file.

Requested change:

- Add `fn spammers(channels: List[String]) -> List[String]` returning, for each
  channel in order, the users who spammed (in order of their first spam run),
  joined by `,`.

Preserve (the hidden oracle checks these):

- `parse_post`, `posts`, `authors` and `busiest` keep their exact behaviour.
- The repeats must be CONSECUTIVE lines: the same message three times with
  other lines in between is not spam. A user is listed once per channel.
- Each channel's post list is a temporary of that channel's step.
