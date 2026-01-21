# Image Mapping - VARIABLE-BASED CONFIGURATION

## WORKFLOW

1. **Prepare images** - Drop into correct folder with ANY name
2. **Run auto-rename script** - Converts to .webp and names according to convention
3. **Configure product.config** - Set image variables to point to correct files
4. **Build** - Template uses variable paths from product.config
5. **After success** - Delete original jpg/png files

---

## REQUIRED IMAGE STRUCTURE

### Product Images (Hero Carousel)

```
images/product/
├── product-01.webp  (REQUIRED)
├── product-02.webp  (REQUIRED)
├── product-03.webp  (REQUIRED)
├── product-04.webp  (REQUIRED)
├── product-05.webp  (REQUIRED)
└── product-06.webp  (REQUIRED)
```

### Testimonial Images (Features, Secrets, Reviews)

**CONFIGURABLE via product.config variables - set FEATURE_IMAGE_1/2/3 and SECRET_IMAGE_1/2/3**

```
images/testimonials/
├── testimonial-01.webp  (REQUIRED - Used by Features/Secrets/Reviews)
├── testimonial-02.webp  (REQUIRED - Used by Features/Secrets/Reviews)
├── testimonial-03.webp  (REQUIRED - Used by Features/Secrets/Reviews)
├── testimonial-04.webp  (REQUIRED - Used by Features/Secrets/Reviews)
├── testimonial-05.webp  (REQUIRED - Used by Features/Secrets/Reviews)
└── (additional images as needed for reviews)
```

**Default product.config assignment:**

- FEATURE_IMAGE_1 → testimonial-01.webp
- FEATURE_IMAGE_2 → testimonial-02.webp
- FEATURE_IMAGE_3 → testimonial-03.webp
- SECRET_IMAGE_1 → testimonial-04.webp
- SECRET_IMAGE_2 → testimonial-05.webp
- SECRET_IMAGE_3 → testimonial-01.webp (cycles)

### Founder Image

```
images/founder/
└── founder-01.webp  (REQUIRED)
```

### Comparison Images

```
images/comparison/
├── comparison-good.webp  (REQUIRED)
└── comparison-bad.webp   (REQUIRED)
```

### Order Bump Image

```
images/order-bump/
└── order-bump-01.webp  (REQUIRED)
```

### Awards Images (Hardcoded)

```
images/awards/
├── awards-1.webp  (REQUIRED)
├── awards-2.webp  (REQUIRED)
├── awards-3.webp  (REQUIRED)
├── awards-4.webp  (REQUIRED)
└── awards-5.webp  (REQUIRED)
```

---

## IMAGE SECTIONS (Variable-based via product.config)

| Section         | Images | product.config Variable | Default Path                                 |
| --------------- | ------ | ----------------------- | -------------------------------------------- |
| Hero Carousel   | 6      | PRODUCT_IMAGE_1-6       | `images/product/product-01 to 06.webp`       |
| Hero Thumbnails | 5      | PRODUCT_IMAGE_1-5       | `images/product/product-01 to 05.webp`       |
| Feature 1       | 1      | FEATURE_IMAGE_1         | `images/testimonials/testimonial-01.webp`    |
| Feature 2       | 1      | FEATURE_IMAGE_2         | `images/testimonials/testimonial-02.webp`    |
| Feature 3       | 1      | FEATURE_IMAGE_3         | `images/testimonials/testimonial-03.webp`    |
| Secret 1        | 1      | SECRET_IMAGE_1          | `images/testimonials/testimonial-04.webp`    |
| Secret 2        | 1      | SECRET_IMAGE_2          | `images/testimonials/testimonial-05.webp`    |
| Secret 3        | 1      | SECRET_IMAGE_3          | `images/testimonials/testimonial-01.webp`    |
| Founder Story   | 1      | FOUNDER_IMAGE           | `images/founder/founder-01.webp`             |
| Comparison      | 2      | COMPARISON*IMAGE*\*     | `images/comparison/comparison-good/bad.webp` |
| Order Bump      | 1      | ORDER_BUMP_IMAGE        | `images/order-bump/order-bump-01.webp`       |
| Awards          | 5      | (hardcoded)             | `images/awards/awards-1 to 5.webp`           |
| Reviews         | 12+    | TESTIMONIAL\_\*\_IMAGE  | `images/testimonials/testimonial-*.webp`     |

