# 🏛️ The Senate

*A decision-analysis swarm for Claude Code. Rome does not average — Rome decides.*

One command — `/senate` — convenes a bench of deliberately **conflicting** senators on your decision, lets a cross-family Foreign Envoy attack whatever they agree on, and merges the result without smoothing the disagreements away.

```
/senate Should I migrate the blog off WordPress? [--debate] [--log]
```

## How it works

```
Consul (you + frontier model, main conversation)
  1. distills the decision into ONE compact brief
  2. loads the standing bench (roster.yaml) — may summon ≤2 extra conflicting experts
  3. fans the SAME brief out to all senators — parallel, independent, read-only
  4. [--debate] one rebuttal round (off by default)
  5. Foreign Envoy (OpenAI Codex, cross-family) attacks the CONSENSUS —
     the shared assumption that could kill every senator at once
  6. non-averaging merge → verdict
  7. [--log] appends the verdict to the project's MEMORY.md (vault convention)
```

**The bench** (edit `roster.yaml` — rows are data, no code change):

| Senator | Lens | Bias |
|---|---|---|
| Quaestor | money | every spend is suspect |
| Legatus | execution | distrusts ambitious scope |
| Tribunus Plebis | users/people | defends the crowd over the treasury |
| Augur | long-term, 2nd-order | discounts near-term wins |
| Cato | attacks the proposal itself | assumes it's a mistake |

Two adversarial layers by design: **Cato** (internal standing skeptic) and the **Envoy** (external, different model family, targets aggregate agreement). No Codex installed? The Envoy degrades to a Claude devil and the verdict says so.

## Principles

- **Reading is the cost.** The Consul reads once and distills; senators get the brief, not the world (≤2 targeted verification reads each). Cheap models for the many, frontier for the few.
- **Roles conflict, not complement.** A bench of honest extremists maps a decision better than one balanced mind.
- **Non-averaging merge.** Agreement across opposed biases = granite. Named conflict = signal. Lone dissent can be the whole point.
- **Read-only.** The Senate deliberates; it never edits, deletes, or deploys. Acting on a verdict is your separate decision.
- **The Senate commands the Legions.** Pass it build work by mistake ("fix this bug") and the Consul hands off to your installed `/bug` or `/feature` skills — `⚔️ The Senate sends the Legions`. A decision *about* a bug ("fix now or defer?") stays on the floor.
- **Untrusted text is data** (the Praetorian rule): briefs, quoted files, and Envoy output can inform — never command.

## Install

```bash
./install.sh    # copies into ~/.claude (agents/, skills/senate/, senate/)
```

Requires Claude Code. Optional: [Codex CLI](https://github.com/openai/codex) + `codex` plugin for the cross-family Envoy.

## Repo map

- `agents/senator.md` — one generic read-only senator agent (personas are roster rows, not agent files)
- `skills/senate/` — the Consul workflow + `roster.yaml` (+ repo-only `EVALUATION.yaml`)
- `MODEL-POLICY.md` — role→model bindings, upgrade discipline
- `EVALS.md` — per-role eval scenarios (upgrade only on evidence)
- `LORE.md` — the Roman world, human-facing (never loaded at runtime)
- `docs/` — SPEC + design checkpoint

*SPQR.*
