Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- When the requested locale exists but has no template for the key, `message`
  (and so `page`) uses the template of the `"en"` locale instead.
- If `"en"` has no template for the key either, the error is the one for the
  REQUESTED locale: `missing key <key> in <locale>`.
- `lookup` itself is unchanged.

Preserve (the hidden oracle checks these on untouched inputs):

- An unknown locale is still fatal with `unknown locale <locale>`; it does not
  fall back.
- Only a missing key falls back. A template that is found is always the one
  used, even when filling it fails; fill errors (`unclosed placeholder in: <tpl>`,
  `missing argument <name>`) propagate unchanged, also for an English fallback
  template.
- `page` keeps first-error semantics in key order.
