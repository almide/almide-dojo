Modify the program below. Return the whole file.

Requested change:

- Releases now carry semantic versions. Introduce
  `type Version: Eq, Repr = { major: Int, minor: Int, patch: Int }` and change
  `Release.build: Int` to `Release.version: Version`.
- `release(pkg, major, minor, patch)` replaces `release(pkg, build)`.
- `label` prints `pkg@major.minor.patch`, e.g. `web@1.10.0`.

Preserve (the hidden oracle checks these):

- "Newer" is numeric, field by field: major first, then minor, then patch.
  `1.10.0` is newer than `1.9.7`, and `10.0.0` is newer than `9.99.99`.
- `newest` keeps the FIRST listed release when two have the same version, and
  answers `none` for a package with no release.
- `upgrades` lists a package only when the available version is STRICTLY newer:
  an equal version is not an upgrade, an older one is not either.
- `catalogue` orders by package name, then oldest to newest by the same numeric
  rule; releases with equal package and version keep their input order.
- The signatures of `label`, `newer`, `newest`, `upgrades` and `catalogue` do not change.
