locals {
  common_tags = {
      owner = "Nir and Tomer"
      usage = "Podify"
  }

  vpc_name       = "Podify"
  vpc_cidr_block = "10.20.0.0/16"
  public_subnets = ["10.20.0.0/20", "10.20.16.0/20", "10.20.32.0/20"]
  ami = "ami-04fb94b3991bc696f" # change to your own AMI
}