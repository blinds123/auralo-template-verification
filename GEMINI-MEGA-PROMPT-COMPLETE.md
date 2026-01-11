# 🎯 COMPLETE LANDING PAGE BUILDER MEGA-PROMPT

**Purpose**: Build a complete, high-converting landing page from scratch for ANY product
**Target AI**: Gemini, ChatGPT, Claude, or any LLM
**Result**: Deployed site with working crypto checkout, optimized for speed

---

## 🚨 MANDATORY VISION MODE PROTOCOL

**YOU MUST FOLLOW THIS THROUGHOUT EVERY PHASE:**

### Vision Mode Rules:

1. **After EVERY phase**: Take screenshot, visually confirm completion
2. **Before proceeding**: Check off validation gate items BY LOOKING at screenshots
3. **No assumptions**: If you can't see it in a screenshot, it doesn't exist
4. **Self-validate**: Don't ask user "is this correct?" - YOU verify with vision mode
5. **Count visually**: Screenshot folders and count files, don't assume file counts

### Examples:

**❌ WRONG (Assumption-based):**

```
"I generated 35 images."
"All images are WebP format."
"Images are loading correctly."
```

**✅ CORRECT (Vision mode verification):**

```
"I took screenshot of images/product/ folder. I count 6 files: product-01.webp through product-06.webp. ✓"

"I took screenshot of images/testimonials/ folder. I count 25 files: testimonial-01.webp through testimonial-25.webp. ✓"

"I opened index.html in browser and took screenshot. I can see product-01.webp loaded in hero section. ✓"

"I used browser DevTools Network tab screenshot - all images show 200 status code, no 404 errors. ✓"
```

---

## 📁 TEMPLATE STRUCTURE OVERVIEW

Before starting, understand the template architecture:

```
brunson-protocol-template/
├── sections/              # 23 modular HTML sections
│   ├── 01-head.html
│   ├── 02-announcement.html
│   ├── 03-header.html
│   ├── 04-hero.html
│   ├── 05-main-product.html
│   ├── 06-features.html
│   ├── ...
│   └── 23-scripts.html
├── stylesheets/           # 13 CSS modules
├── scripts/               # 9 JavaScript modules
├── images/                # ALL images go here
│   ├── product/          # 6 product photos (product-01.webp → product-06.webp)
│   ├── testimonials/     # 25 testimonial photos (testimonial-01.webp → testimonial-25.webp)
│   ├── comparison/       # 2 comparison images (comparison-bad.webp, comparison-good.webp)
│   ├── founder/          # 1 founder photo (founder-01.webp)
│   └── order-bump/       # 1 order bump product (order-bump-01.webp)
├── netlify/functions/     # Checkout function
│   └── buy-now.js
├── product.config         # 178+ variables (ALL text content)
├── build.sh              # Builds final index.html
├── optimize-images.sh    # Converts PNG/JPG → WebP
└── optimize-speed.sh     # Speed optimization

```

**Key Points:**

- **Zero hardcoded content** - Everything uses `{{VARIABLE}}` placeholders
- **Modular sections** - Easy to customize individual sections
- **Variable replacement** - build.sh reads product.config and replaces all `{{VARIABLES}}`
- **Image optimization** - All images MUST be WebP format for speed
- **SimpleSwap checkout** - Pre-created crypto exchanges from shared pool server

---

## 🎯 COMPLETE WORKFLOW (7 Phases)

### Phase 0: Setup & Prerequisites

### Phase 1: Buyer Research (Russell Brunson + Steve Larsen frameworks)

### Phase 2: Image Generation (35 images with TikTok bubbles)

### Phase 2.5: **IMAGE PATH VERIFICATION (NEW - Check locally immediately)**

### Phase 3: Copywriting (178+ variables using mapping formulas)

### Phase 4: SimpleSwap Checkout Integration

### Phase 5: **SPEED OPTIMIZATION (WebP, minification, lazy loading)**

### Phase 5.5: **PRE-DEPLOYMENT AUDIT (Check all paths before Netlify)**

### Phase 6: Deployment & Testing

### Phase 6.5: **POST-DEPLOYMENT VERIFICATION (Check again after upload)**

---

# PHASE 0: SETUP & PREREQUISITES

## Step 0.1: Verify Prerequisites

**Check these BEFORE starting:**

1. **Node.js installed** (v18+ minimum)

   ```bash
   node --version
   # Must show v18 or higher
   ```

2. **Netlify CLI installed**

   ```bash
   npm install -g netlify-cli
   netlify --version
   ```

3. **WebP tools installed** (for image optimization)

   ```bash
   # macOS
   brew install webp

   # Linux
   sudo apt-get install webp

   # Verify
   cwebp -version
   ```

4. **Image generation tool access**
   - Whisk (Google Labs) OR
   - DALL-E (ChatGPT Plus) OR
   - Midjourney

5. **Vision mode activated**
   - Confirm you can take screenshots
   - Test: Take screenshot of desktop, describe what you see

**Vision Mode Checkpoint:**

- [ ] Take screenshot showing Node.js version ≥ v18
- [ ] Take screenshot showing `cwebp -version` output
- [ ] Screenshot shows Netlify CLI installed

---

## Step 0.2: Get Product Information from User

**Ask user for these inputs:**

```
REQUIRED INPUTS:

1. Product Name: [exact string, e.g., "Leopard Sequin Maxi Skirt"]

2. Product Category: [e.g., "Women's Fashion - Party Wear"]

3. Target Price: [single number, e.g., "97" - this is for display only, checkout uses pool server tiers]

4. Competitor URL: [full URL of main competing product for research]

5. Reference Image: [user uploads product photo for image generation consistency]
```

**Store these in memory** - you'll use them throughout all phases.

---

# PHASE 1: BUYER RESEARCH

## Purpose

Generate complete buyer research document using Russell Brunson + Steve Larsen frameworks. This is the **foundation** for ALL copywriting decisions.

**Output File**: `BUYER-RESEARCH-[PRODUCT-NAME].md`

---

## Section 1.1: Dream Customer Profile

**Instructions**: Research and document your ideal customer using these EXACT questions. Provide specific answers, not generic statements.

### Demographics (Answer ALL 5):

1. **Age range**: [e.g., "20-32" NOT "young adults"]

2. **Gender**: [e.g., "Women" or "Men" or "Non-binary"]

3. **Location**: [e.g., "Urban areas - NYC, LA, Miami, Chicago" NOT "cities"]

4. **Income level**: [e.g., "$35k-$75k/year" NOT "middle class"]

5. **Occupation**: [e.g., "College students, young professionals, content creators" with 3+ specific job types]

### Psychographics (Answer ALL 4):

1. **What do they value most?** [List 5+ specific values with examples]

2. **What are they afraid of?** [List 5+ specific fears related to product category]

3. **What embarrasses them?** [List 3+ situations that cause social embarrassment]

4. **Who do they want to impress?** [List 4+ specific people/groups]

### Online Behavior (Answer ALL 4):

1. **Spends time on**: [List 4+ specific platforms with content types they consume]

2. **Follows**: [List 3+ specific influencer types or example accounts]

3. **Searches for**: [List 5+ exact Google search queries in quotes, e.g., "best sequin skirt for plus size"]

4. **Pain points they Google**: [List 4+ exact search queries showing problems, e.g., "why does my sequin dress shed"]

### Shopping Behavior (Answer ALL 5):

1. **When do they buy?** [Specific triggers: events, seasons, emotions]

2. **How do they research?** [Exact process with steps: TikTok reviews → Google → Amazon reviews → buy]

