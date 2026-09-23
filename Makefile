# Almide Dojo — entry points a third party can run after `git clone`.
#
#   make msr            install the pinned compiler, run every available language plugin
#                       under one manifest, print the multi-language table
#   make msr-verify     the same plugins on the reference solutions (no model, no key)
#   make msr-probe      which languages this machine can measure
#   make test           the harness's own test blocks
#
# `make msr` needs one provider's credentials in the environment (see README,
# "Running the harness") — no Anthropic key is required; MODEL picks the spec,
# LANGUAGES / TASKS narrow the run:
#
#   CF_ACCOUNT_ID=... CLOUDFLARE_API_KEY=... CLOUDFLARE_EMAIL=... make msr
#   ANTHROPIC_API_KEY=... make msr MODEL=anthropic:claude-sonnet-5
#   make msr MODEL=cli:claude TASKS=gcd,fizzbuzz LABEL=smoke

MODEL ?=
LANGUAGES ?=
TASKS ?=
LABEL ?=
OUT ?= runs/msr

.PHONY: msr msr-verify msr-probe test

msr:
	@bash scripts/msr.sh run "$(MODEL)" "$(LANGUAGES)" "$(TASKS)" "$(LABEL)" "$(OUT)"

msr-verify:
	@bash scripts/msr.sh verify "" "$(LANGUAGES)" "$(TASKS)" "" "$(OUT)"

msr-probe:
	@bash scripts/msr.sh probe "" "" "" "" ""

test:
	@bash scripts/msr.sh compiler
	almide test src/
