resource "aws_autoscaling_group" "worker" {
    name                         =    "${var.prefix}-worker"
    vpc_zone_identifier          =    aws_subnet.private[*].id
    max_size                     =    var.max_size	
    min_size                     =    var.min_size
    desired_capacity             =    var.desired_capacity
    
    health_check_type            =    "ELB"

    launch_template {
        id         =     aws_launch_template.worker.id
        version    =     "$Default"
    }
}


resource "aws_autoscaling_policy" "scale_up" {
  name                   = "${var.prefix}-scale_up"
  autoscaling_group_name = aws_autoscaling_group.worker.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = 1
  cooldown               = 60
}

resource "aws_cloudwatch_metric_alarm" "scale_up" {
  alarm_description   = "Monitors CPU utilization for Terramino ASG"
  alarm_actions       = [aws_autoscaling_policy.scale_up.arn]
  alarm_name          = "${var.prefix}_scale_up"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  namespace           = "AWS/EC2"
  metric_name         = "CPUUtilization"
  threshold           = "30"
  evaluation_periods  = "2"
  period              = "30"
  statistic           = "Average"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.worker.name
  }
  
}


resource "aws_autoscaling_policy" "scale_down" {
  name                   = "${var.prefix}_scale_down"
  autoscaling_group_name = aws_autoscaling_group.worker.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = -1
  cooldown               = 60
}

resource "aws_cloudwatch_metric_alarm" "scale_down" {
  alarm_description   = "Monitors CPU utilization for Terramino ASG"
  alarm_actions       = [aws_autoscaling_policy.scale_down.arn]
  alarm_name          = "${var.prefix}_scale_down"
  comparison_operator = "LessThanOrEqualToThreshold"
  namespace           = "AWS/EC2"
  metric_name         = "CPUUtilization"
  threshold           = "10"
  evaluation_periods  = "2"
  period              = "60"
  statistic           = "Average"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.worker.name
  }
}
