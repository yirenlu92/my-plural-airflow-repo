metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Uuk2f7Ri1+OlwvCsuZhAquAZ+VFp/4Nc8Ujrq5HlDsw="
  retries = 0
}

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "console",
  ]

  sha     = "f45371ff503258f3f73c947fd875adc5c96c2f3b4c4c96bd7e25047116b9ce6d"
  retries = 0
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha     = "h1:d79gNqfBOwu7C25XfBztylzpDikU9p+Zjil6sxwsyT8="
  retries = 0
}
