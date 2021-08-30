metadata {
  path = "postgres"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:gZUur2uDooDAc1io5R5BGiMXF78GvigDdB6zO0d40ok="
}

step "terraform-apply" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:gZUur2uDooDAc1io5R5BGiMXF78GvigDdB6zO0d40ok="
}

step "terraform-output" {
  wkdir   = "postgres"
  target  = "postgres/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "postgres",
  ]

  sha = "h1:gZUur2uDooDAc1io5R5BGiMXF78GvigDdB6zO0d40ok="
}

step "kube-init" {
  wkdir   = "postgres"
  target  = "postgres/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "5bd7d1d5d97383506c274962c415186643755d36c9b423b8c48bdb65bd5f0968"
}

step "crds" {
  wkdir   = "postgres"
  target  = "postgres/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "postgres",
  ]

  sha = "h1:+KtpiGhaAg9Db5EdGawKjfUTQqpyrQFC87h9Gj2L/zQ="
}

step "bounce" {
  wkdir   = "postgres"
  target  = "postgres/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "postgres",
  ]

  sha = "h1:if79HE2dW8EbNGYDdzrxdnqHoKSG45PSLxOVvKVrXMg="
}
