
#importing existing key

resource "aws_key_pair" "private" {
  key_name = "terra_key"
  #using file function 
  public_key = file(var.public_key_path) #file("~/.ssh/id_rsa.pub")
  tags = {
    createdby = "terra_instances_key"
  }
}
