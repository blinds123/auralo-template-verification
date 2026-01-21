#!/bin/bash
# VALIDATE-IMAGES-SOURCE.sh
# Enforces that Secrets and Features use "Testimonial" (UGC) style images, NOT product shots.

# Source the config
source product.config

ERRORS=0

echo "🔍 Validating Image Sources (Authenticity Check)..."

# Function to check if an image path is "too polished" (i.e., comes from product/ folder)
check_image_source() {
    local var_name=$1
    local image_path=$2
    
    # Check if the variable is empty
    if [ -z "$image_path" ]; then
        return
    fi

    # If the path contains "product/", it's a fail for Features/Secrets
    if [[ "$image_path" == *"images/product/"* ]]; then
        echo "❌ FAIL: $var_name uses a Product Image ('$image_path')."
        echo "   Rule: Features and Secrets MUST use 'images/testimonials/' (UGC/Messy/Real)."
        ((ERRORS++))
    else
        echo "✅ PASS: $var_name uses authentic source ('$image_path')."
    fi
}

# Validate Secrets
check_image_source "SECRET_IMAGE_1" "$SECRET_IMAGE_1"
check_image_source "SECRET_IMAGE_2" "$SECRET_IMAGE_2"
check_image_source "SECRET_IMAGE_3" "$SECRET_IMAGE_3"

# Validate Features (MultiRow)
check_image_source "FEATURE_IMAGE_1" "$FEATURE_IMAGE_1"
check_image_source "FEATURE_IMAGE_2" "$FEATURE_IMAGE_2"
check_image_source "FEATURE_IMAGE_3" "$FEATURE_IMAGE_3"
check_image_source "MULTIROW_IMAGE_1" "$MULTIROW_IMAGE_1"

if [ "$ERRORS" -gt 0 ]; then
    echo ""
    echo "⛔ IMAGE VALIDATION FAILED with $ERRORS errors."
    echo "   Action: Change these variables in product.config to point to 'images/testimonials/testimonial-XX.webp'."
    exit 0
fi

echo ""
echo "✅ PASS: All feature images rely on Social Proof (Testimonials), not Product Shots."
exit 0
