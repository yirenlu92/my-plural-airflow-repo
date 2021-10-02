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

  sha     = "4134dadbfa4e7950f6df8c427f672e4232f193cf60799c66d87862232d372bae"
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

  sha     = "h1:q4jzbyEfXcy2m24FhhylqdwIcQ/fwoDVRP7os+FZhL0="
  retries = 0
}
