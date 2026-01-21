# Brunson PRD: {{PRODUCT_NAME}}

> **Competitor:** {{COMPETITOR_URL}}
> **Started:** {{DATE}}

---

## Phase 1: Initialize

- [ ] **1-init:** Verify images exist in `images/product/`, `images/testimonials/`, `images/founder/`, `images/order-bump/`. Create `context/mission.json` with product name and competitor URL.

---

## Phase 2: Research

- [ ] **2A-scout:** READ `.agent/skills/brunson-scout/SKILL.md`. Navigate competitor URL. OUTPUT `market_trends.json` with: `cultural_landscape` (3+ trends), `linguistic_markers` (5+ terms), `freshness_citations` (URLs, last 30 days).

- [ ] **2B-spy:** READ `.agent/skills/brunson-spy/SKILL.md`. Screenshot competitor page. OUTPUT `competitor_funnels.json` with: 5+ pain points, 4+ desires, 6+ objections with answers.

- [ ] **2C-profiler:** READ `.agent/skills/brunson-profiler/SKILL.md`. INPUT `competitor_funnels.json`. OUTPUT `customer_profile.json` with day-in-the-life data, voice patterns.

- [ ] **2D-avatar:** READ `.agent/skills/brunson-avatar/SKILL.md`. INPUT `customer_profile.json`. OUTPUT `avatar_profile.json` with 7 sections: fears_and_frustrations, biases_and_false_beliefs, jargon_and_language, aspirations_and_identity, objection_matrix, social_proof_triggers, decision_factors. TEST: `bash tests/validate-avatar.sh`

- [ ] **2E-mechanic:** READ `.agent/skills/brunson-mechanic/SKILL.md`. OUTPUT `mechanism_report.json` with unique mechanism, specs, proof points.

- [ ] **2F-strategist:** READ `.agent/skills/brunson-strategist/SKILL.md`. INPUT all research files. OUTPUT `strategy_brief.json` with: big_domino, 3_secrets (vehicle/internal/external), epiphany_bridge (5 elements).

- [ ] **2G-neuro:** READ `.agent/skills/antigravity-neuro-research/SKILL.md`. OUTPUT `neuro_triggers.json` with dopamine, serotonin, oxytocin, cortisol trigger words.

---

## Phase 3: Linguistic Mapping

- [ ] **3-linguist:** READ `.agent/skills/antigravity-linguist/SKILL.md`. INPUT `avatar_profile.json`, `strategy_brief.json`, `neuro_triggers.json`. OUTPUT `linguistic_seed_map.json` with: 3-5 seeds (identity/transformation/relief), 3-touch placements (plant/depth/harvest).

---

## Phase 4: Copywriting

- [ ] **4-copy:** READ `.agent/skills/engage-fibs-writer/SKILL.md`. INPUT all research + `linguistic_seed_map.json`. OUTPUT `copy_draft.json` with: engage (headline, subhead, opening), features[3] (FIBS each), secrets[3] (vehicle/internal/external), founder_story (5 epiphany elements), tiktok_bubbles, rolling_reviews[5], main_reviews[12]. TEST: `bash tests/validate-framework.sh`

- [ ] **4B-visual:** READ `.agent/skills/whisk-architect/SKILL.md`. INPUT `copy_draft.json`. OUTPUT `visual_asset_manifest.md` mapping copy claims to image slots with neuro-strategy.

---

## Phase 5: Optimization

- [ ] **5-optimize:** READ `.agent/skills/brunson-perry-brain/SKILL.md`. INPUT `copy_draft.json`. Refine using avatar language, neuro triggers. OUTPUT `copy_final.json`.

---

## Phase 6: Traceability

- [ ] **6-trace:** READ `.agent/skills/antigravity-traceability/SKILL.md`. For EACH copy element in `copy_final.json`, document source file and quote. OUTPUT `copy_provenance_report.md`. Verify no hallucinations. Append `HALLUCINATION_CHECK: PASSED`. TEST: `bash tests/validate-trace.sh`

---

## Phase 7: Build

- [ ] **7-build:** READ `.agent/skills/brunson-builder/SKILL.md`. Inject `copy_final.json` into `product.config`. Map images per `IMAGE-MAPPING.md`. Run `./build.sh`. OUTPUT `index.html`. TEST: `bash tests/validate-build.sh`

---

## Phase 8: Audit

- [ ] **8-audit:** READ `.agent/skills/brunson-auditor/SKILL.md`. Check `index.html` for: no placeholders, all images load, ENGAGE patterns in headlines, mobile responsive (375px). Fix any issues. Rebuild if needed.

---

## Phase 9: Local QA

- [ ] **9-localqa:** Open `file:///[path]/index.html` in browser. Screenshot. Verify: hero renders, images load, CTAs visible, no console errors, mobile works. OUTPUT `local_qa_report.md`.

---

## Phase 10: Deploy

- [ ] **10A-name:** Generate unique project name: `[brand]-[product]-[id]`. Verify no collision with existing Netlify/GitHub.

- [ ] **10B-deploy:** READ `.agent/skills/brunson-deployer/SKILL.md`. Create Netlify site. Deploy. OUTPUT live URL.

---

## Phase 11: Live QA

- [ ] **11-liveqa:** Open live URL in browser. Compare to local. Verify HTTPS, images load, no placeholders. OUTPUT `live_qa_report.md` with `LIVE_QA: PASSED`.

---

## Phase 12: Complete

- [ ] **12-done:** Confirm: Live URL works, all artifacts committed, provenance report complete. OUTPUT final summary with Live URL and repo link.

---

## Validation Summary

| Gate         | Script                  | Checks                                        |
| ------------ | ----------------------- | --------------------------------------------- |
| Avatar       | `validate-avatar.sh`    | 7 sections present                            |
| Framework    | `validate-framework.sh` | ENGAGE patterns, FIBS, 3 Secrets              |
| Traceability | `validate-trace.sh`     | Provenance exists, HALLUCINATION_CHECK passed |
| Build        | `validate-build.sh`     | No placeholders, images mapped, renders       |
| Images       | `validate-images.sh`    | Correct folders, no banned mappings           |
