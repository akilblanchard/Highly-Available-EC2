#Launch Template to create instances upon for asg
resource "aws_launch_template" "launch_template" {

  name = "launch_template"

  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = "key-pair"

  user_data = filebase64("${path.module}/script.sh")

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 8
      volume_type = "gp2"
    }
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.my_security.id]
  }
}