metadata {
  path = "airflow"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "airflow/terraform"
  target  = "airflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:EZ9QB8JmM6n/Nv5QiLtheNdKQx2O9+E2SV11XH6OULc="
}

step "terraform-apply" {
  wkdir   = "airflow/terraform"
  target  = "airflow/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:EZ9QB8JmM6n/Nv5QiLtheNdKQx2O9+E2SV11XH6OULc="
}

step "terraform-output" {
  wkdir   = "airflow"
  target  = "airflow/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "airflow",
  ]

  sha = "h1:EZ9QB8JmM6n/Nv5QiLtheNdKQx2O9+E2SV11XH6OULc="
}

step "kube-init" {
  wkdir   = "airflow"
  target  = "airflow/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "704b847e9b2d7fa2776def613b7060fbb7980839503e7db514bb67171be14ca6"
}

step "crds" {
  wkdir   = "airflow"
  target  = "airflow/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "airflow",
  ]

  sha = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
}

step "bounce" {
  wkdir   = "airflow"
  target  = "airflow/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "airflow",
  ]

  sha = "h1:NobHEeRTx16Qdr4BXIEw2V148/fjLNwwIpMpJBpI+dE="
}
