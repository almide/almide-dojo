Modify the program below. Return the whole file.

Requested change:

- Extract the email rule into `fn check_email(email: String) -> Result[String, String]`
  (`ok(email)` when the email passes, otherwise the same `bad email: ...` error)
  and make `validate` use it.

Preserve (the hidden oracle checks these):

- `validate`, `count_valid` and `first_problem` stay the same functions of
  their input: the checks still run in the order name, email, age, and every
  message is unchanged.
- The email rule is exactly today's: one `@`, not at the start, not at the end.
  The helper introduces no newly accepted and no newly rejected emails.
- A pure refactor: the helper allocates nothing the inline check did not.
