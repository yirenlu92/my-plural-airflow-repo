metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:LecVJADlbrgc6U5QOgMxeeRDwLbmT9adzFL3wBYMft0="
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

  sha     = "h1:LecVJADlbrgc6U5QOgMxeeRDwLbmT9adzFL3wBYMft0="
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

  sha     = "a2f1275597274c693db27dfeff55da3374a0bd5f4929958482effe6730288baa"
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

  sha     = "h1:+lmAIDynAnfCd/QMvLpcVUVqTs92QxDS7kXryxMTOmg="
  retries = 0
}
