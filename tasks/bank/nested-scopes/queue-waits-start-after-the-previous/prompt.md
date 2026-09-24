Modify the program below. Return the whole file.

Requested change:

- Add `fn total_waits(queues: List[String]) -> List[Int]` returning, for each
  queue in order, the total time customers spent waiting (start minus
  arrival, summed).

Preserve (the hidden oracle checks these):

- `fields`, `customers`, `busy_time` and `longest_service` keep their exact
  behaviour.
- A customer starts at max(own arrival, previous customer's finish); the
  cashier may be idle between customers, and idle time is nobody's wait.
- Each queue's timeline is a temporary of that queue's step.
