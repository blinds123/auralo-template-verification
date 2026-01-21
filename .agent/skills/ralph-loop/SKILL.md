---
name: ralph-loop
description: The Ralph Wiggum Pattern implementation. Provides continuous self-correction, state management, and inline verification. Read this at EVERY step to ensure progress tracking and learning accumulation.
---

# 🔄 THE RALPH LOOP: CONTINUOUS SELF-CORRECTION ENGINE

You are implementing the **Ralph Wiggum Pattern** - an iterative, self-correcting loop that verifies and audits at EVERY step, not just at the end.

## THE CORE PHILOSOPHY

> "Every time Ralph does something bad, Ralph gets tuned - like a guitar."

- **Memory persists through files**, not context
- **Each step is verified immediately** after completion
- **Learnings accumulate** so the same mistake is never made twice
- **Small tasks with explicit criteria** - no ambiguity

---

## MANDATORY FILES

These files MUST exist and be updated throughout the workflow:

### 1. `progress.json` - The State Machine

```json
{
  "workflow": "brunson-magic",
  "current_step": 2,
  "current_substep": "2A-scout",
  "status": "IN_PROGRESS",
  "started_at": "2026-01-19T08:00:00Z",
  "last_checkpoint": "2026-01-19T08:15:00Z",
  "steps_completed": [
    {
      "step": "1-initialize",
      "status": "PASSED",
      "acceptance_criteria_met": ["mission_defined", "competitor_url_received", "product_name_confirmed"],
      "verification_passed": true
    }
  ],
  "steps_remaining": ["2A-scout", "2B-spy", "..."],
  "current_blockers": [],
  "context_digests": {}
}
```

### 2. `learnings.md` - The Accumulated Wisdom

```markdown
# Learnings Accumulator

## Pattern: [Date] [Step]
**What happened:** [Description]
**Root cause:** [Analysis]
**Prevention rule:** [New rule to add to skills]

---

## Anti-Pattern: Generic Headlines
**What happened:** Step 4 produced headlines like "Premium Quality" which failed audit.
**Root cause:** Scout research was skimmed, not deeply read.
**Prevention rule:** All headlines must include avatar-specific language from `avatar_profile.json`.
```

### 3. `context_digest.json` - Proof of Reading

```json
{
  "file": "avatar_profile.json",
  "read_at": "2026-01-19T08:10:00Z",
  "critical_extractions": [
    {
      "key": "secret_starvation",
      "value": "To be seen as culturally sophisticated, not a tourist",
      "will_use_in": ["headlines", "founder_story"]
    },
    {
      "key": "top_objection",
      "value": "Material looks shiny/cheap",
      "will_use_in": ["tiktok_bubbles", "feature_1"]
    }
  ],
  "verification_hash": "SHA256:abc123..."
}
```

---

## THE RALPH LOOP PROTOCOL

At EVERY step, you MUST:

### 1. BEFORE STARTING
```
CHECK: Read `progress.json`
CHECK: Verify previous step status is PASSED
CHECK: Read `learnings.md` for relevant anti-patterns
CHECK: Confirm all input files exist
```

### 2. DURING EXECUTION
```
EVERY 5 MINUTES (or after major action):
- Update `progress.json` with current substep
- Log any blockers encountered
- If going off-track, STOP and re-read the skill
```

### 3. AFTER COMPLETING SUBSTEP
```
MANDATORY: Create context_digest for any file you read
MANDATORY: Run inline verification (see below)
MANDATORY: Update `progress.json` with acceptance criteria
MANDATORY: If FAILED, log to `learnings.md` and FIX IMMEDIATELY
DO NOT: Proceed to next step if verification failed
```

---

## INLINE VERIFICATION CHECKPOINTS

Every skill output must pass these checks IMMEDIATELY:

### Research Outputs (market_trends.json, avatar_profile.json, etc.)

