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

  sha     = "942b29314e01089fc2cb9c1e5bb1917f1e58d2b57f49a73fa0e69dd73bd3f648"
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

  sha     = "h1:IeoG0IooJtOJOLguxpfeMBYdX4x7sGwLTTzZdq5B98g="
  retries = 0
}
