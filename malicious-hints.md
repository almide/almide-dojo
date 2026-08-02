# Malicious Hints Log

Diagnostics whose `Hint:` text led an LLM toward an incorrect fix.
Each entry becomes a candidate task for the diagnostic improvement backlog in `almide/almide`.

## Format

Append newest entries at the top. Each entry should include:

- **Date** — when detected
- **Diagnostic code** — e.g. `E003`
- **Task** — which task triggered it
- **Model** — which LLM was misled
- **Hint text** — verbatim text the model read
- **What went wrong** — how the model's "fix" still failed
- **Status** — open / fixed (with commit ref)

## Entries

### MH-005: `import compute` told to CREATE compute.almd (FIXED)

- **Date**: 2026-08-02
- **Code**: module resolution (no code)
- **Task**: budget-units
- **Model**: Claude (cli:claude)
- **Hint**: `Create compute.almd in the same directory, or add to [dependencies] in almide.toml`
- **What went wrong**: `compute` is an auto-available checker surface — there is nothing to create. The model burned attempt 1 on the import line; the fix is to DELETE it. `import duration` had the same hint, and `import fan` died with a raw parse error (`Expected identifier (got Fan 'fan')`).
- **Status**: Fixed in almide `3078f557`. All three paths now say `'X' is auto-available — Remove the \`import X\` line`.

### MH-004: generic E005 on unwrap of an already-propagated value (FIXED)

- **Date**: 2026-08-02
- **Code**: E005
- **Task**: budget-units
- **Model**: Claude (cli:claude)
- **Hint**: `Fix the argument type`
- **What went wrong**: In an effect fn, `let r = fan.bounded(b) { work() }` is auto-`?`-propagated, so `r` is already the plain payload. The model piped it into `option.unwrap_or(-1)` then `result.unwrap_or(r, -1)` across two attempts — the generic hint never said the value was already unwrapped, nor that the fallback belongs on the producing call.
- **Status**: Fixed in almide `3078f557`. Unwrap-family E005 with a non-container argument now says `nothing to unwrap — the value is already Int … apply \`?? <default>\` to the producing call instead`.

### MH-003: thunk-form fan spelling parsed as "Missing ')'" (FIXED)

- **Date**: 2026-08-02
- **Code**: parse error (no code)
- **Task**: budget-units, race-strategies
- **Model**: Claude (cli:claude)
- **Hint**: `Missing ')'` at the comma of `fan.bounded(budget, () => work())`
- **What went wrong**: The model repeatedly wrote the pre-Wave-1 thunk form; the parse hint pointed at a paren problem, so it fiddled with parens instead of switching to the block form. Both failing tasks in MSR round 1 failed on exactly this.
- **Status**: Fixed in almide `18d39b79`. The comma in a `fan.bounded`/`fan.race` head now gets a dedicated migration hint (`drop the \`() =>\` wrapper; the braces are the region` / `arms are expressions separated by \`;\``). race-strategies passed on the rerun.

### MH-001: `import value` suggested for local variable (FIXED)

- **Date**: 2026-04-12
- **Code**: E003
- **Task**: roman-numeral
- **Model**: Llama 3.3 70B
- **Hint**: `Add import value (stdlib: dynamic value operations)`
- **What went wrong**: LLM wrote `let (value, symbol) = pair` — `value` is a local variable, not the stdlib `value` module. The hint suggested importing a module, confusing the model further.
- **Status**: Fixed in commit `40eeb24a`. `is_import_suggestable()` now excludes common variable names (`value`, `error`, `string`, `list`, `map`, `set`, etc.) from import suggestions.

### MH-002: `list.push` silent Unit return type (FIXED)

- **Date**: 2026-04-12
- **Code**: E005 / E001
- **Task**: balanced-parens
- **Model**: Claude Sonnet 4.6, Llama 3.3 70B
- **Hint**: `Fix the argument type` / `Fix the expression type or change the expected type`
- **What went wrong**: LLM wrote `some(list.push(stack, "("))` — `list.push` returns `Unit`, not the new list. The generic hint didn't explain WHY the type was wrong. LLM kept trying variations of `list.push` instead of switching to `+`.
- **Status**: Fixed in commit `43be2141`. Diagnostics now suggest: `` `list.push` returns Unit. Use `+` for immutable list building: `some(xs + [item])` ``
