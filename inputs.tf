# vpc variable
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "this is cidr range for vpc" # for dynamic nature creating variables this inputs file
}

# subnet variable

variable "subnames" {
  type    = list(string)
  default = ["web1", "app2"]

}

# security grp rules
     
     # dev rules 
variable "dev_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type        = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = string
    }))
  })
  default = {
    name        = "dev"
    description = "this security grp"
    rules = [{
      type        = "ingress"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      },
      {
        type        = "ingress"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = "0.0.0.0/0"
        }, {
        type        = "ingress"
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = "0.0.0.0/0"
    }]
  }

}

# pro rules 

variable "pro_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type        = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = string
    }))
  })
  default = {
    name        = "pro"
    description = "this security grp"
    rules = [{
      type        = "ingress"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      },
      {
        type        = "ingress"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = "0.0.0.0/0"
        }, {
        type        = "ingress"
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = "0.0.0.0/0"
    }]
  }

}

# creating variable for keypair 

variable "public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"

}

# creating variable for ami 
variable "ubuntu_ami_id" {
  type    = string
  default = "ami-0c7217cdde317cfec"

}

# variable for instance size 


variable "app_ec2_size" {
  type    = string
  default = "t2.micro"
}
