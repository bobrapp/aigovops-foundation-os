# AiGovOps Foundation Governance

## Governance Bodies

### Steward Council (7-11 members)
- **Role**: Ratifies all normative decisions
- **Term**: 2-year staggered terms
- **Election**: Community vote
- **Requirement**: At least 2 members from underrepresented geographies
- **Decisions**: DISALLOWED categories, Flourishing Gate criteria, ethics boundaries, constitutional amendments (2/3 supermajority), membership terms, public interest budget

### Technical Council (5-9 members)
- **Role**: Release integrity, spec compatibility, reference implementation quality
- **Appointment**: By Steward Council with community input
- **Decisions**: Spec changes, checklist changes, tooling standards

### Public Interest Panel (rotating, stipended)
- **Role**: Reviews high-impact gates and DISALLOWED categories
- **Power**: Can force re-deliberation when impacted voices are missing
- **Funding**: Public Interest Sponsorship (no decision rights attached to sponsors)

### Partner Council (non-voting)
- **Role**: Vendor and service provider input
- **Power**: Advisory only; no veto over specifications or normative decisions

## Conflict of Interest Policy

- All council members must disclose financial relationships with AI vendors
- Members must recuse from votes where they have a material conflict
- COI disclosures are published in the GDR for each decision
- No single vendor/funder may represent >25% of total revenue

## Decision-Making Process

1. **Proposal**: Any community member may propose a GDR
2. **Agent Draft**: Scribe/Mapper agents create structured draft from input
3. **Human Review**: Appropriate council reviews, edits, adds flourishing/dissent
4. **Public Comment**: 14-day comment period for spec/checklist changes; 30-day for constitutional
5. **Ratification**: Council vote per decision type requirements
6. **Publication**: Merged to main, changelog updated, community notified

## Agent Autonomy Levels

| Level | Name | Permissions | Example |
|-------|------|-------------|--------|
| 0 | Assist | Draft artifacts, never merge/send | Scribe Agent creating GDR draft |
| 1 | Execute Bounded | Open PRs, tag reviewers, update labels | Release Agent updating changelog |
| 2 | Optimize | Choose templates, suggest mappings | Mapper Agent selecting framework refs |

**Constitutional rule**: Agents NEVER ratify normative decisions regardless of autonomy level.

## Transparency

- Board meeting summaries published within 7 days
- Financial reports published quarterly
- All GDRs are public by default
- Specification development is conducted in public GitHub repos
