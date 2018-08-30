
output "create_alb" {
  value = "${local.create_alb}"
}

output "blah" {
  value = "${local.blah}"
}

output "foo" {
  value = "${local.foo}"
}

output "spinnaker_managed_value"{
  value = "${var.spinnaker_managed}"
}

output "on_prem_value"{
  value = "${var.on_prem}"
}
