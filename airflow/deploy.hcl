metadata {
  path = "airflow"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "airflow/terraform"
  target  = "airflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:bHMm6C0s7ysi8Dj0+Em4LlB91OIHPGU3dXTqn8gVLB0="
}

step "terraform-apply" {
  wkdir   = "airflow/terraform"
  target  = "airflow/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:bHMm6C0s7ysi8Dj0+Em4LlB91OIHPGU3dXTqn8gVLB0="
}

step "terraform-output" {
  wkdir   = "airflow"
  target  = "airflow/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "airflow",
  ]

  sha = "h1:bHMm6C0s7ysi8Dj0+Em4LlB91OIHPGU3dXTqn8gVLB0="
}

step "kube-init" {
  wkdir   = "airflow"
  target  = "airflow/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "c1e0d1acad869f2629539814f6c78657cb5d70a24b2bf77f470219697ec42c92"
}

step "crds" {
  wkdir   = "airflow"
  target  = "airflow/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "airflow",
  ]

  sha = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
}

step "bounce" {
  wkdir   = "airflow"
  target  = "airflow/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "airflow",
  ]

  sha = "h1:gTYUKuGDq1bcxKbF4aE8C/0P4jzttDaiZ4e2d5bYUV8="
}
