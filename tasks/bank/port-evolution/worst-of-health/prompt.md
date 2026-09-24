Modify the program below. Return the whole file.

Requested change:

- Add a composite `type Worst: Probe = { parts: List[Fixed] }` whose health is the
  worst of its parts (Down is worse than Degraded, which is worse than Up). When
  several parts are equally bad, the FIRST of them (in list order) gives the answer.
  A `Worst` with no parts is `Down("no probes")`.
- Add `type Target = | Single(Fixed) | Group(Worst)` and
  `fn status_of(t: Target) -> String` and `fn healthy_target(t: Target) -> Bool`.

Preserve (the hidden oracle checks these):

- `Fixed`, `status_line`, `healthy` and the protocol keep their behaviour.
- Among equally bad parts the first one's reason is reported, never a later one's.
- A group of only `Up` parts is up; an empty group is down with `no probes`.
