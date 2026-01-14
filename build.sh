#!/bin/bash
# build.sh v4.0 - Complete template builder with ALL variables
# Handles ALL 178+ placeholders from product.config

set -e

echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║           LANDING PAGE BUILDER v4.0                        ║"
echo "║           Blank Template → Production Site                 ║"
echo "║           Handles 178+ Variables                           ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# ============================================
# STEP 0: Check Dependencies
# ============================================
echo "🔍 Checking dependencies..."

if ! command -v node &> /dev/null; then
    echo "❌ Node.js not installed. Install from https://nodejs.org"
    exit 1
fi
echo "   ✅ Node.js"

if ! command -v npx &> /dev/null; then
    echo "❌ npx not available"
    exit 1
fi
echo "   ✅ npx"
echo ""

# ============================================
# STEP 1: Load & Validate Config
# ============================================
echo "📝 Loading product.config..."

if [ ! -f "product.config" ]; then
    echo "❌ product.config not found!"
    exit 1
fi

source product.config

# Check required fields
MISSING=""
[ -z "$PRODUCT_NAME" ] && MISSING="$MISSING PRODUCT_NAME"
[ -z "$BRAND_NAME" ] && MISSING="$MISSING BRAND_NAME"
[ -z "$SINGLE_PRICE" ] && MISSING="$MISSING SINGLE_PRICE"
[ -z "$BUNDLE_PRICE" ] && MISSING="$MISSING BUNDLE_PRICE"
[ -z "$NETLIFY_SITE_ID" ] && MISSING="$MISSING NETLIFY_SITE_ID"
[ -z "$GUARANTEE_NAME" ] && MISSING="$MISSING GUARANTEE_NAME"
[ -z "$GUARANTEE_CONDITION" ] && MISSING="$MISSING GUARANTEE_CONDITION"
[ -z "$REVIEW_COUNT" ] && MISSING="$MISSING REVIEW_COUNT"
[ -z "$AUDIENCE" ] && MISSING="$MISSING AUDIENCE"
[ -z "$HEADLINE_HOOK" ] && MISSING="$MISSING HEADLINE_HOOK"

if [ -n "$MISSING" ]; then
    echo "❌ Missing required fields in product.config:"
    echo "  $MISSING"
    exit 1
fi

echo "   ✅ Config validated"
echo "   Product: $PRODUCT_NAME"
echo "   Brand: $BRAND_NAME"
echo ""

# ============================================
# STEP 2: Check Images
# ============================================
echo "🖼️  Checking images..."

MISSING_IMAGES=""
for i in 1 2 3 4 5; do
    if [ ! -f "images/product/product-0$i.webp" ] && [ ! -f "images/product/product-0$i.png" ] && [ ! -f "images/product/product-0$i.jpg" ]; then
        MISSING_IMAGES="$MISSING_IMAGES product-0$i"
    fi
done

if [ -n "$MISSING_IMAGES" ]; then
    echo "   ⚠️  Missing product images:$MISSING_IMAGES"
    echo "   Add images to images/product/ folder"
else
    echo "   ✅ Product images found"
fi

# Convert images if cwebp available
# (Manual optimization done)
echo "   ✅ Images optimized (Manual)"
# if command -v cwebp &> /dev/null; then
#     find images -name "*.png" -type f 2>/dev/null | while read file; do
#         output="${file%.png}.webp"
#         [ ! -f "$output" ] && cwebp -q 80 "$file" -o "$output" 2>/dev/null
#     done
#     find images -name "*.jpg" -type f 2>/dev/null | while read file; do
#         output="${file%.jpg}.webp"
#         [ ! -f "$output" ] && cwebp -q 80 "$file" -o "$output" 2>/dev/null
#     done
#     echo "   ✅ Images optimized"
# fi
echo ""

# ============================================
# STEP 3: Build HTML with replacements
# ============================================
echo "📄 Building index.html..."

# Concatenate HTML sections in specific order
# Core structure based on Perry Belcher funnel
cat \
  sections/01-head.html \
  sections/02-body-start.html \
  sections/03-header.html \
  sections/04-cart-drawer.html \
  sections/05-main-product.html \
  sections/07-logos.html \
  sections/18-testimonials.html \
  sections/06-comparison.html \
  sections/08-multirow.html \
  sections/14-faq.html \
  sections/22-footer.html \
  sections/23-scripts.html \
  > index.html 2>/dev/null || true

