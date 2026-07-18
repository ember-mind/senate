#!/usr/bin/env bash
# Install (or update) the Senate into ~/.claude.
# The repo is the source of truth: edit here, then re-run this script.
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)"
DEST="${CLAUDE_DIR:-$HOME/.claude}"

mkdir -p "$DEST/agents" "$DEST/skills/decide" "$DEST/senate"

cp "$SRC"/agents/*.md "$DEST/agents/"
cp "$SRC/skills/decide/SKILL.md" "$SRC/skills/decide/roster.yaml" "$DEST/skills/decide/"
cp "$SRC/MODEL-POLICY.md" "$SRC/EVALS.md" "$SRC/README.md" "$DEST/senate/"

echo "The Senate installed to $DEST"
echo "Agent:  senator"
echo "Skill:  /decide  (flags: --debate, --log)"
