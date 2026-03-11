# EIP
resource "aws_eip" "this" {
  vpc               =   true
  tags = {
    Name            =   "${var.prefix}-eip"
  }

}

# NAT Gateway
resource "aws_nat_gateway" "this" {
  allocation_id     =   aws_eip.this.id
  subnet_id         =   var.user09-public-id

  tags = {
    Name            =   "${var.prefix}-nat-gw"
  }

}

resource "aws_route" "nat_gateway" {
    route_table_id             =    aws_route_table.private.id
    destination_cidr_block     =    "0.0.0.0/0"
    nat_gateway_id             =    aws_nat_gateway.this.id
}
