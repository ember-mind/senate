# Senate — model policy

Reference only; nothing here is loaded at runtime.

The whole point of the Senate is **the right model for each duty**: the heavy model makes the judgment, cheaper models do the work that doesn't need a heavy model. That heterogeneity is shipped in the frontmatter, not left to chance.

Two rules make it both work-as-designed and portable across plans:

1. **The sub-agents are pinned to tiers** using model *family aliases* (`sonnet`, `opus`, `haiku`), never dated IDs. Aliases resolve on any plan that has that family, so they travel.
2. **The Consul is not pinned** — it inherits your session model at `high` effort. Role-specific deep work may override one sub-agent invocation to `opus`; ordinary routing does not pay that cost.

## The bindings

| Role | Tier | Binding | Why |
|---|---|---|---|
| Consul (`skills/convene/SKILL.md`) | frontier | **your session model**, `effort: high` | Routes, briefs, and merges. `high` is default; eval before spending `xhigh`. |
| Bench (`agents/bench.md`) | compact many-in-one | `sonnet` / high | Produces five sealed first-pass lenses in one bounded context instead of repeating system prompts five times. |
| Senator (`agents/senator.md`) | selective depth | `sonnet` / medium | One hard lens for a summoned task-specific expert or Envoy fallback. |
| Magister (`agents/magister.md`) | craft | `sonnet` / high; `opus` invocation override for deep work | Ordinary plans stay economical; cross-system or high-risk work escalates. |
| Censor (`agents/censor.md`) | craft | `sonnet` / high; `opus` invocation override for high risk | Ordinary review stays economical; security, data loss, and large cross-system diffs escalate. |
| Legionary (`agents/legionary.md`) | cheap many | `sonnet` / high; `haiku` invocation override for literal skirmishes | Campaign work needs reliable editing; typo, copy, and literal config changes do not. |
| Explorator (`agents/explorator.md`) | readers | `haiku` / medium | Faithful retrieval, no judgment — reading needs no judgment tier. |
| Librarian (`agents/librarian.md`) | cheap many | `sonnet` / medium | Multi-source synthesis with citations. |
| Foreign Envoy | cross-family | OpenAI Codex (`codex:codex-rescue`) | `--cross-check` buys a different model family's blind spots only when requested. Degrades to a Claude devil senator when absent. |

Tier criterion: ordinary synthesis and implementation → `sonnet`; faithful mapping and literal skirmishes → `haiku`; deep single-craft or high-risk review → per-invocation `opus`; final judgment → Consul's inherited session model.

The Envoy reference in `references/decision.md` is the one external model name in workflow instructions. Adaptive Magister, Censor, and skirmish tiers use Agent-call `model` overrides.

## If a tier isn't on your plan

The pins use family aliases. If your plan lacks `opus`, deep invocations stay on default `sonnet`; workflow still works. If it lacks a default tier, edit that role's frontmatter or remove `model:` to inherit session model.

Want every role on one model? Delete `model:` lines and remove invocation overrides. Every role then inherits the session model; the compact bench remains one call.

## Changing a binding

Change default or escalation threshold only on evidence: candidate must beat incumbent on role scenarios (`EVALS.md`) while meeting token and latency budgets. "Newer" is not evidence.
