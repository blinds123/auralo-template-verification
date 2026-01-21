import json
import sys
import os

def load_json(path):
    try:
        with open(path, 'r') as f:
            return json.load(f)
    except:
        return None

def verify_deliberation(output_path, research_dir="."):
    """
    Validates that a JSON output contains a valid 'deliberation' block
    and that the 'source_quote' actually exists in the 'source_file'.
    """
    data = load_json(output_path)
    if not data:
        return False, "Could not load output JSON"

    if "deliberation" not in data:
        return False, "MISSING BLOCK: 'deliberation' array is missing."

    deliberations = data["deliberation"]
    if not isinstance(deliberations, list) or len(deliberations) == 0:
        return False, "EMPTY BLOCK: 'deliberation' array is empty."

    # Verify each deliberation unit
    for i, d in enumerate(deliberations):
        # 1. Structure Check
        for key in ["source_file", "source_quote", "reasoning"]:
            if key not in d:
                return False, f"Deliberation {i+1} missing key: {key}"

        # 2. Fact Check (Hallucination Killer)
        source_file = d["source_file"]
        quote = d["source_quote"].lower() # Normalize case for loose matching
        
        # Load the research file
        r_path = os.path.join(research_dir, source_file)
        research_data = load_json(r_path)
        
        if not research_data:
            return False, f"Deliberation {i+1} cites missing file: {source_file}"
            
        # Check if quote exists in file (Text search in string dump)
        research_text = str(research_data).lower()
        
        # We allow fuzzy match (substring) but strictly enforcing keywords
        # If the quote is short (<5 words), exact match required? 
        # Let's enforce that at least 50% of the quote words appear sequentially or close.
        # For simplicity in V1: Simple Substring Match.
        
        # "Clean" the quote of punctuation for matching
        clean_quote = ''.join(e for e in quote if e.isalnum() or e.isspace())
        clean_research = ''.join(e for e in research_text if e.isalnum() or e.isspace())
        
        if clean_quote not in clean_research:
            # Fallback: Check if 80% of words exist?
            quote_words = clean_quote.split()
            found_count = sum(1 for w in quote_words if w in clean_research)
            ratio = found_count / len(quote_words) if quote_words else 0
            
            if ratio < 0.8:
                return False, f"HALLUCINATION: Quote '{d['source_quote']}' not found in {source_file} (Search Ratio: {ratio:.2f})"

    return True, "Deliberation Verified."

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: verify_deliberation.py <output_file>")
        sys.exit(1)
        
    path = sys.argv[1]
    success, msg = verify_deliberation(path)
    
    if success:
        print(f"✅ PASS: {msg}")
        sys.exit(0)
    else:
        print(f"❌ FAIL: {msg}")
        sys.exit(1)
