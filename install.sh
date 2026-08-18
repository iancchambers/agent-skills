#!/usr/bin/env bash
#
# Symlink shared skills and per-agent instruction files into each agent's
# config directory. Idempotent; real files in the way are backed up first.
#
# Usage:
#   ./install.sh                 install for all agents
#   ./install.sh claude cursor   install for specific agents only

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$REPO_DIR/skills"
ALL_AGENTS=(claude codex cursor grok)

# agent -> "instructions source (repo-relative)|instructions target|skills target dir"
agent_config() {
  case "$1" in
    claude) echo "agents/claude/CLAUDE.md|$HOME/.claude/CLAUDE.md|$HOME/.claude/skills" ;;
    codex)  echo "agents/codex/AGENTS.md|$HOME/.codex/AGENTS.md|$HOME/.codex/skills" ;;
    cursor) echo "agents/cursor/AGENTS.md|$HOME/.cursor/AGENTS.md|$HOME/.cursor/skills" ;;
    grok)   echo "agents/grok/GROK.md|$HOME/.grok/GROK.md|$HOME/.grok/skills" ;;
    *)      return 1 ;;
  esac
}

log()  { printf '  %s\n' "$*"; }
warn() { printf 'WARN: %s\n' "$*" >&2; }

# Symlink $1 -> $2, backing up any real file already at $2.
link() {
  local src="$1" dest="$2"

  if [[ ! -e "$src" ]]; then
    warn "source missing, skipping: $src"
    return
  fi

  if [[ -L "$dest" ]]; then
    if [[ "$(readlink "$dest")" == "$src" ]]; then
      log "ok      $dest"
      return
    fi
    rm "$dest"
  elif [[ -e "$dest" ]]; then
    local backup="$dest.bak.$(date +%Y%m%d%H%M%S)"
    mv "$dest" "$backup"
    log "backup  $dest -> $backup"
  fi

  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
  log "linked  $dest -> $src"
}

install_agent() {
  local agent="$1" config
  if ! config="$(agent_config "$agent")"; then
    warn "unknown agent: $agent (known: ${ALL_AGENTS[*]})"
    return 1
  fi

  local instructions_src instructions_dest skills_dest
  IFS='|' read -r instructions_src instructions_dest skills_dest <<<"$config"

  printf '%s\n' "$agent:"
  link "$REPO_DIR/$instructions_src" "$instructions_dest"

  # Link each skill individually so agent-local skills can coexist.
  mkdir -p "$skills_dest"
  local skill
  for skill in "$SKILLS_DIR"/*/; do
    [[ -f "$skill/SKILL.md" ]] || continue
    link "${skill%/}" "$skills_dest/$(basename "$skill")"
  done
}

agents=("${@:-${ALL_AGENTS[@]}}")
for agent in "${agents[@]}"; do
  install_agent "$agent"
done

printf '\nDone.\n'