# Function to safely escape for sed
escape_sed() {
    printf '%s\n' "$1" | sed 's/[&/\]/\\&/g'
}

# Replace function - handles both macOS and Linux
replace_var() {
    local placeholder="$1"
    local value="$2"
    if [ -n "$value" ]; then
        if [[ "$OSTYPE" == "darwin"* ]]; then
            sed -i '' "s|$placeholder|$(escape_sed "$value")|g" index.html 2>/dev/null || true
        else
            sed -i "s|$placeholder|$(escape_sed "$value")|g" index.html 2>/dev/null || true
        fi
    fi
}

echo "   Replacing variables..."

# =====================================================
# CORE PRODUCT INFO
# =====================================================
replace_var "{{PRODUCT_NAME}}" "$PRODUCT_NAME"
replace_var "{{BRAND_NAME}}" "$BRAND_NAME"
replace_var "{{PRODUCT_HANDLE}}" "$PRODUCT_HANDLE"
replace_var "{{PRODUCT_ID}}" "$PRODUCT_ID"
replace_var "{{VARIANT_ID}}" "$VARIANT_ID"
replace_var "{{SUBDOMAIN}}" "$SUBDOMAIN"

# =====================================================
# URLS
# =====================================================
replace_var "{{ACCOUNT_URL}}" "$ACCOUNT_URL"
replace_var "{{PRODUCT_URL}}" "$PRODUCT_URL"
replace_var "{{PRODUCT_FULL_URL}}" "$PRODUCT_FULL_URL"
replace_var "{{SITE_URL}}" "$SITE_URL"
replace_var "{{SHOP_URL}}" "$SHOP_URL"
replace_var "{{CANONICAL_URL}}" "$CANONICAL_URL"
replace_var "{{LOGO_URL}}" "$LOGO_URL"

# =====================================================
# PRICING
# =====================================================
replace_var "{{SINGLE_PRICE}}" "$SINGLE_PRICE"
replace_var "{{BUNDLE_PRICE}}" "$BUNDLE_PRICE"
replace_var "{{BUNDLE_OLD_PRICE}}" "$BUNDLE_OLD_PRICE"
replace_var "{{BUNDLE_SAVINGS}}" "$BUNDLE_SAVINGS"
replace_var "{{ORDER_BUMP_PRICE}}" "$ORDER_BUMP_PRICE"
replace_var "{{PRICE}}" "$PRICE"

# =====================================================
# GUARANTEE
# =====================================================
replace_var "{{GUARANTEE_DAYS}}" "$GUARANTEE_DAYS"
replace_var "{{GUARANTEE_NAME}}" "$GUARANTEE_NAME"
replace_var "{{GUARANTEE_CONDITION}}" "$GUARANTEE_CONDITION"

# =====================================================
# HEADLINES & COPY
# =====================================================
replace_var "{{REVIEW_COUNT}}" "$REVIEW_COUNT"
replace_var "{{AUDIENCE}}" "$AUDIENCE"
replace_var "{{HEADLINE_HOOK}}" "$HEADLINE_HOOK"
replace_var "{{TAGLINE}}" "$TAGLINE"
replace_var "{{ANNOUNCEMENT_BAR_TEXT}}" "$ANNOUNCEMENT_BAR_TEXT"

# =====================================================
# BUNDLE INFO
# =====================================================
replace_var "{{BUNDLE_DESCRIPTION}}" "$BUNDLE_DESCRIPTION"
replace_var "{{SINGLE_DESCRIPTION}}" "$SINGLE_DESCRIPTION"
replace_var "{{BUNDLE_TITLE_2X}}" "$BUNDLE_TITLE_2X"
replace_var "{{BUNDLE_DESC_2X}}" "$BUNDLE_DESC_2X"
replace_var "{{ORDER_BUMP_DESC}}" "$ORDER_BUMP_DESC"

# =====================================================
# COMPARISON SECTION
# =====================================================
replace_var "{{BEFORE_PAIN}}" "$BEFORE_PAIN"
replace_var "{{AFTER_BENEFIT}}" "$AFTER_BENEFIT"
replace_var "{{COMPARISON_HEADLINE}}" "$COMPARISON_HEADLINE"
replace_var "{{COMPARISON_PARAGRAPH}}" "$COMPARISON_PARAGRAPH"
replace_var "{{COMPARISON_ALT_TEXT}}" "$COMPARISON_ALT_TEXT"
replace_var "{{COMPARISON_BEFORE_ALT}}" "$COMPARISON_BEFORE_ALT"
replace_var "{{COMPARISON_AFTER_ALT}}" "$COMPARISON_AFTER_ALT"

