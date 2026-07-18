# Model Policy

Roles are stable; model bindings are replaceable. Each role states what it *needs* (permanent) and which model currently *holds* it (temporary). When a better model appears, change the binding — never the workflow or the role definition. (Discipline pattern copied from `escapemanuele orchestration`; this repo keeps its own small policy so it stays standalone.)

Bindings live in exactly two kinds of places:
- `~/.claude/agents/senator.md` — `model:` and `effort:` frontmatter
- `~/.claude/skills/decide/SKILL.md` — `model:`/`effort:` frontmatter (Consul), plus workflow step 6's cross-family Envoy agent reference (currently `codex:codex-rescue`); an external CLI can't be bound via frontmatter, so this is the one sanctioned exception to "no model names in workflow bodies"

Change a binding by editing those places only.

---

## Consul (lead)

Needs:
- distillation of messy context into one compact brief
- synthesis of conflicting evidence without averaging
- delegation; resistance to doing the senators' thinking for them

Current model:
- `fable`
- high reasoning/effort

Bound in: `~/.claude/skills/decide/SKILL.md`

## Senator

Needs:
- sharp single-lens reasoning (hold one hard bias without hedging)
- cheap enough to run 5–7× per decision (the "cheap many" tier)
- bounded, structured output

Current model:
- `sonnet`
- medium reasoning/effort

Bound in: `~/.claude/agents/senator.md`

Diversity comes from role rows (roster.yaml), not per-senator models. Multi-family senators are a documented future extension — the star topology already permits dropping in an external senator.

## Foreign Envoy (cross-family)

Needs:
- a different model family from the senators (uncorrelated blind spots)
- adversarial reasoning against aggregate agreement, not individual findings
- low false-positive rate

Current binding:
- OpenAI Codex (Codex CLI via `codex` plugin, `codex:codex-rescue` agent)

Bound in: `~/.claude/skills/decide/SKILL.md` (workflow step 6). Optional by design — degrades to a Claude devil senator when unavailable; the verdict states which ran.

---

## Binding rules

1. **Model bindings change independently from workflows.** A model upgrade is an edit to `model:`/`effort:` frontmatter, nothing else.
2. **Use model-family aliases** (`sonnet`, `opus`, `haiku`, `fable`), not dated model IDs. Pin an exact dated ID only if a specific regression forces it, and record why here.
3. **One role, one binding.**
4. **Upgrade only on evidence.** A new model takes over a role only after beating the incumbent on that role's evals (see `EVALS.md`). "Newer" or "bigger" is not evidence.
5. **Record changes.** When a binding changes, append a dated line below.

## Binding history

- 2026-07-18 — Initial policy: consul=fable/high, senator=sonnet/medium, envoy=Codex via `codex:codex-rescue` (degrades to Claude devil). Senate split out of `escapemanuele orchestration` into its own repo (`ember-mind/senate`).
