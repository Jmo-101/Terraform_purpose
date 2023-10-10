# configure aws provider
provider "aws" {
#provide your aws credentials in ""
  access_key = ""
  secret_key = ""
#You can change the region based on wherever you're located  
  region = "us-east-1"
}

# create instance
resource "aws_instance" "web_server01" {
  ami = "ami-053b0d53c279acc90"
#select an instance type eg. t2.micro, t2.medium
  instance_type = "t2.micro"
  #vpc_security_group_ids = [aws_security_group.web_ssh.id]
#include a subnet id to reference an existing vpc
subnet_id = ""
#input a key-pair name if you'd like in ""
  #key_name = ""


#Input a file that will deploy Jenkins/vs code in user_data(make sure its a .sh script eg."deploy.sh") 
user_data = "${file("")}"

  tags = {
    "Name" : "tf_practice"
  }

}

output "instance_ip" {
  value = aws_instance.web_server01.public_ip
}
