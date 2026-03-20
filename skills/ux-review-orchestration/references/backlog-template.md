# Backlog Item Template

Use this format when creating backlog items during Phase 7. Save the backlog to `.ux-review/backlog.md`.

## Item Format

```markdown
## [UXRV-###] [Title]

**Category:** technical-ux | visual-ux | persona-driven
**Priority:** P0 (Critical) | P1 (High) | P2 (Medium) | P3 (Low)
**Effort:** S (< 1 day) | M (1-3 days) | L (3-5 days) | XL (1-2 weeks)
**Source:** [Which phase/agent/persona identified this]

### Description
[Clear description of what needs to change and why. Include the user impact.]

### Acceptance Criteria
- [ ] [Specific, testable criterion]
- [ ] [Specific, testable criterion]

### Related Artifacts
- Persona: [Persona name if persona-driven]
- Report: [Path to relevant specialist report]
- Mockup: [Path to mockup if one exists]
- Screenshot: [Path to screenshot showing the issue]

### Notes
[Any additional context, constraints, or implementation suggestions]
```

## Backlog File Structure

```markdown
# UX Review Backlog

**Generated:** [Date]
**Application:** [App name]
**Total Items:** [Count]

## Summary by Priority

| Priority | Count | Categories |
|----------|-------|------------|
| P0 | [n] | [categories] |
| P1 | [n] | [categories] |
| P2 | [n] | [categories] |
| P3 | [n] | [categories] |

---

## P0 — Critical (Do This Week)

[Items...]

## P1 — High (This Sprint)

[Items...]

## P2 — Medium (Next Quarter)

[Items...]

## P3 — Low (Backlog)

[Items...]
```

## Priority Assignment Guidelines

- **P0:** Blocks core workflows, causes data loss, critical accessibility failure, security issue
- **P1:** Major friction in common workflows, affects multiple personas, high user impact
- **P2:** Moderate friction, affects specific personas or secondary workflows
- **P3:** Polish, nice-to-have, affects edge cases or power users only

## Effort Estimation Guidelines

- **S (Small):** Copy change, color fix, simple CSS adjustment, add a tooltip
- **M (Medium):** Component redesign, form validation improvement, error state addition
- **L (Large):** Workflow restructuring, new feature addition, navigation overhaul
- **XL (Extra Large):** Architecture change, major redesign, new subsystem

## Collaborative Backlog Creation Process

The backlog creation phase is interactive. Follow these steps:

1. Present all findings organized by priority
2. Ask the user to confirm or adjust priorities
3. Ask if any items should be split, merged, or removed
4. Ask about effort estimates — the user has implementation context
5. Ask if there are dependencies between items that should be noted
6. Confirm the final backlog before saving

The goal is a backlog the team can immediately start working from, not a wish list.
