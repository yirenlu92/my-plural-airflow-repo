metadata {
  path = "console"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Uuk2f7Ri1+OlwvCsuZhAquAZ+VFp/4Nc8Ujrq5HlDsw="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:Uuk2f7Ri1+OlwvCsuZhAquAZ+VFp/4Nc8Ujrq5HlDsw="
  retries = 1
}

step "terraform-output" {
  wkdir   = "console"
  target  = "console/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "console",
  ]

  sha     = "h1:Uuk2f7Ri1+OlwvCsuZhAquAZ+VFp/4Nc8Ujrq5HlDsw="
  retries = 0
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "5c9a92b31de22f306981737ed907dcb72bbf1c8f35f56bb403e24d515dea5d41"
  retries = 0
}

step "crds" {
  wkdir   = "console"
  target  = "console/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "console",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "console"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "console",
  ]

  sha     = "h1:CQhGqdBSzeoWYikRAFGsrov3GeRPPBu9M45OwM4ZBCM="
  retries = 1
}
