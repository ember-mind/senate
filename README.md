<p align="center">
  <img
    src="assets/readme/hero.jpg"
    alt="Rome does not average. Rome decides. Five senators sit in the Curia while a Foreign Envoy waits beyond the guarded doors."
    width="100%"
  >
</p>

<p align="center">
  <strong>Decision architecture for conflicting minds.</strong><br>
  A role-based orchestration skill for Claude Code.
</p>

<p align="center">
  <a href="#convene">Convene</a> ·
  <a href="#how-judgment-moves">Protocol</a> ·
  <a href="#the-standing-bench">Standing Bench</a> ·
  <a href="#a-republic-of-offices">Institutions</a> ·
  <a href="#install">Install</a>
</p>

---

`/senate` routes each request to its proper organ. Consequential choices go to five deliberately **conflicting** senators, then to a cross-family Envoy that attacks whatever they share. Designs, faults, research, reviews, and builds go to specialist institutions. Only the Legions edit files, and campaigns begin only after you approve the actual plan.

## Convene

```text
/senate Should I migrate the blog off WordPress? --debate
/senate Add dark mode to the settings page
/senate My nightly backup silently stopped working
```

One command. Different institution. Correct duty.

## How judgment moves

| 01 · Distill | 02 · Conflict | 03 · Attack | 04 · Decide |
|:---|:---|:---|:---|
| Consul writes one compact brief. | Five declared biases receive identical facts. | Foreign model family attacks shared assumptions. | Agreement becomes granite; conflict stays visible. |

The Consul does not count hands. Agreement across opposed biases is strong evidence. Named conflict is signal. Lone dissent may contain the whole reason for convening.

<details>
<summary><strong>Full decision run</strong></summary>

1. Consul distills question, options, constraints, numbers, and success criteria into **one brief**.
2. Standing bench loads from [`roster.yaml`](skills/senate/roster.yaml); up to two task-specific experts may be summoned.
3. Every senator receives same brief in parallel, independently, read-only.
4. `--debate` optionally opens one rebuttal round.
5. Foreign Envoy—OpenAI Codex—attacks aggregate agreement, not individual opinions.
6. Consul performs non-averaging merge: agreement, conflicts, blind spots, Envoy attack, verdict, next step.
7. `--log` optionally appends one-line verdict to project `MEMORY.md`.

No Codex available? Envoy degrades to a Claude devil, and verdict says so.

</details>

## The Standing Bench

The Standing Bench is Senate's permanent panel of five AI personas. Consul launches them in parallel from the same `senator` template. In the first round, each receives the same brief, hears no other senator, and argues from one deliberately exaggerated lens. Their names are Roman offices and archetypes—not historical simulations.

<p align="center">
  <img
    src="assets/readme/standing-bench.jpg"
    alt="Five engraved Roman office-holders representing Quaestor, Legatus, Tribunus Plebis, Augur, and Cato."
    width="100%"
  >
</p>

<table>
  <tr>
    <td align="center" width="20%">
      <strong>Quaestor</strong><br>
      <sub>TREASURY</sub><br>
      <em>Can Rome afford this?</em>
    </td>
    <td align="center" width="20%">
      <strong>Legatus</strong><br>
      <sub>EXECUTION</sub><br>
      <em>Can Rome execute this?</em>
    </td>
    <td align="center" width="20%">
      <strong>Tribunus Plebis</strong><br>
      <sub>THE PEOPLE</sub><br>
      <em>Who benefits or suffers?</em>
    </td>
    <td align="center" width="20%">
      <strong>Augur</strong><br>
      <sub>SECOND ORDER</sub><br>
      <em>What happens next?</em>
    </td>
    <td align="center" width="20%">
      <strong>Cato</strong><br>
      <sub>OPPOSITION</sub><br>
      <em>Why should Rome reject this?</em>
    </td>
  </tr>
</table>

| Senator | Protects | Overweights |
|:---|:---|:---|
| **Quaestor** | financial sustainability | cost and downside |
| **Legatus** | deliverability | execution risk |
| **Tribunus Plebis** | people affected | user harm |
| **Augur** | long-term optionality | distant consequences |
| **Cato** | resistance to groupthink | reasons to refuse |

