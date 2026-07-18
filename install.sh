#!/usr/bin/env bash
# Install (or update) the Senate into ~/.claude.
# The repo is the source of truth: edit here, then re-run this script.
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)"
DEST="${CLAUDE_DIR:-$HOME/.claude}"

mkdir -p "$DEST/agents" "$DEST/skills/senate" "$DEST/senate"

cp "$SRC"/agents/*.md "$DEST/agents/"
cp "$SRC/skills/senate/SKILL.md" "$SRC/skills/senate/roster.yaml" "$SRC/skills/senate/collegium.yaml" "$DEST/skills/senate/"
cp "$SRC/MODEL-POLICY.md" "$SRC/EVALS.md" "$SRC/README.md" "$DEST/senate/"

# Clean up the pre-rename install path (/decide → /senate, 2026-07-18)
rm -rf "$DEST/skills/decide"

echo "The Senate installed to $DEST"
echo "Agents: senator, magister"
echo "Skill:  /senate  (flags: --debate, --log)"
