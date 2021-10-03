metadata {
  name = "console"
}

scaffold "terraform" {
  path = "terraform"
  type = "terraform"
}

scaffold "crds" {
  path = "crds"
  type = "crd"
}

scaffold "helm" {
  path = "helm/console"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "5cb558ba3f15e31e92546edf8d6bd77df8d0bb97708d25fe98831026cf079e7c"
    retries = 0
  }
}
