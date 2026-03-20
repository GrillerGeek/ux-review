# Walkthrough Strategies by App Type

Select the appropriate interaction strategy based on the application type detected during intake.

## Web Application

**Detection:** URL provided, or project contains web framework files (package.json with React/Vue/Angular, HTML files, etc.)

**Primary tools:** Chrome DevTools MCP or Playwright MCP

**Walkthrough process:**
1. Navigate to the application URL or local dev server
2. Take a screenshot of the landing/home page
3. Follow the critical path identified during intake
4. At each step:
   - Take a screenshot
   - Note the page structure and hierarchy
   - Evaluate form interactions and feedback
   - Check error states (submit empty forms, enter invalid data)
   - Test navigation clarity (can the persona find what they need?)
5. Test responsive behavior at mobile (375px), tablet (768px), and desktop (1440px) widths
6. Run a Lighthouse accessibility audit if available
7. Check keyboard navigation on key interactive elements
8. Note loading states and performance perception

**Key evaluation criteria:**
- Page load and interaction responsiveness
- Form validation and error messaging
- Navigation discoverability and consistency
- Visual feedback for user actions
- Mobile/responsive behavior
- Accessibility (contrast, focus indicators, screen reader compatibility)

## CLI Tool

**Detection:** Path to executable, or project contains CLI framework (commander, yargs, click, cobra, argparse)

**Primary tools:** Bash tool

**Walkthrough process:**
1. Run the tool with `--help` or `-h` flag
2. Evaluate help text clarity, organization, and completeness
3. Run the most common commands identified during intake
4. Test error handling:
   - Run with missing required arguments
   - Run with invalid arguments
   - Run with conflicting flags
5. Test discoverability:
   - Can users discover subcommands?
   - Are common tasks easy to find?
   - Is tab completion available?
6. Evaluate output formatting:
   - Is output readable and well-structured?
   - Does it support `--json` or `--quiet` flags for scripting?
   - Are colors and formatting used effectively?
7. Test progressive disclosure:
   - Basic usage should be simple
   - Advanced features available but not overwhelming

**Key evaluation criteria:**
- Help text quality and discoverability
- Error messages (actionable, specific, include suggestions)
- Command naming consistency and predictability
- Output formatting and readability
- Exit codes and scripting compatibility
- Installation and first-run experience

## Screenshots / Static Images

**Detection:** `--screenshots-only` flag, or image files provided

**Primary tools:** Read tool (for image analysis)

**Walkthrough process:**
1. Analyze each screenshot in sequence
2. For each image:
   - Identify the screen/state being shown
   - Evaluate visual hierarchy and layout
   - Check text readability and contrast
   - Assess information density
   - Note interactive element visibility and affordance
3. Map screenshots to a flow if multiple screens are provided
4. Identify gaps in the flow (missing states, error screens, loading states)
5. Evaluate consistency across screens

**Key evaluation criteria:**
- Visual hierarchy and content prioritization
- Layout structure and whitespace usage
- Typography readability
- Color contrast and accessibility
- Interactive element design (buttons, links, forms)
- Consistency across screens
- Missing states (empty, error, loading)

## Documentation / Wireframes

**Detection:** Markdown docs, design files, or specification documents provided

**Primary tools:** Read tool

**Walkthrough process:**
1. Read through documentation or wireframe descriptions
2. Map the information architecture
3. Identify user flows from the documentation
4. Evaluate:
   - Is the flow logical and efficient?
   - Are there unnecessary steps?
   - Are error cases handled?
   - Is the terminology consistent?
5. Note assumptions that should be validated with real users

**Key evaluation criteria:**
- Information architecture clarity
- Flow logic and efficiency
- Error and edge case coverage
- Terminology consistency
- Completeness of documented states

## Fallback Strategy

**When app is unreachable or interaction tools are unavailable:**

1. Review any available source code for UI patterns
2. Check for existing screenshots in the repo (README, docs, marketing)
3. Review component structure to infer user interface
4. Analyze route definitions to understand navigation structure
5. Read test files for expected user flows
6. Document findings as "inferred from code review" with lower confidence ratings
