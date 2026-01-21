#!/usr/bin/env python3
"""
Injects Ralph Loop integration into all skills.
Run once to upgrade all skills.
"""

import os
import re

# Map skills to their step IDs and previous steps
SKILL_MAP = {
    "brunson-scout": ("2A-scout", "1-initialize"),
    "brunson-spy": ("2B-spy", "2A-scout"),
    "brunson-profiler": ("2C-profiler", "2B-spy"),
    "brunson-avatar": ("2D-avatar", "2C-profiler"),
    "brunson-mechanic": ("2E-mechanic", "2D-avatar"),
    "brunson-strategist": ("2F-strategist", "2E-mechanic"),
    "antigravity-neuro-research": ("2G-neuro-research", "2F-strategist"),
    "whisk-architect": ("2H-whisk-architect", "2G-neuro-research"),
    "whisk-prompter": ("2I-whisk-prompter", "2H-whisk-architect"),
    "antigravity-linguist": ("3-linguist", "2I-whisk-prompter"),
    "brunson-copywriter": ("4-copywriter", "3-linguist"),
    "brunson-perry-brain": ("5-perry-brain", "4-copywriter"),
    "antigravity-traceability": ("6A-traceability", "5-perry-brain"),
    "antigravity-hallucination-killer": ("6B-hallucination-killer", "6A-traceability"),
    "brunson-builder": ("7-builder", "6B-hallucination-killer"),
    "brunson-auditor": ("8-auditor", "7-builder"),
    "antigravity-local-qa": ("9-local-qa", "8-auditor"),
    "antigravity-project-namer": ("10A-project-namer", "9-local-qa"),
    "brunson-deployer": ("10B-deployer", "10A-project-namer"),
    "antigravity-live-qa": ("11-live-qa", "10B-deployer"),
}

RALPH_INTEGRATION_TEMPLATE = '''
## 🔄 RALPH LOOP INTEGRATION (STEP ID: `{step_id}`)

**BEFORE executing this skill:**
1. Read `.agent/skills/ralph-loop/SKILL.md`
2. Verify step `{prev_step}` passed in `progress.json`
3. Check `learnings.md` for relevant anti-patterns

**AFTER executing this skill:**
```bash
python3 .agent/skills/ralph-loop/scripts/verify_step.py --step {step_id}
```
- If FAIL: Fix immediately, do not proceed
- If PASS: Commit with `git add -A && git commit -m "RALPH: {step_id} complete"`

'''

def inject_ralph_into_skill(skill_name, step_id, prev_step):
    skill_path = f".agent/skills/{skill_name}/SKILL.md"
    
    if not os.path.exists(skill_path):
        print(f"⚠️ Skill not found: {skill_path}")
        return False
    
    with open(skill_path, 'r') as f:
        content = f.read()
    
    # Check if already has Ralph integration
    if "RALPH LOOP INTEGRATION" in content:
        print(f"⏭️ Already has Ralph: {skill_name}")
        return True
    
    # Find insertion point (after "When to use this skill" section)
    insertion_pattern = r'(## When to use this skill.*?(?=\n## |\n---|\Z))'
    match = re.search(insertion_pattern, content, re.DOTALL)
    
    if match:
        insert_after = match.end()
        ralph_block = RALPH_INTEGRATION_TEMPLATE.format(
            step_id=step_id,
            prev_step=prev_step
        )
        new_content = content[:insert_after] + "\n" + ralph_block + content[insert_after:]
        
        with open(skill_path, 'w') as f:
            f.write(new_content)
        
        print(f"✅ Injected Ralph into: {skill_name}")
        return True
    else:
        print(f"❌ Could not find insertion point: {skill_name}")
        return False

def main():
    print("=" * 60)
    print("🔄 RALPH LOOP SKILL INJECTOR")
    print("=" * 60)
    
    success = 0
    failed = 0
    
    for skill_name, (step_id, prev_step) in SKILL_MAP.items():
        if inject_ralph_into_skill(skill_name, step_id, prev_step):
            success += 1
        else:
            failed += 1
    
    print(f"\n{'=' * 60}")
    print(f"✅ Success: {success}")
    print(f"❌ Failed: {failed}")
    print(f"{'=' * 60}")

if __name__ == "__main__":
    main()
