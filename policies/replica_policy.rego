package env0

deny[msg] {
    input.request.kind.kind == "Deployment"
    replicas := input.request.object.spec.replicas
    replicas > 3
    msg := sprintf("The number of replicas (%v) is greater than the maximum allowed (3)", [replicas])
}

allow {
    input.request.kind.kind == "Deployment"
    replicas := input.request.object.spec.replicas
    replicas <= 3
}