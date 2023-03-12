resource "aws_internet_gateway" "main-gateway" {
    vpc_id = aws_vpc.main_vpc.id
  
  tags = {
    Name= "main-gateway"
  }
} 