---
name: brunson-magic
description: Launches a high-converting funnel using the Brunson Protocol with Ralphy-Antigravity automation. Research -> Copy -> Build -> Deploy.
activation:
  - /brunson-magic
  - brunson magic
  - start brunson workflow
---

# /brunson-magic - Ralphy-Antigravity Workflow

## ACTIVATION

When user runs `/brunson-magic`, execute this workflow.

## PRE-FLIGHT CHECKLIST

Before starting, verify:

```bash
# Check required image folders exist
bash tests/validate-images.sh
```

| Requirement        | Location               | Minimum      |
| ------------------ | ---------------------- | ------------ |
| Product images     | `images/product/`      | 5            |
| Testimonial images | `images/testimonials/` | 20           |
| Founder image      | `images/founder/`      | 1            |
| Order bump image   | `images/order-bump/`   | 1            |
| Comparison images  | `images/comparison/`   | 2 (optional) |

## CORE PRINCIPLES (Enforced Automatically)

1. **ZERO SKIMMING** - Read files completely (chunk if >500 lines)
2. **ZERO HALLUCINATION** - Every claim traces to research
3. **ENGAGE Headlines** - Pattern interrupts required
4. **FIBS Features** - Fear → Intrigue → Believability → Stakes
5. **Image Rules** - Product→hero, Testimonials→features/secrets

---

## THE 12 PHASES

### Phase 1: Initialize

```
INPUT:  User provides Competitor URL + Product Name
OUTPUT: mission.json
TEST:   bash tests/validate-competitor-url.sh
```

- Ask user for **Competitor URL** and **Product Name**
- Create `mission.json` with project scope

---

### Phase 2A-2G: Research Trinity

Execute each skill, verify output exists:

| Phase | Skill                                               | Output                       | Test                            |
| ----- | --------------------------------------------------- | ---------------------------- | ------------------------------- |
| 2A    | `.agent/skills/brunson-scout/SKILL.md`              | `market_trends.json`         | File exists                     |
| 2B    | `.agent/skills/brunson-spy/SKILL.md`                | `competitor_funnels.json`    | File exists                     |
| 2C    | `.agent/skills/brunson-profiler/SKILL.md`           | `customer_profile.json`      | File exists                     |
| 2D    | `.agent/skills/brunson-avatar/SKILL.md`             | `avatar_profile.json`        | `bash tests/validate-avatar.sh` |
| 2E    | `.agent/skills/brunson-mechanic/SKILL.md`           | `mechanical_components.json` | File exists                     |
| 2F    | `.agent/skills/brunson-strategist/SKILL.md`         | `strategy_brief.json`        | File exists                     |
| 2G    | `.agent/skills/antigravity-neuro-research/SKILL.md` | `neuro_triggers.json`        | File exists                     |

---

### Phase 3: Linguistic Mapping

```
SKILL:  .agent/skills/antigravity-linguist/SKILL.md
INPUT:  avatar_profile.json, strategy_brief.json
OUTPUT: linguistic_seed_map.json
TEST:   File exists with seed definitions
```

---

### Phase 4: Copywriting (ENGAGE + FIBS)

```
SKILL:  .agent/skills/engage-fibs-writer/SKILL.md
INPUT:  All research JSONs + linguistic_seed_map.json
OUTPUT: copy_draft.json
TEST:   bash tests/validate-framework.sh
```

**Section Mappings:**

- `06-bridge-comparison.html` - Bridge Comparison
- `07-bridge-headline.html` - Bridge Headline
- `08-features-3-fibs.html` - Feature Grid (FIBS)
- `09-founder-story.html` - Epiphany Bridge
- `10-secret-1.html` - Vehicle Secret
- `11-secret-2.html` - Internal Secret
- `12-secret-3.html` - External Secret
- `15a-deep-scroll-viral.html` - Viral Evidence
- `15b-deep-scroll-matrix.html` - Education Matrix
- `16-deep-scroll-guarantee.html` - Guarantee
- `19-closer-logic.html` - The Closer
- `20-cta-scarcity.html` - Final Push

---

### Phase 4B: Visual Architect