3. **Price sensitivity**: [Specific range + what they'll pay premium for]

4. **Return habits**: [Why they return + how often]

5. **Repeat purchase behavior**: [When they buy multiples or repurchase]

**EXAMPLE OUTPUT (Golden Sparkle Top):**

```
Age range: 20-32
Gender: Women
Location: Urban areas (NYC, LA, Miami, Chicago, Dallas, Atlanta)
Income level: $35k-$75k/year
Occupation: College students, young professionals in hospitality, retail, marketing, content creators, bartenders

What do they value most?: Standing out at events, getting compliments from strangers, feeling confident in photos, looking expensive without breaking the bank, Instagram-worthy outfits, being "that girl" everyone asks about

What are they afraid of?: Blending in at parties, looking cheap or low-effort, wardrobe malfunctions, being overdressed or underdressed, outfit repeating on social media, buying something that looks different in person

What embarrasses them?: Off-shoulder tops that fall down all night, visible bra straps, cheap-looking fabric that photographs badly, showing up in the same outfit as someone else, unflattering fit that shows every flaw

Who do they want to impress?: Girls in their friend group, guys at bars/clubs, Instagram followers, coworkers at holiday parties, ex-boyfriends, older siblings' friend groups

Spends time on: TikTok (fashion hauls, "what I wore to..." videos, outfit checks), Instagram (influencer outfit posts, Reels), Pinterest (party outfit inspo boards), YouTube (try-on hauls, "what to wear to..." guides)

Follows: Micro-influencers with 50k-500k followers showing real-life party outfits, fashion TikTokers like @stylebyemily, @outfitinspo, fast fashion reviewers testing Amazon/Shein finds

Searches for: "best off-shoulder top for clubs", "sparkle top that stays up", "what to wear to birthday dinner", "outfit for Vegas girls trip", "tops that look expensive under $50"

Pain points they Google: "why does my off-shoulder top keep falling", "how to keep strapless top up all night", "do sequin tops shed glitter everywhere", "off-shoulder top with built-in bra"
```

---

## Section 1.2: Pain Stack (TOP 10 Pains)

**Instructions**: List the TOP 10 frustrations your customer has with existing solutions. Each pain MUST include all 4 elements.

**Format for Each Pain**:

```
### Pain #[N]: [Specific Pain Point - Be Exact, Use Customer Language]

**Emotional Impact**: [Emotion 1], [Emotion 2], [Emotion 3]
**Frequency**: "[Exact quote showing how often this happens]"
**Source**: [Where you found this - review quotes, forum posts, competitor research]
**Intensity**: 🔥🔥🔥🔥🔥 ([Explanation of why this severity: deal-breaker, annoying, or minor])
```

**Research Sources to Check:**

1. **Amazon reviews** - Read 50+ reviews of competing products, especially 3-star "most honest" reviews
2. **Reddit discussions** - Search subreddits for your product category (e.g., r/femalefashionadvice)
3. **YouTube review comments** - Read comments on competitor product reviews
4. **TikTok comment sections** - Search product hashtags, read complaints
5. **Competitor website reviews** - Read negative reviews
6. **Facebook groups** - Join groups related to your product category
7. **Quora questions** - Search "[product category] problems"
8. **Google autocomplete** - Type "[product] is..." and note autocomplete suggestions

**EXAMPLE PAIN #1 (Golden Sparkle Top):**

```
### Pain #1: Off-Shoulder Tops Keep Falling Down All Night

**Emotional Impact**: Constant anxiety, can't relax and enjoy the event, embarrassment when pulling it up in public, feeling self-conscious in photos
**Frequency**: "Every single off-shoulder top I've tried does this within 30 minutes"
**Source**: Amazon reviews of off-shoulder tops (248 mentions of "falls down" or "won't stay up"), Reddit r/femalefashionadvice (87 posts), TikTok comments on #offshouldertop videos
**Intensity**: 🔥🔥🔥🔥🔥 (CRITICAL deal-breaker - ruins the entire experience, makes product unwearable for its intended purpose)
```

**Continue for Pain #2 through Pain #10**

[Each pain follows same format]

---

## Section 1.3: Desire Stack (TOP 10 Desires)

**Instructions**: List the TOP 10 dreams and desires related to your product. Each desire MUST include all 4 elements.

**Format for Each Desire**:

```
### Desire #[N]: "[Quote Format - First Person Customer Voice]"

**Emotional Payoff**: [Emotion 1], [Emotion 2], [Emotion 3], [Emotion 4]
**Trigger Phrases**: "[Phrase 1]", "[Phrase 2]", "[Phrase 3]", "[Phrase 4]"
**Dream Scenario**: [Specific situation with sensory details - what they see, hear, feel when desire is fulfilled]
**Social Proof Evidence**: [Real quotes from reviews/social media showing people experiencing this desire]
```

**EXAMPLE DESIRE #1 (Golden Sparkle Top):**

```
### Desire #1: "I Want to Be the Best Dressed Person in the Room"

**Emotional Payoff**: Pride, confidence, validation, social status elevation, feeling special
**Trigger Phrases**: "Everyone kept asking where I got it", "All eyes on me when I walked in", "My friends were so jealous", "Felt like a celebrity"
**Dream Scenario**: Walking into the party and immediately noticing heads turn, friends rushing over to compliment the outfit, strangers approaching to ask where you got it, feeling the phone camera flashes as everyone wants a photo, posting to Instagram and getting 10x more likes than usual
**Social Proof Evidence**: "I wore this to my friend's birthday and literally 6 people asked me where I got it!" (Amazon review), "Everyone at the club kept complimenting me" (TikTok comment), "My crush finally noticed me when I wore this" (Instagram comment)
```

**Continue for Desire #2 through Desire #10**

[Each desire follows same format]

---

## Section 1.4: The 3 False Beliefs (Russell Brunson Framework)

**Instructions**: Identify the THREE false beliefs preventing purchase, using Russell Brunson's framework.

### False Belief #1: VEHICLE (Does this product actually work?)

```
FALSE BELIEF: "[What do they believe that makes them doubt this category of products works?]"

TRUTH: "[What is actually true that proves this specific product DOES work?]"

EVIDENCE: "[Social proof, mechanism explanation, or results that prove the truth]"
```

**Example (Waist Wrap):**

```
FALSE BELIEF: "All shapewear is uncomfortable and shows through clothing"

TRUTH: "Invisible compression technology from athletic wear creates smooth silhouette without visible lines or restriction"

EVIDENCE: "47,000+ women wearing daily for 8+ hours without discomfort, zero VPL (visible panty lines), works under bodycon dresses and leggings where traditional shapewear fails"
```

### False Belief #2: INTERNAL (Can someone like ME do this / use this / pull this off?)

```
FALSE BELIEF: "[What do they believe about themselves that makes them think this won't work for THEM specifically?]"

TRUTH: "[What is actually true that proves it works for people exactly like them?]"

EVIDENCE: "[Testimonials from similar people, size ranges, body type proof]"
```

**Example (Leopard Sequin Skirt):**

```
FALSE BELIEF: "I'm too curvy/plus-sized for sequins - they'll make me look bigger or highlight my problem areas"

TRUTH: "The fish-tail silhouette and vertical sequin pattern actually creates an elongating effect that flatters curves and defines the waist"

EVIDENCE: "Plus-size fashion bloggers with 200k+ followers specifically recommend this style, available sizes XS-3XL with same flattering effect, testimonials from size 14-18 customers saying it's the MOST flattering skirt they own"
```

### False Belief #3: EXTERNAL (Time, money, or what will others think?)

```
FALSE BELIEF: "[What external factors do they believe will prevent success even if the product works?]"

TRUTH: "[What is actually true that removes these external barriers?]"

EVIDENCE: "[Price justification, time savings, social proof of acceptance]"
```

**Example (Golden Sparkle Top):**

```
FALSE BELIEF: "Sparkly tops are too high-maintenance - I'll have to hand-wash, dry-clean, worry about glitter shedding, and can only wear once before it looks cheap"

TRUTH: "Premium construction means machine washable, zero shedding, and rewearable for years without losing sparkle"

EVIDENCE: "Customers wearing the same top 50+ times over 2 years with no fading, machine washable on delicate cycle, zero glitter shedding reported in 12,000+ reviews, cost-per-wear of $0.94 vs $47 one-time purchase"
```

---

## Section 1.5: Russell Brunson & Steve Larsen Brainstorm Session

**Instructions**: This is the MOST IMPORTANT section. Conduct a detailed brainstorm session between Russell Brunson and Steve Larsen analyzing this product.

**Minimum Requirements:**

- 20+ exchanges (10 from Russell, 10 from Steve)
- Deep analysis using their specific frameworks
- Debate different approaches
- Final consensus on winning headline, mechanism, and secrets

### Brainstorm Session Format:

```
**Russell Brunson**: [Analysis using his frameworks: Epiphany Bridge, Hook Story Offer, Big Domino, etc.]

**Steve Larsen**: [Response using his frameworks: Market Sophistication, One Thing, Unique Mechanism, etc.]

**Russell Brunson**: [Builds on Steve's point, adds his perspective]

**Steve Larsen**: [Challenges or refines Russell's idea]

[Continue for minimum 20 exchanges]

---

**BRAINSTORM OUTPUT SUMMARY:**

WINNING HEADLINE: "[The single best headline from brainstorm - will become HEADLINE_HOOK]"

MECHANISM NAME: "[The unique mechanism / proprietary system name]"

BIG DOMINO STATEMENT: "[The ONE belief that makes all other objections irrelevant]"

SECRET #1 (Vehicle): "[Identity-first headline addressing 'does it work?']"

SECRET #2 (Internal): "[Identity-first headline addressing 'can I do this?']"

SECRET #3 (External): "[Identity-first headline addressing 'time/money/others?']"

COMMENT BUBBLE THEMES: [List 10+ objection/answer pairs for TikTok bubbles in images]

KEY PHRASES TO USE: [List 10+ exact phrases that should appear in copy]

PHRASES TO AVOID: [List 5+ cliché or framework-exposing phrases to never use]

VISUAL DIRECTION: [Describe what each image type should convey emotionally]
```

**EXAMPLE BRAINSTORM EXCERPT (Waist Wrap):**

```
**Russell Brunson**: Okay, Steve, I'm looking at this waist wrap product. My first thought - what's the Epiphany Bridge story here? Every great product has that moment where the founder discovered the solution. For shapewear, there's a thousand options. What's the "aha moment" that makes THIS one different?

**Steve Larsen**: Russell, before we get to story, let's talk Market Sophistication. Eugene Schwartz's 5 levels - where is the shapewear market right now? I'd say we're at Level 4, maybe pushing Level 5. "Shapewear" isn't new. "Invisible shapewear" isn't even new anymore. "Comfortable shapewear" has been claimed 100 times. We're in the "Most Aware" stage where customers have seen every claim and tried everything. So we can't lead with mechanism alone.

**Russell Brunson**: Exactly! Which means we need NEW OPPORTUNITY, not improvement. The Big Domino isn't "this shapewear is better." It's "shapewear itself is the problem, and THIS is the replacement." What if the mechanism is "invisible compression" - borrowed from athletic wear, not shapewear? Now we're creating a new category.

**Steve Larsen**: YES! That's the "One Thing" differentiator. But here's where I'd push back - "invisible compression" sounds like a feature, not a mechanism. A mechanism needs to be proprietary-feeling, ownable. What about "The Wrap Method"? Or "Layered Compression System"? Something that makes them think "Oh, this is different from Spanx."

[... continues for 20+ exchanges ...]

---

**BRAINSTORM OUTPUT SUMMARY:**

WINNING HEADLINE: "The Only Shapewear That Looks Invisible (Because It Is)"

MECHANISM NAME: "Invisible Compression Technology"

BIG DOMINO STATEMENT: "If shapewear is uncomfortable and shows through clothes, it defeats the purpose - this gives you the shape WITHOUT the discomfort or visibility"

SECRET #1 (Vehicle): "For Women Who've Given Up On Uncomfortable Shapewear"

SECRET #2 (Internal): "Works For Every Body Type (Even If You've Never Worn Shapewear Before)"

SECRET #3 (External): "For Busy Women Who Don't Have Time For Complicated Undergarments"

COMMENT BUBBLE THEMES:
1. Q: "Does it show through clothing?" A: "Nope 👏 literally invisible under everything"
2. Q: "Is it uncomfortable like Spanx?" A: "I wear mine 12 hours and forget it's on"
3. Q: "Will it roll down?" A: "Stays put all day, zero rolling"
[... 7 more themes ...]

KEY PHRASES TO USE: "invisible compression", "zero VPL", "looks 2 sizes smaller", "nobody knows you're wearing it", "all-day comfort", "works under everything"

PHRASES TO AVOID: "shapewear revolution", "game-changer", "miracle product", "SECRET #1" (never expose the framework)

VISUAL DIRECTION: Product photos should show the wrap BEFORE being worn (loose, lightweight fabric) and AFTER (smooth, invisible under clothing). Testimonials should be real women in everyday outfits where you CAN'T see the wrap - proving invisibility.
```

---

## Section 1.6: Epiphany Bridge Founder Story (3-Part Structure)

**Instructions**: Write the founder's origin story using Russell Brunson's Epiphany Bridge framework (simplified to 3 parts for landing pages).

### Part 1: THE BACKSTORY (Before discovering the solution)

```
BREAKING POINT MOMENT: "[What was the specific incident that made the founder realize they needed a solution?]"

WHAT THEY TRIED: "[List 3-5 existing solutions they tried that FAILED - be specific about what failed]"

EMOTIONAL STATE: "[How did they feel during this struggle? Frustrated, embarrassed, defeated?]"
```

### Part 2: THE EPIPHANY (The "aha" moment)

```
THE REALIZATION: "[What did they discover or realize that changed everything?]"

WHY IT CLICKED: "[What made this solution different from everything they'd tried?]"

FIRST TEST: "[Describe the first time they tried the new approach - what happened?]"
```

### Part 3: THE RESULT (Transformation achieved)

```
TRANSFORMATION: "[How did life change after discovering this solution?]"

SOCIAL PROOF: "[What did others say? How did people react?]"

MISSION: "[Why did they decide to share this with others? What became possible?]"
```

**EXAMPLE (Golden Sparkle Top):**

```
PART 1: THE BACKSTORY

BREAKING POINT MOMENT: "I spent $300 on a 'designer' off-shoulder top for my sister's wedding weekend. Within 20 minutes of the rehearsal dinner, it had fallen down THREE times. I spent the entire night pulling it up, missing conversations, and feeling self-conscious in every photo. My sister's photographer actually asked if I wanted to 'fix my top' before the group shots. I was mortified."

WHAT THEY TRIED:
1. Fashion tape - Left sticky residue on skin, didn't hold for more than 30 minutes
2. Tight-fitting off-shoulder tops - Gave me "muffin top" from compression, still slipped down
3. Strapless bras with grip - Bra showed when top shifted, defeated the purpose
4. Safety-pinning top to bra - Looked lumpy, pins poked me, unprofessional solution
5. Going without - Zero confidence, constantly adjusting, couldn't enjoy events

EMOTIONAL STATE: "I felt like I couldn't trust ANY off-shoulder top. I'd avoid them completely, even though I loved the look. Every time I saw one online, I'd think 'that's going to fall down' and keep scrolling. I was convinced the style just wasn't FOR me - that I'd have to choose between comfort and looking good."

PART 2: THE EPIPHANY

THE REALIZATION: "I was at a friend's bachelorette party in Nashville, and one of the girls wore an off-shoulder top ALL NIGHT - dancing, drinking, sitting, standing - and it NEVER MOVED. I literally asked her about it, and she said it had a built-in grip-strip technology from activewear. The fabric had micro-silicone dots inside that gripped skin without feeling tight or sticky. It was the first time I'd seen someone wear off-shoulder with zero adjustments."

WHY IT CLICKED: "This wasn't traditional fashion tape or tight elastic - it was engineered fabric from athletic wear. The same technology that keeps sports bras in place during workouts. It was designed to GRIP, not compress. That's why every other top failed - they relied on tightness or sticky tape, which inevitably gives up. This was structural."

FIRST TEST: "I ordered one immediately. The night it arrived, I wore it to a rooftop bar with my boyfriend. I literally forgot I was wearing an off-shoulder top - which sounds insane, but I wasn't thinking about it AT ALL. No adjusting, no mirror checks, no anxiety. At the end of the night, my boyfriend said 'That top looks amazing - you seem so confident tonight.' That's when I knew - this was the solution I'd been searching for."

PART 3: THE RESULT

TRANSFORMATION: "I went from avoiding off-shoulder tops completely to wearing them 3-4 times a week. I bought them in every color. I started getting compliments from strangers asking where I got them. I could finally enjoy events without wardrobe anxiety - weddings, date nights, girls' nights, work events. The style I loved was finally wearable."

SOCIAL PROOF: "My friends noticed immediately. They'd ask 'How is your top staying up?!' and I'd show them the grip technology. Within a month, 5 of my closest friends ordered the same top. One of them texted me a week later: 'I wore this to a wedding and danced for 4 hours straight - it didn't move ONCE. You changed my life.'"

MISSION: "That's when I realized - if this technology exists, why isn't EVERY off-shoulder top using it? Why are we still dealing with fashion tape and safety pins like it's 1995? I wanted to make this available to every woman who'd given up on off-shoulder styles. You shouldn't have to choose between confidence and comfort - you deserve both."
```

---

## PHASE 1 VALIDATION GATE (MANDATORY)

**Before proceeding to Phase 2, verify:**

### Vision Mode Checklist:

- [ ] Save file as `BUYER-RESEARCH-[PRODUCT-NAME].md`
- [ ] Take screenshot of file saved in template directory
- [ ] Screenshot shows file size > 15 KB (indicates complete research, not summary)
- [ ] Open file and screenshot Section 1.1 showing all 5 demographics answered
- [ ] Screenshot Pain Stack showing all 10 pains with intensity ratings
- [ ] Screenshot Desire Stack showing all 10 desires with trigger phrases
- [ ] Screenshot Brainstorm Session showing 20+ exchanges visible
- [ ] Screenshot Brainstorm Output Summary showing WINNING HEADLINE selected
- [ ] Screenshot Epiphany Bridge showing all 3 parts completed

**IF ANY ITEM FAILS:** Return to incomplete section, complete it, re-verify with vision mode.

**DO NOT PROCEED** until all checkboxes verified with screenshots.

---

# PHASE 2: IMAGE GENERATION (35 Images)

## Purpose

Generate 35 ultra-high-quality images for the landing page using Whisk, DALL-E, or Midjourney.

**Image Breakdown:**

- 6 Product Photos (professional luxury settings)
- 25 Testimonial Photos (iPhone mirror selfies, UGC aesthetic)
- 2 Comparison Photos (Bad product with ✗, Good product with ✓)
- 1 Founder Photo (CEO holding product, brand story)
- 1 Order Bump Product (complementary accessory)

**CRITICAL FILE NAMING CONVENTION:**

```
images/product/product-01.webp        (Hero image - MOST important)
images/product/product-02.webp
images/product/product-03.webp
images/product/product-04.webp
images/product/product-05.webp
images/product/product-06.webp

images/testimonials/testimonial-01.webp   ⚠️ SINGULAR (not testimonials-01)
images/testimonials/testimonial-02.webp   ⚠️ SINGULAR (not testimonials-02)
...
images/testimonials/testimonial-25.webp   ⚠️ SINGULAR (not testimonials-25)

images/comparison/comparison-bad.webp   (Competing inferior product)
images/comparison/comparison-good.webp  (Your product)

images/founder/founder-01.webp

images/order-bump/order-bump-01.webp
```

**🚨 CRITICAL NAMING RULES:**

1. **ALL images MUST be .webp format** (for speed optimization)

2. **Testimonials MUST be SINGULAR**: `testimonial-01.webp` (NOT `testimonials-01.webp`)
   - **Most common mistake**: Image generation tools often create `testimonials-01.png` (plural)
   - **Template expects**: `testimonial-01.webp` (singular)
   - **If you generate with plural, rename them immediately** (see Phase 2.5 for rename script)

3. **Product numbers MUST have leading zero**: `product-01.webp` (NOT `product-1.webp`)

4. **Comparison names MUST match**: `comparison-good.webp` (NOT `comparison-new.webp`)

**Why this matters**: The template HTML hardcodes these exact paths. If names don't match, images won't load (404 errors, brown placeholder squares).

---

## Image Type 1: Product Photos (6 images)

**Requirements:**

- Professional editorial quality
- Luxury location settings (resort, rooftop bar, upscale restaurant, art gallery, etc.)
- Model demographics from Phase 1 research (Dream Customer Profile)
- Product clearly visible and hero of the shot
- 2 TikTok comment bubbles per image (Question + Answer addressing objections)

**TikTok Comment Bubble Structure:**

Each product photo has 2 comment bubbles:

**Bubble 1 (Question - Top-Left):**

```
- Small circular profile photo (40px) of Gen Z girl matching target demo
- Header: "Reply to [Name]'s comment" with blue ✓
- Name: Realistic Gen Z name (Madison, Zara, etc.)
- Comment text: Short objection/question with emoji
- Example: "does it actually stay up all night? 😭"
```

**Bubble 2 (Answer - Top-Right):**

```
- Small circular profile photo of different Gen Z girl
- Header: "Reply to [Name]'s ✓ comment"
- Comment text: Social proof answer using Russell Brunson frameworks
- Example: "literally wore mine for 6 hours dancing, didn't move once 👑"
```

**EXAMPLE PROMPT (Product Photo #1 - Golden Sparkle Top):**

```
A professional golden hour photoshoot on a luxury rooftop bar in Manhattan, with warm ambient lighting from string lights and candles, soft evening glow, high resolution, and sharp focus. A curvy, plus-sized olive-skinned Latina woman in her late 20s stands confidently beside a marble bar counter, facing the camera with a radiant smile and poised expression. She has double D breasts, a BBL with wide rounded hips, full glam makeup with bronzed skin, glossy nude lips, dramatic winged eyeliner, eyelash extensions, and long flowing dark brown hair styled in loose Hollywood waves with a deep side part. She wears a golden sparkle off-shoulder top with flowing sleeves that stays perfectly in place on her shoulders, paired with high-waisted black leather pants. The off-shoulder top features built-in grip technology that's visible in the structured fit - the neckline sits exactly where designed without any slipping or adjusting. The golden sparkle catches the light creating a luxurious shimmer. She stands with one hand on her hip and the other holding a champagne glass, her posture elegant and confident. The warm golden-hour light reflects off the sparkles creating a stunning glow. In the background, the New York City skyline at sunset with glowing skyscrapers, potted olive trees, velvet lounge furniture, and ambient candlelight create an upscale evening atmosphere. Shot on Canon EOS R5 with RF 85mm f/1.2 lens at f/2.0, creating an editorial-quality, ultra-high resolution image with a luxury party and celebration vibe. IN THE TOP-LEFT CORNER positioned above the model's head, a white rounded rectangle TikTok-style comment bubble with subtle shadow contains: a small 40px circular profile photo of a young blonde Gen Z girl with space buns and Y2K aesthetic, next to it the text "Reply to Madison's comment" in grey with a blue verification checkmark, below that in bold black text "but does it actually stay up all night tho? 😭". IN THE TOP-RIGHT CORNER positioned to not cover the top or model's face, a second white rounded rectangle TikTok-style comment bubble with subtle shadow contains: a small 40px circular profile photo of a young brunette Gen Z girl with loose curls and natural makeup, next to it the text "Reply to Zara's ✓ comment" in grey with blue checkmark, below that in bold black text "girl YES 👏 wore mine for 6+ hours dancing and it literally didn't move once". Refer to the source product image for exact product details. Save as images/product/product-01.webp
```

**Generate prompts for product-02.webp through product-06.webp following same structure with:**

- Different luxury locations each time
- Different model demographics (vary ethnicity, body type, age within target market)
- Different objections in comment bubbles (use Comment Bubble Themes from Phase 1 Brainstorm)
- All reference source image

---

## Image Type 2: Testimonial Photos (25 images)

**Requirements:**

- POV-style iPhone mirror selfie aesthetic
- Real UGC (user-generated content) feel
- Specific locations from Phase 1 research (Toronto condo, hotel bathroom, gym, etc.)
- Model wearing product in everyday contexts
- 20% (5 images) have 2 comment bubbles, 80% (20 images) have 1 comment bubble

**Comment Bubble Distribution:**

- testimonial-01 through testimonial-05: 2 bubbles each (Question + Answer)
- testimonial-06 through testimonial-25: 1 bubble each (Answer only, social proof)

**EXAMPLE PROMPT (Testimonial #1 - 2 Bubbles):**

```
A POV-style iPhone mirror selfie of a confident, curvy African American woman in her mid-20s. She has glam makeup with visible skin texture, large lip fillers, eyelash extensions, and long wavy ombre hair. She wears the golden sparkle off-shoulder top with flowing sleeves that stays perfectly positioned on her shoulders, showing the built-in grip technology working as designed. The top is paired with high-waisted jeans. Her figure shows full double-D breasts and curves. She's turned slightly to the side with a poised, self-assured expression, one hand adjusting her hair. The setting is a modern Toronto condo entryway with a sleek black console table, minimal décor like a vase of dried pampas grass, and floor-to-ceiling windows letting in natural daylight. Through the glass balcony door, the Toronto skyline is visible. Realistic iPhone 15 Pro selfie quality with natural grain and lighting. IN THE TOP-LEFT CORNER positioned above her head, a white rounded rectangle TikTok-style comment bubble contains: a small 40px circular profile photo of a young blonde Gen Z girl with middle part and soft glam, next to it the text "Reply to Kileey's comment" in grey with blue checkmark, below that in bold black text "is it actually comfortable tho? 🤔". IN THE TOP-RIGHT CORNER positioned to not cover her face, a second bubble contains: a small 40px circular profile photo of a brunette Gen Z girl with sleek ponytail, next to it "Reply to Jaz's ✓ comment", below that "literally the most comfortable top I own 😍 wear it 24/7". Refer to the source product image for exact product details. Save as images/testimonials/testimonial-01.webp
```

**EXAMPLE PROMPT (Testimonial #6 - 1 Bubble):**

```
A POV-style iPhone mirror selfie of a confident curvy Latina woman in her late 20s. She has full glam makeup with dewy skin, nude glossy lips, and long dark hair in a high ponytail. She wears the golden sparkle off-shoulder top perfectly positioned, paired with a black mini skirt. Setting is a luxury hotel bathroom with marble counters and gold fixtures. Natural bathroom lighting. Realistic iPhone selfie quality. IN THE TOP-RIGHT CORNER positioned above her head, a white rounded rectangle TikTok-style comment bubble contains: a small 40px circular profile photo of a brunette Gen Z girl, next to it "Reply to Muva's ✓ comment", below that "wore this to 3 different events and got compliments every single time ✨ literally obsessed". Refer to the source product image for exact product details. Save as images/testimonials/testimonial-06.webp
```

**Generate testimonial-02.webp through testimonial-25.webp following same structure.**

---

## Image Type 3: Comparison Photos (2 images)

**CRITICAL**: The "bad" comparison does NOT show your product. It shows the competing inferior solution.

**comparison-bad.webp Requirements:**

- Shows competing/inferior product (research competitor from Phase 1)
- Same model type for fair comparison
- Visual indicator: Large red ✗ or "X" overlay in top-right corner
- Shows the PROBLEM: unflattering fit, cheap look, obvious issues
- 800x1200px vertical format

**comparison-good.webp Requirements:**

- Shows YOUR product
- Visual indicator: Large green ✓ checkmark overlay in top-right corner
- Same model demographics as bad comparison
- Shows the SOLUTION: flattering fit, premium look, problem solved
- References source image
- 800x1200px vertical format

**EXAMPLE PROMPT (comparison-bad.webp for Off-Shoulder Top):**

```
A professional studio photoshoot with clean white backdrop, even lighting. A curvy Latina woman in her late 20s with full glam makeup stands facing the camera with an uncomfortable, awkward expression. She wears a cheap-looking basic off-shoulder top that has fallen down to her upper arms - clearly not staying in place. The top is made of thin, low-quality fabric with no structure, obviously sliding down and requiring constant adjustment. She's pulling at the top with one hand trying to keep it up, looking frustrated and self-conscious. The fit is unflattering, bunching awkwardly around her arms. A large red X or cross mark appears in the top-right corner of the image. Studio lighting, white background. This is THE OLD way - constant adjusting, no confidence, wardrobe malfunction waiting to happen. 800x1200px vertical. Save as images/comparison/comparison-bad.webp
```

**EXAMPLE PROMPT (comparison-good.webp for Off-Shoulder Top):**

```
A professional studio photoshoot with clean white backdrop, even lighting. A curvy Latina woman in her late 20s with full glam makeup stands facing the camera with a confident, radiant smile. She wears the golden sparkle off-shoulder top with flowing sleeves that sits perfectly on her shoulders - clearly staying in place due to built-in grip technology. The top looks premium, structured, and comfortable. Both her hands are relaxed at her sides (not adjusting the top), showing total confidence. The fit is flattering, highlighting her curves while the off-shoulder design stays exactly where it should. A large green checkmark appears in the top-right corner of the image. Studio lighting, white background. This is THE NEW way - zero adjusting, total confidence, engineered to stay put. Refer to the source product image for exact product details. 800x1200px vertical. Save as images/comparison/comparison-good.webp
```

---

## Image Type 4: Founder Photo (1 image)

**CRITICAL**: Founder is HOLDING the product (not wearing it). This is a "Meet the Founder" brand story shot.

**founder-01.webp Requirements:**

- Professional CEO editorial quality
- Luxury location (Aman resort lobby, design studio, upscale office)
- Founder HOLDS product in hand (loose, showing fabric/material)
- Business-casual luxury outfit
- Brand elements in background
- Confident founder energy
- References source image

**EXAMPLE PROMPT (founder-01.webp for Off-Shoulder Top):**

```
A professional morning-hour editorial photoshoot inside the grand lobby of a luxury Aman resort, staged with a sleek photography studio backdrop and natural ambient lighting. The environment features stone textures, tropical greenery, and soft wood accents, giving off a luxury fashion-meets-executive branding aesthetic. The model is a curvy, plus-sized Black woman in her mid-30s, confidently embodying a modern CEO and founder presence. She has full glam makeup, subtle lip fillers, eyelash extensions, and long jet-black hair in a sleek low ponytail. She wears light-wash wide-leg jeans, a crisp white button-up shirt tucked in, and an oversized cream blazer draped casually over her shoulders. Her outfit blends boardroom confidence with relaxed, high-end style. She is NOT wearing the off-shoulder top. Instead, she is holding it in one hand at her side - the golden sparkle top with flowing sleeves is draped over her forearm or held gently by the neckline, showing the fabric texture and sparkle detail. The top is loose and unstructured in her hand, displaying the quality of the material. Her other hand rests on her hip, and she stands confidently facing the camera, her expression proud, warm, and self-assured — the vibe is "this is my brand, this is my creation." Shot on Canon RF 85mm f/1.2 in a white studio backdrop setup placed inside the Aman lobby. Lighting is soft, premium, and directional, casting natural highlights and soft shadows. High-resolution, film grain added for editorial realism. A perfect brand founder or press-kit style image for a "Meet the Founder" or "Our Story" section. Refer to the source product image for exact product details. Save as images/founder/founder-01.webp
```

---

## Image Type 5: Order Bump Product (1 image)

**CRITICAL**: This is a DIFFERENT product (complementary accessory). Does NOT reference source image.

**order-bump-01.webp Requirements:**

- Professional product photography (flat-lay or styled shot)
- Complementary accessory to main product
- $10 order bump with $70-80 perceived value
- Clean white or minimal styled background
- Premium presentation
- Square format 1000x1000px

**Order Bump Product by Main Product Type:**

| Main Product     | Order Bump Product                                             | Perceived Value |
| ---------------- | -------------------------------------------------------------- | --------------- |
| Off-Shoulder Top | Statement Jewelry Set (necklace + earrings + bracelet in gold) | $75             |
| Sequin Skirt     | Party Glam Essentials Set (belt + earrings + scrunchie)        | $78             |
| Waist Wrap       | Resistance Band Set (5 bands with accessories)                 | $72             |

**EXAMPLE PROMPT (order-bump-01.webp for Off-Shoulder Top):**

```
A professional jewelry product photography shoot with clean white background, luxury e-commerce aesthetic, bright even lighting, ultra-high resolution, sharp focus throughout. The "Statement Jewelry Set" - three premium pieces arranged in elegant composition: (1) A delicate gold chain necklace with small crystal pendant, adjustable 16-20 inch length, lobster clasp visible showing quality construction; (2) A pair of gold drop earrings with crystal accents, secure post backs, showing front and side angle; (3) A thin gold chain bracelet with adjustable slider closure, 6.5-8 inch length. All three pieces in matching gold tone (14k gold plated over brass), arranged on white velvet jewelry display with soft shadows. Minimal styling: small crystal cluster accent, hint of champagne-gold silk fabric in background corner. The necklace is arranged in gentle curve showing chain detail and pendant, earrings positioned to show crystal facets catching light, bracelet displays adjustable mechanism. Shot on Canon EOS R5 with RF 50mm macro lens at f/8 for complete depth of field. Luxury accessories e-commerce style, party glam aesthetic, elevated essentials presentation. Soft professional lighting with minimal shadows, premium product showcase. Square format 1000x1000px for order bump upsell. Save as images/order-bump/order-bump-01.webp
```

---

## PHASE 2 OUTPUT CHECKLIST

Before proceeding, verify you have generated:

**Vision Mode Verification Required:**

- [ ] Screenshot images/product/ folder - Count 6 files (product-01.webp through product-06.webp)
- [ ] Screenshot images/testimonials/ folder - Count 25 files (testimonial-01.webp through testimonial-25.webp)
- [ ] Screenshot images/comparison/ folder - Count 2 files (comparison-bad.webp, comparison-good.webp)
- [ ] Screenshot images/founder/ folder - Count 1 file (founder-01.webp)
- [ ] Screenshot images/order-bump/ folder - Count 1 file (order-bump-01.webp)
- [ ] Total: 35 images confirmed via screenshots ✓

**DO NOT PROCEED to Phase 2.5 until all 35 images verified.**

---

# PHASE 2.5: IMAGE PATH VERIFICATION (CRITICAL)

## Purpose

**IMMEDIATELY verify all image paths are correct and will load properly** BEFORE writing any copywriting or building anything.

**This prevents the #1 most common deployment failure: broken image paths.**

---

## Step 2.5.1: Convert All Images to WebP Format

**If images were generated as PNG or JPG, convert them NOW:**

```bash
cd /path/to/template/directory

# Run optimization script
./optimize-images.sh
```

**Vision Mode Checkpoint:**

- [ ] Take screenshot of terminal showing optimization complete
- [ ] Screenshot shows "PNG files converted: X" and "JPG files converted: X"
- [ ] Screenshot shows "WebP total: X KB"

**If cwebp not installed:**

```bash
# macOS
brew install webp

# Linux
sudo apt-get install webp

# Verify
cwebp -version
```

---

## Step 2.5.2: Verify File Naming Convention

**Run this command to check all image filenames:**

```bash
# List all images with full paths
find images -type f -name "*.webp" | sort
```

**Expected output (exactly 35 files):**

```
images/comparison/comparison-bad.webp
images/comparison/comparison-good.webp
images/founder/founder-01.webp
images/order-bump/order-bump-01.webp
images/product/product-01.webp
images/product/product-02.webp
images/product/product-03.webp
images/product/product-04.webp
images/product/product-05.webp
images/product/product-06.webp
images/testimonials/testimonial-01.webp
images/testimonials/testimonial-02.webp
...
images/testimonials/testimonial-25.webp
```

**Vision Mode Checkpoint:**

- [ ] Screenshot terminal output showing EXACTLY 35 .webp files
- [ ] Screenshot confirms NO .png or .jpg files remain (or they coexist with .webp versions)
- [ ] All filenames match expected convention (product-01 not product-1, testimonial-01 not testimonial-1)

**If files are misnamed, rename them NOW:**

```bash
# Example: Fix product-1.webp to product-01.webp
mv images/product/product-1.webp images/product/product-01.webp
```

---

## Step 2.5.3: Test Image Loading Locally

**Create a test HTML file to verify images load:**

```bash
# Create test file
cat > test-images.html << 'EOF'
<!DOCTYPE html>
<html>
<head><title>Image Path Test</title></head>
<body>
  <h1>Product Images (6)</h1>
  <img src="images/product/product-01.webp" width="200"><br>
  <img src="images/product/product-02.webp" width="200"><br>
  <img src="images/product/product-03.webp" width="200"><br>
  <img src="images/product/product-04.webp" width="200"><br>
  <img src="images/product/product-05.webp" width="200"><br>
  <img src="images/product/product-06.webp" width="200"><br>

  <h1>Testimonials (25)</h1>
  <img src="images/testimonials/testimonial-01.webp" width="150">
  <img src="images/testimonials/testimonial-02.webp" width="150">
  <img src="images/testimonials/testimonial-03.webp" width="150">
  <img src="images/testimonials/testimonial-04.webp" width="150">
  <img src="images/testimonials/testimonial-05.webp" width="150"><br>
  <img src="images/testimonials/testimonial-06.webp" width="150">
  <img src="images/testimonials/testimonial-07.webp" width="150">
  <img src="images/testimonials/testimonial-08.webp" width="150">
  <img src="images/testimonials/testimonial-09.webp" width="150">
  <img src="images/testimonials/testimonial-10.webp" width="150"><br>
  <img src="images/testimonials/testimonial-11.webp" width="150">
  <img src="images/testimonials/testimonial-12.webp" width="150">
  <img src="images/testimonials/testimonial-13.webp" width="150">
  <img src="images/testimonials/testimonial-14.webp" width="150">
  <img src="images/testimonials/testimonial-15.webp" width="150"><br>
  <img src="images/testimonials/testimonial-16.webp" width="150">
  <img src="images/testimonials/testimonial-17.webp" width="150">
  <img src="images/testimonials/testimonial-18.webp" width="150">
  <img src="images/testimonials/testimonial-19.webp" width="150">
  <img src="images/testimonials/testimonial-20.webp" width="150"><br>
  <img src="images/testimonials/testimonial-21.webp" width="150">
  <img src="images/testimonials/testimonial-22.webp" width="150">
  <img src="images/testimonials/testimonial-23.webp" width="150">
  <img src="images/testimonials/testimonial-24.webp" width="150">
  <img src="images/testimonials/testimonial-25.webp" width="150"><br>

  <h1>Comparison (2)</h1>
  <img src="images/comparison/comparison-bad.webp" width="200">
  <img src="images/comparison/comparison-good.webp" width="200"><br>

  <h1>Founder (1)</h1>
  <img src="images/founder/founder-01.webp" width="200"><br>

  <h1>Order Bump (1)</h1>
  <img src="images/order-bump/order-bump-01.webp" width="200"><br>
</body>
</html>
EOF

# Open in browser
open test-images.html
# or: python3 -m http.server 8000
# then visit: http://localhost:8000/test-images.html
```

**Vision Mode Checkpoint (CRITICAL):**

- [ ] Take screenshot of test-images.html loaded in browser
- [ ] Screenshot shows ALL 35 images loaded (no broken image icons)
- [ ] Zoom in and screenshot product-01.webp - confirm it's visible and correct
- [ ] Screenshot browser DevTools Network tab - all images show 200 status (no 404 errors)
- [ ] Screenshot shows total page size and load time

**If ANY images show as broken:**

1. Check filename spelling (product-01 vs product-1, testimonial-01 vs testimonial-1)
2. Check file actually exists in correct folder
3. Check file extension is .webp (not .png or .jpg)
4. Re-run image optimization if needed
5. **DO NOT PROCEED until ALL 35 images load correctly**

---

## Step 2.5.4: Document Image Paths

**Create an image manifest for reference:**

```bash
# Generate image manifest
cat > IMAGE-MANIFEST.md << 'EOF'
# Image Manifest

## Product Images (6)
- images/product/product-01.webp ✓
- images/product/product-02.webp ✓
- images/product/product-03.webp ✓
- images/product/product-04.webp ✓
- images/product/product-05.webp ✓
- images/product/product-06.webp ✓

## Testimonial Images (25)
- images/testimonials/testimonial-01.webp ✓
- images/testimonials/testimonial-02.webp ✓
[... all 25 listed ...]

## Comparison Images (2)
- images/comparison/comparison-bad.webp ✓
- images/comparison/comparison-good.webp ✓

## Founder Image (1)
- images/founder/founder-01.webp ✓

## Order Bump Image (1)
- images/order-bump/order-bump-01.webp ✓

**Total: 35 images**
**All paths verified: YES**
**All WebP format: YES**
**Test page loads all: YES**
EOF
```

**Vision Mode Checkpoint:**

- [ ] Screenshot IMAGE-MANIFEST.md file created
- [ ] Screenshot shows all 35 images listed with ✓ checkmarks

---

## PHASE 2.5 FINAL VALIDATION

**Before proceeding to Phase 3, confirm:**

✅ All 35 images converted to WebP format
✅ All filenames follow exact convention (product-01.webp not product-1.webp)
✅ test-images.html loads all 35 images without errors
✅ Browser DevTools shows all images return 200 status
✅ IMAGE-MANIFEST.md documents all paths
✅ All verified via vision mode screenshots

**If ANY item fails, STOP and fix before proceeding.**

**Once all verified, you may proceed to Phase 3 (Copywriting).**

---

# PHASE 3: COPYWRITING (178+ Variables)

## Purpose

Write all sales copy for the landing page using Russell Brunson + Steve Larsen frameworks, mapping Phase 1 research to product.config variables.

**Output File**: `product.config` (Bash file with 178+ variables)

---

## Section-to-Research Mapping Table

**THE KEY TO EVERYTHING**: This table shows EXACTLY which Phase 1 research element maps to each variable.

| Variable                  | Phase 1 Source                          | Formula                                     | Example                                                       |
| ------------------------- | --------------------------------------- | ------------------------------------------- | ------------------------------------------------------------- |
| `HEADLINE_MAIN`           | Desire #1                               | `[Desire #1 aspirational form]`             | "Turn Every Room Into Your Runway"                            |
| `SUBHEADLINE`             | Pain #1 + Pain #2 reversal              | `"No more [Pain #1]. Finally, [Solution]."` | "No more boring outfits. Finally, a statement piece..."       |
| `HEADLINE_HOOK`           | **WINNING HEADLINE from Brainstorm**    | Use verbatim                                | "The Skirt That Stops The Room"                               |
| `TAGLINE`                 | MECHANISM NAME from Brainstorm          | Use verbatim or adapt                       | "Double-stitched sequins that never shed"                     |
| `FEATURE_1_TITLE`         | Pain #1 → Benefit                       | `"[Pain #1 reversed as benefit]"`           | "Falls down" → "Finally Stays Up All Night"                   |
| `FEATURE_1_DESCRIPTION`   | SECRET #1 (Vehicle) + Emotional outcome | `"[Truth statement]. [Emotional outcome]"`  | "Built-in grip technology means zero adjusting."              |
| `FEATURE_2_TITLE`         | Pain #2 → Benefit                       | Same formula                                |                                                               |
| `FEATURE_2_DESCRIPTION`   | SECRET #1 + Desire #1                   |                                             |                                                               |
| `FEATURE_3_TITLE`         | Pain #3 → Benefit                       | Same formula                                |                                                               |
| `FEATURE_3_DESCRIPTION`   | SECRET #2 (Internal)                    |                                             |                                                               |
| `FEATURE_4_TITLE`         | Pain #4 → Benefit                       | Same formula                                |                                                               |
| `FEATURE_4_DESCRIPTION`   | SECRET #3 (External)                    |                                             |                                                               |
| `FAQ_1_QUESTION`          | Objection #1 from Comment Bubble Themes | Verbatim                                    | "Does it actually stay up all night?"                         |
| `FAQ_1_ANSWER`            | Answer from Brainstorm + Social proof   | `"[Answer]. [Add statistic if available]"`  | "Yes! Built-in grip technology. 12,000+ customers confirm..." |
| `GUARANTEE_NAME`          | Reverses Objection #1                   | `"[Key fear] Promise/Guarantee"`            | "Perfect Fit Promise"                                         |
| `FOUNDER_STORY_BACKSTORY` | Epiphany Bridge Part 1                  | Use verbatim                                | "$300 designer top fell down at sister's wedding..."          |
| `FOUNDER_STORY_EPIPHANY`  | Epiphany Bridge Part 2                  | Use verbatim                                | "Discovered grip technology from activewear..."               |
| `FOUNDER_STORY_RESULT`    | Epiphany Bridge Part 3                  | Use verbatim                                | "Wore it 3-4 times a week with zero anxiety..."               |

**[Continue for ALL 178+ variables - full table in complete prompt would be 178 rows]**

---

## Step 3.1: Core Product Info

```bash
# Product Identification
PRODUCT_NAME="[Exact product name from user input]"
BRAND_NAME="Auralo"  # ALWAYS "Auralo"
PRODUCT_HANDLE="[URL-safe version: lowercase, hyphens]"  # Example: "leopard-sequin-maxi-skirt"
SUBDOMAIN="[Short memorable subdomain, 8 chars max]"  # Example: "seqskirt"

# IDs (use product name as base)
PRODUCT_ID="[product-handle]"
VARIANT_ID="[product-handle]-default"
```

---

## Step 3.2: Pricing (HARDCODED - DO NOT CHANGE)

```bash
# CRITICAL: These prices are FIXED for ALL products
SINGLE_PRICE="19.00"           # ALWAYS $19
BUNDLE_PRICE="59.00"           # ALWAYS $59
ORDER_BUMP_PRICE="10.00"       # ALWAYS $10 (adds to single when checked)
BUNDLE_OLD_PRICE="99.00"       # ALWAYS $99 (crossed-out perceived value)
BUNDLE_SAVINGS="40"            # ALWAYS $40 ($99 - $59)
PRICE="19.00"                  # Same as SINGLE_PRICE

# Order Bump Checkbox: ALWAYS pre-checked by default
ORDER_BUMP_PRECHECKED="true"   # ✅ CRITICAL: This variable controls checkbox state
```

**⚠️ NEVER calculate pricing from competitor research. These are fixed.**

**🎯 Order Bump Pre-Check Implementation (SOLVED):**

The template now **natively handles** order bump pre-checking through:

1. **product.config Variable**: `ORDER_BUMP_PRECHECKED="true"` tells build.sh to inject `checked` attribute
2. **build.sh Auto-Injection**: When building, build.sh replaces `{{ORDER_BUMP_CHECKED}}` with `checked` in HTML
3. **No Manual Editing Needed**: The checkbox is automatically pre-checked when ORDER_BUMP_PRECHECKED="true"

**How it works:**

```bash
# In product.config
ORDER_BUMP_PRECHECKED="true"

# In sections/05-main-product.html (before build)
<input type="checkbox" id="orderBumpCheck" {{ORDER_BUMP_CHECKED}} />

# After build.sh runs (in index.html)
<input type="checkbox" id="orderBumpCheck" checked />
```

**Result**: $19 single option automatically shows $29 total with pre-checked bump, increasing average order value by 52%.

**Three-Tier Checkout System:**

- **$19** - Single item WITHOUT order bump (checkbox unchecked)
- **$29** - Single item WITH order bump ($19 + $10, checkbox checked - DEFAULT)
- **$59** - Bundle (2x product + order bump included automatically)

---

## Step 3.3: Headlines & Hero Copy

**Map from Phase 1 Brainstorm Output Summary:**

```bash
# Main Headlines (from Brainstorm + Research)
HEADLINE_MAIN="[Use Desire #1, make aspirational]"
SUBHEADLINE="[Use Pain #1 + Pain #2 reversal, benefit-focused]"
HEADLINE_HOOK="[WINNING HEADLINE from Brainstorm - USE VERBATIM]"
TAGLINE="[MECHANISM NAME from Brainstorm]"

# Announcement Bar
ANNOUNCEMENT_BAR_TEXT="[Create urgency: Limited Stock, Free Shipping, or Social Proof]"
```

**Example (Golden Sparkle Top):**

```bash
HEADLINE_MAIN="Effortless Elegance. Zero Wardrobe Malfunctions."
SUBHEADLINE="The off-shoulder top with built-in grip technology that stays locked in place all night."
HEADLINE_HOOK="The Party Top That Stays Up, Feels Amazing & Looks Expensive"
TAGLINE="Built-in grip technology. Zero adjusting. All confidence."
ANNOUNCEMENT_BAR_TEXT="🔥 12,847 sold this month | Free shipping on all orders"
```

---

## Step 3.4: Feature Cards (Identity-First Headlines)

**Map from Pain Stack + 3 Secrets:**

```bash
# Feature Card 1 (SECRET #1: Vehicle - "Does it work?")
FEATURE_1_TITLE="[Pain #1 reversed - Identity-first]"
FEATURE_1_DESCRIPTION="[Explain mechanism + emotional outcome]"

# Feature Card 2 (SECRET #1 continued)
FEATURE_2_TITLE="[Pain #2 reversed - Identity-first]"
FEATURE_2_DESCRIPTION="[Explain how it solves this specific pain]"

# Feature Card 3 (SECRET #2: Internal - "Can I do this?")
FEATURE_3_TITLE="[Pain #3 reversed - Addresses self-doubt]"
FEATURE_3_DESCRIPTION="[Prove it works for people like them]"

# Feature Card 4 (SECRET #3: External - "Time/money/others?")
FEATURE_4_TITLE="[Pain #4 reversed - Removes external barriers]"
FEATURE_4_DESCRIPTION="[Show ease, value, social acceptance]"
```

**Example (Golden Sparkle Top):**

```bash
# Feature 1 (Vehicle - Pain #1: Falls down)
FEATURE_1_TITLE="Finally Stays Up All Night"
FEATURE_1_DESCRIPTION="Built-in micro-silicone grip technology from athletic wear locks the off-shoulder neckline exactly where it belongs. Dance, sit, move freely—it won't budge. Zero adjusting, zero anxiety, all confidence."

# Feature 2 (Vehicle - Pain #2: Cheap sparkle sheds)
FEATURE_2_TITLE="Sparkle That Lasts (Without The Shedding)"
FEATURE_2_DESCRIPTION="Premium double-stitched sequins and reinforced sparkle thread means zero shedding, zero glitter trails. Looks as stunning on wear #50 as it did on day one. Machine washable. Built to last."

# Feature 3 (Internal - Pain #3: Unflattering fit)
FEATURE_3_TITLE="Flatters Every Body Type"
FEATURE_3_DESCRIPTION="Designed for real women, not runway models. Structured bodice with built-in support highlights your best features while the flowing sleeves add elegant movement. Sizes XS-3XL, all equally stunning."

# Feature 4 (External - Pain #4: High maintenance)
FEATURE_4_TITLE="Low-Maintenance Luxury"
FEATURE_4_DESCRIPTION="No dry cleaning, no hand-washing, no special care required. Toss it in the washing machine on delicate. Air dry. Wear again. This is luxury made for real life, not your closet."
```

**⚠️ CRITICAL: Never use framework labels like "Secret #1" or "Vehicle False Belief" in customer-facing copy. Use identity-first language.**

---

## Step 3.5: Epiphany Bridge (Founder Story)

**Map from Phase 1 Section 1.6:**

```bash
# Founder Story (3-Part Epiphany Bridge)
FOUNDER_STORY_BACKSTORY="[Part 1: Breaking point moment + what they tried that failed - USE VERBATIM from Phase 1]"

FOUNDER_STORY_EPIPHANY="[Part 2: The 'aha' realization + why it clicked - USE VERBATIM from Phase 1]"

FOUNDER_STORY_RESULT="[Part 3: Transformation + social proof + mission - USE VERBATIM from Phase 1]"
```

**Example (Golden Sparkle Top - Shortened for example):**

```bash
FOUNDER_STORY_BACKSTORY="I spent $300 on a designer off-shoulder top for my sister's wedding. Within 20 minutes, it had fallen down three times. I spent the entire night pulling it up, missing conversations, feeling self-conscious in every photo. The photographer asked if I wanted to 'fix my top' before group shots. I was mortified. I tried fashion tape (didn't hold), tight-fitting tops (gave me muffin top), strapless bras (still showed), safety pins (poked me). Nothing worked. I started avoiding off-shoulder styles completely, convinced they just weren't for me."

FOUNDER_STORY_EPIPHANY="At a friend's bachelorette party, one girl wore an off-shoulder top all night—dancing, drinking, sitting—and it NEVER MOVED. I asked her about it. She said it had built-in grip-strip technology from activewear. Micro-silicone dots inside gripped skin without feeling tight or sticky. The first time I'd seen someone wear off-shoulder with zero adjustments. This wasn't fashion tape or elastic—it was engineered fabric from sports bras. Designed to GRIP, not compress. That's why everything else failed."

FOUNDER_STORY_RESULT="I ordered one immediately. The night it arrived, I wore it to a rooftop bar. I literally forgot I was wearing an off-shoulder top—no adjusting, no mirror checks, no anxiety. My boyfriend said, 'You seem so confident tonight.' That's when I knew this was the solution. I went from avoiding off-shoulder completely to wearing them 3-4 times a week. Friends asked 'How is your top staying up?!' Within a month, 5 close friends ordered it. One texted: 'I wore this to a wedding and danced for 4 hours—it didn't move ONCE.' If this technology exists, why isn't every off-shoulder top using it? You shouldn't have to choose between confidence and comfort—you deserve both."
```

---

## Step 3.6: FAQs (Crush False Beliefs)

**Map from Comment Bubble Themes + 3 False Beliefs:**

```bash
# FAQ 1 (Vehicle - Objection #1)
FAQ_1_QUESTION="[Objection from Comment Bubble Themes - verbatim]"
FAQ_1_ANSWER="[Answer using Russell Brunson framework: Truth + Evidence + Social Proof]"

# FAQ 2 (Internal - Objection #2)
FAQ_2_QUESTION="[Objection about body type / self-doubt]"
FAQ_2_ANSWER="[Prove it works for them specifically]"

# FAQ 3 (External - Objection #3)
FAQ_3_QUESTION="[Objection about price, time, maintenance, or social acceptance]"
FAQ_3_ANSWER="[Remove barrier with logic + social proof]"

# FAQ 4-8 (Additional objections)
FAQ_4_QUESTION="..."
FAQ_4_ANSWER="..."
[Continue for 8 FAQs total]
```

**Example (Golden Sparkle Top):**

```bash
FAQ_1_QUESTION="Does it actually stay up all night without adjusting?"
FAQ_1_ANSWER="Yes! The built-in micro-silicone grip technology was engineered from athletic wear to lock the neckline in place. Over 12,000 customers have worn it to weddings, clubs, and events for 6+ hours with zero slipping. One customer review: 'I danced for 4 hours straight and it didn't move once.' You'll forget you're even wearing an off-shoulder top."

FAQ_2_QUESTION="I'm curvy/plus-sized - will this flatter my body type?"
FAQ_2_ANSWER="Absolutely. This top was designed for REAL women, not runway models. The structured bodice with built-in support highlights curves beautifully, and the flowing sleeves add elegant movement that balances proportions. Available in sizes XS-3XL. Our plus-size customers (size 14-22) consistently rate it 5 stars for fit and say it's the most flattering top they own."

FAQ_3_QUESTION="Is it high-maintenance? Do I need to dry clean it?"
FAQ_3_ANSWER="Not at all. Machine washable on delicate cycle, air dry, and it's ready to wear again. No dry cleaning, no hand-washing, no special care. Premium construction means it looks as stunning after 50 washes as it did on day one. This is luxury made for real life."

FAQ_4_QUESTION="Will the sparkle shed glitter everywhere?"
FAQ_4_ANSWER="No shedding. Ever. The premium double-stitched sequins and reinforced sparkle thread are engineered to stay put. Over 12,000 sold with ZERO reports of glitter shedding. You can wear it, wash it, pack it in your suitcase—it won't leave a trail."

FAQ_5_QUESTION="Can I wear a bra with this?"
FAQ_5_ANSWER="Yes! The off-shoulder design works with strapless bras, stick-on bras, or no bra at all (built-in support). The grip technology keeps the neckline positioned exactly where it should, so your bra stays hidden. Many customers go braless and feel totally supported."

FAQ_6_QUESTION="Is it true to size?"
FAQ_6_ANSWER="Yes, true to size. If you're between sizes or prefer a looser fit, size up. Check our size chart with bust, waist, and hip measurements. Over 95% of customers say it fits as expected. Free returns if it's not perfect."

FAQ_7_QUESTION="How long does shipping take?"
FAQ_7_ANSWER="Free standard shipping (5-7 business days). Express shipping available at checkout (2-3 business days). Order before 2pm EST for same-day processing. You'll receive tracking info via email."

FAQ_8_QUESTION="What if it doesn't fit or I don't love it?"
FAQ_8_ANSWER="120-day Perfect Fit Guarantee. If it doesn't fit perfectly or you're not completely obsessed, return it for a full refund—no questions asked. We cover return shipping. You have 4 months to decide, because we're that confident you'll love it."
```

---

## Step 3.7: Guarantee

**Map from Objection #1 + 120-Day Rule:**

```bash
# Guarantee (ALWAYS 120 days)
GUARANTEE_DAYS="120"  # HARDCODED - NEVER CHANGE
GUARANTEE_NAME="[Reverses Objection #1 - Name the fear]"
GUARANTEE_CONDITION="[If {fear} doesn't happen, full refund]"
```

**Example (Golden Sparkle Top):**

```bash
GUARANTEE_DAYS="120"
GUARANTEE_NAME="Perfect Fit Promise"
GUARANTEE_CONDITION="If it doesn't fit perfectly, stay up all night, or make you feel like the best-dressed person in the room"
```

---

## Step 3.8: Social Proof

```bash
# Review Count & Audience
REVIEW_COUNT="[Realistic number based on product: 2000-15000]"
AUDIENCE="[Target demographic from Dream Customer Profile]"
```

**Example:**

```bash
REVIEW_COUNT="12,847"
AUDIENCE="women who want to turn heads without wardrobe anxiety"
```

---

## Step 3.9: Bundle Copy

```bash
# Single Option Description
SINGLE_DESCRIPTION="1x [Product Name] + FREE [Order Bump Product]"

# Bundle Option Description (2x)
BUNDLE_TITLE_2X="Best Value"
BUNDLE_DESC_2X="2x [Product Name] + FREE [Order Bump Product]"
BUNDLE_DESCRIPTION="Get two [products] and save $[savings]. Perfect for [use case 1] and [use case 2]. Both [products] include your FREE [order bump]."

# Order Bump Description
ORDER_BUMP_DESC="FREE [Order Bump Product Name] (${ORDER_BUMP_PRICE} value) - [Short benefit]"
```

**Example (Golden Sparkle Top with Statement Jewelry Set order bump):**

```bash
SINGLE_DESCRIPTION="1x Golden Sparkle Off-Shoulder Top + FREE Statement Jewelry Set"

BUNDLE_TITLE_2X="Best Value"
BUNDLE_DESC_2X="2x Golden Sparkle Off-Shoulder Tops + FREE Statement Jewelry Set"
BUNDLE_DESCRIPTION="Get two tops in your favorite style and save $40. Perfect for alternating outfits or having a backup for last-minute plans. Both tops include your FREE Statement Jewelry Set ($75 value) with matching necklace, earrings, and bracelet."

ORDER_BUMP_DESC="FREE Statement Jewelry Set ($75 value) - Complete your look with matching gold accessories"
```

---

## Step 3.10: Comparison Section

**Map from False Belief #1 (Vehicle) + Competitor Research:**

```bash
# Comparison (Before vs After)
COMPARISON_HEADLINE="[Old way vs New way - Create contrast]"
COMPARISON_PARAGRAPH="[Explain what's different about new approach - 2-3 sentences]"
BEFORE_PAIN="[What life looks like with old solution]"
AFTER_BENEFIT="[What life looks like with your product]"

# Alt Text
COMPARISON_ALT_TEXT="[Describe what comparison shows]"
COMPARISON_BEFORE_ALT="[Describe bad product / old way]"
COMPARISON_AFTER_ALT="[Describe your product / new way]"
```

**Example (Golden Sparkle Top):**

```bash
COMPARISON_HEADLINE="The Old Way vs The New Way"
COMPARISON_PARAGRAPH="For years, off-shoulder tops meant constant adjusting, fashion tape that didn't hold, and anxiety about wardrobe malfunctions. The new way? Built-in grip technology from athletic wear that locks the neckline in place—zero adjusting, all confidence."
BEFORE_PAIN="Constant adjusting. Fashion tape fails. Wardrobe anxiety."
AFTER_BENEFIT="Stays locked in place. Zero adjusting. Total confidence."
COMPARISON_ALT_TEXT="Side by side comparison of old off-shoulder tops versus new grip technology tops"
COMPARISON_BEFORE_ALT="Woman pulling up falling off-shoulder top looking frustrated"
COMPARISON_AFTER_ALT="Woman confidently wearing off-shoulder top that stays perfectly in place"
```

---

## Step 3.11: URLs & Metadata

```bash
# URLs (replace with actual Netlify site URL after deployment)
SITE_URL="https://[SUBDOMAIN].netlify.app"
CANONICAL_URL="https://[SUBDOMAIN].netlify.app"
PRODUCT_URL="https://[SUBDOMAIN].netlify.app"
PRODUCT_FULL_URL="https://[SUBDOMAIN].netlify.app"
SHOP_URL="https://[SUBDOMAIN].netlify.app"
ACCOUNT_URL="https://[SUBDOMAIN].netlify.app"
LOGO_URL="https://[SUBDOMAIN].netlify.app/images/universal-assets/logo.svg"

# Netlify Site ID (get from Netlify dashboard after creating site)
NETLIFY_SITE_ID="[Will be generated when you create Netlify site in Phase 6]"

# SEO Meta
META_DESCRIPTION="[60-160 chars: Hook + benefit + CTA]"
OG_DESCRIPTION="[Same as META_DESCRIPTION or slightly longer]"
OG_IMAGE_URL="https://[SUBDOMAIN].netlify.app/images/product/product-01.webp"
```

**Example:**

```bash
SITE_URL="https://goldentop.netlify.app"
CANONICAL_URL="https://goldentop.netlify.app"
# [... same for all URL fields ...]

NETLIFY_SITE_ID="[Leave blank - will be set in Phase 6]"

META_DESCRIPTION="The off-shoulder top with built-in grip technology that stays up all night. Zero adjusting, total confidence. 12,847 five-star reviews."
OG_DESCRIPTION="Built-in grip technology from athletic wear locks the off-shoulder neckline in place. Dance, move, live freely—it won't budge. Premium sparkle that never sheds."
OG_IMAGE_URL="https://goldentop.netlify.app/images/product/product-01.webp"
```

---

## PHASE 3 VALIDATION GATE

**Before proceeding to Phase 4, verify:**

**Vision Mode Checklist:**

- [ ] Screenshot product.config file saved
- [ ] Screenshot shows file size > 20 KB (indicates complete config)
- [ ] Search file for `HEADLINE_HOOK` - screenshot shows WINNING HEADLINE from Phase 1 Brainstorm used verbatim
- [ ] Search for `FEATURE_1_TITLE` through `FEATURE_4_TITLE` - screenshot confirms NO "Secret #1/2/3" labels (identity-first language used)
- [ ] Search for `FOUNDER_STORY` - screenshot shows all 3 parts (BACKSTORY, EPIPHANY, RESULT) filled
- [ ] Search for `SINGLE_PRICE` - screenshot confirms "19.00"
- [ ] Search for `BUNDLE_PRICE` - screenshot confirms "59.00"
- [ ] Search for `ORDER_BUMP_PRICE` - screenshot confirms "10.00"
- [ ] Search for `GUARANTEE_DAYS` - screenshot confirms "120"
- [ ] Count FAQ variables - screenshot shows FAQ_1 through FAQ_8 (8 total)

**DO NOT PROCEED to Phase 4 until all items verified.**

---

# PHASE 4: SIMPLESWAP CHECKOUT INTEGRATION

## Purpose

Integrate SimpleSwap crypto checkout using pre-created exchange pool from shared pool server.

**Key Concept**: Instead of creating new exchanges for every customer (slow), we use a POOL of pre-created exchanges at standard price tiers that are ready instantly.

---

## Step 4.1: Understanding the Pool System

**Pool Server**: `https://simpleswap-automation-1.onrender.com`

**Standard Price Tiers (Pre-Created):**

```
$19 - 45 exchanges ready
$29 - 45 exchanges ready
$59 - 45 exchanges ready
$99 - 45 exchanges ready (not used in default pricing)
```

**How It Works:**

1. Customer clicks "Buy Now" for $19, $29, or $59
2. Frontend JavaScript calls Netlify Function: `/.netlify/functions/buy-now`
3. Netlify Function requests pre-created exchange from pool server: `POST /buy-now`
4. Pool server instantly returns ready exchange URL (< 50ms)
5. Customer redirected to SimpleSwap with pre-filled amount
6. Pool server automatically creates replacement exchange in background

**Benefits:**

- **Instant checkout** (< 50ms vs 2-3 seconds creating new exchange)
- **Zero configuration** needed (pool already has exchanges ready)
- **Auto-replenishment** (pool maintains 45 exchanges per tier automatically)

---

## Step 4.2: Create Netlify Function (buy-now.js)

**Copy this EXACT code into `netlify/functions/buy-now.js`:**

```javascript
// netlify/functions/buy-now.js
// SimpleSwap Shared Pool Integration
// Maps custom prices to pool tiers [19, 29, 59, 99]

const POOL_SERVER = "https://simpleswap-automation-1.onrender.com";

exports.handler = async (event) => {
  // CORS preflight
  if (event.httpMethod === "OPTIONS") {
    return {
      statusCode: 200,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Headers": "Content-Type",
        "Access-Control-Allow-Methods": "POST, OPTIONS",
      },
      body: "",
    };
  }

  // Only allow POST
  if (event.httpMethod !== "POST") {
    return {
      statusCode: 405,
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ error: "Method not allowed" }),
    };
  }

  try {
    const { amountUSD, size } = JSON.parse(event.body || "{}");

    // Validate amount
    if (!amountUSD) {
      return {
        statusCode: 400,
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ error: "Missing amountUSD" }),
      };
    }

    // Map input amount to nearest standard pool tier
    // MODIFY THIS ARRAY if using custom pricing
    const authorizedTiers = [19, 29, 59, 99];
    let targetTier = 19;

    if (authorizedTiers.includes(amountUSD)) {
      targetTier = amountUSD;
    } else {
      // Find closest tier
      targetTier = authorizedTiers.reduce((prev, curr) => {
        return Math.abs(curr - amountUSD) < Math.abs(prev - amountUSD)
          ? curr
          : prev;
      });
      console.log(
        `[buy-now] Mapping non-standard amount ${amountUSD} to pool tier ${targetTier}`,
      );
    }

    console.log(
      `[buy-now] Requesting exchange for tier ${targetTier} (original: ${amountUSD}) from shared pool`,
    );

    // Call SHARED pool server
    const response = await fetch(`${POOL_SERVER}/buy-now`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ amountUSD: targetTier }),
    });

    const data = await response.json();

    if (response.ok && data.success && data.exchangeUrl) {
      console.log(`[buy-now] ✅ Pool server success: ${data.exchangeUrl}`);
      return {
        statusCode: 200,
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Headers": "Content-Type",
        },
        body: JSON.stringify(data),
      };
    } else {
      console.error(`[buy-now] ❌ Pool server error:`, data);
      return {
        statusCode: response.status || 500,
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*",
        },
        body: JSON.stringify({
          error: "Pool server failed",
          details: data,
        }),
      };
    }
  } catch (error) {
    console.error("[buy-now] ❌ Exception:", error);
    return {
      statusCode: 500,
      headers: {
        "Content-Type": "application/json",
        "Access-Control-Allow-Origin": "*",
      },
      body: JSON.stringify({
        error: error.message,
        poolServer: POOL_SERVER,
      }),
    };
  }
};
```

**Vision Mode Checkpoint:**

- [ ] Screenshot netlify/functions/buy-now.js file saved
- [ ] Screenshot shows file size ~3.5 KB
- [ ] Search file for `POOL_SERVER` - screenshot confirms URL is "https://simpleswap-automation-1.onrender.com"
- [ ] Search for `authorizedTiers` - screenshot shows [19, 29, 59, 99]

---

## 🎯 CRITICAL: SimpleSwap Endpoint Path (SOLVED)

**Problem**: Many implementations fail because the frontend calls the wrong API endpoint path.

**❌ WRONG Paths (Common Mistakes):**

```javascript
fetch('/api/buy-now', ...)           // Wrong - not Netlify routing
fetch('/functions/buy-now', ...)     // Wrong - missing .netlify
fetch('/.netlify/function/buy-now', ...)  // Wrong - "function" not "functions"
fetch('.netlify/functions/buy-now', ...)  // Wrong - missing leading /
```

**✅ CORRECT Path (Netlify Internal Routing):**

```javascript
fetch("/.netlify/functions/buy-now", {
  method: "POST",
  headers: { "Content-Type": "application/json" },
  body: JSON.stringify({ amountUSD: 19 }),
});
```

**Why this matters**:

- Netlify automatically routes `/.netlify/functions/*` to serverless functions
- Any other path results in 404 errors
- The leading `/` is CRITICAL for absolute path resolution

**Enhanced Backend Logging (SOLVED):**

The buy-now.js function now includes **detailed logging** to track every request:

```javascript
// Logs tier mapping
console.log(
  `[buy-now] Requesting tier ${targetTier} (original: ${amountUSD}) from shared pool`,
);

// Logs success
console.log(`[buy-now] ✅ Pool server success: ${data.exchangeUrl}`);

// Logs errors
console.error(`[buy-now] ❌ Pool server error:`, data);
```

**How to use logs:**

```bash
# View real-time logs after deployment
npx netlify functions:log buy-now --tail

# Expected output when working:
[buy-now] Requesting tier 19 (original: 19) from shared pool
[buy-now] ✅ Pool server success: https://simpleswap.io/exchange?id=...
```

**Benefit**: Instantly diagnose checkout issues by checking Netlify logs instead of guessing.

**Tier Mapping Robustness:**

The function automatically maps ANY checkout amount to nearest authorized pool tier:

```javascript
// Customer pays $47 (custom pricing not in pool)
// Function maps to nearest tier: $59
// Pool server returns $59 exchange
// Result: Checkout works even with custom pricing
```

**Standard tier mapping:**

- $19 → $19 tier (exact match)
- $29 → $29 tier (exact match)
- $59 → $59 tier (exact match)
- $47 → $59 tier (nearest match)
- $71 → $59 tier (nearest match)
- $99 → $99 tier (exact match)

**Vision Mode Verification:**

- [ ] Screenshot Netlify function logs showing tier mapping
- [ ] Screenshot showing "✅ Pool server success" message
- [ ] Screenshot showing exchangeUrl in response

---

## Step 4.3: Frontend JavaScript (Update Required)

**CRITICAL UPDATE**: You MUST replace the existing checkout script in `sections/05-main-product.html` to ensure the correct endpoint (`/.netlify/functions/buy-now`) is called and to enable "Optimistic Pre-loading" for instant checkout.

**Action**: Find the `<script>` block inside `sections/05-main-product.html` that handles the checkout (look for `handleCheckout`) and **REPLACE** it entirely with this robust version:

```html
<script>
  document.addEventListener('DOMContentLoaded', function () {
    const bundleCards = document.querySelectorAll('.bundle-card');
    const orderBumpCheck = document.getElementById('orderBumpCheck');
    const mobileAtcBtn = document.getElementById('mobile-atc-trigger');
    const desktopAtcBtn = document.querySelector('.main-product-atc');

    const BUNDLE_PRICES = {
      single: {{SINGLE_PRICE}},
      bundle2: {{BUNDLE_PRICE}}
    };
    const ORDER_BUMP_PRICE = {{ORDER_BUMP_PRICE}};

    // Cache for pre-loaded checkout URLs
    const checkoutCache = {};
    const PRELOAD_AMOUNTS = [{{SINGLE_PRICE}}, {{BUNDLE_PRICE}}, {{SINGLE_PRICE}} + {{ORDER_BUMP_PRICE}}];

    let selectedBundle = 'single';

    // Pre-load checkout links to eliminate latency
    async function preloadCheckout(amount) {
      if (checkoutCache[amount]) return; // Already cached
      
      console.log(`[Preload] Fetching link for ${amount}...`);
      try {
        const response = await fetch("/.netlify/functions/buy-now", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          // CRITICAL: Must use 'amountUSD' to match backend
          body: JSON.stringify({ amountUSD: amount }),
        });
        const data = await response.json();
        if (data.exchangeUrl) {
          checkoutCache[amount] = data.exchangeUrl;
          console.log(`[Preload] Cached link for ${amount}:`, data.exchangeUrl);
        }
      } catch (e) {
        console.warn(`[Preload] Failed to preload ${amount}`, e);
      }
    }

    // Initial preload of key price points
    PRELOAD_AMOUNTS.forEach(amount => preloadCheckout(amount));

    function updatePrice() {
      let total = BUNDLE_PRICES[selectedBundle];

      if (orderBumpCheck.checked && selectedBundle === 'single') {
        total += ORDER_BUMP_PRICE;
      }

      const priceDisplay = document.getElementById('auralo-total-price');
      if (priceDisplay) priceDisplay.textContent = `$${total.toFixed(2)}`;

      const mobilePrice = document.getElementById('mobile-price');
      if (mobilePrice) mobilePrice.textContent = `$${total.toFixed(2)}`;

      const bumpSection = document.getElementById('order-bump-section');
      if (selectedBundle === 'bundle2') {
        bumpSection.style.opacity = '0.5';
        bumpSection.style.pointerEvents = 'none';
        orderBumpCheck.checked = true;
      } else {
        bumpSection.style.opacity = '1';
        bumpSection.style.pointerEvents = 'auto';
      }
      
      // Optimistically preload the new total
      preloadCheckout(total);
    }

    bundleCards.forEach(card => {
      card.addEventListener('click', function () {
        bundleCards.forEach(c => c.classList.remove('active'));
        this.classList.add('active');
        selectedBundle = this.dataset.offer;
        updatePrice();
      });
    });

    orderBumpCheck.addEventListener('change', updatePrice);

    async function handleCheckout(e) {
      if (e) e.preventDefault();

      let total = BUNDLE_PRICES[selectedBundle];
      if (orderBumpCheck.checked && selectedBundle === 'single') {
        total += ORDER_BUMP_PRICE;
      }

      // Show loading
      const overlay = document.getElementById("checkoutTransition");
      if (overlay) overlay.style.display = "flex";

      console.log("Starting checkout for total:", total);

      // Check cache first (Optimistic UI)
      if (checkoutCache[total]) {
         console.log("Using cached link (Instant Redirect)");
         window.location.href = checkoutCache[total];
         return;
      }

      try {
        // CRITICAL: Correct path is /.netlify/functions/buy-now
        const response = await fetch("/.netlify/functions/buy-now", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ amountUSD: total }),
        });

        const data = await response.json();
        console.log("Received response:", data);

        if (data.exchangeUrl) {
          window.location.href = data.exchangeUrl;
        } else {
          throw new Error("No exchange URL returned");
        }
      } catch (error) {
        if (overlay) overlay.style.display = "none";
        alert("Checkout error. Please try again.");
        console.error("Checkout failed:", error);
      }
    }

    if (mobileAtcBtn) mobileAtcBtn.addEventListener('click', handleCheckout);
    if (desktopAtcBtn) desktopAtcBtn.addEventListener('click', handleCheckout);

    // Trigger initial price update
    updatePrice();
  });
</script>
```

**Vision Mode Checkpoint:**

- [ ] Screenshot shows `fetch("/.netlify/functions/buy-now")` (CORRECT)
- [ ] Screenshot shows `amountUSD` payload key (CORRECT)
- [ ] Screenshot shows `preloadCheckout` function present (CORRECT)

---

## Step 4.4: Exit Transition Overlay (Already in Template)

**The template already has a professional white exit transition overlay in `sections/05-main-product.html`.**

**Features:**

- Clean white background (not black)
- Trust badges: 256-bit SSL Encryption, Verified Partner
- Smooth fade-in animation
- Response fallback: `exchangeUrl || url` (uses whichever pool server returns)

**Vision Mode Checkpoint:**

- [ ] Search sections/05-main-product.html for "Redirecting to secure checkout"
- [ ] Screenshot shows exit overlay HTML with white background
- [ ] Screenshot shows trust badge elements (256-bit SSL, Verified Partner)

---


---

## ⚠️ Critical Troubleshooting: 3 Common Checkout Failures

**If checkout fails or is slow, check these 3 common errors first:**

1.  **The "Wrong Door" (404 Error)**
    *   **Symptom**: Console shows `404 Not Found` on checkout click.
    *   **Cause**: Fetching `/api/buy-now` instead of `/.netlify/functions/buy-now`.
    *   **Fix**: Ensure frontend fetch URL starts with `/.netlify/functions/...`.

2.  **The "Wrong Language" (Parameter Mismatch)**
    *   **Symptom**: Backend logs show "Missing amountUSD" or price defaults to fallback.
    *   **Cause**: Frontend sending `{ amount: 19 }` instead of `{ amountUSD: 19 }`.
    *   **Fix**: Update frontend `JSON.stringify` payload to use `amountUSD`.

3.  **The "Slow Load" (Cold Start Latency)**
    *   **Symptom**: Checkout takes > 5 seconds to redirect.
    *   **Cause**: Serverless function "cold start" + pool server connection time.
    *   **Fix**: Ensure `preloadCheckout()` function is running on page load (Optimistic UI).

---

## PHASE 4 VALIDATION GATE


**Before proceeding to Phase 5, verify:**

- [ ] netlify/functions/buy-now.js file exists with exact code above
- [ ] Pool server URL is correct (https://simpleswap-automation-1.onrender.com)
- [ ] authorizedTiers array is [19, 29, 59, 99]
- [ ] Frontend pre-loading code exists in sections/05-main-product.html
- [ ] Exit transition overlay exists with white background
- [ ] All verified via vision mode screenshots

---

# PHASE 5: SPEED OPTIMIZATION

## Purpose

**Optimize site for maximum speed** - Critical for conversion rates. Slow sites lose 7% of conversions for every 1-second delay.

**Target Metrics:**

- Mobile First Contentful Paint: < 1.5s
- Mobile Largest Contentful Paint: < 2.5s
- Total page weight: < 2MB
- All images: WebP format
- CSS/JS: Minified

---

## Step 5.1: Verify All Images Are WebP

**This should already be done from Phase 2.5, but double-check:**

```bash
# Count non-WebP images
find images -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) | wc -l
```

**Expected output: 0** (or these files coexist with .webp versions)

**If any PNG/JPG files exist without WebP versions, convert now:**

```bash
./optimize-images.sh
```

**Vision Mode Checkpoint:**

- [ ] Screenshot terminal showing 0 non-WebP images OR all have .webp equivalents
- [ ] Screenshot shows WebP total size in KB

---

## Step 5.2: Run Speed Optimization Script

**Run the brunson-protocol speed optimization:**

```bash
./optimize-speed.sh
```

**This script:**

- Compresses PNG images to WebP (if not done)
- Shows file size comparison
- Reports total savings

**Vision Mode Checkpoint:**

- [ ] Screenshot terminal output showing optimization complete
- [ ] Screenshot shows "Speed optimization complete!" message
- [ ] Screenshot shows target metrics listed

---

## Step 5.3: Build and Minify HTML

**The build.sh script automatically:**

- Concatenates all 23 section HTML files
- Replaces all {{VARIABLES}} with values from product.config
- Creates final `index.html`

**Build will be run in next phase, but understand what it does:**

```bash
./build.sh
```

**Process:**

1. Loads product.config
2. Validates required fields
3. Checks for images
4. Builds index.html from sections/\*.html
5. Replaces all {{PLACEHOLDERS}}
6. (Optional) Converts images to WebP if cwebp available
7. Deploys to Netlify
8. Runs E2E tests

---

## Step 5.4: Add Lazy Loading Attributes (Already in Template)

**The template already has lazy loading for all images except hero:**

```html
<!-- Hero image (eager load) -->
<img src="images/product/product-01.webp" fetchpriority="high" />

<!-- All other images (lazy load) -->
<img loading="lazy" src="images/product/product-02.webp" />
<img loading="lazy" src="images/testimonials/testimonial-01.webp" />
```

**Vision Mode Checkpoint:**

- [ ] Search sections/05-main-product.html for `loading="lazy"`
- [ ] Screenshot shows multiple instances of lazy loading attribute
- [ ] Search for `fetchpriority="high"` - screenshot shows it's ONLY on product-01.webp

---

## Step 5.5: Resource Hints (Already in Template)

**The template already preloads critical resources in `sections/01-head.html`:**

```html
<link
  rel="preload"
  as="image"
  href="images/product/product-01.webp"
  fetchpriority="high"
/>
<link rel="preconnect" href="https://simpleswap-automation-1.onrender.com" />
```

**Vision Mode Checkpoint:**

- [ ] Search sections/01-head.html for `preload`
- [ ] Screenshot shows preload for product-01.webp
- [ ] Search for `preconnect` - screenshot shows pool server URL

---

## PHASE 5 VALIDATION GATE

**Before proceeding to Phase 5.5 (Pre-Deployment Audit), verify:**

- [ ] All 35 images are WebP format
- [ ] optimize-speed.sh ran successfully
- [ ] Lazy loading confirmed on non-hero images
- [ ] Resource hints confirmed in head
- [ ] All verified via vision mode screenshots

---

# PHASE 5.5: PRE-DEPLOYMENT AUDIT (CRITICAL)

## Purpose

**FINAL CHECK before deploying to Netlify** - Catch all broken paths, missing images, placeholder text, and errors NOW before they go live.

---

## Step 5.5.1: Build the Site Locally

```bash
# Run build script
./build.sh
```

**This will:**

1. Validate product.config
2. Check for required images
3. Build index.html
4. Show any remaining placeholders
5. Skip deployment (we'll do manual check first)

**Vision Mode Checkpoint:**

- [ ] Screenshot build.sh output showing "✅ Built index.html"
- [ ] Screenshot shows remaining placeholders count (should be 0)
- [ ] If placeholders > 0, screenshot shows which ones

**If placeholders remain:**

```bash
# See which placeholders are still empty
grep -o "{{[^}]*}}" index.html | sort -u
```

**Fix missing variables in product.config, then rebuild.**

---

## Step 5.5.2: Test Site Locally with Server

```bash
# Start local server
python3 -m http.server 8000

# Or use Node.js
npx http-server -p 8000

# Or use PHP
php -S localhost:8000
```

**Open browser: `http://localhost:8000`**

**Vision Mode Checkpoint:**

- [ ] Screenshot homepage loaded in browser
- [ ] Screenshot shows hero section with product-01.webp loaded (no broken image icon)
- [ ] Scroll down and screenshot product gallery - all 6 product images loaded
- [ ] Screenshot testimonials section - sample testimonial images loaded
- [ ] Screenshot comparison section - both images loaded
- [ ] Screenshot order bump section - order-bump-01.webp loaded

---

## Step 5.5.3: Check Browser DevTools Network Tab

**Open DevTools (F12) → Network tab → Reload page**

**Vision Mode Checkpoint:**

- [ ] Screenshot Network tab showing all image requests
- [ ] Screenshot filtered to "Img" - confirm ALL images return 200 status (no 404 errors)
- [ ] Screenshot shows total page size (should be < 2MB)
- [ ] Screenshot shows page load time (should be < 3 seconds on localhost)

**If ANY images show 404:**

1. Check exact filename in error (product-01.webp or product-1.webp?)
2. Check file exists in correct folder
3. Fix filename if needed
4. Rebuild with `./build.sh`
5. Reload page and re-verify

---

## Step 5.5.4: Visual Inspection Checklist

**Scroll through ENTIRE page and verify:**

**Hero Section:**

- [ ] Screenshot hero - product-01.webp visible
- [ ] Screenshot headline - no {{PLACEHOLDER}} text visible
- [ ] Screenshot subheadline - actual copy visible
- [ ] Screenshot CTA button - says "Pre-Order Now $19" (not {{PRICE}})

**Product Gallery:**

- [ ] Screenshot product carousel - all 6 images loaded
- [ ] Click through carousel - verify all 6 images display

**Features Section:**

- [ ] Screenshot 4 feature cards - all have titles and descriptions (no placeholders)
- [ ] Feature titles use identity-first language (no "Secret #1")

**Social Proof:**

- [ ] Screenshot review count shows number (not {{REVIEW_COUNT}})

**Comparison Section:**

- [ ] Screenshot comparison images - both loaded (comparison-bad.webp and comparison-good.webp)
- [ ] Red ✗ visible on bad image
- [ ] Green ✓ visible on good image

**Founder Story:**

- [ ] Screenshot founder section - founder-01.webp loaded
- [ ] Screenshot founder story text - actual story visible (not placeholder)

**Order Bump:**

- [ ] Screenshot order bump - order-bump-01.webp loaded
- [ ] Checkbox is pre-checked by default
- [ ] Order bump description visible

**Pricing:**

- [ ] Screenshot single option shows "$19"
- [ ] Screenshot bundle option shows "$59"
- [ ] Screenshot bundle savings shows "$40"

**FAQs:**

- [ ] Screenshot FAQ section - all 8 questions visible with answers

**Footer:**

- [ ] Screenshot footer - no placeholder text

---

## Step 5.5.5: Test Checkout Flow Locally (Simulated)

**Click "Pre-Order Now $19" button**

**What should happen:**

1. Button shows loading state
2. Exit transition overlay appears (white background, trust badges)
3. Message: "Redirecting to secure checkout..."
4. (On localhost, actual redirect won't work, but you'll see the overlay)

**Vision Mode Checkpoint:**

- [ ] Screenshot "Pre-Order Now" button
- [ ] Click button and screenshot exit overlay appearing
- [ ] Screenshot shows white background (not black)
- [ ] Screenshot shows trust badges (256-bit SSL, Verified Partner)
- [ ] Check browser console (F12) - screenshot shows no JavaScript errors

**Common Issues:**

| Issue                          | Fix                                                       |
| ------------------------------ | --------------------------------------------------------- |
| Button does nothing            | Check JavaScript loaded, check browser console for errors |
| Black overlay instead of white | Check sections/05-main-product.html overlay CSS           |
| JavaScript errors              | Check netlify/functions/buy-now.js exists                 |

---

## Step 5.5.6: Final Placeholder Check

**Search for any remaining placeholders:**

```bash
# Find any {{PLACEHOLDER}} text in index.html
grep -c "{{" index.html
```

**Expected output: 0**

**If count > 0:**

```bash
# See which placeholders remain
grep -o "{{[^}]*}}" index.html | sort -u
```

**Fix in product.config:**

1. Open product.config
2. Find missing variable
3. Add value
4. Rebuild: `./build.sh`
5. Re-check

**Vision Mode Checkpoint:**

- [ ] Screenshot showing `grep -c "{{" index.html` returns 0
- [ ] Or screenshot showing which placeholders remain with fix plan

---

## PHASE 5.5 FINAL VALIDATION

**Before proceeding to Phase 6 (Deployment), confirm:**

✅ build.sh completed with 0 placeholders
✅ Local server running (localhost:8000)
✅ ALL 35 images load without 404 errors
✅ Browser Network tab shows all images 200 status
✅ No {{PLACEHOLDER}} text visible anywhere on page
✅ Hero, features, comparison, founder, order bump all verified visually
✅ Checkout button triggers exit overlay (white background)
✅ Browser console shows zero JavaScript errors
✅ All verified via vision mode screenshots

**If ANY item fails, STOP and fix before deploying.**

**Once all verified, proceed to Phase 6 (Deployment).**

---

# PHASE 6: DEPLOYMENT & TESTING

## Purpose

Deploy to Netlify and verify everything works in production.

---

## Step 6.1: Create Netlify Site

**Option 1: Netlify CLI (Recommended)**

```bash
# Login to Netlify (first time only)
npx netlify login

# Link to new site (creates site automatically)
npx netlify init

# Follow prompts:
# - Create & configure a new site
# - Team: [Your team]
# - Site name: [subdomain from product.config]
# - Build command: (leave empty)
# - Directory: . (current directory)
```

**Option 2: Netlify Dashboard**

1. Go to https://app.netlify.com
2. Click "Add new site" → "Deploy manually"
3. Drag the entire template folder
4. Wait for deploy to complete

**Vision Mode Checkpoint:**

- [ ] Screenshot Netlify deployment started
- [ ] Screenshot shows site name matches SUBDOMAIN from product.config
- [ ] Screenshot shows deploy in progress

---

## Step 6.2: Get Netlify Site ID

**After site is created:**

```bash
# Get site ID
npx netlify status

# Or find in Netlify dashboard:
# Site settings → General → Site information → API ID
```

**Copy the Site ID (looks like: `abc123def-456g-789h-ijk0-lmnop123qrst`)**

**Add to product.config:**

```bash
# Open product.config
# Find line: NETLIFY_SITE_ID=""
# Replace with: NETLIFY_SITE_ID="abc123def-456g-789h-ijk0-lmnop123qrst"
```

**Vision Mode Checkpoint:**

- [ ] Screenshot `netlify status` output showing Site ID
- [ ] Screenshot product.config with NETLIFY_SITE_ID filled in

---

## Step 6.3: Deploy to Production

```bash
# Deploy production build
npx netlify deploy --prod --site "$NETLIFY_SITE_ID" --dir .
```

**This uploads:**

- index.html
- images/ (all 35 images)
- stylesheets/
- scripts/
- netlify/functions/

**Vision Mode Checkpoint:**

- [ ] Screenshot deploy command running
- [ ] Screenshot shows "Deploy is live!" with production URL
- [ ] Copy production URL (e.g., https://goldentop.netlify.app)

---

## Step 6.4: Update URLs in product.config

**Now that you have the production URL, update all URL fields:**

```bash
# Open product.config
# Replace ALL instances of placeholder URL with actual Netlify URL

SITE_URL="https://goldentop.netlify.app"
CANONICAL_URL="https://goldentop.netlify.app"
PRODUCT_URL="https://goldentop.netlify.app"
PRODUCT_FULL_URL="https://goldentop.netlify.app"
SHOP_URL="https://goldentop.netlify.app"
ACCOUNT_URL="https://goldentop.netlify.app"
LOGO_URL="https://goldentop.netlify.app/images/universal-assets/logo.svg"
OG_IMAGE_URL="https://goldentop.netlify.app/images/product/product-01.webp"
```

**Rebuild and redeploy:**

```bash
# Rebuild with correct URLs
./build.sh

# Deploy again
npx netlify deploy --prod --site "$NETLIFY_SITE_ID" --dir .
```

**Vision Mode Checkpoint:**

- [ ] Screenshot product.config with all URLs updated to production domain
- [ ] Screenshot second deploy completing

---

# PHASE 6.5: POST-DEPLOYMENT VERIFICATION (CRITICAL)

## Purpose

**Verify EVERYTHING works in production** - This is the final check before declaring success.

---

## Step 6.5.1: Load Production Site

**Open production URL in browser (e.g., https://goldentop.netlify.app)**

**Vision Mode Checkpoint:**

- [ ] Screenshot homepage loaded
- [ ] Screenshot shows hero section with product-01.webp loaded
- [ ] Screenshot URL bar showing correct Netlify domain

---

## Step 6.5.2: Production Image Verification

**Scroll through entire page and verify:**

**Vision Mode Checkpoint:**

- [ ] Screenshot hero - product-01.webp visible
- [ ] Scroll and screenshot product gallery - all 6 images loaded
- [ ] Screenshot testimonials section - sample testimonials visible
- [ ] Screenshot comparison section - both images loaded with ✗ and ✓
- [ ] Screenshot founder section - founder-01.webp loaded
- [ ] Screenshot order bump - order-bump-01.webp loaded

**Open DevTools → Network tab → Reload page**

**Filter to "Img":**

- [ ] Screenshot Network tab filtered to images
- [ ] Screenshot shows ALL images return 200 status (no 404 errors)
- [ ] Screenshot shows images served from your Netlify domain

---

## Step 6.5.3: Test Live Checkout Flow

**Click "Pre-Order Now $19" button**

**What should happen:**

1. Button shows loading state
2. Exit transition overlay appears (white background)
3. "Redirecting to secure checkout..." message
4. **Page redirects to SimpleSwap** (actual redirect to simpleswap.io with pre-filled amount)

**Vision Mode Checkpoint:**

- [ ] Screenshot "Pre-Order Now" button
- [ ] Click button and screenshot exit overlay appearing
- [ ] Screenshot shows redirect to SimpleSwap (URL changes to simpleswap.io)
- [ ] Screenshot SimpleSwap page showing correct USD amount ($19, $29, or $59)
- [ ] Screenshot SimpleSwap shows "to address" field pre-filled

**Test all three price points:**

- [ ] Click $19 single option → Screenshot SimpleSwap with $19
- [ ] Go back, click $29 single with bump → Screenshot SimpleSwap with $29
- [ ] Go back, click $59 bundle → Screenshot SimpleSwap with $59

---

## Step 6.5.4: Check Netlify Function Logs

**View function execution logs:**

```bash
# View real-time function logs
npx netlify functions:log buy-now
```

**Or in Netlify dashboard:**

1. Go to Functions tab
2. Click "buy-now"
3. View execution logs

**Vision Mode Checkpoint:**

- [ ] Screenshot function logs showing successful requests
- [ ] Screenshot shows "✅ Pool server success" messages
- [ ] Screenshot shows correct tier mapping (e.g., "Requesting exchange for tier 19")

**If function errors appear:**

- Check pool server is online (https://simpleswap-automation-1.onrender.com/health)
- Verify POOL_SERVER URL in buy-now.js is correct
- Check authorizedTiers array includes your price points

---

## Step 6.5.5: Mobile Responsiveness Check

**Test on mobile or use Chrome DevTools device emulation:**

```
Chrome DevTools → Toggle device toolbar (Cmd+Shift+M)
Select "iPhone 12 Pro" or similar
```

**Vision Mode Checkpoint:**

- [ ] Screenshot mobile view - hero section
- [ ] Screenshot mobile - product gallery scrolls horizontally
- [ ] Screenshot mobile - features stack vertically
- [ ] Screenshot mobile - CTA buttons full width
- [ ] Screenshot mobile - checkout button accessible

---

## Step 6.5.6: PageSpeed Insights Test

**Run Google PageSpeed Insights:**

1. Go to https://pagespeed.web.dev/
2. Enter your Netlify URL
3. Run analysis

**Target Metrics:**

- Mobile Performance Score: > 80
- Mobile First Contentful Paint: < 1.5s
- Mobile Largest Contentful Paint: < 2.5s
- Desktop Performance Score: > 90

**Vision Mode Checkpoint:**

- [ ] Screenshot PageSpeed Insights results
- [ ] Screenshot shows Performance score
- [ ] Screenshot shows Core Web Vitals (FCP, LCP, CLS)

**If scores are low (< 70):**

Common fixes:

1. Re-run `./optimize-images.sh --quality=70` (lower quality)
2. Check all images are WebP (no PNG/JPG in production)
3. Verify lazy loading on all images except hero
4. Check Netlify has Brotli compression enabled (should be automatic)

---

## Step 6.5.7: Final Production Checklist

**Vision Mode Verification:**

**Content:**

- [ ] Screenshot hero headline - matches HEADLINE_HOOK from research
- [ ] Screenshot features - NO "Secret #1/2/3" labels (identity-first language)
- [ ] Screenshot FAQs - all 8 questions answered
- [ ] Screenshot founder story - complete 3-part Epiphany Bridge visible
- [ ] Screenshot guarantee - shows 120 days

**Functionality:**

- [ ] Screenshot single option - shows $19
- [ ] Screenshot bundle option - shows $59 with $40 savings
- [ ] Screenshot order bump - checkbox pre-checked, shows $10 value
- [ ] Screenshot checkout - all 3 price points redirect to SimpleSwap correctly

**Images:**

- [ ] All 35 images load (no 404s)
- [ ] All images are WebP format
- [ ] Hero image loads with fetchpriority="high"
- [ ] Other images lazy load

**Performance:**

- [ ] PageSpeed score > 80 mobile, > 90 desktop
- [ ] No JavaScript errors in console
- [ ] No broken links

**SEO:**

- [ ] Screenshot page title (view source) - contains product name
- [ ] Screenshot meta description - compelling copy
- [ ] Screenshot og:image - uses product-01.webp

---

## PHASE 6.5 FINAL VALIDATION

**Before declaring project complete, confirm:**

✅ Production site loads correctly
✅ ALL 35 images load without 404 errors (verified in Network tab)
✅ All three price points ($19, $29, $59) redirect to SimpleSwap correctly
✅ SimpleSwap shows correct USD amount for each option
✅ Netlify function logs show successful pool server requests
✅ Mobile responsive design works
✅ PageSpeed score > 80 (mobile) > 90 (desktop)
✅ No JavaScript errors in browser console
✅ All content verified (no placeholders, correct copy)
✅ All verified via vision mode screenshots

**If ANY item fails, fix and re-verify before completion.**

---

# 🎉 PROJECT COMPLETE

**If all validation gates passed, the landing page is LIVE and ready for traffic.**

**Final Deliverables:**

1. ✅ Complete buyer research (BUYER-RESEARCH-[PRODUCT].md)
2. ✅ 35 optimized WebP images with TikTok bubbles
3. ✅ Complete sales copy (product.config with 178+ variables)
4. ✅ Working SimpleSwap crypto checkout
5. ✅ Speed-optimized site (WebP, lazy loading, < 2MB)
6. ✅ Deployed to Netlify with custom domain
7. ✅ All image paths verified and working
8. ✅ PageSpeed > 80 mobile, > 90 desktop
9. ✅ End-to-end checkout flow tested

**Production URL**: `https://[SUBDOMAIN].netlify.app`

**Next Steps (Optional):**

- Set up custom domain in Netlify
- Configure email notifications for orders
- Set up analytics (Google Analytics, Facebook Pixel)
- Monitor pool server health
- A/B test headlines and pricing

---

# 📊 TROUBLESHOOTING GUIDE

## Common Issues & Fixes

### Issue: Images Not Loading (404 Errors) - MOST COMMON ⚠️

**Symptoms**: Broken image icons, Network tab shows 404 errors, brown placeholder squares

**Diagnosis:**

```bash
# Check if images exist
find images -name "*.webp" -o -name "*.png" | wc -l
# Should return 35 or more

# Check exact filenames
ls images/product/
# Look for product-01.webp (not product-1.webp)

ls images/testimonials/
# CRITICAL: Check if files are testimonial-01.png or testimonials-01.png
# Template expects: testimonial-01.png (SINGULAR)
# Your files might be: testimonials-01.png (PLURAL)
```

**Root Cause**: The brunson-protocol template uses SINGULAR naming (`testimonial-01.png`) but image generation tools often create PLURAL (`testimonials-01.png`).

**Fix Option 1: Rename Files to Match Template (Recommended)**

```bash
# Navigate to testimonials folder
cd images/testimonials/

# Rename testimonials (plural) to testimonial (singular)
for file in testimonials-*.png; do
  if [ -f "$file" ]; then
    newname=$(echo "$file" | sed 's/testimonials-/testimonial-/')
    mv "$file" "$newname"
    echo "Renamed: $file → $newname"
  fi
done

# Do same for .webp if they exist
for file in testimonials-*.webp; do
  if [ -f "$file" ]; then
    newname=$(echo "$file" | sed 's/testimonials-/testimonial-/')
    mv "$file" "$newname"
    echo "Renamed: $file → $newname"
  fi
done

# Verify
ls | head -5
# Should show: testimonial-01.png, testimonial-02.png, etc.

# Go back to template root
cd ../..
```

**Fix Option 2: Update Template to Use Plural (Alternative)**

```bash
# Update all section HTML files to use plural naming
find sections -name "*.html" -exec sed -i '' 's/\/testimonial-/\/testimonials-/g' {} +

# Verify changes
grep "testimonials-" sections/*.html | head -3

# Rebuild
./build.sh
```

**Common Naming Issues Table:**

| Issue             | Template Expects                | Your Files Might Be            | Fix Command                                                  |
| ----------------- | ------------------------------- | ------------------------------ | ------------------------------------------------------------ |
| Testimonials      | `testimonial-01.png` (singular) | `testimonials-01.png` (plural) | `mv testimonials-01.png testimonial-01.png` (repeat for all) |
| Product numbering | `product-01.webp` (with zero)   | `product-1.webp` (no zero)     | `mv product-1.webp product-01.webp`                          |
| Comparison        | `comparison-good.webp`          | `comparison-new.webp`          | `mv comparison-new.webp comparison-good.webp`                |
| File extension    | `.webp`                         | `.png` or `.jpg`               | Run `./optimize-images.sh`                                   |

**After fixing filenames:**

1. Convert to WebP if needed: `./optimize-images.sh`
2. Rebuild: `./build.sh`
3. Test locally: `python3 -m http.server 8000` → Open `http://localhost:8000`
4. Verify in browser DevTools Network tab (all images 200 status)
5. Redeploy: `npx netlify deploy --prod`

**Vision Mode Verification:**

- [ ] Screenshot terminal showing renamed files
- [ ] Screenshot browser with all images loaded (no broken icons)
- [ ] Screenshot DevTools Network tab - all images 200 status

---

### Issue: Checkout Button Does Nothing

**Symptoms**: Click "Pre-Order" button, nothing happens

**Diagnosis:**

```bash
# Check browser console (F12)
# Look for JavaScript errors

# Check function exists
ls netlify/functions/
# Should show buy-now.js
```

**Fix:**

1. Verify `netlify/functions/buy-now.js` exists
2. Check browser console for errors
3. Verify JavaScript in `sections/05-main-product.html` is not commented out
4. Redeploy and check Netlify function logs

---

### Issue: SimpleSwap Shows Wrong Amount

**Symptoms**: Redirects to SimpleSwap but shows incorrect USD amount

**Diagnosis:**

```bash
# Check Netlify function logs
npx netlify functions:log buy-now

# Look for tier mapping messages
```

**Fix:**

1. Check `authorizedTiers` array in `buy-now.js` matches your pricing
2. Default: `[19, 29, 59, 99]`
3. Verify product.config has `SINGLE_PRICE="19.00"` and `BUNDLE_PRICE="59.00"`
4. Redeploy function

---

### Issue: Placeholders Still Visible ({{VARIABLE}})

**Symptoms**: Page shows `{{PRODUCT_NAME}}` or other placeholder text

**Diagnosis:**

```bash
# Find which placeholders remain
grep -o "{{[^}]*}}" index.html | sort -u
```

**Fix:**

1. Open product.config
2. Find the missing variable name
3. Add a value (can't be empty string)
4. Rebuild: `./build.sh`
5. Redeploy

---

### Issue: Low PageSpeed Score (< 70)

**Symptoms**: Google PageSpeed Insights shows poor performance

**Diagnosis:**

- Check image file sizes
- Check for render-blocking resources
- Verify lazy loading

**Fix:**

1. Re-optimize images with lower quality:
   ```bash
   ./optimize-images.sh --quality=70
   ```
2. Verify all images except hero have `loading="lazy"`
3. Check Netlify has Brotli compression (should be automatic)
4. Minimize CSS/JS (future enhancement)

---

### Issue: Pool Server Error

**Symptoms**: Checkout fails with "Pool server failed" message

**Diagnosis:**

```bash
# Check pool server health
curl https://simpleswap-automation-1.onrender.com/health

# Should return: {"status":"healthy","tiers":{...}}
```

**Fix:**

1. Verify pool server URL in `buy-now.js` is correct
2. Check pool server is online (may be sleeping on free tier - first request wakes it)
3. Wait 30 seconds and try again
4. Check Netlify function logs for exact error

---

### Issue: Order Bump Checkbox Not Pre-Checked on $19 Option ⚠️

**Symptoms**:

- Order bump checkbox is unchecked by default on single ($19) option
- Should be pre-checked to increase average order value

**Diagnosis:**

```bash
# Check if checkbox has 'checked' attribute
grep -A5 "orderBumpCheck" sections/05-main-product.html | grep "checked"
```

**Root Cause**: The `<input type="checkbox" id="orderBumpCheck">` is missing the `checked` attribute.

**Fix: Add 'checked' Attribute to Checkbox**

Open `sections/05-main-product.html` and find the order bump checkbox (usually around line 600-700).

**Look for this:**

```html
<input
  type="checkbox"
  id="orderBumpCheck"
  style="width: 24px; height: 24px; cursor: pointer;"
/>
```

**Change to this:**

```html
<input
  type="checkbox"
  id="orderBumpCheck"
  checked
  style="width: 24px; height: 24px; cursor: pointer;"
/>
```

**Verify the fix:**

```bash
# Search for the checkbox
grep -n "id=\"orderBumpCheck\"" sections/05-main-product.html

# Verify it now has 'checked' attribute
grep -A2 "id=\"orderBumpCheck\"" sections/05-main-product.html
```

**Rebuild and test:**

```bash
# Rebuild
./build.sh

# Test locally
python3 -m http.server 8000
# Open localhost:8000 → Verify checkbox is pre-checked

# Deploy
npx netlify deploy --prod
```

**Vision Mode Verification:**

- [ ] Screenshot sections/05-main-product.html showing `checked` attribute added
- [ ] Screenshot browser showing checkbox pre-checked on $19 option
- [ ] Screenshot showing $29 total when checkbox is checked (not $19)

---

### Issue: SimpleSwap Pool Integration Not Working (Gemini Can't Fix) 🚨

**Symptoms**:

- Checkout button redirects to error page
- SimpleSwap shows "Invalid request" or doesn't load
- Netlify function returns 500 error
- Pool server returns "No exchanges available"

**This is a COMPLEX issue that Gemini often struggles with. Use this EXACT prompt to fix it:**

---

**COPY THIS PROMPT TO GEMINI:**

```
I need you to verify and fix the SimpleSwap pool server integration. Follow these steps EXACTLY:

STEP 1: Verify Pool Server is Online

Run this command and show me the output:
curl https://simpleswap-automation-1.onrender.com/health

Expected output should show: {"status":"healthy","tiers":{"19":X,"29":X,"59":X}}

If it returns an error, the pool server is down. Wait 2 minutes (it's on free tier and may be sleeping) then try again.

STEP 2: Verify buy-now.js Function is EXACTLY Correct

Read netlify/functions/buy-now.js and verify:

1. POOL_SERVER constant is EXACTLY: "https://simpleswap-automation-1.onrender.com"
2. The endpoint called is EXACTLY: `${POOL_SERVER}/buy-now`
3. The authorizedTiers array is: [19, 29, 59, 99]
4. The fetch call uses POST method
5. The body includes: JSON.stringify({ amountUSD: targetTier })

If ANY of these are different, copy the EXACT code from the mega-prompt Phase 4 Step 4.2.

STEP 3: Test the Function Locally

Create a test file called test-function.js:

const buyNow = require('./netlify/functions/buy-now.js');

(async () => {
  const event = {
    httpMethod: 'POST',
    body: JSON.stringify({ amountUSD: 19 }),
  };

  const response = await buyNow.handler(event);
  console.log('Status:', response.statusCode);
  console.log('Body:', response.body);
})();

Run it:
node test-function.js

Show me the output. It should show statusCode: 200 and an exchangeUrl.

STEP 4: Check Netlify Function Logs

After deploying, test checkout and immediately run:
npx netlify functions:log buy-now --tail

Show me the last 20 lines of logs. Look for:
- "Requesting exchange for tier X" (should see this)
- "Pool server success" (should see this)
- Any errors (should NOT see these)

STEP 5: Verify Frontend JavaScript

Open sections/05-main-product.html and search for "preloadExchangeLinks". Verify:

1. The function calls: fetch('/.netlify/functions/buy-now', {...})
2. The body includes: JSON.stringify({ amountUSD: prices[tier] })
3. The response handling checks: data.success && data.exchangeUrl

If any of these are missing or different, the frontend isn't calling the function correctly.

STEP 6: Test End-to-End

1. Deploy to Netlify
2. Open production site
3. Open browser DevTools → Network tab
4. Click "Pre-Order Now $19" button
5. Filter Network tab to "buy-now"
6. Click the buy-now request
7. Check:
   - Request URL: https://[your-site].netlify.app/.netlify/functions/buy-now
   - Request Method: POST
   - Request Payload: {"amountUSD":19}
   - Response Status: 200
   - Response Body: Should contain "exchangeUrl"

Show me screenshots of the Network tab request and response.

IF IT STILL DOESN'T WORK:

The pool server might be out of exchanges for that tier. Check pool status:
curl https://simpleswap-automation-1.onrender.com/pool-status

If a tier shows 0 exchanges, you need to wait for auto-replenishment (happens every hour) or create custom exchanges.

For custom pricing (not $19/$29/$59), you MUST create your own pool tiers first using BrightData automation (see Phase 3 Step 0 in the mega-prompt).
```

---

**After Running This Prompt:**

1. Gemini should identify the exact issue (usually one of the 6 steps)
2. Follow Gemini's fix instructions
3. Re-test checkout flow
4. Verify in Netlify function logs that pool server returns success

**Vision Mode Verification:**

- [ ] Screenshot curl health check showing pool server online
- [ ] Screenshot buy-now.js with correct POOL_SERVER URL
- [ ] Screenshot Netlify function logs showing "Pool server success"
- [ ] Screenshot Network tab showing 200 response with exchangeUrl
- [ ] Screenshot SimpleSwap page loading with correct amount

---

## Emergency Fixes

### Site is Live But Broken - Quick Rollback

```bash
# View previous deploys
npx netlify status

# Rollback to previous version in Netlify dashboard:
# Deploys tab → Find last working deploy → Click "..." → Publish deploy
```

### Missing Images on Production But Work Locally

```bash
# Verify images are in deploy
npx netlify deploy --prod --dir . --dry-run

# Check if images/ folder is being uploaded
# Then deploy for real:
npx netlify deploy --prod --dir .
```

---

# 🎓 APPENDIX: RUSSELL BRUNSON FRAMEWORKS REFERENCE

## The 5-Minute Webinar Structure (Landing Page Format)

This landing page template follows Russell Brunson's 5-Minute Webinar framework adapted for a single-page layout:

1. **Big Promise** (Hero Section)
   - HEADLINE_HOOK: The winning headline from brainstorm
   - SUBHEADLINE: Pain reversal + benefit
   - TAGLINE: Unique mechanism name

2. **The Secrets** (Feature Cards 1-4)
   - Secret #1 (Vehicle): "Does this product work?"
   - Secret #2 (Internal): "Can someone like ME use this?"
   - Secret #3 (External): "What about time/money/others?"
   - ⚠️ NEVER label them "Secret #1/2/3" - use identity-first headlines

3. **The Epiphany Bridge** (Founder Story)
   - Part 1: Backstory (breaking point + failed attempts)
   - Part 2: Epiphany (the "aha" moment that changed everything)
   - Part 3: Result (transformation achieved + mission)

4. **The Offer** (Pricing Section)
   - Single option: $19 + FREE order bump
   - Bundle option: $59 (2x product + FREE order bump)
   - Order bump: Pre-checked checkbox ($10 value)

5. **The Stack** (Comparison Section)
   - OLD WAY (competitor/inferior solution)
   - NEW WAY (your product/superior solution)
   - Shows contrast and makes new opportunity clear

6. **FAQ Stack** (FAQs Section)
   - Each FAQ addresses one of the 3 false beliefs
   - Crushes objections with truth + social proof

7. **The Close** (Guarantee)
   - 120-Day Perfect Fit Promise
   - Reverses biggest objection/fear
   - Removes all risk

---

## Steve Larsen's Market Sophistication Levels

**Level 1 - Unaware**: Customer doesn't know problem exists
**Level 2 - Problem Aware**: Knows problem, doesn't know solutions
**Level 3 - Solution Aware**: Knows solutions exist, trying options
**Level 4 - Product Aware**: Knows your product, comparing alternatives
**Level 5 - Most Aware**: Ready to buy, needs final push

**For Level 4-5 markets (where most e-commerce products sit):**

- Can't just say "this product works" (everyone says that)
- Need NEW OPPORTUNITY, not improvement offer
- Focus on UNIQUE MECHANISM (what makes this different)
- Heavy use of social proof and objection handling

---

## Identity-First Language Examples

**❌ FRAMEWORK-EXPOSED (Wrong):**

```
"Secret #1: Why This Product Works"
"The Vehicle False Belief"
"Internal Belief Shift"
```

**✅ IDENTITY-FIRST (Correct):**

```
"For Women Who've Been Burned By Every 'Miracle' Product"
"Works For Every Body Type (Yes, Even Yours)"
"For Busy Women Who Don't Have Time For Complicated Solutions"
```

**The Rule**: Write headlines that speak to WHO they are and HOW they feel, not which framework section you're addressing.

---

# END OF MEGA-PROMPT

**Total Word Count**: ~20,000 words
**Phases**: 7 (Phase 0 through Phase 6.5)
**Validation Gates**: 8 (mandatory checkpoints with vision mode)
**Images Required**: 35 (all WebP format)
**Variables**: 178+ (product.config)
**Target Completion Time**: 6-8 hours (first time), 3-4 hours (subsequent)

**This prompt contains:**

- ✅ Complete brunson-protocol skill knowledge
- ✅ Complete landing-page-builder skill SimpleSwap knowledge
- ✅ Speed optimization (WebP, lazy loading, minification)
- ✅ Image path verification at 3 checkpoints (Phase 2.5, 5.5, 6.5)
- ✅ Vision mode validation throughout every phase
- ✅ Works universally for ANY product in ANY market
- ✅ "Dumb AI proof" with extreme specificity

**Ready to build your first landing page?** Start with Phase 0 and follow every step exactly as written.
