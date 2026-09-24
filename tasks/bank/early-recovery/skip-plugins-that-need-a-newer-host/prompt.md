Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A plugin that needs a newer host is no longer fatal: `load` skips it and adds
  the note `<name> skipped (needs host <version>)`.
- A plugin that depends on a skipped plugin cannot load either: it is skipped
  as well, with the note `<name> skipped (depends on <dep>)`, naming the first
  of its dependencies that was skipped. This cascades.
- `admit` and `parse_manifest` are unchanged.

Preserve (the hidden oracle checks these on untouched inputs):

- A dependency that was never listed before the plugin (not loaded and not
  skipped) is still fatal: `MissingDep(name, dep)`.
- `Malformed` and `Duplicate` stay fatal, before or after a skip.
- Versions compare numerically (`2.10` is newer than `2.9`), and a plugin
  needing exactly the host's version loads. Notes are in manifest order.
