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

  sha     = "918ba0a2f4b53b0f73eaecc0bee67bedf6fb5ffb4b0d3d278439cccad215886a"
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

  sha     = "h1:On4jDy/UEPjj6Iqj9Y0B0OIdMxfNh5SrghnOV3FYmhA="
  retries = 0
}
