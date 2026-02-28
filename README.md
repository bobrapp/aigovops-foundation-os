# AiGovOps Foundation OS

> Agent-first, human-souled governance-as-code reference implementation

**Mission**: AiGovOps makes AI safer and more beneficial by turning ambiguous policy into executable "policy as procedure," enforced as code in the delivery pipeline (AiDevOps), with evidence and audit trails by default.

**Operating Thesis**: Agents do the bureaucracy; humans hold moral legitimacy.

## What Is This Repo?

This is the founding repository of the AiGovOps Foundation OS (FOSL) -- a dogfooded reference implementation of agentic governance-as-code. Everything the foundation produces passes through the same governance pipeline it advocates for others.

## Core Principle

**Agents may draft anything; only humans may ratify norms, adjudicate value conflicts, grant trust status, or approve exceptions.**

## Repository Structure

```
aigovops-foundation-os/
|-- constitution.md          # Foundation constitution with human-only decision rights
|-- GOVERNANCE.md             # Governance bodies, COI policy, decision process
|-- CONSENT-AND-REDACTION.md  # Contributor consent and privacy policy
|-- ROADMAP.md                # Phased rollout plan (Phase 0-3)
|-- LICENSE                   # Apache 2.0
|
|-- aidevops-spec/            # AiDevOps Governance Pipeline Specification
|   |-- schema.json           # JSON Schema for gates, checks, audit events
|
|-- checklists/               # Production-ready governance checklists
|   |-- ai-production-readiness.v0.1.yaml
|
|-- decision-cards/           # Governance Decision Records (GDRs)
|   |-- schema.json           # GDR JSON Schema (ADR-inspired)
|   |-- README.md             # How GDRs work
|
|-- foundation-os/            # Agent workflow definitions
|   |-- README.md             # Agent registry, Perplexity shortcuts, n8n workflows
|
|-- mappings/                 # Regulatory framework mappings
|   |-- nist-rmf.yml          # NIST AI RMF mapping
|
|-- policy/                   # Policy-as-code YAML files
|   |-- gate.ai-flourishing.v1.yaml  # Human Flourishing Gate
|
|-- rego/                     # OPA/Rego policy enforcement
|   |-- production_readiness.rego    # Production readiness gate
```

## The AiDevOps Pipeline

Every AI artifact must pass through governance gates before production:

- **YES** -> artifact proceeds to next gate
- **NO** -> triggers mandatory mitigation workflow
- **DISALLOWED** -> hard block, cannot proceed to production

Every decision is logged with full audit trail.

## Gates

1. **Pre-Development**: Use case registration, risk classification, stakeholder impact
2. **Data**: Provenance, consent, bias assessment, PII detection
3. **Model**: Fairness metrics, explainability, security testing, performance baselines
4. **Deployment**: Environment compliance, monitoring, rollback, human oversight
5. **Post-Production**: Continuous monitoring, incident response, periodic reassessment
6. **Human Flourishing**: Dignity, Equity, Delight assessment (the differentiator)

## Governance Bodies

- **Steward Council** (7-11 humans): Ratifies normative decisions
- **Technical Council** (5-9 humans): Release integrity and spec quality
- **Public Interest Panel** (rotating, stipended): Reviews high-impact gates
- **Partner Council** (non-voting): Vendor input without veto

## Built With (Lenny Product Pass Stack)

- **Orchestration**: n8n (Railway)
- **AI/Cognitive**: Perplexity Pro (Spaces, Shortcuts, Tasks)
- **Dev**: Replit, Lovable, Railway
- **Planning**: Linear
- **Analytics**: PostHog

## Get Involved

- Website: [aigovopsfoundation.org](https://www.aigovopsfoundation.org)
- Read the [Constitution](constitution.md)
- Review the [Roadmap](ROADMAP.md)
- Explore the [AiDevOps Spec](aidevops-spec/schema.json)
- Try the [Production Readiness Checklist](checklists/ai-production-readiness.v0.1.yaml)

## License

Apache 2.0 - See [LICENSE](LICENSE)