```
SKILL:  .agent/skills/whisk-architect/SKILL.md
INPUT:  copy_draft.json (map claims to visuals)
OUTPUT: visual_asset_manifest.md
TEST:   Claims mapped to visual proof
```

---

### Phase 5: Optimization (Perry Brain)

```
SKILL:  .agent/skills/brunson-perry-brain/SKILL.md
INPUT:  copy_draft.json
OUTPUT: copy_final.json
TEST:   Avatar language integrated
```

---

### Phase 6: Traceability + Hallucination Check

```
SKILL 6A: .agent/skills/antigravity-traceability/SKILL.md
SKILL 6B: .agent/skills/antigravity-hallucination-killer/SKILL.md
OUTPUT:   copy_provenance_report.md
TEST:     bash tests/validate-trace.sh
```

**CRITICAL:** Must contain `HALLUCINATION_CHECK: PASSED`

---

### Phase 7: Build

```
SKILL:  .agent/skills/brunson-builder/SKILL.md
ACTION: Inject copy into product.config + sections/, run ./build.sh
OUTPUT: index.html
TEST:   bash tests/validate-build.sh
```

---

### Phase 8: Audit

```
SKILL:  .agent/skills/brunson-auditor/SKILL.md
ACTION: Loop correction until all checks pass
TEST:   bash tests/validate-build.sh (all green)
```

---

### Phase 9: Local QA

```
SKILL:  .agent/skills/antigravity-local-qa/SKILL.md
ACTION: Open index.html in browser, screenshot, verify
OUTPUT: local_qa_report.md
TEST:   All visual checks pass
```

---

### Phase 10: Deployment

```
SKILL 10A: .agent/skills/antigravity-project-namer/SKILL.md (generate unique name)
SKILL 10B: .agent/skills/brunson-deployer/SKILL.md (deploy to Netlify)
OUTPUT:    Live URL
TEST:      HTTP 200 response
```

---

### Phase 11: Live QA

```
SKILL:  .agent/skills/antigravity-live-qa/SKILL.md
ACTION: Verify HTTPS, images load, mobile responsive
OUTPUT: live_qa_report.md
TEST:   All checks pass
```

---

### Phase 12: Completion

```
ACTION: Generate summary report
OUTPUT:
  - Live URL
  - GitHub Repo URL
  - Provenance Report
  - All artifacts committed
```

---

## QUICK START (Manual)

If running without Ralphy orchestration:

```bash
# 1. Verify images
bash tests/validate-images.sh

# 2. Execute phases 1-12 manually, checking tests after each

# 3. Build
./build.sh

# 4. Validate
bash tests/validate-build.sh

# 5. Deploy
# (use brunson-deployer skill)
```

## QUICK START (Ralphy Automated)

```bash
# One command - automated execution with quality gates
ralphy --prd ./brunson-prd.md --engine claude-code --test
```

---

## VALIDATION SCRIPTS

| Script                        | Checks                                        |
| ----------------------------- | --------------------------------------------- |
| `tests/validate-images.sh`    | Folder structure, counts, banned mappings     |
| `tests/validate-avatar.sh`    | 7 psychological sections present              |
| `tests/validate-framework.sh` | ENGAGE patterns, FIBS structure, 3 Secrets    |
| `tests/validate-trace.sh`     | Provenance report, HALLUCINATION_CHECK passed |
| `tests/validate-build.sh`     | No placeholders, valid HTML, CTAs present     |
| `tests/validate-current.sh`   | Meta-validator (runs appropriate checks)      |

---

## IMAGE PLACEMENT RULES

| Image Source           | Allowed Sections                     | BANNED          |
| ---------------------- | ------------------------------------ | --------------- |
| `images/product/`      | Hero carousel (03, 05), Gallery (24) | Testimonials    |
| `images/testimonials/` | Features, Secrets, Reviews (08-22)   | Slideshow, Hero |
| `images/founder/`      | Founder story ONLY (09, 18)          | Anywhere else   |
| `images/order-bump/`   | Order bump ONLY (08)                 | Anywhere else   |
| `images/comparison/`   | Comparison section (06, 11)          | Anywhere else   |
