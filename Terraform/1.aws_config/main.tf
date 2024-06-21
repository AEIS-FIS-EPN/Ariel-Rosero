//Provider .- Es un plugin que permite a Terraform interactuar con un proveedor de nube, como AWS, Azure, Google Cloud, etc.

provider "aws" {
  shared_config_files = "C:/Users/pc/.aws/config"
  shared_credentials_files = "C:/Users/pc/.aws/credentials"
}

