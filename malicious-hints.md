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
