# Linear Project Setup for AiGovOps Foundation OS

## Overview

Linear is the planning tool in the Lenny Product Pass stack. This document defines the project structure, labels, and workflows for tracking AiGovOps Foundation OS development.

## Team Setup

**Team Name:** AiGovOps Foundation
**Team Key:** AGOV

## Project: Foundation OS Prototype (Weeks 1-12)

Create this project in Linear to track the ROADMAP.md milestones.

## Labels

Create these labels in Linear Settings > Labels:

| Label | Color | Purpose |
|-------|-------|---------|
| `agent-draft` | Blue | Items drafted by agents, pending human review |
| `human-ratify` | Orange | Requires human ratification (Steward Council) |
| `policy-gate` | Red | Blocked by policy gate failure |
| `decision-card` | Purple | Linked to a Decision Card |
| `campfire` | Green | Originated from a campfire meeting |
| `checklist` | Teal | Checklist-related work item |
| `infrastructure` | Gray | Platform/tooling setup |

## Workflow States

| State | Type | Description |
|-------|------|-------------|
| Triage | triage | New items from agents or humans |
| Backlog | backlog | Prioritized but not started |
| In Progress | started | Active work |
| Agent Draft | started | Agent has produced draft, awaiting review |
| Human Review | started | Awaiting human ratification |
| Done | completed | Ratified and merged |
| Cancelled | cancelled | Rejected or superseded |

## Week 1-2 Sprint Issues

Create these issues for the first sprint:

### Infrastructure
- [ ] AGOV-1: Deploy n8n on Railway
- [ ] AGOV-2: Configure Zoom webhook for campfire-intake
- [ ] AGOV-3: Set up Perplexity API credentials in n8n
- [ ] AGOV-4: Import capture-scribe-agent workflow into n8n
- [ ] AGOV-5: Connect GitHub integration in n8n

### First Dogfood
- [ ] AGOV-6: Record 30-minute test campfire
- [ ] AGOV-7: Run campfire through Capture/Scribe pipeline
- [ ] AGOV-8: Review and ratify 3 draft Decision Cards
- [ ] AGOV-9: Validate checklist snippet output
- [ ] AGOV-10: Retrospective on pipeline quality

### Governance
- [ ] AGOV-11: Ratify constitution.md (Steward Council vote)
- [ ] AGOV-12: Review GOVERNANCE.md roles and fill initial seats
- [ ] AGOV-13: Set up PostHog analytics for pipeline metrics

## GitHub Integration

In Linear Settings > Integrations > GitHub:
1. Connect the `bobrapp/aigovops-foundation-os` repository
2. Enable auto-link for PR references (AGOV-XX in commit messages)
3. Enable auto-close on PR merge

## n8n Integration

The n8n Capture/Scribe agent creates Linear issues automatically via the GraphQL API when new campfire Decision Cards are drafted. See `foundation-os/n8n-workflows/capture-scribe-agent.json` for the notify-linear node.

## Environment Variables Needed

```
LINEAR_API_KEY=lin_api_xxxxx
LINEAR_TEAM_ID=<your-team-uuid>
LINEAR_LABEL_REVIEW=<human-ratify-label-uuid>
```

Get these from Linear Settings > API > Personal API Keys.
