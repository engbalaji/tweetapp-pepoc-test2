package kubernetes.admission

deny[msg] {
    input.request.kind.kind == "Deployment"
    replicas := input.request.object.spec.replicas
    replicas > 5
    msg := sprintf("The number of replicas (%v) is greater than the maximum allowed (5)", [replicas])
}