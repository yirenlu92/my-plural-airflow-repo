metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:ioBS07M9BnA63telJm29yj5TP0NYnzCwmFnBZWAQo2k="
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:ioBS07M9BnA63telJm29yj5TP0NYnzCwmFnBZWAQo2k="
}

step "terraform-output" {
  wkdir   = "bootstrap"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "bootstrap",
  ]

  sha = "h1:ioBS07M9BnA63telJm29yj5TP0NYnzCwmFnBZWAQo2k="
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "38ef5510d33378784a2f14c84c03b8a54cf65f6baa5a02423c381ee8c0371450"
}

step "crds" {
  wkdir   = "bootstrap"
  target  = "bootstrap/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "bootstrap",
  ]

  sha = "h1:ncb5hEQISc87jUrGZOozVbsStfhtYdj7AT/vPLGrqRI="
}

step "bounce" {
  wkdir   = "bootstrap"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "bootstrap",
  ]

  sha = "h1:K3WbNRSPs1wvE2jdPqpLRH4PQ2bKgtzcQIlOR8kYsCs="
}
