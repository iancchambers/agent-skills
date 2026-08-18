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

## Working style

- Run the project's tests/linters before declaring work done, when available.
- Ask before destructive or hard-to-reverse actions (deletes, force pushes,
  publishing).

## Git

- Never commit or push unless explicitly asked.
- Write imperative, present-tense commit messages ("Add X", not "Added X") in
  my tone: short, precise, and to the point.

## Skills

Shared skills from this repo are linked into each agent's skills directory.
Use them when their description matches the task at hand.
