metadata {
  path = "postgres"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:GQiGiAH8LlRNF+29w8qPr3cMCRUJFiNJQpoc66fTnfA="
  retries = 0
}

step "terraform" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "postgres",
  ]

  sha     = "h1:GQiGiAH8LlRNF+29w8qPr3cMCRUJFiNJQpoc66fTnfA="
  retries = 0
}

step "kube-init" {
  wkdir   = "postgres"
  target  = "postgres/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "postgres",
  ]

  sha     = "99e979a1b05340f5388c51c4a142efdbd0dfea95a654200f3f99e0b5fc9d636f"
  retries = 0
}

step "helm" {
  wkdir   = "postgres/helm"
  target  = "postgres/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "postgres",
  ]

  sha     = "h1:XZThDLjtRoWG9EdW8kdx/GTrjf+gG995mePcoo+8DuM="
  retries = 0
}
