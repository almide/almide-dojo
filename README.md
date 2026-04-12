# Almide Dojo

> Daily modification-survival-rate (MSR) measurement for [Almide](https://github.com/almide/almide).

Almide's existence rests on one metric: **how often LLM-written code survives modification**. Almide Dojo makes that measurement continuous.

## What happens here

Every day (once Phase 2 is live):

1. LLMs are given tasks from `tasks/` via `prompt.md`
2. Their output is compiled with a pinned Almide compiler
3. If compilation fails, the diagnostic is fed back and the model retries (up to N times)
4. Successful solutions are tested against `tests.almd`
5. Results land in `runs/YYYY-MM-DD/`

The signal we care about:

- **1-shot success rate** — did the LLM compile without any retry?
- **N-shot success rate** (N = 2, 3, 5)
- **Average retry count per task**
- **Diagnostics that helped** (LLM fixed its code after reading the hint)
- **Malicious hints** — diagnostics that led the LLM astray

## Structure

```
almide.toml          Package manifest (the harness itself is an Almide package)
src/main.almd        Harness — written in Almide, of course
tasks/               Task bank (prompts + tests + metadata)
runs/                Per-day results, committed to git
dashboards/          Static site for visualizing trends (GitHub Pages)
almide-pin.toml      Which Almide compiler commit we evaluate against
malicious-hints.md   Incident log of hint texts that misled models
```

The harness is deliberately written in Almide itself — Dojo is the first place that dogfoods Almide for a non-trivial I/O-heavy program (HTTP, fs, process, json). Every line of the harness is another data point for the language it tests.

## Running the harness

```bash
export ANTHROPIC_API_KEY=sk-ant-...
almide run src/main.almd -- fizzbuzz
```

Available basic tasks: `fizzbuzz`, `factorial`, `is-prime`, `string-reverse`, `is-palindrome`.

## Current phase

**Phase 1** — scaffolding. Single-task runs only. Per-day metrics, dashboards, scheduled runs, and malicious-hint detection land in Phase 2.

See [`docs/roadmap/active/almide-dojo.md`](https://github.com/almide/almide/blob/main/docs/roadmap/active/almide-dojo.md) in the main Almide repo for the full roadmap.

## License

MIT — see [LICENSE](./LICENSE).
