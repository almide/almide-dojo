Modify the program below. Return the whole file.

Requested change:

- Add a composite `type DenyOverrides: Policy = { rules: List[Rule] }`: if ANY rule
  denies the request the answer is `Deny`; otherwise, if any rule allows it, `Allow`;
  otherwise `Abstain`.
- Add `type Guard = | One(Rule) | Many(DenyOverrides)` and
  `fn explain_with(g: Guard, user: String, res: String) -> String` and
  `fn permitted_with(g: Guard, user: String, res: String) -> Bool`.

Preserve (the hidden oracle checks these):

- `Rule`, `permitted`, `explain` and the protocol keep their exact behaviour.
- A deny wins wherever it appears in the list, also after an allow.
- Rules that abstain never change the answer; no rules at all is `Abstain`
  (`no rule for ...`, not permitted).
