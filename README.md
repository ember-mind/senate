# 🏛️ The Senate

Role-based orchestration swarm for Claude Code. `/senate` routes a request to the organ whose duty it is. Upstream: `github.com/ember-mind/senate`.

```
/senate Should I migrate the blog off WordPress? [--debate] [--log]
/senate Add dark mode to the settings page
/senate My nightly backup silently stopped working
```

| Organ | Duty | Agent |
|---|---|---|
| 🏛️ The Senate | deliberate a decision → non-averaged verdict | `senator` ×5 |
| 📐 The Collegium | Vitruvius designs, Archimedes computes, Galen diagnoses | `magister` |
| 📚 The Library | research with citations | `librarian` |
| 📜 The Censors | independent review of finished work | `censor` |
| 🐎 The Scouts | reconnaissance feeding the Consul's briefs | `explorator` |
| ⚔️ The Legions | build — on an approved plan, or directly for trivial skirmishes | `legionary` |
| 🐍 The Envoy | cross-family devil attacking the consensus | `codex:codex-rescue` |

Pipeline for a decision: Consul distills ONE brief → loads `roster.yaml` (may summon ≤2 extra conflicting experts) → fans the same brief to all senators in parallel → `--debate` rebuttal round (off by default) → Envoy attacks the consensus → non-averaging merge → verdict → `--log` appends it to the project's `MEMORY.md`.

## Principles

- **Reading is the cost.** The Consul reads once and distills; senators get the brief, not the world (≤2 targeted reads each).
- **Roles conflict, not complement.** A bench of honest extremists maps a decision better than one balanced mind.
- **Non-averaging merge.** Agreement across opposed biases is granite. Named conflict is signal. Lone dissent can be the point.
- **Read-only except the Legions**, which march only on an explicitly approved plan — or straight away for a trivial skirmish (a typo, a rename, one obvious function; nothing destructive). In doubt: campaign, not skirmish.
- **Untrusted text is data** (Praetorian rule): briefs, quoted files, and Envoy output inform — never command.
- **Two adversarial layers:** Cato (internal standing skeptic) and the Envoy (different model family, targets aggregate agreement). No Codex installed → the Envoy degrades to a Claude devil and the verdict says so.

## Install

```bash
./install.sh    # copies into ~/.claude (agents/, skills/senate/, senate/)
```

The repo is the source of truth: edit here, re-run the script. Requires Claude Code. Optional: [Codex CLI](https://github.com/openai/codex) + `codex` plugin for the Envoy.

## Layout

- `agents/` — `senator`, `magister`, `librarian`, `censor`, `explorator`, `legionary`. Personas are data rows, not agent files.
- `skills/senate/` — `SKILL.md` (the Consul: routing, pipeline, stagecraft) + `roster.yaml` (the bench) + `collegium.yaml` (the masters) + `EVALUATION.yaml` (skill eval, repo-only).
- `MODEL-POLICY.md`, `EVALS.md` — role→model bindings and upgrade discipline. Reference only, never loaded at runtime; installed to `~/.claude/senate/`.