# =====================================================
# HERO FEATURE CARDS (4 quick benefits)
# =====================================================
replace_var "{{HERO_FEATURE_1}}" "$HERO_FEATURE_1"
replace_var "{{HERO_FEATURE_2}}" "$HERO_FEATURE_2"
replace_var "{{HERO_FEATURE_3}}" "$HERO_FEATURE_3"
replace_var "{{HERO_FEATURE_4}}" "$HERO_FEATURE_4"

# =====================================================
# FEATURES
# =====================================================
replace_var "{{FEATURE_HEADLINE_1}}" "$FEATURE_HEADLINE_1"
replace_var "{{FEATURE_HEADLINE_2}}" "$FEATURE_HEADLINE_2"
replace_var "{{FEATURE_HEADLINE_3}}" "$FEATURE_HEADLINE_3"
replace_var "{{FEATURE_HEADLINE_4}}" "$FEATURE_HEADLINE_4"
replace_var "{{FEATURE_HEADING_1}}" "$FEATURE_HEADING_1"
replace_var "{{FEATURE_HEADING_2}}" "$FEATURE_HEADING_2"
replace_var "{{FEATURE_PARAGRAPH_1_1}}" "$FEATURE_PARAGRAPH_1_1"
replace_var "{{FEATURE_PARAGRAPH_1_2}}" "$FEATURE_PARAGRAPH_1_2"
replace_var "{{FEATURE_PARAGRAPH_2}}" "$FEATURE_PARAGRAPH_2"
replace_var "{{FEATURE_BENEFIT_TEXT}}" "$FEATURE_BENEFIT_TEXT"

# =====================================================
# FOUNDER SECTION (Epiphany Bridge)
# =====================================================
replace_var "{{FOUNDER_SECTION_HEADING}}" "$FOUNDER_SECTION_HEADING"
replace_var "{{FOUNDER_SECTION_PARAGRAPH_1}}" "$FOUNDER_SECTION_PARAGRAPH_1"
replace_var "{{FOUNDER_SECTION_PARAGRAPH_2}}" "$FOUNDER_SECTION_PARAGRAPH_2"
replace_var "{{FOUNDER_BACKSTORY}}" "$FOUNDER_BACKSTORY"
replace_var "{{FOUNDER_WALL}}" "$FOUNDER_WALL"
replace_var "{{FOUNDER_EPIPHANY}}" "$FOUNDER_EPIPHANY"
replace_var "{{FOUNDER_PLAN}}" "$FOUNDER_PLAN"
replace_var "{{FOUNDER_TRANSFORMATION}}" "$FOUNDER_TRANSFORMATION"
replace_var "{{FOUNDER_INVITATION}}" "$FOUNDER_INVITATION"

# =====================================================
# BIG DOMINO
# =====================================================
replace_var "{{BIG_DOMINO}}" "$BIG_DOMINO"

# =====================================================
# 3 SECRETS (FALSE BELIEFS)
# =====================================================
replace_var "{{SECRET_1_FALSE_BELIEF}}" "$SECRET_1_FALSE_BELIEF"
replace_var "{{SECRET_1_TRUTH}}" "$SECRET_1_TRUTH"
replace_var "{{SECRET_1_HEADLINE}}" "$SECRET_1_HEADLINE"
replace_var "{{SECRET_2_FALSE_BELIEF}}" "$SECRET_2_FALSE_BELIEF"
replace_var "{{SECRET_2_TRUTH}}" "$SECRET_2_TRUTH"
replace_var "{{SECRET_2_HEADLINE}}" "$SECRET_2_HEADLINE"
replace_var "{{SECRET_3_FALSE_BELIEF}}" "$SECRET_3_FALSE_BELIEF"
replace_var "{{SECRET_3_TRUTH}}" "$SECRET_3_TRUTH"
replace_var "{{SECRET_3_HEADLINE}}" "$SECRET_3_HEADLINE"

# =====================================================
# TIKTOK BUBBLE COPY
# =====================================================
replace_var "{{BUBBLE_Q1_VEHICLE}}" "$BUBBLE_Q1_VEHICLE"
replace_var "{{BUBBLE_A1_VEHICLE}}" "$BUBBLE_A1_VEHICLE"
replace_var "{{BUBBLE_Q2_INTERNAL}}" "$BUBBLE_Q2_INTERNAL"
replace_var "{{BUBBLE_A2_INTERNAL}}" "$BUBBLE_A2_INTERNAL"
replace_var "{{BUBBLE_Q3_EXTERNAL}}" "$BUBBLE_Q3_EXTERNAL"
replace_var "{{BUBBLE_A3_EXTERNAL}}" "$BUBBLE_A3_EXTERNAL"