```
✓ File exists and is valid JSON
✓ File size > 1KB (not empty/minimal)
✓ Contains at least 5 unique data points
✓ Contains URL citations (freshness check)
✓ Context digest was created proving critical data extracted
```

### Copy Outputs (copy_draft.json, copy_final.json)

```
✓ All required sections present (headlines, features, secrets, founder_story, tiktok_bubbles)
✓ No generic language detected (check against anti-pattern list)
✓ Seed map traces to linguistic_seed_map.json
✓ At least 3 neuro-trigger words from neuro_triggers.json used
✓ Context digest proves avatar research was incorporated
```

### Build Outputs (index.html)

```
✓ No {{PLACEHOLDER}} text in output
✓ All images exist in images/ folder
✓ Build script exited with code 0
✓ File size > 50KB (real page, not empty)
```

---

## THE SELF-CORRECTION PROTOCOL

When a verification check FAILS:

1. **STOP IMMEDIATELY** - Do not proceed
2. **Log to learnings.md** - What happened and why
3. **Identify root cause**:
   - Was input file not read properly? → Re-read with chunk-reader
   - Was skill instruction unclear? → Add clarification to skill
   - Was research insufficient? → Return to research step
4. **Fix the issue** - Make the correction
5. **Re-run verification** - Must PASS before proceeding
6. **Update progress.json** - Mark as FIXED with timestamp

---

## DELTA CHECKING

Before finalizing any output, verify NEW information was incorporated:

```
BEFORE: Read copy_draft.json from previous run (if exists)
AFTER: Read new copy_draft.json

CHECK: At least 20% of content should be different
CHECK: New avatar research terms should appear
CHECK: If delta < 20%, flag as "STALE OUTPUT - RE-RUN REQUIRED"
```

---

## ACCEPTANCE CRITERIA TEMPLATE

Every skill should define explicit pass/fail criteria:

```json
{
  "skill": "brunson-copywriter",
  "acceptance_criteria": [
    {
      "id": "AC-1",
      "description": "Primary linguistic seed appears in headline",
      "verification": "grep for seed term in headlines object",
      "required": true
    },
    {
      "id": "AC-2",
      "description": "At least 6 TikTok bubbles defined",
      "verification": "count keys matching BUBBLE_* pattern",
      "required": true
    },
    {
      "id": "AC-3",
      "description": "Founder story exceeds 200 words",
      "verification": "word count check",
      "required": true
    }
  ]
}
```

---

## USAGE

At the START of every workflow step:
1. `Read .agent/skills/ralph-loop/SKILL.md`
2. `Read progress.json`
3. `Read learnings.md`

At the END of every workflow step:
1. Run inline verification
2. Update `progress.json`
3. If FAILED, log to `learnings.md` and FIX
4. Only proceed if verification PASSED

---

## MANDATORY INJECTION INTO ALL SKILLS

Every skill file MUST include this header section:

```markdown
## 🔄 RALPH LOOP INTEGRATION

**BEFORE executing this skill:**
1. Read `.agent/skills/ralph-loop/SKILL.md`
2. Verify previous step passed in `progress.json`
3. Check `learnings.md` for relevant anti-patterns

**AFTER executing this skill:**
1. Run: `python3 .agent/skills/ralph-loop/scripts/verify_step.py --step [STEP_ID]`
2. If FAIL: Fix immediately, do not proceed
3. If PASS: Continue to next step
```

---

## GIT SNAPSHOT AFTER EACH STEP

To enable rollback, commit after each successful verification:

```bash
git add -A && git commit -m "RALPH: Step [STEP_ID] completed - $(date)"
```

This creates a snapshot that can be rolled back to if later steps fail.

---

## THE NUCLEAR OPTION

If after 20 loops the workflow STILL fails:

1. **STOP** - Do not continue
2. **Read** learnings.md for all failure patterns
3. **Diagnose** - The problem is likely in research quality, not code
4. **Reset** - Consider starting fresh with deeper research
5. **Report** - Tell the user what failed and why

