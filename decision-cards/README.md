# Governance Decision Records (GDRs)

This directory contains the institutional memory of the AiGovOps Foundation.

## What is a GDR?

A Governance Decision Record is an ADR-inspired document that captures every normative decision made by the foundation. It follows the principle: **If it is not in a Decision Card, it did not happen.**

## Schema

See `schema.json` for the formal JSON Schema definition.

## Required Fields

| Field | Description |
|-------|-------------|
| `id` | Unique ID (GDR-0001 format) |
| `title` | Human-readable title |
| `status` | proposed / accepted / deprecated / superseded |
| `type` | Category determining approval requirements |
| `authors` | Who drafted this GDR |
| `created_at` | ISO 8601 date |
| `context` | What forces are at play |
| `decision` | What change is proposed |
| `consequences` | What becomes easier/harder |

## Optional But Encouraged

- `flourishing` - Dignity/Equity/Delight assessment (required for normative types)
- `dissent` - Minority viewpoints and rationale
- `regulatory_mapping` - NIST AI RMF, ISO 42001, EU AI Act traceability
- `policy_files` - Affected policy YAML/JSON paths
- `automation_refs` - n8n workflow IDs, Perplexity Shortcut IDs

## Decision Types and Required Approvals

| Type | Approver |
|------|----------|
| `spec-change` | Technical Council |
| `checklist-change` | Technical Council |
| `disallowed-definition` | Steward Council |
| `flourishing-gate-change` | Steward Council |
| `certification-change` | Steward Council + Technical Council |
| `constitutional-amendment` | Steward Council (2/3 supermajority) |
| `operational` | Named human owner |

## Naming Convention

Files: `GDR-NNNN-short-title.md` (e.g., `GDR-0001-adopt-constitution.md`)

## Creation Pipeline

1. Human captures discussion (voice memo, call, text)
2. Scribe Agent drafts GDR from transcript
3. Human edits, adds flourishing/dissent sections
4. PR opened with GDR file
5. Required approvers review and ratify
6. n8n commits final GDR, tags with issue/workflow links
