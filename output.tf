output "private-ssh-key" {
  value     = module.ssh-key-pair.key-pair-private-ssh-key
  sensitive = true
}
output "key-pair-filename" {
  value = module.ssh-key-pair.key-pair-filename
}

output "public_ip" {
  value = module.ec2.public-ip
}