#Virtual Private Cloud component
resource "aws_vpc" "main" {
    cidr_block = var.main


tags = {
    name = "app-vpc"
 }
}
