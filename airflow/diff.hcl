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

  sha     = "02d7494255584341ca85d96e471d30679cfc57c1b2292bfb623cd3d8da2046d6"
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

  sha     = "h1:mX6Z4Le+EozPCWpcIq7w3LE0waV5gI2EhZFUuk0/0sQ="
  retries = 0
}
