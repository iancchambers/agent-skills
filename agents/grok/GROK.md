# Grok — Global Instructions

Managed in the agent-skills repo; edit there, not in ~/.grok. Symlinked to
`~/.grok/GROK.md` by `install.sh`.

## Working style

- Prefer small, focused changes; don't refactor beyond the scope of the task.
- Match the existing code style of whatever project you are in.
- Run the project's tests/linters before declaring work done, when available.
- Ask before destructive or hard-to-reverse actions (deletes, force pushes,
  publishing).

## Git

- Never commit or push unless explicitly asked.
- Write imperative, present-tense commit messages ("Add X", not "Added X").

## Skills

Shared skills are linked into `~/.grok/skills/`. Use them when their
description matches the task at hand.
