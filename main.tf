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
  ami = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_ssh.id]
#input a key-pair name if you'd like in ""
  #key_name = ""

#Input a file that will deploy Jenkins in user_data 
user_data = "${file("deploy.sh")}"

#The new name of the server 
  tags = {
    "Name" : "tf_practice"
  }

}
