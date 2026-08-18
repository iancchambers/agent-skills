# agent-skills

A single, version-controlled home for AI coding agent configuration. One shared
`skills/` folder is the source of truth for skills; each supported agent gets a
small folder containing only its provider-specific instructions file. An
install script symlinks everything into the right place per agent, so editing a
file here updates every agent at once.

## Layout

```
agent-skills/
├── install.sh              # symlinks configs + skills into each agent's home
├── skills/                 # shared skills (SKILL.md format) — used by ALL agents
│   └── example-skill/
│       └── SKILL.md
└── agents/
    ├── claude/
    │   └── CLAUDE.md       # → ~/.claude/CLAUDE.md
    ├── codex/
    │   └── AGENTS.md       # → ~/.codex/AGENTS.md
    ├── cursor/
    │   └── AGENTS.md       # → ~/.cursor/AGENTS.md
    └── grok/
        └── GROK.md         # → ~/.grok/GROK.md
```

Skills are shared rather than duplicated per agent because the `SKILL.md`
format (a folder containing a `SKILL.md` with name/description frontmatter) has
become a de-facto standard across agents. Each skill directory is symlinked
into every agent's skills directory:

| Agent  | Instructions file      | Skills directory    |
| ------ | ---------------------- | ------------------- |
| Claude | `~/.claude/CLAUDE.md`  | `~/.claude/skills/` |
| Codex  | `~/.codex/AGENTS.md`   | `~/.codex/skills/`  |
| Cursor | `~/.cursor/AGENTS.md`  | `~/.cursor/skills/` |
| Grok   | `~/.grok/GROK.md`      | `~/.grok/skills/`   |

If an agent needs a skill tweaked or excluded, prefer handling it inside the
skill itself (frontmatter/description) before forking a per-agent copy.

## Install

```sh
./install.sh            # install for all agents
./install.sh claude     # install for one or more specific agents
./install.sh claude cursor
```

The script is idempotent: existing correct symlinks are left alone, stale ones
are replaced, and any real (non-symlink) file that would be clobbered is backed
up alongside as `<name>.bak.<timestamp>` first.

## Adding a skill

1. Create `skills/<skill-name>/SKILL.md` with frontmatter:

   ```markdown
   ---
   name: skill-name
   description: One line saying when the agent should use this skill.
   ---

   Instructions for the agent...
   ```

   Optional control fields (`allowed-tools`, `disable-model-invocation`,
   `license`, `metadata`) are documented in `skills/example-skill/SKILL.md`.
   They're safe to include everywhere — agents ignore fields they don't
   support — but currently only Claude Code enforces the tool/invocation
   controls.

2. Re-run `./install.sh` to link it into each agent.

## Adding an agent

1. Create `agents/<agent>/` with its instructions file.
2. Add an entry to the `AGENTS` case block in `install.sh` (instructions file
   source/target + skills directory target).
