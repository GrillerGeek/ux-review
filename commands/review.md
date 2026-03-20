---
description: Run a comprehensive UX review with simulated user personas and specialist analysis
argument-hint: [url-or-path] [--screenshots-only]
---

Initialize the UX review workspace by running the init script:

!`bash ${CLAUDE_PLUGIN_ROOT}/scripts/init-review.sh`

Detect the application type from `$ARGUMENTS`:
- If the argument is a URL (starts with http:// or https://), this is a **web application** review
- If the argument is a file path or the current directory contains CLI framework files, this is a **CLI tool** review
- If `--screenshots-only` is present, this is an **image analysis** review
- If no arguments are provided, ask the user what application to review using AskUserQuestion

Load and follow the orchestration workflow defined in `${CLAUDE_PLUGIN_ROOT}/skills/ux-review-orchestration/SKILL.md`.

Begin Phase 1 by conducting the intake interview. Use AskUserQuestion to ask the user about their application, target users, key workflows, and known pain points. Follow the interview guide at `${CLAUDE_PLUGIN_ROOT}/skills/ux-review-orchestration/references/interview-guide.md`.

After intake, proceed through all 7 phases as defined in the orchestration skill: persona generation, simulated interviews, app walkthroughs, specialist reviews, synthesis, and collaborative backlog creation.
