//Acceso a las credenciales

provider "aws" {
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
}

//Modulos

module "vpc" {
  source = "./modules/vpc"
}

module "subnet" {
  source = "./modules/subnet"
  //depends_on = [  ] //No se va a crear hasta que algo mas exista
  vpc_id = module.vpc.fis_vpc_id
}

module "security_groups" {
  source     = "./modules/security_group"
  fis_vpc_id = module.vpc.fis_vpc_id
}

module "network_interface" {
  source           = "./modules/network_interface"
  subnet_id        = module.subnet.subnet_id
  web_server_sg_id = module.security_groups.web_server_sg_id
}

module "ec2_instances" {
  source                             = "./modules/ec2_instances"
  aeis_network_interface_id          = module.network_interface.aeis_network_interface_id
  depends_on                         = [module.network_interface]
  aeis_network_interface_private_ips = module.network_interface.aeis_network_interface_private_ips
}

module "ecr" {
  source = "./modules/ecr"
}

//Salidas

output "public_ip" {
  value = module.ec2_instances.public_aeis_ip
  description = ""
}

output "private_ip" {
  value = module.ec2_instances.private_aeis_ip
  description = ""
}

output "url_ecr_repository_aeis" {
  value = module.ecr.url_ecr_repository_aeis
  description = ""
}


//Es complejo leer todo el documento, porque se estan creando muchos objetos en el mismo archivo. 
//Para solo levantar la VPN se suele eliminar o comentar los otros objetos.

//Se debe segmentar la logica del Terraform en base a modulos, se hara en forma de archivos. 




