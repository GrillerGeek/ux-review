# UX Review Plugin for Claude Code

A multi-agent UX review system that conducts comprehensive usability analysis using simulated user personas and specialist agents.

## Installation

```bash
claude install-plugin https://github.com/GrillerGeek/skills.git
```

## Usage

```bash
/ux-review https://myapp.com           # Review a web application
/ux-review ./my-cli-tool               # Review a CLI tool
/ux-review --screenshots-only          # Review from screenshots only
```

## What It Does

The `/ux-review` command orchestrates a structured 7-phase UX review:

| Phase | What Happens |
|-------|-------------|
| **1. Intake Interview** | Asks about your app, users, goals, and known pain points |
| **2. Persona Generation** | Creates 3-5 diverse simulated user personas |
| **3. Persona Interviews** | Each persona articulates their needs and concerns (parallel) |
| **4. App Walkthroughs** | Each persona uses the app and reports friction points (parallel) |
| **5. Specialist Reviews** | Technical UX + Visual UX specialists analyze the app (parallel) |
| **6. Synthesis** | All findings combined into a prioritized summary report |
| **7. Backlog Creation** | Collaborative session to build an actionable backlog |

All artifacts are saved to a `.ux-review/` directory in your project.

## Agents

| Agent | Role | Color |
|-------|------|-------|
| **ux-review-moderator** | Orchestrates all phases, conducts intake, synthesizes findings | Blue |
| **persona-interviewer** | Embodies a user persona for interviews and walkthroughs | Green |
| **technical-ux-specialist** | Evaluates IA, task flows, error handling, accessibility (WCAG 2.1 AA) | Cyan |
| **visual-ux-specialist** | Evaluates visual design and creates HTML improvement mockups | Magenta |

## Supported App Types

- **Web applications** — Live interaction via Chrome DevTools or Playwright MCP
- **CLI tools** — Command execution and help text evaluation via Bash
- **Screenshots** — Visual analysis of provided images
- **Docs/wireframes** — Information architecture and flow review

## Optional Integrations

These MCP servers enhance the review but are not required:

- **Chrome DevTools MCP** or **Playwright MCP** — Live web app interaction and screenshots
- **Figma MCP** — Polished design proposals (falls back to HTML mockups)
- **Excalidraw MCP** — Flow diagrams and wireframes

## Output

After a review, your project will contain:

```
.ux-review/
├── interviews/          # Intake notes + persona interview transcripts
├── personas/            # Simulated user persona profiles
├── walkthroughs/        # Per-persona app walkthrough reports
├── specialist-reports/  # Technical UX + Visual UX analysis
├── mockups/             # HTML mockups of proposed improvements
├── summary-report.md    # Synthesized findings with top 5 issues
└── backlog.md           # Prioritized, actionable backlog items
```
