variable "tags" {
  description = "Define the tags to be applied to the resources"
  default = {
    Enevrionment = "Dev"
    Deployment = "Terraform"
    Workload = "Networking"
  }
}