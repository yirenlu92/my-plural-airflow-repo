metadata {
  path = "monitoring"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:OdD4+bvfoypTlxRKnI3vXwWpqnCQGvOz90OcuBuuEXQ="
  retries = 0
}

step "terraform" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "monitoring",
  ]

  sha     = "450c410fee8954db8ba09b2905b00a3f54fb6f8cd0f6f1d2114d00e5f63fc338"
  retries = 0
}

step "helm" {
  wkdir   = "monitoring/helm"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "monitoring",
  ]

  sha     = "h1:eeZRLKWJM0uG1PMo2qXCYo41+tBAasD3boGLEEct+Jc="
  retries = 0
}
