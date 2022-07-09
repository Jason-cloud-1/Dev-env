module "ssh-key-pair" {
  source = "./module/keypair"
}

module "ec2" {
  source = "./module/ec2"

  ssh-key-pair-name = module.ssh-key-pair.key-pair-name
  ssh-private-key   = module.ssh-key-pair.key-pair-private-ssh-key
  instance_type     = var.instance_type

}