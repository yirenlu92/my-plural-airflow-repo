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

  sha     = "7706d9271a49a08499393a30d33d218fc3451de2edf3d3646458552d87d2ad39"
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

  sha     = "h1:mGZHvJ1vt6ghA1euVGzWpeQnK8MX7IRxpD9BGScZ6XM="
  retries = 0
}
