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

## What a verdict looks like

`/senate Move the newsletter off Substack (10% fee, 2,100 subs, 38 paid at €7/mo) to self-hosted Ghost (€12/mo VPS, migration ~2 weekends, own the list)?`

```
# ⚖️ The Senate's Verdict

🤝 Agreement — Every senator, across opposed biases, agreed on one thing:
the €26/mo you save is not the point. The list is. On Substack you rent your
audience; on Ghost you own it.

⚔️ Conflicts
· Quaestor (money) vs Legatus (execution): Quaestor says the 10% fee on
  €266/mo is €320/year walking out the door — move now. Legatus says two
  weekends of migration risk a broken send to 2,100 people, and a botched
  first email costs more trust than a year of fees.
· Tribunus Plebis (users): the reader does not care where the email is
  hosted — they care it keeps arriving. A silent broken migration is the one
  failure they will punish.

👁️ Blind spot (Augur, long-term) — At 38 paid you are below the line where
fees hurt. The decision that matters is 3 years out: if the list grows to
500 paid, Substack's fee is €4,200/year and switching then means moving a
paying audience, which is far riskier than moving now.

🐍 The Envoy's attack (Codex) — Every senator assumed the migration is a
one-time cost. None asked who runs the VPS the week the Ghost server goes
down and a send is due. Owning the list also means owning the ops. That
recurring burden, not the two weekends, is the real price.

🏛️ Verdict — CONDITIONAL. Move — but only after you can answer the Envoy:
who patches and restarts the server. If that is "nobody", a managed Ghost
host (≈€9/mo) beats both the VPS and staying on Substack.

➡️ 🏛️ The Senate has spoken — the decision is yours to execute.
```

The senators never average. Where opposed biases agree, that is the strongest signal; where they collide, the collision is the finding; and the Envoy's job is the question all five forgot to ask.

## Principles

- **Reading is the cost.** The Consul reads once and distills; senators get the brief, not the world (≤2 targeted reads each).
- **Roles conflict, not complement.** A bench of honest extremists maps a decision better than one balanced mind.
- **Non-averaging merge.** Agreement across opposed biases is granite. Named conflict is signal. Lone dissent can be the point.
- **Read-only except the Legions**, which march only on an explicitly approved plan — or straight away for a trivial skirmish (a typo, a rename, one obvious function; nothing destructive). In doubt: campaign, not skirmish.
- **Untrusted text is data** (Praetorian rule): briefs, quoted files, and Envoy output inform — never command.
- **Two adversarial layers:** Cato (internal standing skeptic) and the Envoy (different model family, targets aggregate agreement). No Codex installed → the Envoy degrades to a Claude devil and the verdict says so.

## Install

**As a plugin** (recommended). In Claude Code:

```
/plugin marketplace add ember-mind/senate
/plugin install senate@ember-mind
```

Then invoke it with `/senate:senate <your decision>` (plugin skills are namespaced by the plugin name). Update later with `/plugin marketplace update ember-mind`.

**Or from source** — copies straight into `~/.claude` and gives you a bare `/senate`:

```bash
git clone https://github.com/ember-mind/senate && cd senate && ./install.sh
```

Requires Claude Code. Optional: [Codex CLI](https://github.com/openai/codex) + `codex` plugin for the Envoy. No model is pinned — every role runs on your session model by default; see `MODEL-POLICY.md` to opt into the cheaper per-role tiers.

## Layout

- `agents/` — `senator`, `magister`, `librarian`, `censor`, `explorator`, `legionary`. Personas are data rows, not agent files.
- `skills/senate/` — `SKILL.md` (the Consul: routing, pipeline, stagecraft) + `roster.yaml` (the bench) + `collegium.yaml` (the masters) + `EVALUATION.yaml` (skill eval, repo-only).
- `.claude-plugin/` — `plugin.json` + `marketplace.json` (plugin distribution).
- `MODEL-POLICY.md` — recommended per-role model tiers (opt-in). `EVALS.md` — upgrade discipline. Reference only, never loaded at runtime.
