metadata {
  path = "monitoring"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:KHpiJ87YE5R6czA/8WBed+vemw8BYFTYdmfW1yJIUUs="
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

  sha     = "h1:KHpiJ87YE5R6czA/8WBed+vemw8BYFTYdmfW1yJIUUs="
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

  sha     = "c42fbb6c4d1b8ce3c7aa51d600e16d66b1e46ff2d71d52fb09e49938953abbfb"
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

  sha     = "h1:a5MJx9y3dR9n4/cHPNrzc4T8EvhMMovRHMDJJFgVmh4="
  retries = 0
}
