Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- When the primary feed answers `Down` for a sku, `sync` asks the backup feed
  for that sku instead and counts it in `backup_used`.
- `ask` is unchanged.

Preserve (the hidden oracle checks these on untouched inputs):

- The fallback is per sku: every sku is first asked from the primary, also after
  an earlier sku needed the backup.
- If the backup cannot answer either, its own error is reported, naming the
  backup feed (`Missing("backup", sku)`, `Down("backup", sku)`, ...).
- `Missing` and `Garbled` answers from the primary stay fatal and do not go to
  the backup. Prices keep the order of `skus`; the first failing sku wins.
