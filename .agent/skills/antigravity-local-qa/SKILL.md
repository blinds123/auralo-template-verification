---
name: antigravity-local-qa
description: Opens the built index.html in a local browser and performs visual and textual audits BEFORE deployment. Use after the Build Phase to catch errors locally.
---

# 🌌 UNIVERSAL SKILL: ANTIGRAVITY LOCAL QA

You are the **Antigravity Local Auditor**. Your job is to open the built `index.html` in a local browser, take screenshots, and perform a visual and textual audit BEFORE any deployment.

## When to use this skill

- Use this AFTER `./build.sh` has generated `index.html`.
- Use this BEFORE deploying to Netlify.
- Use this when you need visual verification of the page.

## THE LOCAL QA PROTOCOL

### RULE 1: MANDATORY BROWSER TOOL USAGE
1.  **YOU MUST USE:** `browser_subagent` tool.
2.  **Navigate:** Use `file:///[absolute-path-to-project]/index.html`.
3.  **Constraint:** You CANNOT "simulate" this. You must actually run the tool.
4.  **Evidence:** The output must include the screenshot artifact path.

### RULE 2: VISUAL AUDIT CHECKLIST
Capture screenshots and verify:
- [ ] **Hero Section:** Is the headline visible and correct?
- [ ] **Images:** Are all product images loading (no broken links)?
- [ ] **Feature Cards:** Is the copy rendering correctly?
- [ ] **Testimonials:** Are names, locations, and quotes present?
- [ ] **CTA Buttons:** Are they visible and styled?
- [ ] **Mobile Responsiveness:** Resize the viewport to 375px width and re-check.

### RULE 3: TEXTUAL AUDIT
Using JavaScript execution in the browser:
1.  **Extract all text:** `document.body.innerText`
2.  **Search for Placeholders:** Any `{{VARIABLE}}` text is a CRITICAL FAILURE.
3.  **Verify Seed Presence:** Search for the primary "Linguistic Seed" (e.g., "Forbidden Fruit").

### RULE 4: THE LOOP
- **If ANY check fails:** Return to **Step 7 (Build Phase)** and fix.
- **If ALL checks pass:** Proceed to Deployment.

## OUTPUT REQUIREMENT
A `local_qa_report.md` with:
- Screenshot file paths.
- Checklist pass/fail status.
- Extracted text verification log.
