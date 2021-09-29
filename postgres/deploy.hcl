metadata {
  path = "postgres"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:XxB/kQDwEwn/+fBAk5KJqVTjvgOdnnDOQieBFYU9IaM="
}

step "terraform-apply" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:XxB/kQDwEwn/+fBAk5KJqVTjvgOdnnDOQieBFYU9IaM="
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

  sha = "h1:XxB/kQDwEwn/+fBAk5KJqVTjvgOdnnDOQieBFYU9IaM="
}

step "kube-init" {
  wkdir   = "postgres"
  target  = "postgres/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "96d7b0c6f18eef87324c69744f47b4f9564fa19b006c1c3e87587de6504b5f73"
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

  sha = "h1:jnQ61IDacdwE5K4EOyARpLkkJEoLbrmiqgewSEj6U54="
}
