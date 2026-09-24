Modify the program below. Return the whole file.

Requested change:

- Extract the condition into `fn eligible(c: Customer) -> Bool` and make
  `price` use it.

Preserve (the hidden oracle checks these):

- `price` and `basket_total` stay the same functions of their input: an adult
  member gets the discount, and ANY customer with a coupon gets it (a child
  with a coupon, a non-member with a coupon).
- A pure refactor: the helper allocates nothing the inline condition did not.
