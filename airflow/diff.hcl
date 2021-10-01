metadata {
  path = "airflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "airflow/terraform"
  target  = "airflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:ovVSdZh7FvPEsGr/hN41ufOqMtTOhhKps1ZT/Ua8aYo="
  retries = 0
}

step "terraform" {
  wkdir   = "airflow/terraform"
  target  = "airflow/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "airflow",
  ]

  sha     = "h1:ovVSdZh7FvPEsGr/hN41ufOqMtTOhhKps1ZT/Ua8aYo="
  retries = 0
}

step "kube-init" {
  wkdir   = "airflow"
  target  = "airflow/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "airflow",
  ]

  sha     = "1e44f2e610ff87d3ea8f0d176027c546e8df5215830ff889664a5ac4ee520b8d"
  retries = 0
}

step "helm" {
  wkdir   = "airflow/helm"
  target  = "airflow/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "airflow",
  ]

  sha     = "h1:1PncwpDNBmsDW9J+VU4yEAO0LcSA8o1aTGpnBO+VVu8="
  retries = 0
}
