---
name: UX Review Orchestration
description: This skill should be used when the user asks to "run a UX review", "review UX", "get user feedback on my app", "conduct usability testing", "create UX personas", "test with user personas", "do a usability audit", "find UX issues", "evaluate usability", or invokes the /ux-review command. Orchestrates a multi-agent UX review workflow with simulated persona research and specialist analysis.
---

# UX Review Orchestration

Orchestrate a comprehensive, multi-agent UX review workflow that produces actionable findings and a prioritized backlog. The workflow simulates real user research by creating personas, conducting simulated interviews and walkthroughs, and dispatching specialist agents for technical and visual analysis.

## Workflow Overview

The review proceeds through 7 phases. Each phase has clear entry criteria, actions, and outputs.

| Phase | Name | Agent(s) | Output |
|-------|------|----------|--------|
| 1 | Intake Interview | Moderator | `.ux-review/interviews/intake.md` |
| 2 | Persona Generation | Moderator | `.ux-review/personas/*.md` |
| 3 | Persona Interviews | persona-interviewer (parallel) | `.ux-review/interviews/*.md` |
| 4 | App Walkthroughs | persona-interviewer (parallel) | `.ux-review/walkthroughs/*.md` |
| 5 | Specialist Reviews | technical-ux + visual-ux (parallel) | `.ux-review/specialist-reports/*.md` |
| 6 | Synthesis | Moderator | `.ux-review/summary-report.md` |
| 7 | Backlog Creation | Moderator + User | `.ux-review/backlog.md` |

## Agents

This workflow uses four co-located agents defined in the plugin's `agents/` directory:

- **`ux-review-moderator`** — Orchestrates all phases, conducts intake, generates personas, synthesizes findings
- **`persona-interviewer`** — Simulates a specific user persona for interviews and walkthroughs (dispatched once per persona)
- **`technical-ux-specialist`** — Evaluates information architecture, task flows, error handling, accessibility
- **`visual-ux-specialist`** — Evaluates visual design quality and creates improvement mockups

Dispatch agents using the Agent tool with the appropriate agent name. The moderator dispatches persona-interviewers and specialists; the orchestrating session dispatches the moderator.

## Prerequisites

The following tools and integrations enhance the review but are not required:

- **Chrome DevTools MCP or Playwright MCP** — Enables live web app interaction, screenshots, and accessibility audits. Without these, fall back to screenshot analysis or code review.
- **Figma MCP** — Enables the visual specialist to create polished design proposals in Figma. Without it, HTML mockups are used (default).
- **Excalidraw MCP** — Enables flow diagrams and architecture wireframes. Optional.

## App Type Detection

Detect the application type from the provided arguments or project context:

- **Web app:** URL provided (http/https), or project contains web framework (package.json, HTML files)
- **CLI tool:** Path to executable, or project uses CLI frameworks (commander, click, cobra, argparse)
- **Screenshots only:** `--screenshots-only` flag passed
- **Documentation/wireframes:** Markdown, design files, or specification documents provided

Select the appropriate walkthrough strategy from `references/walkthrough-strategies.md` based on the detected type.

## Phase Details

### Phase 1 — Intake Interview

Conduct a structured interview with the user using AskUserQuestion. Follow the question framework in `references/interview-guide.md`. Cover: app purpose, target users, key workflows, known pain points, business goals, competitive landscape, success metrics, and review scope.

Save responses to `.ux-review/interviews/intake.md`. If the user is short on time, use the minimum viable intake (4 questions) from the interview guide.

### Phase 2 — Persona Generation

Generate 3-5 simulated user personas based on intake data. Use the profile structure from `references/persona-template.md`. Ensure diversity across:

- Tech comfort levels (at least one novice, one expert)
- Use frequency (daily users and occasional visitors)
- Accessibility needs (at least one persona with specific needs)
- Primary goals (covering different app workflows)

Save each persona to `.ux-review/personas/[kebab-name].md`. Present personas to the user for review before proceeding.