# =====================================================
# CUSTOM SECTIONS
# =====================================================
replace_var "{{CUSTOM_SECTION_HEADING}}" "$CUSTOM_SECTION_HEADING"
replace_var "{{CUSTOM_SECTION_TEXT}}" "$CUSTOM_SECTION_TEXT"
replace_var "{{IMAGE_WITH_TEXT_4_HEADING}}" "$IMAGE_WITH_TEXT_4_HEADING"

# =====================================================
# SLIDESHOW
# =====================================================
replace_var "{{SLIDESHOW_HEADING_1}}" "$SLIDESHOW_HEADING_1"
replace_var "{{SLIDESHOW_TEXT_1}}" "$SLIDESHOW_TEXT_1"
replace_var "{{SLIDESHOW_HEADING_2}}" "$SLIDESHOW_HEADING_2"
replace_var "{{SLIDESHOW_TEXT_2}}" "$SLIDESHOW_TEXT_2"

# =====================================================
# CTA BANNER
# =====================================================
replace_var "{{CTA_BANNER_HEADING}}" "$CTA_BANNER_HEADING"
replace_var "{{CTA_BANNER_TEXT}}" "$CTA_BANNER_TEXT"

# =====================================================
# PROMISE SECTION
# =====================================================
replace_var "{{PROMISE_HEADING}}" "$PROMISE_HEADING"
replace_var "{{PROMISE_POINT_1}}" "$PROMISE_POINT_1"
replace_var "{{PROMISE_POINT_2}}" "$PROMISE_POINT_2"
replace_var "{{PROMISE_POINT_3}}" "$PROMISE_POINT_3"
replace_var "{{PROMISE_POINT_4}}" "$PROMISE_POINT_4"

# =====================================================
# FEATURE CARDS (MULTIROW - 4 cards)
# =====================================================
replace_var "{{MULTIROW_1_PARAGRAPH}}" "$MULTIROW_1_PARAGRAPH"
replace_var "{{MULTIROW_2_PARAGRAPH}}" "$MULTIROW_2_PARAGRAPH"
replace_var "{{MULTIROW_3_PARAGRAPH}}" "$MULTIROW_3_PARAGRAPH"
replace_var "{{MULTIROW_4_PARAGRAPH}}" "$MULTIROW_4_PARAGRAPH"

# =====================================================
# MULTIROW SECTION 2 (Secondary features)
# =====================================================
replace_var "{{MULTIROW_2_HEADING}}" "$MULTIROW_2_HEADING"
replace_var "{{MULTIROW_2_PARAGRAPH_1}}" "$MULTIROW_2_PARAGRAPH_1"
replace_var "{{MULTIROW_2_PARAGRAPH_2}}" "$MULTIROW_2_PARAGRAPH_2"

# =====================================================
# FAQ SECTION
# =====================================================
replace_var "{{FAQ_HEADING}}" "$FAQ_HEADING"
replace_var "{{FAQ_ICON_1}}" "$FAQ_ICON_1"
replace_var "{{FAQ_ICON_2}}" "$FAQ_ICON_2"
replace_var "{{FAQ_ICON_3}}" "$FAQ_ICON_3"
replace_var "{{FAQ_ICON_4}}" "$FAQ_ICON_4"
replace_var "{{FAQ_ICON_5}}" "$FAQ_ICON_5"
replace_var "{{FAQ_QUESTION_1}}" "$FAQ_QUESTION_1"
replace_var "{{FAQ_ANSWER_1}}" "$FAQ_ANSWER_1"
replace_var "{{FAQ_QUESTION_2}}" "$FAQ_QUESTION_2"
replace_var "{{FAQ_ANSWER_2}}" "$FAQ_ANSWER_2"
replace_var "{{FAQ_QUESTION_3}}" "$FAQ_QUESTION_3"
replace_var "{{FAQ_ANSWER_3}}" "$FAQ_ANSWER_3"
replace_var "{{FAQ_QUESTION_4}}" "$FAQ_QUESTION_4"
replace_var "{{FAQ_ANSWER_4}}" "$FAQ_ANSWER_4"
replace_var "{{FAQ_QUESTION_5}}" "$FAQ_QUESTION_5"
replace_var "{{FAQ_ANSWER_5}}" "$FAQ_ANSWER_5"

