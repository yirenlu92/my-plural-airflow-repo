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

  sha     = "4cb022093fed829c3a9b1b74d182f13d59cd71b76438e44e3aa3647ca7e52cd5"
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

  sha     = "h1:+hFxyefAWVeMlGHszYIuGEXbZnDGC3r7xxE1mZzix7I="
  retries = 0
}
