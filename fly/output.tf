# output.tf

# Yeh block ek output variable define karta hai jiska naam "instance_ip" hai.
# Iska value hai public IP address jo Terraform ne create ki hui EC2 instance ko assign kiya hai.
output "instance_ip" {
  value       = aws_instance.debian_ec2.public_ip    # EC2 instance ka public IP
  description = "The public IP address of the instance"  # Output ki description
}

# Yeh block dusra output define karta hai jiska naam "instance_id" hai.
# Iska value hai AWS EC2 instance ka unique ID jo Terraform ne assign kiya hai.
output "instance_id" {
  value       = aws_instance.debian_ec2.id            # EC2 instance ka unique ID
  description = "The ID of the instance"               # Output ki description
}

##########################################################
# Is file ka use kaise karein:
# --------------------------------
# 1. Jab aap 'terraform apply' run karenge, 
#    Terraform aapko yeh output dikhaega — instance ka public IP aur instance ID.
#
# 2. Yeh info aapko SSH karne ya AWS console me identify karne mein help karegi.
#
# 3. Aap yeh outputs command line se bhi dekh sakte hain:
#      terraform output instance_ip     # Sirf public IP dekhne ke liye
#      terraform output instance_id     # Sirf instance ID dekhne ke liye
#
# 4. Yeh outputs aapke Terraform state file mein store hote hain, toh baar baar apply na karte hue bhi dekh sakte hain.
##########################################################
