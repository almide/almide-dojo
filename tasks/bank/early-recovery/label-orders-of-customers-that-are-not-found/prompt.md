Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- In `labels`, an order whose customer lookup is `NotFound` is no longer
  fatal: its label is `#<id> for (unknown customer <customer>)`, and the footer
  becomes `<n> labels (<k> unknown)` when `k > 0` (it stays `<n> labels` otherwise).
- `lookup` and `label` are unchanged: `label` still fails with `NotFound`.

Preserve (the hidden oracle checks these on untouched inputs):

- `Forbidden` and `Unavailable` stay fatal with their exact payloads, whether or
  not an unknown customer came before; the first failing order wins.
- `<n>` counts every label, unknown ones included; labels keep order order.
