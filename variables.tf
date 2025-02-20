variable "subscription_id" {
  description = "The subscription ID to use for the tests"
  type        = string
  default     = "57124af2-ec2e-466c-a744-c046ea95c09a"

}

variable "region" {
  description = "The Azure region to use for the tests"
  type        = string
  validation {
    condition     = contains(["eastus", "westus", "centralus"], var.region)
    error_message = "Specify a valid Azure region."
  }
  
}

variable "kv_name" {
  description = "The name of the key vault to create"
  type        = string
  default     = "kv-hashitalks"
}