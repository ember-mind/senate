# Model Policy

Roles are stable; model bindings are replaceable. Each role states what it *needs* (permanent) and which model currently *holds* it (temporary). When a better model appears, change the binding — never the workflow or the role definition.
Bindings live in exactly two kinds of places:
- `~/.claude/agents/senator.md` and `~/.claude/agents/magister.md` — `model:` and `effort:` frontmatter
- `~/.claude/skills/senate/SKILL.md` — `model:`/`effort:` frontmatter (Consul), plus workflow step 6's cross-family Envoy agent reference (currently `codex:codex-rescue`); an external CLI can't be bound via frontmatter, so this is the one sanctioned exception to "no model names in workflow bodies"

Change a binding by editing those places only.

---

## Consul (lead)

Needs:
- distillation of messy context into one compact brief
- synthesis of conflicting evidence without averaging
- delegation; resistance to doing the senators' thinking for them

Current model:
- `fable`
- xhigh reasoning/effort — the Consul is the supreme figure and always reasons at the top level; frontier is never delegated away from the final judgment

Bound in: `~/.claude/skills/senate/SKILL.md`

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

## Magister (Collegium master)

Needs:
- deep single-craft reasoning (architecture, mechanism, or diagnosis) without dilution
- evidence discipline: reads with intent, separates verified from assumed
- bounded, structured plans/diagnoses

Current model:
- `opus`
- high reasoning/effort

Bound in: `~/.claude/agents/magister.md`

One master per request (the "craft" tier) — near-frontier quality at half frontier price; Opus-tier models are explicitly strong on agentic and knowledge work. Personas (Vitruvius, Archimedes, Galen) are data rows in `collegium.yaml`, not per-persona agents or bindings.

## Explorator (Scout)

Needs: strong navigation, high recall, accurate terrain reports, speed and low cost. NO judgment — the explorator reports terrain, it does not vote (its own prompt forbids opinions), which is exactly the profile of a retrieval-tier model.

Current model: `haiku`, medium reasoning/effort. Bound in: `~/.claude/agents/explorator.md`

## Censor

Needs: independence, adversarial reasoning, bug detection, low false-positive rate.

Current model: `opus`, high reasoning/effort. Bound in: `~/.claude/agents/censor.md` (Opus-tier models are explicitly strong on code review and bug-finding)

## Legionary

Needs: reliable editing, strict instruction adherence, minimal diffs, test awareness, honest reporting.

Current model: `sonnet`, high reasoning/effort. Bound in: `~/.claude/agents/legionary.md`

## Librarian

Needs: multi-source synthesis, citation discipline, contested-vs-established separation, reasonable cost.

Current model: `sonnet`, medium reasoning/effort. Bound in: `~/.claude/agents/librarian.md`

## Foreign Envoy (cross-family)

Needs:
- a different model family from the senators (uncorrelated blind spots)
- adversarial reasoning against aggregate agreement, not individual findings
- low false-positive rate

Current binding:
- OpenAI Codex (Codex CLI via `codex` plugin, `codex:codex-rescue` agent)

Bound in: `~/.claude/skills/senate/SKILL.md` (workflow step 6). Optional by design — degrades to a Claude devil senator when unavailable; the verdict states which ran.

---

## Binding rules

1. **Model bindings change independently from workflows.** A model upgrade is an edit to `model:`/`effort:` frontmatter, nothing else.
2. **Use model-family aliases** (`sonnet`, `opus`, `haiku`, `fable`), not dated model IDs. Pin an exact dated ID only if a specific regression forces it, and record why here.
3. **One role, one binding.**
4. **Upgrade only on evidence.** A new model takes over a role only after beating the incumbent on that role's evals (see `EVALS.md`). "Newer" or "bigger" is not evidence.
5. **Record changes.** When a binding changes, append a dated line below.

## Binding history

- 2026-07-19 — Explorator moved sonnet→haiku: faithful retrieval needs no judgment tier (the tier criterion: judgment/synthesis → sonnet+, faithful reading/mapping → haiku). Demote on the same rule only when a role's output is reportage, not position.
- 2026-07-19 — Consul raised to fable/xhigh: the supreme figure always reasons at the top level (xhigh, not max — max is prone to overthinking on agentic work).
- 2026-07-19 — Craft tier introduced: magister and censor moved fable→opus (near-frontier quality at half price; frontier reserved for the Consul's judgment). Treasury decision.
- 2026-07-18 — Four organs shipped: explorator=sonnet/medium, censor=fable/high, legionary=sonnet/high, librarian=sonnet/medium.
- 2026-07-18 — Command renamed `/decide` → `/senate`; skill dir `skills/decide/` → `skills/senate/`. Bindings unchanged; bound-in paths updated above.
- 2026-07-18 — Collegium added: magister=fable/high (one master per request — the "frontier few" tier; craft quality over cost).
- 2026-07-18 — Initial policy: consul=fable/high, senator=sonnet/medium, envoy=Codex via `codex:codex-rescue` (degrades to Claude devil).
