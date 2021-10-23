metadata {
  path = "monitoring"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:OdD4+bvfoypTlxRKnI3vXwWpqnCQGvOz90OcuBuuEXQ="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:OdD4+bvfoypTlxRKnI3vXwWpqnCQGvOz90OcuBuuEXQ="
  retries = 1
}

step "terraform-output" {
  wkdir   = "monitoring"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "monitoring",
  ]

  sha     = "h1:OdD4+bvfoypTlxRKnI3vXwWpqnCQGvOz90OcuBuuEXQ="
  retries = 0
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "450c410fee8954db8ba09b2905b00a3f54fb6f8cd0f6f1d2114d00e5f63fc338"
  retries = 0
}

step "crds" {
  wkdir   = "monitoring"
  target  = "monitoring/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "monitoring",
  ]

  sha     = "h1:RVv+4M77PJRYVB6Y7EdMaGrG8GT6Pkxdgv50thEt2N4="
  retries = 0
}

step "bounce" {
  wkdir   = "monitoring"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "monitoring",
  ]

  sha     = "h1:eeZRLKWJM0uG1PMo2qXCYo41+tBAasD3boGLEEct+Jc="
  retries = 1
}
