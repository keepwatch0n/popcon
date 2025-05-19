# AWS provider specify kar rahe hain aur region set kar rahe hain jahan resources create honge
provider "aws" {
  region = var.region  # AWS region (jaise us-east-1), yeh variable se aayega
}

# EC2 instance create kar rahe hain jiska naam "debian_ec2" hai
resource "aws_instance" "debian_ec2" {
  ami                         = var.ami_id           # Debian AMI ID, variable se aayega
  instance_type               = var.instance_type    # EC2 ka instance type (jaise t2.micro), variable se aayega
  key_name                    = var.key_name         # AWS key pair ka naam jisse aap SSH karenge
  associate_public_ip_address = true                 # Public IP de rahe hain taaki SSH kar saken
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]  # Security group jisme SSH allowed hai

  tags = {
    Name = "Debian-Terraform-EC2"   # AWS console mein instance ka naam dikhane ke liye tag
  }
}

# Security group define kar rahe hain jo SSH access allow karega
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"                    # Security group ka naam
  description = "Allow SSH inbound traffic"   # Security group ki description

  # Inbound rule: port 22 (SSH) ko allow kar rahe hain sabhi IPs se
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # WARNING: Yeh sabhi IPs se SSH allow karta hai, security ke liye apni IP ya specific CIDR use karein
  }

  # Outbound rule: sabhi outgoing traffic allowed hai
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"             # -1 matlab sab protocols allowed hain
    cidr_blocks = ["0.0.0.0/0"]
  }
}

########################################################
# Is script ko kaise use karein:
# 1. Ek file banayein 'variables.tf' naam se aur variables define karein:
#
# variable "region" {
#   description = "AWS region jahan deploy karna hai"
#   default     = "us-east-1"
# }
#
# variable "ami_id" {
#   description = "Debian AMI ka ID"
# }
#
# variable "instance_type" {
#   description = "EC2 instance ka type"
#   default     = "t2.micro"
# }
#
# variable "key_name" {
#   description = "AWS EC2 key pair ka naam SSH ke liye"
# }
#
# 2. Terraform initialize karein working directory mein:
#    terraform init
#
# 3. Deployment plan dekhein:
#    terraform plan -var="region=us-east-1" -var="ami_id=ami-0abcdef1234567890" -var="key_name=apka-key-name"
#
# 4. Resources create karne ke liye apply karein:
#    terraform apply -var="region=us-east-1" -var="ami_id=ami-0abcdef1234567890" -var="key_name=apka-key-name"
#
# 5. Deploy hone ke baad, aap SSH se connect kar sakte hain apne EC2 instance mein.
#
# 6. Kaam khatam hone par resources delete karne ke liye:
#    terraform destroy -var="region=us-east-1" -var="ami_id=ami-0abcdef1234567890" -var="key_name=apka-key-name"
########################################################
