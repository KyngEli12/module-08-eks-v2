variable "region" {
  type    = string
  default = "us-east-1"
}

variable "cluster_name" {
  type    = string
  default = "eli-eks-lab"
}

variable "node_type" {
  type    = string
  default = "t3.micro"
}
