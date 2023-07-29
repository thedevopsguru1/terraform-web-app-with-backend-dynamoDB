resource "aws_eip" "eip-ip" {
 #instance = aws_instance.web.id
  vpc      = true
}