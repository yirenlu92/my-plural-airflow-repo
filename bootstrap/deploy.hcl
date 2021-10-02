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

  sha     = "1c4aee327f6f731ce72f209477f80666b61fc8b89d289030e0e40317aa5b897a"
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

  sha     = "h1:xm42buyGvWV89gLOOg/huHV6CCgBceotTN/N6cPS0oA="
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

  sha     = "h1:DxdQcPuuiXT08tODpm8Mbf0HytKds0YGx2+csYpFJf8="
  retries = 0
}
