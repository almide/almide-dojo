# L1 prediction loop — verdicts vs measured MSR

5 verdict(s), 1 scored run(s).
Mean MSR-with-retry across runs before/after each landing date;
a prediction only counts as confirmed/refuted once post-landing runs exist.

| id | change | landed | predicted | before | after | standing |
|---|---|---|---|---|---|---|
| LV-001 | LICM restricted to speculation-safe expressions (no trapping ops hoisted) | 2026-08-15 | up | 100% | — | awaiting post-landing runs |
| LV-002 | Local fn colliding with a selective import is hard error E050 | 2026-08-15 | up | 100% | — | awaiting post-landing runs |
| LV-003 | Constructor resolution owner-scoped; same-module duplicate case names are E019 at registration | 2026-08-15 | up | 100% | — | awaiting post-landing runs |
| LV-004 | Err constructor emission carries the checker-resolved Result type (turbofish) | 2026-08-15 | up | 100% | — | awaiting post-landing runs |
| LV-005 | v1 native ok-lift carried as a return-type override, not a ret-value retype | 2026-08-15 | up | 100% | — | awaiting post-landing runs |
