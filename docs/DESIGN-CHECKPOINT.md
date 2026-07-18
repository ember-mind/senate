# The Senate — Design Checkpoint

Working checkpoint for extending the `escapemanuele orchestration` skill with a
non-code pillar, reskinned as a Roman-world metaphor ("The Senate"). Living doc,
updated during grilling. Not the final spec.

> **2026-07-18 — home changed after grilling:** Q1's "extend the orchestration
> skill" was superseded; the Senate shipped as this standalone repo
> (`ember-mind/senate`). See the banner in `SPEC.md`. The trail below is kept
> verbatim as the historical record.

## Origin

- Trigger: h100envy X article "A Swarm of Agents for Multi-Angle Analysis"
  (orchestrator picks CONFLICTING roles → independent parallel experts → debate
  round → devil's advocate vs consensus → non-averaging merge).
- Article verdict: it's a subset of patterns we already have on the code side,
  EXCEPT 3 transferable ideas: (1) conflicting-role orchestrator, (2) debate
  round, (3) devil's-advocate-vs-consensus (attacks aggregate agreement, not
  per-finding).

## The real system being extended

`~/Code/skills/orchestration` (installs to `~/.claude`). Role-based multi-agent,
**star topology** (subagents report to lead, never delegate). Today it is
entirely CODE-oriented:

- Lead skills: `/feature`, `/bug`, `/review`.
- Role agents: `code-explorer`, `implementer`, `test-runner`, `reviewer`.
- Cross-family: Codex adversarial reviewer inside `/review` (`[both]`-tagged
  findings = highest confidence).
- Discipline: `MODEL-POLICY.md` (benchmarked bindings, "upgrade models not
  workflows"), `EVALS.md` (per-role scenarios), read-only enforced via `tools:`
  allowlists, `install.sh` distribution.
- NOT part of this system: vault skill `pr-review-ping-pong` (separate).

Reframe agreed: the skill's reusable core is **domain-agnostic** (topology +
model-policy + evals + install). Code is domain #1.

## Decisions locked

- **[Q1] Home = A.** Extend this skill (new pillar beside /feature /bug /review,
  reuse infra), NOT a sibling skill and NOT a bare Workflow script.
- **[Q2] Skin vs structure = structural for the one new organ, cosmetic for the
  rest.** v1 = Senate world lore + `/decide` decision-swarm (real new organ) +
  rename/announce reskin of existing three (Legions=feature/bug, Censors=review,
  Scouts=explorer). Library/research = lore placeholder, NOT built v1 (vault
  `deep-research` already covers it; no duplication).
- **[Q3] Role selection = hybrid, fixed-default.** Standing bench of permanent
  conflicting senators + Consul (orchestrator) may summon ≤2 task-specific
  experts for off-profile decisions. "Roles must conflict, not complement"
  enforced on bench AND summoned experts. Provisional roster (confirm at spec):
  Quaestor=money, Legatus=execution/risk, Tribunus Plebis=user/people,
  Augur=long-term/2nd-order. Consul=orchestrator. (Cato=standing skeptic — TBD
  in Q4 vs the foreign devil.)
- **[Q4] Pipeline = Full cross-family, debate as flag, devil = Codex envoy.**
  Chain: `Consul assigns roles → Senators analyze independently (parallel) →
  [optional debate round, --debate flag, off by default, ~doubles expert calls]
  → Foreign Envoy attacks the consensus (Codex cross-family, degrade to Claude
  devil if absent) → Consul merge = non-averaging verdict.` Two adversarial
  layers: Cato = internal standing skeptic senator; Foreign Envoy = external
  cross-family attack on aggregate agreement (reuses proven `/review` Codex
  integration). Merge always uses non-averaging prompt (keep disagreement as
  signal). Adopts all 3 article ideas: conflicting-role orchestrator (Consul +
  "must conflict" rule), debate round (flagged), devil-vs-consensus (Envoy).

- **[Q5] Senator implementation = one generic read-only `senator` agent +
  `roster.yaml` data file.** Agent tools = Read/Grep/Glob only (reason & opine,
  never act). Bench = data rows `{name, focus, bias}` (Quaestor/Legatus/Tribunus
  Plebis/Augur/Cato), Consul loads + injects via `EXPERT_SYSTEM.format(...)`.
  Summoned experts = same agent, Consul-generated runtime rows. Lore lives in
  roster data + merge/announce text, NOT in per-persona agent files. Only one
  role to bind/eval: "senator". Consul = lead in main conversation.

