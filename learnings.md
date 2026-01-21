# 📚 LEARNINGS ACCUMULATOR

This file persists across context windows. Every mistake becomes a rule.

---

## INITIAL RULES (Day 0)

### Rule 1: Never Trust "Read Complete"
**Origin:** Workflow design
**Rule:** After reading any file >20 lines, output a `context_digest` proving critical data was extracted.

### Rule 2: Headlines Must Be Avatar-Specific
**Origin:** Prior audit finding
**Rule:** No generic headlines like "Premium Quality." Every headline must include terminology from `avatar_profile.json`.

### Rule 3: Verify Before Proceeding
**Origin:** Ralph Pattern
**Rule:** Never move to the next step until the current step's acceptance criteria are verified and logged.

### Rule 4: Log Every Failure
**Origin:** Ralph Pattern
**Rule:** Every failed verification becomes a learning entry in this file.

---

## ✅ CRITICAL NEW PROTOCOLS (2026-01-19)

### 1. The Placeholder Blindspot
- **Failure:** Build script detected placeholders but continued to deploy.
- **Fix:** `build.sh` updated to `exit 1` if `grep` finds placeholders.
- **Rule:** Build scripts must HARD FAIL on any residual `{{PLACEHOLDER}}`.

### 2. Deep Structure Verification (Anti-Skim)
- **Failure:** `verify_step.py` checked for top-level keys (`features`) but ignored content structure.
- **Fix:** Added `engage_compliance_check` to deeply iterate through objects.
- **Rule:** Never verify just the *presence* of a key. Verify its *structure* (e.g., "Does every feature object have an 'exploit' key?").

### 3. Space-Tolerant Templating
- **Failure:** `{{ BUNDLE_PRICE }}` failed replacement because script only looked for `{{BUNDLE_PRICE}}`.
- **Fix:** Build scripts must use regex or explicit space handling for placeholders.

### 4. Zero Redundancy
- **Failure:** Comparison image injected into Hero section redundantly.
- **Fix:** Remove vestigial layout code from `05-main-product.html`.

---

## SESSION FAILURES LOG

## Failure: 2026-01-19 07:38 - Step 4-copywriter
**What failed:**
- previous_step: Previous step '3-linguist' NOT complete
- has_key: Key 'features' MISSING in copy_draft.json
- has_key: Key 'secrets' MISSING in copy_draft.json
- has_key: Key 'founder_story' MISSING in copy_draft.json
- has_key: Key 'tiktok_bubbles' MISSING in copy_draft.json

## Failure: 2026-01-19 09:05 - Step 2A-scout
**What failed:**
- previous_step: Required steps NOT complete: 1-initialize
- has_key: Key 'cultural_landscape' MISSING in market_trends.json
- has_key: Key 'linguistic_markers' MISSING in market_trends.json
- has_key: Key 'freshness_citations' MISSING in market_trends.json

## Failure: 2026-01-19 09:12 - Step 4-copywriter
**What failed:**
- min_dict_keys: 'tiktok_bubbles' is not a dictionary

## Failure: 2026-01-19 09:17 - Step 10A-project-namer
**What failed:**
- previous_step: Required steps NOT complete: 9-local-qa
- custom: Unknown check type: custom

## Failure: 2026-01-19 09:40 - Build Phase
**What failed:**
- Placeholders `{{ ORDER_BUMP_PRICE }}` and `{{ BUNDLE_PRICE }}` leaked to production because build script warned but didn't stop.
**Resolution:** Updated build.sh to strict exit mode.
