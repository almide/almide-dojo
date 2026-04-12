# Runs

Per-day MSR results will be committed here once Phase 2 of the harness is live.

Layout (planned):

```
runs/
└── YYYY-MM-DD/
    ├── summary.md          # committed
    ├── metrics.toml        # committed (parsable for dashboards)
    └── per-task/
        └── <task-name>.md  # committed (pass/fail + retry count per task)
```

Raw LLM outputs and full diagnostic dumps are written to `runs/YYYY-MM-DD/raw/`, which is git-ignored to keep the repo lean. Summaries only.

This directory is currently empty.
