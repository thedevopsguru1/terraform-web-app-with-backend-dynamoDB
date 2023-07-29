resource "aws_instance" "BASTIONHOST_B" {
    ami = "ami-0cc87e5027adcdca8"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.public-bastion.id}"
    key_name = "anael1"
    associate_public_ip_address = "true"
    vpc_security_group_ids = ["${aws_security_group.SG-bastionhosts.id}"]
    tags = {
        Name = "Batsion-ec2"
       
    }
}
