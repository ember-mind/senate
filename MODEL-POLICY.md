# Senate — model policy

Reference only; nothing here is loaded at runtime.

The whole point of the Senate is **the right model for each duty**: the heavy model makes the judgment, cheaper models do the work that doesn't need a heavy model. That heterogeneity is shipped in the frontmatter, not left to chance.

Two rules make it both work-as-designed and portable across plans:

1. **The sub-agents are pinned to tiers** using model *family aliases* (`sonnet`, `opus`, `haiku`), never dated IDs. Aliases resolve on any plan that has that family, so they travel.
2. **The Consul is not pinned** — it inherits your session model. This is the correct meaning of "the best model decides": the Consul runs on whatever top model you are already using, instead of hardcoding one specific model that might not be on your plan.

## The bindings

| Role | Tier | Binding | Why |
|---|---|---|---|
| Consul (`skills/convene/SKILL.md`) | frontier | **your session model**, `effort: xhigh` | Distills the brief and merges conflicting evidence — the judgment is the whole product. Inherits your best model. xhigh, not max: max overthinks agentic work. |
| Senator (`agents/senator.md`) | cheap many | `sonnet` / medium | A single hard lens held without hedging. Runs 5–7× per decision, so cost matters most here. |
| Magister (`agents/magister.md`) | craft | `opus` / high | Deep single-craft plans and diagnoses. One call per request. |
| Censor (`agents/censor.md`) | craft | `opus` / high | Independent review, low false-positive rate. One call per review. |
| Legionary (`agents/legionary.md`) | cheap many | `sonnet` / high | Reliable minimal-diff editing, strict instruction adherence. |
| Explorator (`agents/explorator.md`) | readers | `haiku` / medium | Faithful retrieval, no judgment — reading needs no judgment tier. |
| Librarian (`agents/librarian.md`) | cheap many | `sonnet` / medium | Multi-source synthesis with citations. |
| Foreign Envoy | cross-family | OpenAI Codex (`codex:codex-rescue`) | A different model family gives uncorrelated blind spots. Optional; degrades to a Claude devil senator when absent, and the verdict states which ran. |

Tier criterion: judgment or synthesis → `sonnet` or better; faithful reading and mapping → `haiku`; single-craft depth and review → `opus`; final judgment → the Consul's inherited session model.

The Envoy reference in SKILL.md step 6 is the one model name that lives in a workflow body: an external CLI can't be bound via frontmatter.

## If a tier isn't on your plan

The pins use family aliases, so a plan with that family just works. If your plan lacks a tier (for example no `opus`), edit that role's `model:` to a family you do have, or delete the line to fall back to your session model. A model change is an edit to `model:`/`effort:` frontmatter only — never to a workflow or a role definition.

Want every role on one model instead of the tiers? Delete the `model:` lines and each role inherits your session model. You lose the cost split (a five-senator fan-out then runs five times on your main model), but nothing breaks.

## Changing a binding

Upgrade a role only on evidence: the candidate must beat the incumbent on that role's scenarios (`EVALS.md`). "Newer" is not evidence.
