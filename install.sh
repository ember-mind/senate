#!/usr/bin/env bash
# Install (or update) the Senate into ~/.claude.
# The repo is the source of truth: edit here, then re-run this script.
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)"
DEST="${CLAUDE_DIR:-$HOME/.claude}"

mkdir -p "$DEST/agents" "$DEST/skills/convene" "$DEST/senate"

cp "$SRC"/agents/*.md "$DEST/agents/"
cp "$SRC/skills/convene/SKILL.md" "$SRC/skills/convene/roster.yaml" "$SRC/skills/convene/collegium.yaml" "$DEST/skills/convene/"
cp "$SRC/MODEL-POLICY.md" "$SRC/EVALS.md" "$SRC/README.md" "$DEST/senate/"

# Clean up the pre-rename skill dir (skill senate → convene, 1.0.0)
rm -rf "$DEST/skills/senate"

echo "The Senate installed to $DEST"
echo "Agents: senator, magister, explorator, censor, librarian, legionary"
echo "Skill:  /convene  (flags: --debate, --log)"
