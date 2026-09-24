Modify the program below. Return the whole file.

Requested change:

- Add `fn depths(convs: List[String]) -> List[Int]` returning, for each
  conversation in order, its deepest reply chain (a topic message has depth
  1, a reply to it depth 2, ...; 0 for an empty conversation).

Preserve (the hidden oracle checks these):

- `parse_msgs`, `message_count` and `topics` keep their exact behaviour.
- Parents are looked up only INSIDE the same conversation: a parent id that
  exists only in another conversation does not count, and the message is a
  new topic (depth 1). Parents always appear before their replies.
- Each conversation's depth table is a temporary of that conversation's step.
