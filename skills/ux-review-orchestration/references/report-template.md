# UX Review Summary Report Template

Use this structure when synthesizing findings from all phases into the final report. Save to `.ux-review/summary-report.md`.

## Report Structure

```markdown
# UX Review Summary Report

**Application:** [App name]
**Review Date:** [Date]
**App Type:** [Web / CLI / Mobile / Desktop]
**Personas Evaluated:** [Number] personas

---

## Executive Summary

### Top 5 Findings

| # | Finding | Severity | Category | Affected Personas |
|---|---------|----------|----------|-------------------|
| 1 | [Finding] | Critical | [Tech/Visual/Persona] | [Names] |
| 2 | [Finding] | High | [Tech/Visual/Persona] | [Names] |
| 3 | [Finding] | High | [Tech/Visual/Persona] | [Names] |
| 4 | [Finding] | Medium | [Tech/Visual/Persona] | [Names] |
| 5 | [Finding] | Medium | [Tech/Visual/Persona] | [Names] |

### Overall Assessment
[2-3 paragraph summary of the app's UX strengths and key areas for improvement]

---

## Persona Insights Matrix

| Aspect | [Persona 1] | [Persona 2] | [Persona 3] |
|--------|-------------|-------------|-------------|
| Primary Goal Achievable? | Yes/Partial/No | Yes/Partial/No | Yes/Partial/No |
| Key Friction Point | [Point] | [Point] | [Point] |
| Satisfaction Estimate | High/Med/Low | High/Med/Low | High/Med/Low |
| Critical Blocker? | [Yes/No + detail] | [Yes/No + detail] | [Yes/No + detail] |

### Persona-Specific Insights
[For each persona, 2-3 sentences summarizing their experience and unique perspective]

---

## Technical UX Findings

### Critical Issues
[Issues that prevent task completion or cause data loss]

### High-Severity Issues
[Issues that significantly impair usability for many users]

### Medium-Severity Issues
[Issues that cause friction but have workarounds]

### Low-Severity Issues
[Minor polish items and nice-to-haves]

For each issue:
- **Description:** [What the problem is]
- **Location:** [Where it occurs]
- **Impact:** [Who is affected and how]
- **Evidence:** [Screenshot reference or observation detail]
- **Recommendation:** [Suggested fix]

---

## Visual UX Findings

### Design System Consistency
[Assessment of visual consistency across the application]

### Visual Hierarchy
[Assessment of how well the visual design guides user attention]

### Specific Findings
[List of visual UX issues with the same format as technical findings above]

### Mockups Created
| Mockup | Description | Location |
|--------|-------------|----------|
| [Name] | [What it demonstrates] | `.ux-review/mockups/[filename]` |

---

## Prioritized Recommendations

### Immediate Actions (P0 — Do This Week)
1. [Recommendation with rationale]

### Short-Term Improvements (P1 — This Sprint/Cycle)
1. [Recommendation with rationale]

### Medium-Term Enhancements (P2 — Next Quarter)
1. [Recommendation with rationale]

### Long-Term Vision (P3 — Roadmap Items)
1. [Recommendation with rationale]

---

## Artifacts Index

| Artifact | Location |
|----------|----------|
| Persona Profiles | `.ux-review/personas/` |
| Interview Transcripts | `.ux-review/interviews/` |
| Walkthrough Reports | `.ux-review/walkthroughs/` |
| Technical UX Report | `.ux-review/specialist-reports/technical-ux.md` |
| Visual UX Report | `.ux-review/specialist-reports/visual-ux.md` |
| Mockups | `.ux-review/mockups/` |

---

## Methodology

This review was conducted using [number] simulated user personas, each representing
a distinct user segment. Each persona completed a simulated interview and app walkthrough.
Findings were then analyzed by technical UX and visual UX specialists. All findings were
synthesized and prioritized based on severity, frequency across personas, and alignment
with stated business goals.
```

## Severity Rating Guidelines

- **Critical:** Prevents task completion, causes data loss, or creates security/accessibility barriers. Affects all or most users.
- **High:** Significantly impairs usability. Users can complete tasks but with substantial friction. Affects many users.
- **Medium:** Causes noticeable friction but users can work around it. Affects some users or some workflows.
- **Low:** Minor polish issues, cosmetic inconsistencies, or nice-to-have improvements. Minimal user impact.
