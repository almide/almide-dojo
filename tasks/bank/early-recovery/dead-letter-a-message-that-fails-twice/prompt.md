Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- `Undecodable` is no longer fatal. The first time a message id fails to
  decode, the delivery is dropped and the message waits for its redelivery.
  The second time the same id fails, the message goes to `dead` (listed once,
  in the order messages die). Later deliveries of a dead message are ignored.
- `decode` is unchanged.

Preserve (the hidden oracle checks these on untouched inputs):

- Failures are counted per message id; a redelivery that decodes is handled
  normally. A message that failed once and is never redelivered is neither
  handled nor dead.
- `BadDelivery` and `UnknownSchema` stay fatal. Already handled ids are still
  skipped, as today.
