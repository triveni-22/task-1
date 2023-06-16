resource "aws_instance" "terraform_server" {
    ami = "ami-01dd271720c1ba44f"
    instance_type = "t2.micro"
    key_name = "terraform-lb-eu-keypair"
    subnet_id = aws_subnet.terraform_subnet1.id
    associate_public_ip_address = true
    vpc_security_group_ids = ["${aws_security_group.terraform_sg.id}"]

    user_data = <<-EOF
    #! /bin/bash 
    apt install apache2 -y
    systemctl start apache2
    systemctl status apache2
    systemctl enable apache2
EOF
}