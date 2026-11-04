variable "cluster_name" {
  type = string
}

variable "region" {
  type = string
}

variable "node_type" {
  type    = string
  default = "t3.micro"
}
