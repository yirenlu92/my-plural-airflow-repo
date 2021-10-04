metadata {
  path = "monitoring"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:KHpiJ87YE5R6czA/8WBed+vemw8BYFTYdmfW1yJIUUs="
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

  sha     = "h1:KHpiJ87YE5R6czA/8WBed+vemw8BYFTYdmfW1yJIUUs="
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
  ]

  sha     = "c42fbb6c4d1b8ce3c7aa51d600e16d66b1e46ff2d71d52fb09e49938953abbfb"
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

  sha     = "h1:a5MJx9y3dR9n4/cHPNrzc4T8EvhMMovRHMDJJFgVmh4="
  retries = 0
}
