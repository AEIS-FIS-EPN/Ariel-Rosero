//Modulo de VPC, hay que intanciarla dentro del directorio raiz. 
//La primera VPC que engloba a todas

resource "aws_vpc" "fis_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "FIS VPC"
  }
}

output "fis_vpc_id" {
  value = aws_vpc.fis_vpc.id
}
