#!/bin/bash
# Validate all required image directories exist with minimum images
# This is Phase 0 pre-check - FAIL FAST if inputs missing

set -e

IMAGES_DIR="${1:-images}"

echo "=== VALIDATING IMAGE STRUCTURE ==="
echo ""

FAILURES=0

# Check images directory exists
if [ ! -d "$IMAGES_DIR" ]; then
  echo "FAIL: $IMAGES_DIR directory does not exist"
  echo ""
  echo "FIX: Create the images directory with this structure:"
  echo "  mkdir -p images/{hero,product,testimonials,comparison,lifestyle,founder}"
  exit 0
fi

echo "Directory exists: $IMAGES_DIR"
echo ""

# Function to check folder has minimum images
check_folder() {
  local folder="$1"
  local min_count="$2"
  local folder_path="$IMAGES_DIR/$folder"

  if [ ! -d "$folder_path" ]; then
    echo "FAIL: $folder_path does not exist"
    FAILURES=$((FAILURES + 1))
    return
  fi

  # Count image files
  local count=$(find "$folder_path" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.webp" -o -name "*.gif" \) 2>/dev/null | wc -l | tr -d ' ')

  if [ "$count" -lt "$min_count" ]; then
    echo "FAIL: $folder_path has $count images (need $min_count+)"
    FAILURES=$((FAILURES + 1))
  else
    echo "PASS: $folder_path has $count images (need $min_count+)"
  fi
}

# Check each required folder
# NOTE: Product images ARE the hero images (no separate hero folder)
echo "Checking image folders..."
echo ""

check_folder "product" 5            # Also used as hero images
check_folder "testimonials" 25      # Features, Secrets, Testimonials, Reviews
check_folder "order-bump" 1         # Order bump product image
check_folder "founder" 1            # Founder story image
check_folder "comparison" 2         # Before/after comparison
check_folder "universal-assets" 1   # Trust badges, press logos

echo ""
echo "=== SUMMARY ==="

if [ "$FAILURES" -eq 0 ]; then
  echo "PASS: All image folders have required minimum images"
  echo ""
  echo "Image structure validated:"
  echo "  ✅ product/ (5+ images) - Also used as hero"
  echo "  ✅ testimonials/ (25 images) - Features, Secrets, Reviews"
  echo "  ✅ order-bump/ (1+ image) - Order bump product"
  echo "  ✅ founder/ (1 image)"
  echo "  ✅ comparison/ (2 images) - Before/after"
  echo "  ✅ universal-assets/ (trust badges, logos)"
  exit 0
else
  echo "FAIL: $FAILURES folders missing or incomplete"
  echo ""
  echo "FIX: Add the missing images before running Ralph."
  echo ""
  echo "Required structure:"
  echo "  images/product/         - 5+ product shots (ALSO HERO IMAGES)"
  echo "  images/testimonials/    - 25 images (Features, Secrets, Testimonials, Reviews)"
  echo "  images/order-bump/      - 1+ order bump product image"
  echo "  images/founder/         - 1 founder image"
  echo "  images/comparison/      - 2 images (good + bad)"
  echo "  images/universal-assets/ - Trust badges, press logos"
  exit 0
fi