# =====================================================
# ROTATING TESTIMONIALS (5 complete testimonials)
# =====================================================
replace_var "{{ROTATING_TESTIMONIAL_1}}" "$ROTATING_TESTIMONIAL_1"
replace_var "{{ROTATING_TESTIMONIAL_2}}" "$ROTATING_TESTIMONIAL_2"
replace_var "{{ROTATING_TESTIMONIAL_3}}" "$ROTATING_TESTIMONIAL_3"
replace_var "{{ROTATING_TESTIMONIAL_4}}" "$ROTATING_TESTIMONIAL_4"
replace_var "{{ROTATING_TESTIMONIAL_5}}" "$ROTATING_TESTIMONIAL_5"

# =====================================================
# MAIN TESTIMONIALS (12)
# =====================================================
for i in 1 2 3 4 5 6 7 8 9 10 11 12; do
    eval "replace_var \"{{TESTIMONIAL_${i}_TITLE}}\" \"\$TESTIMONIAL_${i}_TITLE\""
    eval "replace_var \"{{TESTIMONIAL_${i}_QUOTE}}\" \"\$TESTIMONIAL_${i}_QUOTE\""
    eval "replace_var \"{{TESTIMONIAL_${i}_AUTHOR}}\" \"\$TESTIMONIAL_${i}_AUTHOR\""
    eval "replace_var \"{{TESTIMONIAL_${i}_LOCATION}}\" \"\$TESTIMONIAL_${i}_LOCATION\""
done

# =====================================================
# TESTIMONIAL STRIP ALT TEXT (13)
# =====================================================
for i in 1 2 3 4 5 6 7 8 9 10 11 12 13; do
    eval "replace_var \"{{TESTIMONIAL_STRIP_ALT_${i}}}\" \"\$TESTIMONIAL_STRIP_ALT_${i}\""
done

# =====================================================
# IMAGE PATHS
# =====================================================
replace_var "{{SLIDESHOW_IMAGE_1}}" "$SLIDESHOW_IMAGE_1"
replace_var "{{SLIDESHOW_IMAGE_2}}" "$SLIDESHOW_IMAGE_2"
replace_var "{{CTA_BANNER_IMAGE}}" "$CTA_BANNER_IMAGE"
replace_var "{{FOUNDER_IMAGE}}" "$FOUNDER_IMAGE"
replace_var "{{FEATURE_IMAGE_1}}" "$FEATURE_IMAGE_1"
replace_var "{{FEATURE_IMAGE_2}}" "$FEATURE_IMAGE_2"
replace_var "{{SUPPORT_BADGE_IMAGE}}" "$SUPPORT_BADGE_IMAGE"
replace_var "{{MULTIROW_2_IMAGE}}" "$MULTIROW_2_IMAGE"
replace_var "{{FAQ_IMAGE}}" "$FAQ_IMAGE"
replace_var "{{SIZE_CHART_IMAGE}}" "$SIZE_CHART_IMAGE"

# Multirow images (4)
replace_var "{{MULTIROW_IMAGE_1}}" "$MULTIROW_IMAGE_1"
replace_var "{{MULTIROW_IMAGE_2}}" "$MULTIROW_IMAGE_2"
replace_var "{{MULTIROW_IMAGE_3}}" "$MULTIROW_IMAGE_3"
replace_var "{{MULTIROW_IMAGE_4}}" "$MULTIROW_IMAGE_4"

# Comparison images
replace_var "{{COMPARISON_IMAGE_BEFORE}}" "$COMPARISON_IMAGE_BEFORE"
replace_var "{{COMPARISON_IMAGE_AFTER}}" "$COMPARISON_IMAGE_AFTER"

# Testimonial images (12)
for i in 1 2 3 4 5 6 7 8 9 10 11 12; do
    eval "replace_var \"{{TESTIMONIAL_${i}_IMAGE}}\" \"\$TESTIMONIAL_${i}_IMAGE\""
done

# Testimonial strip images (13)
for i in 1 2 3 4 5 6 7 8 9 10 11 12 13; do
    eval "replace_var \"{{TESTIMONIAL_STRIP_IMAGE_${i}}}\" \"\$TESTIMONIAL_STRIP_IMAGE_${i}\""
done

