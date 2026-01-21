#!/usr/bin/env python3
"""
Git Checkpoint Script for Ralph Loop
Creates automatic git commits after each verified step.
Usage: python3 git_checkpoint.py --step 2A-scout
"""

import subprocess
import sys
import argparse
from datetime import datetime
import os

def run_git_command(cmd, cwd=None):
    """Run a git command and return output."""
    try:
        result = subprocess.run(
            cmd,
            cwd=cwd,
            capture_output=True,
            text=True,
            timeout=30
        )
        return result.returncode == 0, result.stdout.strip(), result.stderr.strip()
    except subprocess.TimeoutExpired:
        return False, "", "Command timed out after 30 seconds"
    except Exception as e:
        return False, "", str(e)

def is_git_repo():
    """Check if current directory is a git repo."""
    success, _, _ = run_git_command(["git", "rev-parse", "--git-dir"])
    return success

def init_git_if_needed():
    """Initialize git repo if not already initialized."""
    if not is_git_repo():
        success, out, err = run_git_command(["git", "init"])
        if success:
            print("📁 Initialized new git repository")
            return True
        else:
            print(f"❌ Failed to init git: {err}")
            return False
    return True

def has_changes():
    """Check if there are uncommitted changes."""
    success, out, err = run_git_command(["git", "status", "--porcelain"])
    if success:
        return len(out.strip()) > 0
    return False

def create_checkpoint(step_name, message=None):
    """Create a git checkpoint (commit) for a step."""
    if not init_git_if_needed():
        return False
    
    if not has_changes():
        print(f"ℹ️ No changes to commit for step {step_name}")
        return True
    
    # Stage all changes
    success, _, err = run_git_command(["git", "add", "-A"])
    if not success:
        print(f"❌ Failed to stage changes: {err}")
        return False
    
    # Create commit message
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    if message:
        commit_msg = f"RALPH: {step_name} - {message} [{timestamp}]"
    else:
        commit_msg = f"RALPH: Step {step_name} checkpoint [{timestamp}]"
    
    # Commit
    success, out, err = run_git_command(["git", "commit", "-m", commit_msg])
    if success:
        print(f"✅ Git checkpoint created: {step_name}")
        
        # Get short hash
        success, hash_out, _ = run_git_command(["git", "rev-parse", "--short", "HEAD"])
        if success:
            print(f"   Commit: {hash_out}")
        
        return True
    else:
        if "nothing to commit" in err:
            print(f"ℹ️ Nothing to commit for step {step_name}")
            return True
        print(f"❌ Failed to commit: {err}")
        return False

def list_checkpoints(limit=10):
    """List recent Ralph checkpoints."""
    success, out, _ = run_git_command([
        "git", "log", 
        "--oneline", 
        f"-{limit}",
        "--grep=RALPH"
    ])
    if success and out:
        print(f"\n📋 Recent Ralph Checkpoints:")
        print("-" * 40)
        for line in out.split('\n'):
            print(f"  {line}")
        print("-" * 40)
        return True
    return False

def rollback_to_step(step_name):
    """Rollback to a previous step's checkpoint."""
    # Find commit with step name
    success, out, _ = run_git_command([
        "git", "log",
        "--oneline",
        f"--grep=RALPH: {step_name}"
    ])
    
    if not success or not out:
        print(f"❌ No checkpoint found for step: {step_name}")
        return False
    
    # Get the most recent commit for this step
    commit_hash = out.split('\n')[0].split()[0]
    
    print(f"⚠️ Rolling back to: {out.split(chr(10))[0]}")
    
    # Perform rollback (hard reset)
    success, _, err = run_git_command(["git", "reset", "--hard", commit_hash])
    if success:
        print(f"✅ Rolled back to step: {step_name}")
        return True
    
    print(f"❌ Rollback failed: {err}")
    return False


def main():
    parser = argparse.ArgumentParser(description="Git Checkpoint for Ralph Loop")
    parser.add_argument("--step", help="Step ID to create checkpoint for")
    parser.add_argument("--message", "-m", help="Optional commit message")
    parser.add_argument("--list", "-l", action="store_true", help="List recent checkpoints")
    parser.add_argument("--rollback", help="Rollback to a specific step")
    
    args = parser.parse_args()
    
    if args.list:
        list_checkpoints()
    elif args.rollback:
        rollback_to_step(args.rollback)
    elif args.step:
        success = create_checkpoint(args.step, args.message)
        sys.exit(0 if success else 1)
    else:
        parser.print_help()
        sys.exit(1)


if __name__ == "__main__":
    main()
