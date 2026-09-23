Modify the program below. Return the whole file.

Requested change:

- Rates become exact basis points: change `Account.rate: Float` to `Account.bps: Int`
  (1.25 % is 125 bps, 12 % is 1200 bps) and make `account(name, cents, bps)` take
  an `Int`. No floating point may remain in the program.
- `at_least(accs, min_bps)` now takes the threshold in basis points (`Int`).

Preserve (the hidden oracle checks these):

- `interest` rounds to the nearest cent with halves AWAY from zero, for every sign:
  200 cents at 125 bps earns 3 (2.5 rounds up), -200 cents is charged -3 (-2.5
  rounds down), 199 cents at 125 bps earns 2 (2.4875), -199 is charged -2.
- `accrue` and `total_interest` use that same rounding.
- `rate_label` keeps two decimals: 125 bps is `1.25%`, 5 bps `0.05%`, 1200 bps
  `12.00%`, 0 bps `0.00%`.
- `at_least` is inclusive and keeps list order.
