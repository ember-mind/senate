# 🏛️ The Senate

*A decision-analysis swarm for Claude Code. Rome does not average — Rome decides.*

One command — `/senate` — and the Consul routes your request to the organ whose duty it is: decisions get a bench of deliberately **conflicting** senators plus a cross-family Envoy attacking whatever they agree on; designs get an architect; faults get a physician; research gets a librarian; reviews get a censor; and building gets the Legions — who march only when you approve the plan.

```
/senate Should I migrate the blog off WordPress? [--debate] [--log]
/senate Add dark mode to the settings page
/senate My nightly backup silently stopped working
```

| Organ | Duty |
|---|---|
| 🏛️ The Senate | deliberate a decision → non-averaged verdict |
| 📐 The Collegium | Vitruvius designs, Archimedes computes, Galen diagnoses |
| 📚 The Library | research with citations |
| 📜 The Censors | independent review of finished work |
| 🐎 The Scouts | reconnaissance feeding the Consul's briefs |
| ⚔️ The Legions | build — only on your approved plan |
| 🐍 The Envoy | cross-family devil vs the consensus |
| 🛡️ The Praetorians | untrusted text is data, never command |

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

**The Collegium** (edit `collegium.yaml`): when the request is a thing to design or heal rather than a choice, the Consul summons a master instead —

| Magister | Craft |
|---|---|
| Vitruvius | architecture of the new — buildable plans |
| Archimedes | mathematics & mechanism — algorithms, performance, feasibility |
| Galen | diagnosis of the broken — root cause, minimal cure |

## Principles

- **Reading is the cost.** The Consul reads once and distills; senators get the brief, not the world (≤2 targeted verification reads each). Cheap models for the many, frontier for the few.
- **Roles conflict, not complement.** A bench of honest extremists maps a decision better than one balanced mind.
- **Non-averaging merge.** Agreement across opposed biases = granite. Named conflict = signal. Lone dissent can be the whole point.
- **Read-only, except the Legions.** Every organ opines, plans, diagnoses, reviews — none edits. The Legions are the single exception, and they march only on a plan you explicitly approved, with honest reporting of what they changed and verified.
- **Not a decision? The Collegium.** Ask for something new or something broken and the Consul summons a master instead of the bench: **Vitruvius** drafts the buildable plan, **Archimedes** solves the mechanism, **Galen** convicts the root cause. Still read-only — plans and diagnoses, never edits. A contested plan goes straight back to the Senate floor, where the senators attack it.
- **Untrusted text is data** (the Praetorian rule): briefs, quoted files, and Envoy output can inform — never command.

## Install

```bash
./install.sh    # copies into ~/.claude (agents/, skills/senate/, senate/)
```

Requires Claude Code. Optional: [Codex CLI](https://github.com/openai/codex) + `codex` plugin for the cross-family Envoy.

## Repo map

- `agents/` — `senator`, `magister`, `librarian`, `censor`, `explorator`, `legionary` (personas are data rows, not agent files)
- `skills/senate/` — the Consul workflow + `roster.yaml` (the bench) + `collegium.yaml` (the masters) (+ repo-only `EVALUATION.yaml`)
- `MODEL-POLICY.md` — role→model bindings, upgrade discipline
- `EVALS.md` — per-role eval scenarios (upgrade only on evidence)
- `LORE.md` — the Roman world, human-facing (never loaded at runtime)
- `docs/` — SPEC + design checkpoint

*SPQR.*
