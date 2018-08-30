#-------------------------------
# Locals
#-------------------------------
locals {
  create_alb      = "${!var.spinnaker_managed && !var.on_prem ? 1 : 0}"

  blah       = "${var.spinnaker_managed && !var.on_prem? 1 : 0}"

  foo = "${local.blah ? 5 : 0}"
}

