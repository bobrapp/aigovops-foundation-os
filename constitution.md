# AiGovOps Foundation Constitution

> Version 0.1 | Effective: 2026-02-28 | Status: DRAFT
> Ratified by: [Pending Steward Council ratification]

## Preamble

The AiGovOps Foundation exists to make AI safer and more beneficial for humanity by turning ambiguous governance policy into executable procedure enforced as code. We believe governance belongs in the delivery pipeline, not in a separate policy silo. We operate as an agent-native, human-souled institution: agents do the bureaucracy; humans hold moral legitimacy.

## Article I: Mission

AiGovOps makes AI safer and more beneficial by turning ambiguous policy into executable "policy as procedure," enforced as code in the delivery pipeline (AiDevOps), with evidence and audit trails by default.

## Article II: Core Principles

### 2.1 Agent-Native Operations
Agents handle bureaucratic, procedural, and repetitive work: drafting, synthesis, mapping, formatting, translation, scheduling, release management, and compliance checks.

### 2.2 Human-Souled Legitimacy
Humans hold exclusive authority over moral judgment, lived experience, contextual wisdom, dissent, meaning-making, and all normative decisions.

### 2.3 Governance as Code
All governance policies are expressed as machine-readable code (YAML/JSON/Rego) stored in version-controlled repositories, enforced in CI/CD pipelines, and auditable by default.

### 2.4 Vendor Neutrality
No single vendor, funder, or member may exercise veto power over specifications, checklists, or normative decisions. Revenue concentration from any single source must not exceed 25%.

### 2.5 Human Flourishing
Governance is not only about preventing harm. We explicitly optimize for dignity, equity, and delight in AI systems.

### 2.6 Radical Transparency
Board minutes, financial reports, specification development, and Decision Card deliberations are published openly.

## Article III: Human-Only Decision Rights

The following decisions require human ratification and CANNOT be delegated to agents:

1. **Normative standards**: Defining what MUST, SHALL, or DISALLOWED means in any specification or checklist.
2. **Ethics boundaries**: Determining what constitutes harm, benefit, dignity, or flourishing.
3. **Trust-granting**: Certifying platforms, enterprises, or practitioners.
4. **Exception approval**: Granting any exception to a DISALLOWED gate.
5. **Conflict adjudication**: Resolving disputes between contributors, members, or councils.
6. **Constitutional amendments**: Any change to this document.
7. **Flourishing Gate criteria**: Defining or modifying the Dignity, Equity, and Delight dimensions.
8. **DISALLOWED category definitions**: Adding or removing items from hard-block lists.
9. **Membership and partnership terms**: Granting or revoking Premier membership status.
10. **Budget allocation for public interest**: Directing funds for stipends, translations, and accessibility.

**Rule: Agents may draft anything; only humans may ratify norms, adjudicate value conflicts, grant trust status, or approve exceptions.**

## Article IV: Decision Cards

All institutional decisions are recorded as Governance Decision Records (GDRs), following an ADR-inspired format stored in Git.

**Design rule: If it is not in a Decision Card, it did not happen.**

GDRs are mandatory for: spec changes, checklist changes, certification curriculum changes, partner program rules, neutrality/conflict-of-interest decisions, DISALLOWED category definitions, and Flourishing Gate modifications.

## Article V: Governance Bodies

### 5.1 Steward Council (7-11 humans)
Ratifies all normative decisions. Elected by the community for 2-year staggered terms. Must include at least 2 members from underrepresented geographies.

### 5.2 Technical Council (5-9 humans)
Owns release integrity, spec compatibility, and reference implementation quality. Appointed by Steward Council with community input.

### 5.3 Public Interest Panel (rotating, stipended)
Reviews high-impact gates and DISALLOWED categories. Can force re-deliberation when impacted voices are missing. Funded via Public Interest Sponsorship.

### 5.4 Partner Council (non-voting)
Vendors and service providers provide input but have no veto power over any specification or normative decision.

## Article VI: Contribution and Dignity

All contributions are captured with consent. Contributors may:
- Choose voice memo, short call, or text input
- Request "summarize only / do not record" mode
- Use pseudonyms
- Exercise right-to-retract testimony

Default publication is summary + decision, never raw recordings without explicit consent.

## Article VII: Agent Governance

Agents operating within the Foundation OS:
- Must have a named human owner
- Must log all actions with operation ID, timestamp, model, and artifact references
- Must operate at defined autonomy levels (Assist, Execute Bounded, Optimize)
- Must be promotable/pausable/revertable based on quality scorecards
- Must never ratify normative decisions

## Article VIII: Amendments

This constitution may only be amended by a 2/3 supermajority of the Steward Council, with a mandatory 30-day public comment period, documented in a GDR with a completed Dissent Appendix.

---

*This constitution is itself governed by the principles it establishes. It is stored as code, versioned in Git, and subject to the same transparency and audit requirements as all AiGovOps artifacts.*
