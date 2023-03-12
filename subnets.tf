#Three public subnets in Three different Availability zones

resource "subnet" "public_subnet" {
    count = length(var.subnets_cidr)
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = element(var.subnets_cidr, count.index)
    availability_zone = element(var.subnets_cidr,count.index)

    tahs = {
        Name = "Subnet-${count.index+1}"
    }
}
