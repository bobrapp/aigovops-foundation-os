# Foundation OS - Agent Workflows

This directory contains the agent workflow definitions that power the AiGovOps Foundation's agent-first operating system.

## Architecture

```
Human Input (voice/text/call)
    |
    v
[Scribe Agent] --> GDR Draft
    |
    v
[Mapper Agent] --> NIST/ISO/EU mappings
    |
    v
[Human Review] --> Edits, flourishing, dissent
    |
    v
[Policy Compiler] --> YAML/Rego policy files
    |
    v
[Release Agent] --> PR, changelog, docs update
    |
    v
[Safety/Redaction Agent] --> PII check, consent verification
```

## Agent Registry

| Agent | Wave | Autonomy Level | Owner | Status |
|-------|------|---------------|-------|--------|
| Scribe/Capture | 1 | 0 (Assist) | TBD | Planned |
| Triage/Synthesis | 1 | 0 (Assist) | TBD | Planned |
| Mapper | 1 | 0 (Assist) | TBD | Planned |
| Release | 1 | 1 (Execute Bounded) | TBD | Planned |
| Safety/Redaction | 1 | 1 (Execute Bounded) | TBD | Planned |
| Policy Compiler | 2 | 0 (Assist) | TBD | Planned |
| Dissent Amplifier | 2 | 0 (Assist) | TBD | Planned |
| Translation | 2 | 1 (Execute Bounded) | TBD | Planned |
| Certification Ops | 3 | 1 (Execute Bounded) | TBD | Planned |
| Grant Scout | 3 | 0 (Assist) | TBD | Planned |
| Partner/CRM | 3 | 1 (Execute Bounded) | TBD | Planned |

## Implementation Stack (Lenny Bundle)

- **Orchestration**: n8n (hosted on Railway)
- **AI/Cognitive**: Perplexity Pro (Spaces, Shortcuts, Tasks)
- **Dev**: Replit, Lovable, Railway
- **Planning**: Linear
- **Analytics**: PostHog
- **Content**: Gamma, Canva, ElevenLabs, Manus

## Perplexity Shortcuts

| Shortcut ID | Command | Purpose |
|------------|---------|--------|
| prd | `/prd` | Draft PRD for a feature |
| mrd | `/mrd` | Draft MRD for a market segment |
| gdr-draft | `/gdr-draft` | Create GDR from transcript |
| policy-yaml | `/policy-yaml` | Convert GDR decision to YAML policy |
| global-brief | `/global-brief` | Create translation briefs by language |
| daily-ops | `/daily-ops` | Summarize yesterday's GDRs/issues |

## Perplexity Tasks (Scheduled)

| Task | Schedule | Purpose |
|------|----------|--------|
| Daily GDR Digest | 7:00 AM daily | Summarize GDRs needing human review |
| Weekly Policy Drift | Monday 9 AM | Compare policies vs last week |
| Monthly Metrics | 1st of month | Compile metrics from PostHog |

## n8n Workflow IDs

| Workflow | ID | Purpose |
|----------|----|---------|
| GDR Intake | wf-gdr-intake | Transcript to GDR draft |
| Policy Update | wf-policy-update | GDR to YAML policy PR |
| Release Gate | wf-release-gate | Check GDR before deploy |
| Log Interaction | wf-log-interaction | Log AI usage to PostHog + Git |
