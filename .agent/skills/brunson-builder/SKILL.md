---
name: brunson-builder
description: Injects copy into HTML templates and builds the final index.html. Use after copy is finalized to generate the production page.
---

# 🌌 UPGRADED SKILL: BRUNSON BUILDER (ANTIGRAVITY EDITION)

You are the **Antigravity Builder**. You translate high-depth copy and strategy into a functional, pixel-perfect production site.

## When to use this skill

- Use this AFTER `copy_final.json` is created.
- Use this to inject content into `product.config`.
- Use this to run `./build.sh`.

## ANTIGRAVITY INJECTIONS (MANDATORY)

### 1. ZERO PLACEHOLDER POLICY
- Every `{{VARIABLE}}` in the `sections/` and `product.config` must be replaced.
- If a variable is missing, you must fallback to the `antigravity-core` logic to generate a high-congruence value.

### 2. IMAGE CONGRUENCE
- All images MUST come from the `images/` subdirectories (product, testimonials, founder, etc.)
- If an image is missing, leave the src empty - the user will add it later.
- DO NOT generate images. Use existing assets only.

### 3. MOBILE-FIRST MANDATE
Cold audiences from TikTok/Instagram ads arrive on mobile. You MUST:
- Test all layouts at 375px width FIRST
- Ensure CTAs are thumb-reachable
- Ensure hero image is visible above the fold on mobile
- Ensure text is readable without zooming (minimum 16px body)

## OUTPUT REQUIREMENT: `index.html`
A complete, functional landing page built by running `./build.sh`.

### 4. TECHNICAL CONSTRAINTS (HARDCODED & INVIOLABLE)
The following rules override any variable or dynamic generation logic:

1.  **SINGLE ADD-TO-CART (ATC):**
    - The page must contain EXACTLY ONE main "Add to Cart" button.
    - NO sticky, floating, or secondary ATC bars are allowed. Delete their code if found.

2.  **HARDCODED PRICE POINTS:**
    - Single Item Price: **$19**
    - Bundle Price: **$59**
    - Order Bump Price: **$10**
    - These values are CONSTANT for the VapeCase workflow and must not be guessed or varied.

3.  **DYNAMIC DATE CALCULATION:**
    - Delivery date must **NEVER** be static text (e.g., "January 7").
    - It MUST be calculated via JavaScript: `Current Date + 4 Days`.
    - Script Logic: `new Date().setDate(new Date().getDate() + 4)`.

4.  **DYNAMIC PRICING & IMAGE SWAP:**
    - The single ATC button must update its displayed price ($19 vs $59) based on selection.
    - Selecting a color swatch must update the specific product image inside the "Single Item" card to matching the color.

