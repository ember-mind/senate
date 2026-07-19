# 💰 The Treasury

*Rome is rich because the Quaestor is stingy. Right model for the right duty — frontier minds are for judgment, not for chorus work.*

## The tiers

| Tier | Who | Model | Why |
|---|---|---|---|
| **The cheap many** | senators (×5–7), scouts, legionaries, librarians | `sonnet` | Parallel single-lens work. A senator needs to hold one hard bias, not be a genius; the merge corrects for depth. |
| **The craft tier** | magistri, censors | `opus` | Near-frontier quality at half frontier price — Opus-tier models are explicitly strong on planning, knowledge work, and code review. One call per request. |
| **The frontier one** | Consul (distill + merge) | `fable`, xhigh effort | The supreme figure always reasons at the top level. Every run passes through it — the brief and the verdict are frontier work, and its cost is largely paid anyway (it IS the main conversation). |
| **The foreigner** | Envoy | Codex (cross-family) | Uncorrelated blind spots. Billed on the other empire's ledger. |

Pricing reference (per Mtok, 2026-07): fable $10 in / $50 out · opus $5/$25 · sonnet $3/$15 · haiku $1/$5. Example: a magister plan at ~10k in / 3k out costs ~$0.12 on opus vs ~$0.25 on fable — halved, per Treasury decision 2026-07-19.

## Benchmark — one real decision run

Decision: "migrate the newsletter from Substack to self-hosted Ghost?" (2,100 subs, 38 paid, real numbers). Token counts estimated from the actual run.

| Run | Composition | Est. cost |
|---|---|---|
| Fable alone, single pass | 1× fable (~1k in / ~3k out, thinking always on) | ~$0.16 |
| **The Senate as built** | 5× senator on sonnet + Consul merge on fable | **~$0.33** (+ Codex Envoy on OpenAI's bill) |
| Same swarm, all fable | 5× senator on fable + merge on fable | ~$0.81 |

Two conclusions:

1. **Right-sizing the senators saves ~60%** vs running the identical swarm on fable (0.33 vs 0.81). The bench's value is role discipline, not model depth — sonnet holds a single hard lens perfectly well.
2. **vs a single fable pass, the Senate costs ~2×** and buys what one pass structurally cannot produce: a quantified dissent (the Augur's compounding math) and a cross-family attack that caught the bench answering the easier question and option C having no decision rule. Both landed in the verdict. The Envoy's marginal cost was the best-spent cent of the run.

## The rules (token budget — "reading is the cost")

1. Distill once, reuse: one brief, N senators — never N re-reads at frontier price.
2. Cheap for the many, frontier for the few.
3. Capped, structured opinions — the merge reads bounded input.
4. Debate is the re-read tax: `--debate` opt-in only (~doubles senator calls).
5. Bindings change only on eval evidence (`EVALS.md`), never on hype — and if scores tie, the cheaper model wins.

Floor per decision: 5 senators + Envoy + merge ≈ 7 calls. Ceiling: +2 experts ≈ 9; `--debate` ≈ 16.
