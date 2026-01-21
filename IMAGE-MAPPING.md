# Image Mapping Reference

## Folder Structure (EXACT)

```
images/
├── product/           # 5+ images - Product shots (ALSO HERO IMAGES)
├── testimonials/      # 25 images - Used across multiple sections
├── order-bump/        # 1-2 images - Order bump product only
├── founder/           # 1 image - Founder story section only
├── comparison/        # 2 images - Before/after comparison
└── universal-assets/  # Trust badges, press logos, icons
```

---

## EXACT Image Placement by Section

### Section 03: Hero

**Images:** `images/product/product-01.webp` through `product-05.webp`

- Main hero image: `product-01.webp`
- Gallery thumbnails: `product-01.webp` through `product-05.webp`
- TikTok comment overlays appear ON TOP of product images

### Section 05: Gallery

**Images:** `images/product/product-01.webp` through `product-05.webp`

- Main large image: `product-01.webp`
- Thumbnail strip: all 5 product images
- Swipeable on mobile

### Section 08: Pricing (Order Bump)

**Images:** `images/order-bump/order-bump-01.webp`

- Shows the order bump product
- Appears next to checkbox: "Add [product] for just $10"
- ONLY place order-bump images are used

### Section 09: Features

**Images:** `images/testimonials/testimonial-06.webp` through `testimonial-10.webp`

- Each feature card can have a testimonial image
- 4-6 features = testimonial images 6-10

### Section 11: Comparison

**Images:** `images/comparison/`

- Before (bad): `comparison-01.webp`
- After (good): `comparison-02.webp`
- Side by side or slider

### Section 12: Press Logos

**Images:** `images/universal-assets/`

- `press-01.webp` through `press-06.webp`
- Trust badges, "As Seen In" logos

### Section 13: Testimonial 1

**Image:** `images/testimonials/testimonial-01.webp`

### Section 14: Secret 1 (Vehicle)

**Image:** `images/testimonials/testimonial-08.webp`

### Section 15: Testimonial 2

**Image:** `images/testimonials/testimonial-02.webp`

### Section 16: Secret 2 (Internal)

**Image:** `images/testimonials/testimonial-15.webp`

### Section 17: Testimonial 3

**Image:** `images/testimonials/testimonial-03.webp`

### Section 18: Founder Story

**Image:** `images/founder/founder-01.webp`

- ONLY place founder image is used

### Section 19: Testimonial 4

**Image:** `images/testimonials/testimonial-04.webp`

### Section 20: Secret 3 (External)

**Image:** `images/testimonials/testimonial-22.webp`

### Section 21: Testimonial 5

**Image:** `images/testimonials/testimonial-05.webp`

### Section 22: Segment Specific

**Image:** `images/testimonials/testimonial-20.webp`

### Section 23: FAQ

**No images** - Text only accordion

### Section 24: Final CTA

**Images:** `images/product/product-01.webp` (optional product reminder)

- Or trust badges from `universal-assets/`

### Section 25: Footer

**Images:** `images/universal-assets/`

- Payment icons, trust badges
- Logo if applicable

---

## Testimonial Image Assignment (25 images)

| Image               | Used In Section                 |
| ------------------- | ------------------------------- |
| testimonial-01.webp | Section 13: Testimonial 1       |
| testimonial-02.webp | Section 15: Testimonial 2       |
| testimonial-03.webp | Section 17: Testimonial 3       |
| testimonial-04.webp | Section 19: Testimonial 4       |
| testimonial-05.webp | Section 21: Testimonial 5       |
| testimonial-06.webp | Section 09: Feature 1           |
| testimonial-07.webp | Section 09: Feature 2           |
| testimonial-08.webp | Section 14: Secret 1 (Vehicle)  |
| testimonial-09.webp | Section 09: Feature 3           |
| testimonial-10.webp | Section 09: Feature 4           |
| testimonial-11.webp | Reviews section                 |
| testimonial-12.webp | Reviews section                 |
| testimonial-13.webp | Reviews section                 |
| testimonial-14.webp | Reviews section                 |
| testimonial-15.webp | Section 16: Secret 2 (Internal) |
| testimonial-16.webp | Reviews section                 |
| testimonial-17.webp | Reviews section                 |
| testimonial-18.webp | Reviews section                 |
| testimonial-19.webp | Reviews section                 |
| testimonial-20.webp | Section 22: Segment Specific    |
| testimonial-21.webp | Reviews section                 |
| testimonial-22.webp | Section 20: Secret 3 (External) |
| testimonial-23.webp | Reviews section                 |
| testimonial-24.webp | Reviews section                 |
| testimonial-25.webp | Reviews section                 |

---

## Variable Naming Convention

### Product/Hero Images

```
HERO_IMAGE_1=images/product/product-01.webp
HERO_IMAGE_2=images/product/product-02.webp
HERO_IMAGE_3=images/product/product-03.webp
HERO_IMAGE_4=images/product/product-04.webp
HERO_IMAGE_5=images/product/product-05.webp
```

### Testimonial Images

```
TESTIMONIAL_IMAGE_1=images/testimonials/testimonial-01.webp
...
TESTIMONIAL_IMAGE_25=images/testimonials/testimonial-25.webp
```

### Order Bump Image

```
ORDER_BUMP_IMAGE=images/order-bump/order-bump-01.webp
```

### Founder Image

```
FOUNDER_IMAGE=images/founder/founder-01.webp
```

### Comparison Images

```
COMPARISON_BAD_IMAGE=images/comparison/comparison-01.webp
COMPARISON_GOOD_IMAGE=images/comparison/comparison-02.webp
```

### Universal Assets

```
PRESS_LOGO_1=images/universal-assets/press-01.webp
PRESS_LOGO_2=images/universal-assets/press-02.webp
...
TRUST_BADGE_1=images/universal-assets/trust-01.webp
PAYMENT_ICONS=images/universal-assets/payment-icons.webp
```

---

## CRITICAL RULES

1. **Product images = Hero images** - Same images, no separate hero folder
2. **Order bump image** - ONLY used in pricing/order bump section
3. **Founder image** - ONLY used in founder story section
4. **Testimonial images** - Used for testimonials, features, secrets, segment, reviews
5. **Comparison images** - ONLY used in comparison section
6. **Universal assets** - Trust badges, press logos, payment icons

## File Naming

All images should be WebP format with consistent naming:

- `product-01.webp`, `product-02.webp`, etc.
- `testimonial-01.webp` through `testimonial-25.webp`
- `order-bump-01.webp`
- `founder-01.webp`
- `comparison-01.webp` (bad/before), `comparison-02.webp` (good/after)
- `press-01.webp`, `trust-01.webp`, etc.
