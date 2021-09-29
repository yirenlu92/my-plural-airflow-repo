metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Veid1/y56yEzC0yh3c9vNCD2MLPdMHtmM7WZq/YMfKM="
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:Veid1/y56yEzC0yh3c9vNCD2MLPdMHtmM7WZq/YMfKM="
}

step "terraform-output" {
  wkdir   = "bootstrap"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "bootstrap",
  ]

  sha = "h1:Veid1/y56yEzC0yh3c9vNCD2MLPdMHtmM7WZq/YMfKM="
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "fc0b03a01765325e4d624cc80364d462ebf33ea406d333d975f79d77fdd38b75"
}

step "crds" {
  wkdir   = "bootstrap"
  target  = "bootstrap/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "bootstrap",
  ]

  sha = "h1:xm42buyGvWV89gLOOg/huHV6CCgBceotTN/N6cPS0oA="
}

step "bounce" {
  wkdir   = "bootstrap"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "bootstrap",
  ]

  sha = "h1:n4oLn7Bn7nkvZ1SzM3tOIpgVs99ADKLV805rp8mFghs="
}
