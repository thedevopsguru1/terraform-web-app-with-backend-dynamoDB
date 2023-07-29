resource "aws_security_group" "SG-loadbalancer" {
    name = "SG-loadbalancer"
    vpc_id = "${aws_vpc.example.id}"
    description = "Security group for the load-balancer"
    ingress {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow incoming HTTP traffic from anywhere"
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow incoming HTTPS traffic from anywhere"
    }

    egress {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        #security_groups = ["${aws_security_group.sg-web.id}"]
    }

    egress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
       # security_groups = ["${aws_security_group.sg-web.id}"]
    }

    tags = {
        Name = "SG-loadbalancers"
    }
}