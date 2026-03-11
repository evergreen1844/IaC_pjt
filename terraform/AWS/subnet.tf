# Subnet (Private)
resource "aws_subnet" "private" {
    count               =   length(var.private_subnets)
    
    vpc_id              =   var.vpcid
    cidr_block          =   "${lookup(var.private_subnets[count.index], "cidr")}"
    availability_zone   =   "${lookup(var.private_subnets[count.index], "availability_zone")}"
    
    tags = {
        Name        =   "${var.prefix}-private-subnet-${count.index}"
        Managed_by  =   "terraform"
    }
}