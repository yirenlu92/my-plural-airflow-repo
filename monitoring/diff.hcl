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

  sha     = "b65613bb419c1b7ff5da92a07cc725e7308fc5931394a6abed86d7ec80af83f2"
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

  sha     = "h1:/Ny7GnmUMR50Sfj84VlcprCGiGFZI1VueIMvs1rpUeg="
  retries = 0
}