### Phase 3 — Simulated Persona Interviews

Dispatch one `persona-interviewer` agent per persona, in parallel. Each agent receives:

- The full persona profile
- The intake summary
- The app type and access details
- Instructions to save output to `.ux-review/interviews/[persona-name].md`

Instruct each agent to role-play as its assigned persona, articulating expectations, concerns, must-haves, and deal-breakers.

### Phase 4 — App Walkthroughs

Dispatch `persona-interviewer` agents again (one per persona, parallel). Each agent:

- Navigates or uses the app from their persona's perspective
- Follows the interaction strategy for the detected app type
- Documents step-by-step experience with friction ratings
- Saves output to `.ux-review/walkthroughs/[persona-name].md`

### Phase 5 — Specialist Reviews

Dispatch `technical-ux-specialist` and `visual-ux-specialist` agents in parallel. Provide each with:

- Intake notes from `.ux-review/interviews/intake.md`
- All persona profiles from `.ux-review/personas/`
- All walkthrough reports from `.ux-review/walkthroughs/`
- App access details (URL, path, or screenshots)

Direct the technical specialist to evaluate: information architecture, navigation, task flows, error handling, accessibility (WCAG 2.1 AA), pattern consistency, cognitive load.

Direct the visual specialist to evaluate: visual hierarchy, typography, color/contrast, spacing, brand consistency, responsive behavior. Instruct it to create HTML mockups for top improvement suggestions.

### Phase 6 — Synthesis

Read all artifacts from `.ux-review/` and synthesize into a summary report. Use the structure from `references/report-template.md`:

- Executive summary with top 5 findings
- Persona insights matrix (goal achievability, friction points, satisfaction)
- Technical UX findings by severity
- Visual UX findings with mockup references
- Prioritized recommendations (P0 through P3)
- Artifacts index

Save to `.ux-review/summary-report.md`. Present the executive summary and top findings to the user.

### Phase 7 — Collaborative Backlog Creation

Facilitate interactive backlog creation with the user using AskUserQuestion:

1. Present findings organized by priority
2. Ask the user to confirm or adjust priorities
3. Discuss effort estimates (user has implementation context)
4. Identify dependencies between items
5. Finalize the backlog

Use the item format from `references/backlog-template.md`. Save to `.ux-review/backlog.md`.

## Error Handling

- **App unreachable:** Ask for alternatives — local dev server, screenshots, documentation. Fall back to code review if no interaction method is available.
- **Browser automation unavailable:** Fall back to screenshot analysis or source code review. Note reduced confidence in findings.
- **Agent failure:** Report partial findings. Note gaps in the summary report. Continue with available data.
- **No Figma MCP:** Visual specialist uses HTML mockups only (default behavior).
- **Insufficient intake data:** Use minimum viable intake. Note assumptions in the report.

Always produce a report even with incomplete data. Mark findings with confidence levels: High (directly observed), Medium (inferred from partial data), Low (inferred from code/docs only).

## Artifact Path Conventions

All artifacts are relative to the project root:

```
.ux-review/
├── interviews/
│   ├── intake.md
│   ├── [persona-name].md
│   └── ...
├── personas/
│   ├── [persona-name].md
│   └── ...
├── walkthroughs/
│   ├── [persona-name].md
│   └── ...
├── specialist-reports/
│   ├── technical-ux.md
│   └── visual-ux.md
├── mockups/
│   ├── [description].html
│   └── ...
├── summary-report.md
└── backlog.md
```

## Reference Files

- **`references/persona-template.md`** — Persona profile structure and diversity guidelines
- **`references/interview-guide.md`** — Intake question framework with minimum viable set
- **`references/walkthrough-strategies.md`** — Per-app-type interaction and evaluation guides
- **`references/report-template.md`** — Summary report structure with severity guidelines
- **`references/backlog-template.md`** — Backlog item format and collaborative creation process
