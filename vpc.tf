#Virtual Private Cloud component
resource "aws_vpc" "main_vpc" {
    cidr_block = var.main_vpc


tags = {
    name = "app-vpc"
 }
}
