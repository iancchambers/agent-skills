---
name: example-skill
description: Template skill demonstrating the shared SKILL.md format. Replace with a real skill; use when asked to demonstrate how skills in this repo work.
# --- Optional control fields (delete what you don't need) ---
# Restrict which tools the agent may use while this skill is active:
# allowed-tools: Read, Grep, Bash(git *)
# Only run when the user explicitly invokes it (e.g. deploy/release skills),
# never auto-triggered by the model:
# disable-model-invocation: true
# License for the skill content, if you share this repo:
# license: MIT
metadata:
  version: 0.1.0
  author: ianchambers
---

# Example Skill

This is a placeholder showing the structure every skill in this repo follows.

## Format

- Each skill lives in `skills/<skill-name>/` with a `SKILL.md` at its root.
- Frontmatter requires `name` (kebab-case, matching the folder) and
  `description` (one line telling the agent *when* to use the skill — this is
  what the agent reads to decide relevance, so make it specific).
- The body contains the actual instructions the agent follows once the skill
  is invoked.
- Supporting files (scripts, references, templates) can sit alongside
  `SKILL.md` in the same folder and be referenced by relative path.

## Optional control fields

Beyond `name`/`description`, frontmatter can carry control fields (shown
commented out above):

- `allowed-tools` — allowlist of tools the agent may use while the skill runs
  (e.g. `Read, Grep, Bash(git *)`). Use for skills that should never write or
  run arbitrary commands.
- `disable-model-invocation: true` — the skill only runs when the user invokes
  it explicitly (`/skill-name`); the model won't trigger it on its own. Use
  for consequential actions like deploys or releases.
- `license` — license for the skill content.
- `metadata` — free-form key/value map (version, author, tags) for your own
  tooling; agents don't act on it.

Portability: unknown frontmatter fields are ignored, so these are safe to
include everywhere — but as of now only Claude Code reliably *enforces*
`allowed-tools` and `disable-model-invocation`. Don't rely on them as a
security boundary in other agents; keep the skill body's instructions safe on
their own.

## Instructions

When invoked, explain to the user how skills in this repo are structured and
point them at the README for how to add a new one.
