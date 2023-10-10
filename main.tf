# configure aws provider
provider "aws" {
#provide your aws credentials in ""
  access_key = ""
  secret_key = ""
#You can change the region based on wherever you're located  
  region = "us-east-1"
  #profile = "Admin"
}

# create instance
resource "aws_instance" "web_server01" {
  ami = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_ssh.id]
  #key_name = "ubuntuSandbox"