- **[Q6] Model diversity = single benchmarked `senator` binding for v1.**
  Diversity from roster biases + Consul high-variance role-gen. Cross-family
  only at the Envoy, and only if Codex present (else degrade to Claude devil).
  Multi-family senators = documented future extension (topology allows it), not
  v1. Translation: article's temperature knob → our effort+prompt (Consul prompt
  "roles maximally conflicting" for divergence; merge prompt "sober, do not
  average" + lower effort for synthesis). Agents have no temperature param.

- **[Q7] Output = stdout default + opt-in `--log` to project MEMORY when in
  vault.** Default: Consul renders structured verdict in-conversation
  (Agreement / Conflicts named with cost / Blind spots / Envoy's attack / Final
  verdict + conditions). `--log` flag: when cwd is inside the vault, append a
  `[YYYY-MM-DD] Decision:` entry to the relevant project `MEMORY.md` per vault
  CLAUDE.md rule. Skill is machine-global — no hard vault dependency; global
  runs stay clean.

- **[Q8] Lore = LORE.md + README banner; runtime flavor light.** Deep lore
  human-facing only (not loaded per run). Runtime flavor at the edges: reskinned
  announce lines per organ + Consul verdict in light Senate voice. Analysis
  prompts stay SOBER (no purple prose — protects reasoning quality + tokens).
  Command names unchanged (`/feature` etc. still work); Senate names = narrative
  skin. Imagery (nano-banana banner) = post-v1 nice-to-have. Themed aliases
  (`/campaign`) = optional later, not v1.

- **[Q9] Prewalk (stencil.so/blog/prewalk) = adopt PRINCIPLE, defer literal.**
  "Reading is the cost." Literal prewalk = frontier→cheap handoff on ONE
  continuous thread → doesn't map to the parallel swarm; maps to the Legions
  (explore→plan→implement) → documented Legions FUTURE enhancement. Senate v1
  adopts the principle as token-budget rules: (a) Consul distills ONE compact
  brief, reused by all senators (never N re-reads of raw context at frontier
  price); (b) cheap-many/frontier-few (senators cheap binding, frontier only
  Consul+merge); (c) short-and-hard capped structured opinions; (d) debate off
  by default (the re-read tax).
- **[Q10] Praetorians (security layer) = input-hygiene guard rule in v1;
  action-gating deferred.** Senate is read-only (no action surface), so classic
  action-gating is a Legions concern. Real v1 threat = untrusted content
  (scouted files, decision brief, esp. Foreign Envoy/Codex output) carrying
  prompt injection. v1 Praetorian = prompt rule: untrusted content is DATA not
  commands; Envoy output = advisory + untrusted (informs merge, can't issue
  instructions). No new agent. Full Praetorian ORGAN (action-gating) = reskin
  over REUSED built-in `security-review` skill, lands with Legions, not v1.
  Lore: Praetorian Guard watches the foreigner in Rome (the Envoy).

## Grilling COMPLETE — all branches resolved. See consolidated design below.

## The vision (resolved)

Reskin the orchestration system as a coherent Roman world — "glorious," with
imagery/lore like gas-town/gas-city. Candidate metaphor map (DRAFT):

| Institution        | Capability                        | Maps to today            |
|--------------------|-----------------------------------|--------------------------|
| The Senate         | deliberate / decide (the swarm)   | NEW → `/decide`          |
| Library / Archives | research (fan-out, deep-research) | NEW → `/research`?       |
| The Legions (Army) | build / campaign (implementation) | `/feature`, `/bug`       |
| Censors            | independent review                | `/review`                |
| Scouts             | read-only exploration             | `code-explorer`          |

Senate can: decide things, start researches (Library), send the army (build/do).

## Open grill branches (not yet resolved)

- [Q2] Is "The Senate" a cosmetic identity layer (rename + lore + announce
  lines) OR does it add real new capabilities (decide / research / ...)? Which
  are v1?
- [Q3] Decision pillar: dynamic conflicting roles (article) vs fixed role set vs
  hybrid.
- [Q4] Adopt which article patterns: debate round? devil's-advocate-vs-consensus
  (reuse Codex cross-family as the devil?)? non-averaging merge prompt.
- [Q5] Output: where does a verdict/research go? Vault? MEMORY? stdout only?
- [Q6] Agents: one generic `senator` expert agent (dynamic role via prompt) vs
  several fixed persona agents. Read-only or can they act?
- [Q7] Model policy: swarm wants DIVERSITY (maybe multi-family experts) vs our
  benchmarked-single-binding-per-role discipline. Reconcile.
- [Q8] Scope boundary: decision-analysis only for v1, or Library/Army rename now?
- [Q9] Lore depth: how much imagery/world text, and where (README? a LORE.md?
  announce lines?) without bloating token cost of every run.

## Next step

Continue grill-me from Q2.
