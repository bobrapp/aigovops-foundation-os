#!/bin/bash
# AiGovOps Foundation OS - Dogfood Campfire Test
# First end-to-end test: simulated campfire -> Decision Cards + Checklist
#
# Prerequisites:
#   1. n8n deployed on Railway with capture-scribe-agent workflow imported
#   2. Environment variables set (see foundation-os/linear-project/setup.md)
#   3. GitHub token configured in n8n
#
# Usage: ./scripts/dogfood-campfire-test.sh [N8N_WEBHOOK_URL]

set -euo pipefail

# Configuration
N8N_WEBHOOK_URL="${1:-${N8N_WEBHOOK_URL:-http://localhost:5678/webhook/campfire-intake}}"
MEETING_ID="dogfood-test-$(date +%Y%m%d-%H%M%S)"
TIMESTAMP=$(date -u +%Y-%m-%dT%H:%M:%SZ)

echo "============================================"
echo "AiGovOps Dogfood Campfire Test"
echo "============================================"
echo "Meeting ID:  $MEETING_ID"
echo "Timestamp:   $TIMESTAMP"
echo "Webhook URL: $N8N_WEBHOOK_URL"
echo "============================================"
echo ""

# Simulated campfire transcript (30-minute meeting extract)
# This represents the kind of governance discussion that produces Decision Cards
TRANSCRIPT=$(cat << 'TRANSCRIPT_END'
[00:00] Bob: Welcome everyone to our first AiGovOps campfire. Today we need to make three decisions.

[02:15] Bob: First decision - should we adopt the Human Flourishing Gate as a mandatory checkpoint before any AI system goes to production? This would mean every deployment must pass dignity, equity, and delight assessments.

[04:30] Alice: I strongly support this. The whole point of AiGovOps is that we don't just check boxes - we ensure AI actually serves human flourishing. Making it mandatory sends the right signal.

[06:00] Carlos: Agreed, but I want to make sure we define clear thresholds. What counts as passing the dignity assessment? We need measurable criteria.

[08:15] Bob: Good point. Let's decide: the Human Flourishing Gate is mandatory for all production deployments, with initial thresholds to be defined in the first checklist iteration. All in favor? [unanimous agreement]

[10:00] Bob: Second decision - our agent autonomy levels. I propose three tiers: Level 1 (Draft Only) where agents can only create drafts that humans must approve; Level 2 (Execute with Audit) where agents can execute routine tasks but everything is logged; Level 3 (Full Auto) which we won't use initially.

[13:30] Alice: I think we should explicitly ban Level 3 for the first year. We need to build trust incrementally.

[15:00] Carlos: I agree with the three-tier model. For the Capture/Scribe agent, it should be Level 1 - draft only. For the Release Bot, Level 2 makes sense since it's just running policy checks.

[17:00] Bob: Decision made: Three-tier autonomy model adopted. Capture/Scribe is Level 1. Release Bot is Level 2. Level 3 banned for Year 1. [unanimous]

[20:00] Bob: Third decision - meeting cadence. I propose weekly 30-minute campfires, always recorded and processed through our pipeline. If it's not in a Decision Card, it didn't happen.

[22:30] Alice: Weekly works. But I want a checklist item that every campfire must produce at least one Decision Card and update the roadmap.

[25:00] Carlos: Agreed. And every Decision Card from a campfire should automatically get a PR with the policy gate running.

[27:00] Bob: Done. Weekly campfires, mandatory Decision Card output, auto-PR with policy gates. Meeting adjourned.
TRANSCRIPT_END
)

echo "Step 1: Sending simulated campfire transcript to n8n webhook..."
echo ""

# Build the payload
PAYLOAD=$(cat << EOF
{
  "meeting_id": "$MEETING_ID",
  "timestamp": "$TIMESTAMP",
  "participants": ["Bob", "Alice", "Carlos"],
  "recording_url": "simulated://dogfood-test",
  "transcript": $(echo "$TRANSCRIPT" | python3 -c 'import sys,json; print(json.dumps(sys.stdin.read()))'),
  "test_mode": true,
  "audit": {
    "source": "dogfood-campfire-test.sh",
    "operator": "$(whoami)",
    "initiated_at": "$TIMESTAMP"
  }
}
EOF
)

# Send to n8n webhook
HTTP_CODE=$(curl -s -o /tmp/dogfood-response.json -w "%{http_code}" \
  -X POST "$N8N_WEBHOOK_URL" \
  -H "Content-Type: application/json" \
  -d "$PAYLOAD")

echo "Response Code: $HTTP_CODE"
echo "Response Body:"
cat /tmp/dogfood-response.json | python3 -m json.tool 2>/dev/null || cat /tmp/dogfood-response.json
echo ""

if [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 201 ]; then
  echo "Step 2: Webhook accepted. Waiting for pipeline to process..."
  echo "(The n8n workflow will: transcribe -> extract decisions -> create PR)"
  echo ""
  sleep 10

  echo "Step 3: Checking for new branch and PR..."
  # Check if the campfire branch was created
  BRANCH_CHECK=$(curl -s -o /dev/null -w "%{http_code}" \
    "https://api.github.com/repos/bobrapp/aigovops-foundation-os/branches/campfire/$MEETING_ID" \
    -H "Authorization: token ${GITHUB_TOKEN:-}")

  if [ "$BRANCH_CHECK" -eq 200 ]; then
    echo "Branch campfire/$MEETING_ID created successfully!"
  else
    echo "Branch not yet created (code: $BRANCH_CHECK). Pipeline may still be processing."
  fi

  echo ""
  echo "Step 4: Checking for open PRs..."
  PR_LIST=$(curl -s \
    "https://api.github.com/repos/bobrapp/aigovops-foundation-os/pulls?state=open&head=bobrapp:campfire/$MEETING_ID" \
    -H "Authorization: token ${GITHUB_TOKEN:-}")

  PR_COUNT=$(echo "$PR_LIST" | python3 -c 'import sys,json; print(len(json.load(sys.stdin)))' 2>/dev/null || echo "0")

  if [ "$PR_COUNT" -gt 0 ]; then
    echo "PR created! Found $PR_COUNT open PR(s) for this campfire."
    echo "$PR_LIST" | python3 -c 'import sys,json; [print(f"  PR #{p["number"]}: {p["title"]}") for p in json.load(sys.stdin)]' 2>/dev/null
  else
    echo "No PRs found yet. Pipeline may still be processing."
  fi
else
  echo "ERROR: Webhook returned $HTTP_CODE. Check n8n logs."
  echo "Make sure n8n is running and the webhook URL is correct."
fi

echo ""
echo "============================================"
echo "Dogfood Test Summary"
echo "============================================"
echo "Meeting ID:     $MEETING_ID"
echo "Webhook Status: $HTTP_CODE"
echo "Expected Output:"
echo "  - 3 Decision Cards (Human Flourishing Gate, Autonomy Tiers, Meeting Cadence)"
echo "  - 1 YAML checklist snippet"
echo "  - 1 PR with policy gate CI running"
echo "  - 1 Linear issue for human review"
echo "============================================"
echo ""
echo "Next: Review the PR, ratify the Decision Cards, merge to main."
echo "Remember: Agents draft, humans ratify."