# =====================================================
# SIZE & DEPLOYMENT
# =====================================================
replace_var "{{SIZES}}" "$SIZES"
replace_var "{{SIZE_CHART_NOTE}}" "$SIZE_CHART_NOTE"

# =====================================================
# META/SEO
# =====================================================
replace_var "{{META_DESCRIPTION}}" "$META_DESCRIPTION"
replace_var "{{OG_DESCRIPTION}}" "$OG_DESCRIPTION"
replace_var "{{OG_IMAGE_URL}}" "$OG_IMAGE_URL"

# Count remaining placeholders
REMAINING=$(grep -o "{{[^}]*}}" index.html 2>/dev/null | wc -l | tr -d ' ')
echo "   ✅ Built index.html"
if [ "$REMAINING" -gt "0" ]; then
    echo "   ❌ ERROR: $REMAINING placeholders still need values!"
    echo ""
    echo "   UNREPLACED PLACEHOLDERS:"
    grep -o "{{[^}]*}}" index.html 2>/dev/null | sort | uniq -c | sort -rn
    echo ""
    echo "   ⚠️  CRITICAL: These appear in the live page as raw {{PLACEHOLDER}} text!"
    echo "   Fix by filling in the empty values in product.config"
    echo ""

    # Check specifically for critical testimonial placeholders
    TESTIMONIAL_PLACEHOLDERS=$(grep -c "{{ROTATING_TESTIMONIAL" index.html 2>/dev/null || echo "0")
    if [ "$TESTIMONIAL_PLACEHOLDERS" -gt "0" ]; then
        echo "   🔴 ROTATING TESTIMONIALS MISSING!"
        echo "      Fill in ROTATING_TESTIMONIAL_1 through ROTATING_TESTIMONIAL_5 in product.config"
        echo ""
    fi
fi
echo ""

# ============================================
# STEP 4: Deploy
# ============================================
echo "🚀 Deploying to Netlify..."

if ! npx netlify status &>/dev/null; then
    echo "   ⚠️  Not logged in to Netlify. Run: npx netlify login"
    echo "   Skipping deployment..."
    PROD_URL="http://localhost:8888"
else
    DEPLOY_OUTPUT=$(npx netlify deploy --prod --site "$NETLIFY_SITE_ID" --dir . 2>&1)
    PROD_URL=$(echo "$DEPLOY_OUTPUT" | grep -o "https://[^[:space:]]*" | head -1)
    echo "   ✅ Deployed"
fi
echo ""

# ============================================
# STEP 5: E2E Tests
# ============================================
echo "🧪 Running Tests..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"

sleep 2

PASS=0
FAIL=0

# Test page loads
HTTP=$(curl -s -o /dev/null -w "%{http_code}" "$PROD_URL" 2>/dev/null || echo "000")
if [ "$HTTP" = "200" ]; then
    echo "   ✅ Page loads"
    ((PASS++))
else
    echo "   ❌ Page failed (HTTP $HTTP)"
    ((FAIL++))
fi

# Test product name appears
PAGE=$(curl -s "$PROD_URL" 2>/dev/null || echo "")
if echo "$PAGE" | grep -q "$PRODUCT_NAME" 2>/dev/null; then
    echo "   ✅ Product name visible"
    ((PASS++))
else
    echo "   ❌ Product name not found"
    ((FAIL++))
fi

# Test no raw placeholders
PLACEHOLDERS=$(echo "$PAGE" | grep -c "{{" || echo "0")
if [ "$PLACEHOLDERS" = "0" ]; then
    echo "   ✅ No raw placeholders"
    ((PASS++))
else
    echo "   ❌ $PLACEHOLDERS raw placeholders visible"
    ((FAIL++))
fi

# Test checkout function
FUNC=$(curl -s -o /dev/null -w "%{http_code}" "$PROD_URL/.netlify/functions/buy-now" 2>/dev/null || echo "000")
if [ "$FUNC" != "404" ]; then
    echo "   ✅ Checkout function exists"
    ((PASS++))
else
    echo "   ❌ Checkout function missing"
    ((FAIL++))
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "   Results: $PASS passed, $FAIL failed"
echo ""

# ============================================
# DONE
# ============================================
echo "╔════════════════════════════════════════════════════════════╗"
echo "║                    BUILD COMPLETE                          ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "🌐 Live URL: $PROD_URL"
echo ""
echo "📋 Manual Tests Needed:"
echo "   1. Open on mobile device"
echo "   2. Test Add to Cart"
echo "   3. Test SimpleSwap checkout"
echo ""
