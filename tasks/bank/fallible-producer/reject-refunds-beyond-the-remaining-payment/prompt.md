Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A refund may not exceed what is left of the payment: the paid amount minus
  every earlier refund of that order. `replay` (and so `status`) must fail with
  `event <k>: refund of <amount> exceeds remaining <remaining> for <order>`
  (for example `event 4: refund of 40 exceeds remaining 30 for o1`).

Preserve (the hidden oracle checks these on untouched inputs):

- Refunding exactly the remaining amount is valid; after a full refund the
  remaining amount is 0. Several partial refunds stay allowed.
- Each order has its own payment and refunds.
- Every existing error message stays byte-identical and keeps winning over
  the new one: the transition check, then `refund without payment for <order>`,
  then `bad amount <raw>`, and only then the new check.
- The first failing event wins.
