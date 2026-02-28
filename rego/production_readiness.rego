# AiGovOps Production Readiness Gate
# Open Policy Agent (OPA) Rego policy
# Enforces AI production readiness checklist before deployment
# License: Apache 2.0

package aigovops.production_readiness

import future.keywords.in
import future.keywords.every
import future.keywords.if

# Default deny deployment
default allow := false

# Allow deployment only if all required gates pass
allow if {
    pre_development_passed
    data_gate_passed
    model_gate_passed
    deployment_gate_passed
    flourishing_gate_passed
}

# Pre-Development Gate
pre_development_passed if {
    input.gates.pre_development.use_case_registered == true
    input.gates.pre_development.risk_classification != ""
    input.gates.pre_development.risk_classification != "unacceptable"
}

# Data Gate
data_gate_passed if {
    input.gates.data.provenance_documented == true
    input.gates.data.consent_verified == true
    input.gates.data.pii_handled == true
}

# Model Gate
model_gate_passed if {
    input.gates.model.security_tested == true
    input.gates.model.performance_baselined == true
}

# Deployment Gate
deployment_gate_passed if {
    input.gates.deployment.environment_compliant == true
    input.gates.deployment.monitoring_configured == true
    input.gates.deployment.rollback_tested == true
}

# Flourishing Gate - required for consumer-facing or high-risk systems
flourishing_gate_passed if {
    not requires_flourishing_gate
}

flourishing_gate_passed if {
    requires_flourishing_gate
    input.gates.flourishing.dignity_assessed == true
    input.gates.flourishing.equity_assessed == true
    input.gates.flourishing.gdr_id != ""
    input.gates.flourishing.human_approver != ""
}

requires_flourishing_gate if {
    input.system.scope in ["consumer-facing", "high-impact", "public-sector"]
}

requires_flourishing_gate if {
    input.system.risk_level in ["medium", "high"]
}

# Block reasons (for audit trail)
block_reasons[reason] if {
    not pre_development_passed
    reason := "Pre-development gate failed: missing use case registration or risk classification"
}

block_reasons[reason] if {
    not data_gate_passed
    reason := "Data gate failed: missing provenance, consent, or PII handling"
}

block_reasons[reason] if {
    not model_gate_passed
    reason := "Model gate failed: missing security testing or performance baselines"
}

block_reasons[reason] if {
    not deployment_gate_passed
    reason := "Deployment gate failed: environment, monitoring, or rollback not ready"
}

block_reasons[reason] if {
    requires_flourishing_gate
    not flourishing_gate_passed
    reason := "Flourishing gate failed: dignity/equity assessment or human approval missing"
}

# Audit output
result := {
    "allowed": allow,
    "block_reasons": block_reasons,
    "gates": {
        "pre_development": pre_development_passed,
        "data": data_gate_passed,
        "model": model_gate_passed,
        "deployment": deployment_gate_passed,
        "flourishing": flourishing_gate_passed,
    },
    "requires_flourishing": requires_flourishing_gate,
}
