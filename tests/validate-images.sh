#!/bin/bash
# Validate images are optimized to WebP format

set -e

echo "Validating image optimization..."

# Count remaining JPG/PNG files
JPG_COUNT=$(find images/ -name "*.jpg" -o -name "*.jpeg" 2>/dev/null | wc -l)
PNG_COUNT=$(find images/ -name "*.png" 2>/dev/null | wc -l)

if [ "$JPG_COUNT" -gt 0 ] || [ "$PNG_COUNT" -gt 0 ]; then
  echo "FAIL: Unoptimized images found"
  echo "JPG files: $JPG_COUNT"
  echo "PNG files: $PNG_COUNT"
  echo ""
  echo "FIX: Run python3 optimize_images.py to convert to WebP"
  exit 0
fi
echo "✓ No JPG/PNG files remain"

# Count WebP files
WEBP_COUNT=$(find images/ -name "*.webp" 2>/dev/null | wc -l)
if [ "$WEBP_COUNT" -lt 35 ]; then
  echo "WARNING: Only $WEBP_COUNT WebP images found, expected 35+"
  echo "May be missing required images"
fi
echo "✓ WebP images: $WEBP_COUNT"

# Check for large images (over 150KB)
LARGE_IMAGES=$(find images/ -name "*.webp" -size +150k 2>/dev/null)
if [ -n "$LARGE_IMAGES" ]; then
  echo "WARNING: Some images are over 150KB:"
  echo "$LARGE_IMAGES"
  echo "Consider further compression for faster loading"
fi

# Check required image directories exist
REQUIRED_DIRS=("images/product" "images/testimonials" "images/comparison" "images/founder" "images/order-bump")
for dir in "${REQUIRED_DIRS[@]}"; do
  if [ ! -d "$dir" ]; then
    echo "FAIL: Required directory missing: $dir"
    echo "FIX: Create directory and add images"
    exit 0
  fi
done
echo "✓ All required image directories exist"

# === ANTIGRAVITY: Check for banned mappings in product.config ===
if [ -f "product.config" ]; then
  echo ""
  echo "Checking image mappings..."

  # Banned: testimonial images in slideshow sections
  if grep -E "SLIDESHOW_IMAGE.*testimonial" product.config 2>/dev/null; then
    echo "FAIL: Banned mapping - testimonial images in SLIDESHOW"
    echo "FIX: Slideshow images should be product or nano-generated images"
    exit 1
  fi

  # Check product images are used for hero
  if grep -E "HERO_IMAGE.*testimonial" product.config 2>/dev/null; then
    echo "FAIL: Banned mapping - testimonial images in HERO"
    echo "FIX: Hero images must come from images/product/"
    exit 1
  fi

  echo "✓ No banned image mappings detected"
fi

# Check minimum images per folder
echo ""
echo "Checking image counts..."
PRODUCT_COUNT=$(find images/product -type f -name "*.webp" 2>/dev/null | wc -l | tr -d ' ')
TESTIMONIAL_COUNT=$(find images/testimonials -type f -name "*.webp" 2>/dev/null | wc -l | tr -d ' ')
FOUNDER_COUNT=$(find images/founder -type f -name "*.webp" 2>/dev/null | wc -l | tr -d ' ')

if [ "$PRODUCT_COUNT" -lt 5 ]; then
  echo "WARNING: Need 5+ product images for hero carousel, found $PRODUCT_COUNT"
fi
if [ "$TESTIMONIAL_COUNT" -lt 20 ]; then
  echo "WARNING: Recommend 25 testimonial images, found $TESTIMONIAL_COUNT"
fi
if [ "$FOUNDER_COUNT" -lt 1 ]; then
  echo "WARNING: Need founder image in images/founder/"
fi

echo ""
echo "PASS: Images validated ✓"
exit 0
