
# Conditionals
variable "spinnaker_managed" {
  description = "Flag that decides if the VM creation is managed by Spinnaker or Terraform"
  default     = false
}

variable "on_prem" {
  description = "Flag that decides if Audit service is deployed on-prem or on cloud"
  default     = false
}

