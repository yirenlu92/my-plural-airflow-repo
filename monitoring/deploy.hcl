metadata {
  path = "monitoring"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:E8LSpUNO3YjAHGjdvqmHBLLRHaCKzQlaS2v0eiA7r5w="
}

step "terraform-apply" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:E8LSpUNO3YjAHGjdvqmHBLLRHaCKzQlaS2v0eiA7r5w="
}

step "terraform-output" {
  wkdir   = "monitoring"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "monitoring",
  ]

  sha = "h1:E8LSpUNO3YjAHGjdvqmHBLLRHaCKzQlaS2v0eiA7r5w="
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "82aab5c5c81b26659dffd23ff627501c88510552eaed4e89308dddf215a3f524"
}

step "crds" {
  wkdir   = "monitoring"
  target  = "monitoring/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "monitoring",
  ]

  sha = "h1:K58dC3a4uKoc98YPgcUCmIk1x9AmL+g+vaBThWgPFCU="
}

step "bounce" {
  wkdir   = "monitoring"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "monitoring",
  ]

  sha = "h1:oDgtDvEC6WXE+hv9hRQB0jFhBDGdT4oWJl83sSHQteQ="
}
