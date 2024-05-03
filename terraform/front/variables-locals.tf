locals {
  common_tags = {
      owner = "Nir and Tomer"
      usage = "Podify"
  }
  vpc_name       = "Podify"
  vpc_cidr_block = "10.10.0.0/16"
  public_subnets = ["10.10.0.0/20", "10.10.16.0/20", "10.10.32.0/20"]

  ami = "ami-0004c36d1930a15e6"
}