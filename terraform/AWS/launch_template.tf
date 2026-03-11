resource "aws_launch_template" "worker" {
    name                                =    "${var.prefix}-worker"
    
    image_id                            =    var.image_id
    instance_type                       =    var.instance_type
    key_name                            =    var.keypair_name
    vpc_security_group_ids              =    [var.master_sg]
    
    tag_specifications {
        resource_type = "instance"
        tags = {
            Name  = "${var.prefix}-worker"
        } 
    }
    depends_on = [aws_subnet.private]
    
    user_data = filebase64("userdata.sh")


}
