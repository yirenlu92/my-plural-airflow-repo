metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:3uopQvvAlCI/CMXRjhT/nYyGSL2piBJ3enRxhyQ5DKY="
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:3uopQvvAlCI/CMXRjhT/nYyGSL2piBJ3enRxhyQ5DKY="
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

  sha = "h1:3uopQvvAlCI/CMXRjhT/nYyGSL2piBJ3enRxhyQ5DKY="
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "aa2965e7955864cc73b1ddd4a9046b9f94948d7ff9148544cf96047ffe626aa9"
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

  sha = "h1:ejyj1K9gKuQWHVNbBkNR1IPuQsqQesDA0O6wjinYWYw="
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

  sha = "h1:C1jsTQFamxrihJMaa5gf4rOo5TJ0niMPtKqqMD3grs0="
}
