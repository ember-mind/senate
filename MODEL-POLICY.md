# Senate — model policy

Reference only; nothing here is loaded at runtime.

**By default every role inherits your session model.** No agent pins a specific model — so the Senate works on any Claude Code plan out of the box, and nothing fails on install because a model isn't on your account. `effort:` is kept in the frontmatter; `model:` is not.

The tradeoff: with no pins, a five-senator fan-out runs on whatever your main model is. If that is a frontier model, one decision run costs five frontier calls. The tiers below let you buy most of the quality back for a fraction of the cost — opt in when you want it.

## Recommended tiers (opt-in)

Add a `model:` line to a role's frontmatter to pin it. One role, one binding. Use family aliases (`sonnet`, `opus`, `haiku`, `fable`), not dated IDs.

| Role | Tier | Recommended | Why |
|---|---|---|---|
| Consul (`skills/convene/SKILL.md`) | frontier | your session model, `effort: xhigh` | Distills the brief and merges conflicting evidence — the judgment is the whole product. xhigh, not max: max overthinks agentic work. |
| Senator (`agents/senator.md`) | cheap many | `sonnet` / medium | A single hard lens held without hedging. Runs 5–7× per decision, so cost matters most here. |
| Magister (`agents/magister.md`) | craft | `opus` / high | Deep single-craft plans and diagnoses. One call per request. |
| Censor (`agents/censor.md`) | craft | `opus` / high | Independent review, low false-positive rate. One call per review. |
| Legionary (`agents/legionary.md`) | cheap many | `sonnet` / high | Reliable minimal-diff editing, strict instruction adherence. |
| Explorator (`agents/explorator.md`) | readers | `haiku` / medium | Faithful retrieval, no judgment — reading needs no judgment tier. |
| Librarian (`agents/librarian.md`) | cheap many | `sonnet` / medium | Multi-source synthesis with citations. |
| Foreign Envoy | cross-family | OpenAI Codex (`codex:codex-rescue`) | A different model family gives uncorrelated blind spots. Optional; degrades to a Claude devil senator when absent, and the verdict states which ran. |

Tier criterion when you pin: judgment or synthesis → `sonnet` or better; faithful reading and mapping → `haiku`; single-craft depth and review → `opus`; final judgment → frontier.

The Envoy reference in SKILL.md step 6 is the one model name that lives in a workflow body: an external CLI can't be bound via frontmatter.

## Changing a pin

A model change is an edit to `model:`/`effort:` frontmatter — never to a workflow or a role definition. Upgrade a role only on evidence: the candidate must beat the incumbent on that role's scenarios (`EVALS.md`). "Newer" is not evidence.
