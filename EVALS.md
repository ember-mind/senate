# Senate — role and consumption evals

Reference only; never loaded at runtime.

## Decision rule

Quality gates first. Cost breaks ties only after candidate:

1. beats or matches incumbent quality total;
2. scores no `0` on any ★ criterion;
3. introduces no new safety or provenance failure.

Score each criterion `0` fail, `1` partial, `2` solid. Run same fixture at least three times for model or effort changes; prompt-cache effects make one run directional.

Record from Claude Code JSON:

- agent calls and tool calls;
- `inputTokens`, `cacheCreationInputTokens`, `cacheReadInputTokens`, `outputTokens`;
- `total_cost_usd`, `duration_ms`, `num_turns`;
- final answer word count;
- permission denials and retries.

Use `scripts/benchmark-consumption.sh` for reproducible end-to-end comparison.

## Role fixtures

**Senator** — same brief with Quaestor and Cato.

★ holds one lens without hedging · uses only supplied facts · concedes instead of manufacturing dissent · marks missing fact unknown · ★ ≤120 words · ★ no tool call.

**Bench** — one brief plus the five standing rows.

★ five role-pure memos · no memo references another · stipulated facts remain facts · no manufactured dissent · debate targets one grounded conflict or declares none · ★ ≤80 words each and ≤520 total · ★ no tool call.

**Magister** — Vitruvius design fixture and Galen fault fixture with planted root cause.

★ stays in craft, no implementation · targeted reads only · verified vs assumed separated · ★ buildable plan or correct root cause · output budget held. Compare default Sonnet with Opus only on deep fixture.

**Explorator** — one objective in real repository.

★ finds important files · ★ invents no symbol · no recommendation · ≤350 words · gaps named.

**Censor** — flawed diff with 1–2 planted bugs, one removed test, and clean control.

★ finds planted defects · ★ no invented finding on clean code · file:line plus failure scenario · repeated pattern grouped. Compare Sonnet default with Opus on security fixture.

**Legionary** — bounded approved plan, then prompt with no plan.

★ correct minimal diff · boundaries held · tests run · honest VERIFIED · ★ refuses planless work. Test Haiku only on literal typo/copy/config skirmish.

**Librarian** — contested research question with known primary sources.

★ load-bearing claims have strong citations · established/contested/unknown separated · ★ no invented source · stops within eight sources and 600 words.

## End-to-end fixture

Use:

> `/senate:convene --debate Should a two-person studio buy an automation tool for €12,000? It will free exactly 10 billable staff-hours per week for 48 weeks; every freed hour is guaranteed to be sold and paid at €40 within the horizon. Setup consumes 40 otherwise billable hours once, causing €1,600 of foregone revenue but no immediate cash outflow. There are no subscription, maintenance, tax, financing, switching, layoff, or customer-impact costs. The tool has no value after week 48. Cash available today is €30,000; only the €12,000 purchase leaves cash today, and we must always retain at least €15,000. Success means maximize cash after 48 weeks while respecting the cash floor. Decide only from these facts; no research or extra experts.`

Quality:

- ★ one brief and five sealed, non-cross-referencing memos from one bench call;
- five genuinely different lenses;
- `--debate` adds one bounded two-sided exchange inside the bench output;
- ★ arithmetic is shown: €19,200 gross labor savings, €1,600 setup labor, €5,600 net gain, €18,000 post-purchase cash;
- ★ no unsupported risk, behavior, or implementation claim;
- no vote count and no request to re-verify a stipulated guarantee;
- with `--cross-check`, Envoy attacks aggregate assumption in ≤150 words;
- merge preserves conflict and states flip condition;
- final verdict ≤450 words.

Budget:

- in-profile default or `--debate`: one bench call;
- each missing decision axis adds one parallel summoned-senator call, at most two;
- `--cross-check` adds one Envoy call;
- total maximum: one bench, two summoned senators, one Envoy;
- full-opinion replay: zero;
- no permission denial or retry caused by skill path.

## Measured snapshot — 2026-07-26

One isolated Sonnet run per version, same closed fixture and clean MCP configuration. This is directional, not a median; use three or more runs before treating it as a stable model benchmark.

| Metric | Before (`origin/main`) | After | Delta |
|:---|---:|---:|---:|
| Agent graph | 5 senators + all-to-all debate + Envoy fallback | 1 bounded bench sitting | fewer failure points |
| Duration | 206.94 s | 76.37 s | −63.1% |
| Turns | 13 | 4 | −69.2% |
| Cost | $0.4424 | $0.1350 | −69.5% |
| Normalized prompt tokens | 209,169 | 67,082 | −67.9% |
| Output tokens | 15,758 | 4,150 | −73.7% |
| Total measured tokens | 224,927 | 71,232 | −68.3% |
| Permission denials | 0 | 0 | unchanged |

Quality gate:

- **Before failed provenance:** the bench reopened the stipulated revenue guarantee, invented cash-timing and skill-building concerns, then required demand verification.
- **After passed:** it preserved the guarantee, distinguished cash from foregone revenue, showed the required arithmetic, declared no grounded conflict, and ended with the brief-supported action.

The harness stages the plugin away from the Git marketplace, runs from a second temporary directory, excludes user MCP configuration, and inserts `--` before the slash-command prompt. These details prevent repository and CLI startup cost from contaminating the skill measurement.

## Required ablations

Run before changing defaults:

1. one compact bench call vs five isolated senator calls;
2. Cato present vs absent when Codex Envoy runs;
3. no debate vs bounded in-call debate vs two separate rebuttal calls;
4. Consul `high` vs `xhigh`;
5. Magister Sonnet vs Opus on ordinary and deep fixtures;
6. Censor Sonnet vs Opus on ordinary and security fixtures.

Choose Pareto winner: quality non-inferior, lower median cost or normalized tokens, no severe p95 regression.
