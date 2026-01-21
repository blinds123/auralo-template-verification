---
description: Launches a high-converting funnel using the Brunson Protocol (Research -> Copy -> Build -> Audit). Optimized v3.1.
---

# 🚀 BRUNSON PROTOCOL: RALPH-ANTIGRAVITY EDITION v3.1 (OPTIMIZED)

## 🛡️ CORE PRINCIPLES
1.  **ZERO SKIMMING:** Use `antigravity-chunk-reader`.
2.  **ZERO HALLUCINATION:** Use `antigravity-traceability`.
3.  **ZERO OVERWRITE:** Use `antigravity-project-namer`.
4.  **RALPH LOOP:** Verify immediately.

---

## 1. Initialize (ID: `1-initialize`)
- **Action:** Ask user for **Competitor URL** and **Product Name**.
- **Action:** Define Mission. Update `progress.json`.
- **RALPH CHECK:** `python3 .agent/skills/ralph-loop/scripts/verify_step.py --step 1-initialize`

## 2. Research Trinity (ID: `2A` to `2H`)
*Run verification after EACH substep.*

- **2A Scout:** `.agent/skills/brunson-scout/SKILL.md` → `market_trends.json`
  - `python3 .agent/skills/ralph-loop/scripts/verify_step.py --step 2A-scout`
- **2B Spy:** `.agent/skills/brunson-spy/SKILL.md` → `competitor_funnels.json`
  - `python3 .agent/skills/ralph-loop/scripts/verify_step.py --step 2B-spy`
- **2C Profiler:** `.agent/skills/brunson-profiler/SKILL.md` → `customer_profile.json`
  - `python3 .agent/skills/ralph-loop/scripts/verify_step.py --step 2C-profiler`
- **2D Avatar:** `.agent/skills/brunson-avatar/SKILL.md` → `avatar_profile.json`
  - `python3 .agent/skills/ralph-loop/scripts/verify_step.py --step 2D-avatar`
- **2E Mechanic:** `.agent/skills/brunson-mechanic/SKILL.md` → `mechanism_report.json`
  - `python3 .agent/skills/ralph-loop/scripts/verify_step.py --step 2E-mechanic`
- **2F Strategist:** `.agent/skills/brunson-strategist/SKILL.md` → `strategy_brief.json`
  - `python3 .agent/skills/ralph-loop/scripts/verify_step.py --step 2F-strategist`
- **2G Neuro:** `.agent/skills/antigravity-neuro-research/SKILL.md` → `neuro_triggers.json`
  - `python3 .agent/skills/ralph-loop/scripts/verify_step.py --step 2G-neuro-research`

## 3. Linguistic Mapping (ID: `3-linguist`)
- **Action:** Execute `.agent/skills/antigravity-linguist/SKILL.md`
- **Output:** `linguistic_seed_map.json`
- **RALPH CHECK:** `python3 .agent/skills/ralph-loop/scripts/verify_step.py --step 3-linguist`

## 4. Copywriting (ID: `4-copywriter`)
- **Action:** Execute `.agent/skills/engage-fibs-writer/SKILL.md`
- **Output:** `copy_draft.json`
- **Mappings:**
    - `06-bridge-comparison.html` (Bridge Comparison)
    - `07-bridge-headline.html` (Bridge Headline)
    - `08-features-3-fibs.html` (Micro Grid)
    - `15a-deep-scroll-viral.html` (Viral Evidence)
    - `15b-deep-scroll-matrix.html` (Education Matrix)
    - `16-deep-scroll-guarantee.html` (Stranger's Guarantee)
    - `19-closer-logic.html` (The Closer)
    - `20-cta-scarcity.html` (Final Push)
- **RALPH CHECK:** `python3 .agent/skills/ralph-loop/scripts/verify_step.py --step 4-copywriter`

## 4B. Visual Architect (ID: `4B-whisk-architect`)
- **Action:** Execute `.agent/skills/whisk-architect/SKILL.md`
- **Input:** `copy_draft.json` (Visually proving the claims)
- **Output:** `visual_asset_manifest.md`
- **RALPH CHECK:** `python3 .agent/skills/ralph-loop/scripts/verify_step.py --step 2H-whisk-architect`

## 5. Optimization (ID: `5-perry-brain`)
- **Action:** Execute `.agent/skills/brunson-perry-brain/SKILL.md`
- **Output:** `copy_final.json`
- **RALPH CHECK:** `python3 .agent/skills/ralph-loop/scripts/verify_step.py --step 5-perry-brain`

## 6. Traceability (ID: `6A`, `6B`)
- **Action 6A:** Execute `.agent/skills/antigravity-traceability/SKILL.md` → `copy_provenance_report.md`
- **Action 6B:** Execute `.agent/skills/antigravity-hallucination-killer/SKILL.md`
- **CRITICAL REQUIREMENT:** Step 6B must append `HALLUCINATION_CHECK: PASSED` to `copy_provenance_report.md`.
- **RALPH CHECK:** `python3 .agent/skills/ralph-loop/scripts/verify_step.py --step 6B-hallucination-killer`

## 7. Build (ID: `7-builder`)
- **Action:** Execute `.agent/skills/brunson-builder/SKILL.md`
- **Task:** Inject content into `product.config` and `sections/`, then run `./build.sh`.
- **Output:** `index.html`
- **RALPH CHECK:** `python3 .agent/skills/ralph-loop/scripts/verify_step.py --step 7-builder`

## 8. Audit (ID: `8-auditor`)
- **Action:** Execute `.agent/skills/brunson-auditor/SKILL.md`
- **Task:** Loop correction until validation passes.
- **RALPH CHECK:** `python3 .agent/skills/ralph-loop/scripts/verify_step.py --step 8-auditor`

## 9. Local QA (ID: `9-local-qa`)
- **Action:** Execute `.agent/skills/antigravity-local-qa/SKILL.md`
- **Output:** `local_qa_report.md`
- **RALPH CHECK:** `python3 .agent/skills/ralph-loop/scripts/verify_step.py --step 9-local-qa`

## 10. Deployment Phase (ID: `10A`, `10B`)
- **10A Namer:** Execute `.agent/skills/antigravity-project-namer/SKILL.md`
  - `python3 .agent/skills/ralph-loop/scripts/verify_step.py --step 10A-project-namer`
- **10B Deployer:** Execute `.agent/skills/brunson-deployer/SKILL.md`
  - `python3 .agent/skills/ralph-loop/scripts/verify_step.py --step 10B-deployer`

## 11. Live QA (ID: `11-live-qa`)
- **Action:** Execute `.agent/skills/antigravity-live-qa/SKILL.md`
- **Output:** `live_qa_report.md`
- **RALPH CHECK:** `python3 .agent/skills/ralph-loop/scripts/verify_step.py --step 11-live-qa`

## 12. Completion (ID: `12-completion`)
- **Action:** Update `progress.json` to COMPLETED.
- **Action:** Report Live URL, Repo URL, and Provenance Report.
- **RALPH CHECK:** `python3 .agent/skills/ralph-loop/scripts/verify_step.py --step 12-completion`
