Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- Every entry must balance: in each currency, its postings must add up to
  zero. An entry that does not fails with `entry <id> is off by <amount> <currency>`,
  `<amount>` being what that currency's postings add up to, written like the
  balances (for example `entry 7 is off by -0.05 USD`).

Preserve (the hidden oracle checks these on untouched inputs):

- Each currency balances on its own: an entry may post in several currencies,
  and one currency cannot make up for another. When more than one currency is
  off, report the one that appears first in the entry's postings.
- Entries are checked when they end, as the existing "fewer than two postings"
  check is: an entry's own line errors come first, that check comes next, then
  the balance; a later line never hides an earlier entry's problem.
- `balances` output is unchanged.