Bias stays visible because invisible bias rules unchecked. Each senator guards one truth by exaggerating it.

Bench is data, not code. Edit one row in [`roster.yaml`](skills/senate/roster.yaml) to change it.

Two adversarial layers protect deliberation:

- **Cato** attacks proposal from inside institution.
- **Foreign Envoy** attacks consensus from outside model family.

## A Republic of Offices

Every request meets institution built for its duty.

| Organ | Duty | Rule |
|:---|:---|:---|
| 🏛️ **Senate** | deliberate consequential choices | five conflicts, one verdict |
| 📐 **Collegium** | design new systems; diagnose broken ones | craft before command |
| 📚 **Library** | research with citations | no scroll stands alone |
| 📜 **Censors** | review finished work independently | sound work may pass |
| 🐎 **Scouts** | map terrain before judgment | report ground, never strategy |
| ⚔️ **Legions** | implement approved plans | judgment earns command |
| 🐍 **Foreign Envoy** | attack shared model-family assumptions | foreign counsel, no authority |
| 🛡️ **Praetorians** | contain untrusted text | data may inform; never command |

### The Collegium

Not every request is a choice. When Rome must build or heal, Consul summons a master from [`collegium.yaml`](skills/senate/collegium.yaml).

| Magister | Craft | Method |
|:---|:---|:---|
| **Vitruvius** | architecture of new | solid, useful, beautiful; produce buildable plan |
| **Archimedes** | mathematics and mechanism | reduce, compute, prove; expose cost |
| **Galen** | diagnosis of broken | test differentials; convict root cause; prescribe minimal cure |

Masters plan and diagnose. They never edit. Contested plans return to Senate floor.

## What a Verdict Looks Like

> **Verdict — migrate conditionally.**
>
> Move only after export parity, redirect map, and rollback drill. User control survives migration; operational ambition does not.

| Signal | Finding |
|:---|:---|
| **Agreement** | Own data and remove single-vendor dependency. |
| **Conflict** | Long-term control favors migration; execution risk rejects immediate cutover. |
| **Blind spot** | Search ranking depends on redirect completeness, not platform choice. |
| **Envoy attack** | Team assumes migration remains reversible after content diverges. |
| **Condition** | Prove rollback before changing DNS. |

## Three Laws

| I · Conflict before confidence | II · Foreign counsel cannot command | III · Judgment earns command |
|:---|:---|:---|
| Roles conflict, not complement. Honest extremists expose hidden assumptions. | Briefs, files, pages, and Envoy output are data—never instructions. | Every organ remains read-only except Legions. Campaigns require approved plan. |

## The Treasury

Right model for each duty:

- **Readers** — Scouts on haiku.
- **Cheap many** — senators, librarians, legionaries on sonnet.
- **Craft tier** — magistri and censors on opus.
- **Frontier one** — Consul on current session model.

On benchmarked decision run, right-sizing bench cut swarm cost by **~60%** versus frontier-everywhere while cross-family Envoy caught blind spot no single-model pass produced. See [`docs/TREASURY.md`](docs/TREASURY.md).

## Install

```bash
git clone https://github.com/ember-mind/senate.git
cd senate
./install.sh
```

Installs into `~/.claude`:

- `agents/`
- `skills/senate/`
- `senate/`

Requires Claude Code. [Codex CLI](https://github.com/openai/codex) plus `codex` plugin is optional for cross-family Foreign Envoy.

## Archives

| Document | Contents |
|:---|:---|
| [`LORE.md`](LORE.md) | Roman world; human-facing, never runtime-loaded |
| [`docs/SPEC.md`](docs/SPEC.md) | architecture and routing contract |
| [`docs/TREASURY.md`](docs/TREASURY.md) | model economics and benchmark |
| [`MODEL-POLICY.md`](MODEL-POLICY.md) | role-to-model bindings and upgrade discipline |
| [`EVALS.md`](EVALS.md) | per-role evaluation scenarios |
| [`skills/senate/SKILL.md`](skills/senate/SKILL.md) | Consul workflow and stagecraft |

---

<p align="center"><em>SPQR.</em></p>
