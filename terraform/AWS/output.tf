output "web_auto_scaling_group_id" {
    description     =   "The ID of Auto Scaling Group"
    value           =   aws_autoscaling_group.worker.id
}

output "web_launch_template_id" {
    description     =   "The ID of Launch Template"
    value           =   aws_launch_template.worker.id
}

output "private_subnet_ids" {
    description     =   "The List of Private Subnet ID of VPC"
    value           =   aws_subnet.private.*.id
}

output "private_route_table_id" {
    description     =   "The ID of Route Table for Private Subnet"
    value           =   aws_route_table.private.id
}

output "this_nat_gateway_id" {
    description     =   "The ID of NAT Gateway of VPC"
    value           =   aws_nat_gateway.this.id
}

output "admin_security_group_id" {
    description     =   "The ID of Security Group for Admin access"
    value           =   aws_security_group.admin.id
}


