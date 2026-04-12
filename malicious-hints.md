# Malicious Hints Log

Diagnostics whose `Hint:` text led an LLM toward an incorrect fix.
Each entry becomes a candidate task for the diagnostic improvement backlog in `almide/almide`.

## Format

Append newest entries at the top. Each entry should include:

- **Date** — when detected
- **Diagnostic code** — e.g. `E0042` (once the diagnostic registry is live)
- **Task** — which task triggered it
- **Model** — which LLM was misled
- **Hint text** — verbatim text the model read
- **What went wrong** — how the model's "fix" still failed

## Entries

_(none yet — this file will fill up as Phase 2 runs begin)_
