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

  sha     = "32db917fb042988d61a90f7da8691e16cd1f9667a353e5048d890047f5b45a60"
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

  sha     = "h1:FoMLwYcavaUl3pQ0WAKy37xfht/5C+Q16URJvBLEJ2g="
  retries = 0
}