---

## PRICING (HARDCODED - ENFORCED BY VALIDATION)

| Variable              | Value | Enforcement                                    |
| --------------------- | ----- | ---------------------------------------------- |
| SINGLE_PRICE          | 19    | `tests/validate-config.sh` will FAIL if not 19 |
| ORDER_BUMP_PRICE      | 10    | `tests/validate-config.sh` will FAIL if not 10 |
| ORDER_BUMP_PRECHECKED | true  | Hardcoded in JS                                |

---

## IMAGE PREPARATION SCRIPT

Run this to auto-convert and rename images:

```bash
#!/bin/bash
# prepare-images.sh - Auto-convert and rename images

# Convert product images
cd images/product
i=1; for f in *.{jpg,jpeg,png,PNG,JPG,JPEG} 2>/dev/null; do
  [ -f "$f" ] && cwebp -q 85 "$f" -o "product-$(printf %02d $i).webp" && ((i++))
done

# Convert testimonial images
cd ../testimonials
i=1; for f in *.{jpg,jpeg,png,PNG,JPG,JPEG} 2>/dev/null; do
  [ -f "$f" ] && cwebp -q 85 "$f" -o "testimonial-$(printf %02d $i).webp" && ((i++))
done

# Convert founder
cd ../founder
for f in *.{jpg,jpeg,png,PNG,JPG,JPEG} 2>/dev/null; do
  [ -f "$f" ] && cwebp -q 85 "$f" -o "founder-01.webp" && break
done

# Convert comparison
cd ../comparison
for f in *good*.{jpg,jpeg,png,PNG,JPG,JPEG} 2>/dev/null; do
  [ -f "$f" ] && cwebp -q 85 "$f" -o "comparison-good.webp" && break
done
for f in *bad*.{jpg,jpeg,png,PNG,JPG,JPEG} 2>/dev/null; do
  [ -f "$f" ] && cwebp -q 85 "$f" -o "comparison-bad.webp" && break
done

# Convert order bump
cd ../order-bump
for f in *.{jpg,jpeg,png,PNG,JPG,JPEG} 2>/dev/null; do
  [ -f "$f" ] && cwebp -q 85 "$f" -o "order-bump-01.webp" && break
done

# Convert awards
cd ../awards
i=1; for f in *.{jpg,jpeg,png,PNG,JPG,JPEG} 2>/dev/null; do
  [ -f "$f" ] && cwebp -q 85 "$f" -o "awards-$i.webp" && ((i++))
done

echo "✅ All images converted to .webp"
```

---

## VALIDATION COMMAND

```bash
# Check all required images exist
for f in images/product/product-{01,02,03,04,05,06}.webp \
         images/testimonials/testimonial-{01,02,03,04,05,06,07,08,09}.webp \
         images/founder/founder-01.webp \
         images/comparison/comparison-{good,bad}.webp \
         images/order-bump/order-bump-01.webp \
         images/awards/awards-{1,2,3,4,5}.webp; do
  [ -f "$f" ] && echo "✓ $f" || echo "✗ MISSING: $f"
done
```

---

## POST-SUCCESS CLEANUP

After the project is declared successful:

```bash
# Delete original files (keep only .webp)
find images/ -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.JPG" -o -name "*.JPEG" -o -name "*.PNG" \) -delete
echo "🧹 Cleaned up original files"
```

---

## RULES

1. **ALL images must be .webp format** - Use prepare-images.sh to convert
2. **Naming is HARDCODED** - Template expects exact filenames
3. **No configuration needed for images** - Just prepare images correctly
4. **Features use 01-03, Secrets use 04-06** - NO COLLISION
5. **Pricing is HARDCODED** - SINGLE_PRICE=19, ORDER_BUMP_PRICE=10 (validated)
6. **Minimum required**: 6 product + 9 testimonial + 1 founder + 2 comparison + 1 order-bump + 5 awards = **24 images**
