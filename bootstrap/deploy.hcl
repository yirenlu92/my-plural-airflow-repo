metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:4+lOZZDk8ISSKbEpFNVUD2f0sxrQ5QtdTfrflqcEV5s="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:4+lOZZDk8ISSKbEpFNVUD2f0sxrQ5QtdTfrflqcEV5s="
  retries = 1
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

  sha     = "h1:4+lOZZDk8ISSKbEpFNVUD2f0sxrQ5QtdTfrflqcEV5s="
  retries = 0
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "8be0a749c58d801f3914e4fa35217d6bc49c89884d4eb2c09db1dbfcae7335ca"
  retries = 0
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

  sha     = "h1:MP4FGRK7DYfJHQZZ97swhR4uU0T0wInfmyrUR4O2j+c="
  retries = 0
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

  sha     = "h1:M6wkRVH0tmm1cQtWBhqTioMNdkRRvUXamq3aAy5zJTU="
  retries = 0
}
