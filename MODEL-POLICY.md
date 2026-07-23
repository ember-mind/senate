# Senate — model policy

Reference only; nothing here is loaded at runtime. Upstream repo: `github.com/ember-mind/senate`.

Roles are stable, model bindings are replaceable. A model change is an edit to `model:`/`effort:` frontmatter — never to a workflow or role definition.

| Role | Needs | Binding | Bound in |
|---|---|---|---|
| Consul | distill messy context into one brief; merge conflicting evidence without averaging; delegate | `fable` / xhigh | `skills/senate/SKILL.md` |
| Senator | sharp single-lens reasoning, no hedging; cheap enough to run 5–7× | `sonnet` / medium | `agents/senator.md` |
| Magister | deep single-craft reasoning; evidence discipline; bounded plans | `opus` / high | `agents/magister.md` |
| Censor | independence, adversarial reasoning, low false-positive rate | `opus` / high | `agents/censor.md` |
| Legionary | reliable editing, strict instruction adherence, minimal diffs, honest reporting | `sonnet` / high | `agents/legionary.md` |
| Explorator | navigation and recall, no judgment | `haiku` / medium | `agents/explorator.md` |
| Librarian | multi-source synthesis, citation discipline | `sonnet` / medium | `agents/librarian.md` |
| Foreign Envoy | different model family (uncorrelated blind spots), attacks aggregate agreement | OpenAI Codex (`codex:codex-rescue`) | `skills/senate/SKILL.md` step 6 |

Tiers: cheap many (senator, explorator, legionary, librarian) · craft (magister, censor) · frontier one (Consul). The Envoy is optional by design — degrades to a Claude devil senator; the verdict states which ran.

The Envoy reference in SKILL.md step 6 is the one sanctioned model name in a workflow body: an external CLI can't be bound via frontmatter.

## Rules

1. Use family aliases (`sonnet`, `opus`, `haiku`, `fable`), not dated IDs. Pin a dated ID only for a specific regression, and note why in the frontmatter.
2. One role, one binding.
3. Upgrade only on evidence — the candidate must beat the incumbent on that role's scenarios (`EVALS.md`). "Newer" is not evidence.

Tier criterion when re-binding: judgment or synthesis → `sonnet` or better; faithful reading and mapping → `haiku`; single-craft depth and review → `opus`; final judgment → frontier. Consul runs xhigh, not max — max overthinks agentic work.
