# Route table (Private)
resource "aws_route_table" "private" {
    vpc_id              =   var.vpcid

    tags = {
        Name            =   "${var.prefix}-private-rt"
        Managed_by      =   "terraform"
    }
}

resource "aws_route_table_association" "private" {
    count               =   length(var.private_subnets)
    
    subnet_id           =   "${aws_subnet.private[count.index].id}"
    route_table_id      =   aws_route_table.private.id
    
    depends_on          =   [aws_subnet.private]
}