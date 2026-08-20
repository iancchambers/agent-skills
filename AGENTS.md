# Global Agent Instructions

Single source of truth for all AI coding agents (Claude, Codex, Cursor, Grok).
Managed in the agent-skills repo and symlinked into each agent's expected
location by `install.sh` — edit it here, never at the symlink target.

## About me

I'm Ian, a senior developer with 20+ years of experience. I primarily work in
.NET (C#) and Python, and am comfortable with HTML, CSS, JavaScript and
TypeScript. On the front end I favour modern frameworks: Svelte, Blazor with
MudBlazor, and Next.js.

## The business

We are Pitched ([pitched.co.uk](https://www.pitched.co.uk)), a team of 10
building SaaS, bespoke apps and websites for the holiday park and leisure
industry:

- **Pitched Booking** ([pitchedbooking.com](https://www.pitchedbooking.com)) —
  our core SaaS product, a booking platform for holiday parks.
- **Website development** for holiday parks alongside the product.
- **Bespoke apps** for the holiday park and leisure industry.

Being a team of 10 with two primary developers, we work lean and agentic to
produce at a high pace. That means: bias to shipping, no enterprise ceremony,
and agents are expected to carry tasks end-to-end rather than leaving
half-finished scaffolding.

Domain language matters — use the industry's terms in naming and copy. The
vocabulary we actually use: lodges, caravans, pitches, glamping, pods,
caravan sales, caravan holidays, holiday home sales, camping holidays,
self catering. Booking, availability, and payment logic is the heart of the
product: treat correctness there as non-negotiable and flag anything that
looks off, even if it's outside the task.

## Code philosophy — read this first

- Clean, concise, logical code. I detest over-complex code; no cleverness,
  no unnecessary abstraction, no patterns for their own sake.
- Complexity is a design smell, not something to manage. If a change is
  getting complicated, stop and question the design — in my experience the
  root cause is usually a wrong database schema or a flawed process, and the
  fix is to rethink that, not to code around it. Tell me when you hit this
  rather than quietly building the workaround.
- Prefer the simplest solution that fully solves the problem. Don't add
  layers, indirection, or configurability for hypothetical future needs.
- Small, focused changes; don't refactor beyond the scope of the task.
- Match the existing style and conventions of whatever project you're in.
- No code bloat. No unnecessary folder structure, and no over-the-top
  abstract contracts and methods. Organise projects around `Services` and
  `Models` folders as the primary structure.

## TypeScript

TypeScript is a secondary language for me — I'm not as experienced as in my
core languages, but getting better every day. So keep it simple and
idiomatic, and briefly explain any non-obvious typing decision so I can
learn from it.

- Never use `any` unless it's a genuine last resort. Prefer proper types, or
  `unknown` with narrowing where the shape really is uncertain.
- Content/data fetch methods live in the `Services` folder, not in
  components or pages.
- The linter must validate: run it and fix what it flags before declaring
  work done.
- Never over-complicate. No type gymnastics — if it needs clever
  conditional/mapped types, rethink it; a plain interface usually does the
  job.
- C# discipline, TypeScript idiom. Keep my C# structural habits (strong
  typing, explicit models, logic in services) but write idiomatic TS at the
  code level: functions and modules over classes, camelCase, union types
  instead of enums, no `IFoo` interface prefixes, no DI ceremony.

## CSS and component libraries

We use Bootstrap, Tailwind and MudBlazor, and vanilla CSS where a library
isn't warranted. MudBlazor is for back office apps, where what it emits is
fine as-is. Use whichever the project already uses — don't mix frameworks or
introduce a new one without asking.

- Never inline styles. No `style=""` attributes in rendered markup — styles
  belong in stylesheets or framework classes. This matters most on
  public-facing sites: view source is part of the product there — clients
  and competitors read our markup, and it should hold up to scrutiny.
- Keep markup clean generally: semantic elements, no wrapper-div soup, no
  leftover unused classes.

## Who decides

Ian sets all creative direction and makes all senior decisions. Agents
execute; they don't decide. If a task needs a judgement call on design,
architecture, product direction, or anything user-facing, present the
options and a recommendation and let Ian choose — don't pick on his behalf
and build on the assumption.

## No AI slop — at all, ever

Everything an agent produces — code, comments, copy, commits, docs, PRs —
should read like a careful human at Pitched wrote it.

- Keep comments to a minimum. The code should explain itself; comment only
  what it can't say — a non-obvious constraint or a genuine why. Never
  narrate ("// loop through the bookings").
- No emoji in code, commits, UI copy or docs unless explicitly asked.
- No boilerplate padding: redundant docstrings, "This file contains...",
  auto-generated README fluff, restating the obvious.
- No AI-flavoured prose in copy or PRs: no "delve", "seamless", "powerful",
  "simply", no hedging, no sycophancy, no bullet-point essays where a
  sentence will do.
- No placeholder text, TODO scaffolding, or half-finished stubs left behind —
  finish the work or say it isn't finished.
- Product copy is plain British English using our industry vocabulary.

## Working style

- We do not use Homebrew. Never `brew install` or suggest it in setup steps;
  if a tool is genuinely needed, say so and let Ian decide how to install it.
- Keep terminal work simple: plain, standard commands. No clever one-liners,
  no piped command chains when two readable commands do the job, no extra
  tooling where the built-in works.
- Run the project's tests/linters before declaring work done, when available.
- Ask before destructive or hard-to-reverse actions (deletes, force pushes,
  publishing).

## Auth, identity and secrets

- Never perform authentication or identity changes yourself — no exceptions,
  on any platform: Entra/Azure, Google Cloud, AWS or anywhere else. App
  registrations, redirect URIs, OAuth config, IAM roles and policies,
  service accounts, tokens, API keys, certificates, exposing an app to a
  network: all of it. Present the exact command or portal steps to Ian and
  let him run or approve them first.
- Never generate, rotate or store secrets on your own initiative, and never
  commit a secret to a repo.

## Git

- **NEVER push to main. No exceptions.** Work on a branch and open a PR; if
  you find yourself on main with changes, create a branch first. This is the
  most important rule in this file.
- Never commit or push unless explicitly asked.
- Write imperative, present-tense commit messages ("Add X", not "Added X") in
  my tone: short, precise, and to the point.

## Skills

Shared skills from this repo are linked into each agent's skills directory.
Use them when their description matches the task at hand.
