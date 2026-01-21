#!/bin/bash
# validate-framework.sh - Validates ENGAGE/FIBS/Secrets frameworks in copy
set -e

echo "=== FRAMEWORK VALIDATION ==="

# Check copy_draft.json or copy_final.json exists
COPY_FILE=""
if [ -f "copy_final.json" ]; then
  COPY_FILE="copy_final.json"
elif [ -f "copy_draft.json" ]; then
  COPY_FILE="copy_draft.json"
else
  echo "FAIL: No copy file found (copy_draft.json or copy_final.json)"
  exit 1
fi
echo "✓ Using: $COPY_FILE"

# Check file is valid JSON
if ! jq empty "$COPY_FILE" 2>/dev/null; then
  echo "FAIL: $COPY_FILE is not valid JSON"
  exit 1
fi
echo "✓ Valid JSON"

# === ENGAGE PATTERN CHECK ===
echo ""
echo "--- ENGAGE Pattern Check ---"

# Look for pattern interrupt markers in headlines
ENGAGE_PATTERNS='Why |What if |Stop |The .* Lie|The .* Myth|The .* Secret|Isn.t|Don.t|Never |truth|secret'
HEADLINE=$(jq -r '.engage.headline // .headline // ""' "$COPY_FILE" 2>/dev/null)

if [ -z "$HEADLINE" ]; then
  echo "WARN: No headline found in engage.headline"
else
  if echo "$HEADLINE" | grep -qiE "$ENGAGE_PATTERNS"; then
    echo "✓ Headline has ENGAGE pattern: $HEADLINE"
  else
    echo "WARN: Headline may lack pattern interrupt: $HEADLINE"
  fi
fi

# === FEATURES CHECK ===
echo ""
echo "--- Features Check ---"

FEATURE_COUNT=$(jq '.features | length // 0' "$COPY_FILE" 2>/dev/null)
if [ "$FEATURE_COUNT" -lt 3 ]; then
  echo "FAIL: Need 3 features, found $FEATURE_COUNT"
  exit 1
fi
echo "✓ Features count: $FEATURE_COUNT"

# === SECRETS CHECK ===
echo ""
echo "--- Secrets Check ---"

SECRET_COUNT=$(jq '.secrets | length // 0' "$COPY_FILE" 2>/dev/null)
if [ "$SECRET_COUNT" -lt 3 ]; then
  echo "FAIL: Need 3 secrets (vehicle/internal/external), found $SECRET_COUNT"
  exit 1
fi
echo "✓ Secrets count: $SECRET_COUNT"

# === FOUNDER STORY CHECK ===
echo ""
echo "--- Founder Story Check ---"

HAS_FOUNDER=$(jq 'has("founder_story")' "$COPY_FILE" 2>/dev/null)
if [ "$HAS_FOUNDER" != "true" ]; then
  echo "WARN: No founder_story section found"
else
  # Check for epiphany bridge elements
  BACKSTORY=$(jq -r '.founder_story.backstory // ""' "$COPY_FILE" 2>/dev/null)
  WALL=$(jq -r '.founder_story.wall // ""' "$COPY_FILE" 2>/dev/null)
  EPIPHANY=$(jq -r '.founder_story.epiphany // ""' "$COPY_FILE" 2>/dev/null)

  ELEMENTS=0
  [ -n "$BACKSTORY" ] && [ "$BACKSTORY" != "null" ] && ((ELEMENTS++))
  [ -n "$WALL" ] && [ "$WALL" != "null" ] && ((ELEMENTS++))
  [ -n "$EPIPHANY" ] && [ "$EPIPHANY" != "null" ] && ((ELEMENTS++))

  if [ "$ELEMENTS" -lt 3 ]; then
    echo "WARN: Founder story missing epiphany bridge elements (found $ELEMENTS/5)"
  else
    echo "✓ Founder story has epiphany bridge elements"
  fi
fi

# === BANNED PATTERNS CHECK ===
echo ""
echo "--- Banned Patterns Check ---"

BANNED_PATTERNS='\$00|XX%|XX months|\[amount\]|\[number\]|The Backstory:|THE EPIPHANY:|Secret 1:|Secret 2:|Secret 3:'
if grep -qiE "$BANNED_PATTERNS" "$COPY_FILE" 2>/dev/null; then
  echo "FAIL: Banned placeholder patterns found in copy"
  grep -iE "$BANNED_PATTERNS" "$COPY_FILE" | head -3
  exit 1
fi
echo "✓ No banned patterns found"

echo ""
echo "PASS: Framework validation complete"
exit 0
