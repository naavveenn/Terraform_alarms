data "aws_instances" "test_id" {
        filter = {
                name = "tag:env"
                values = ["prod","staging"]

                }
        instance_state_names = ["stopped","running"]
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization" {
        count = "${length(data.aws_instances.test_id.ids)}"
        alarm_name                = "msp-awsec2-${data.aws_instances.test_id.ids[count.index]}-CPUUtilization-Critical"
        comparison_operator       = "GreaterThanOrEqualToThreshold"
        evaluation_periods        = "1"
        metric_name               = "CPUUtilization"
        namespace                 = "AWS/EC2"
        period                    = "300"
        statistic                 = "Average"
        threshold                 = "80"
        alarm_description         = "This metric monitors ec2 cpu utilization"
        alarm_actions             = [ "${var.sns_arn}" ]
        dimensions {
                InstanceId = "${data.aws_instances.test_id.ids[count.index]}"
        }
}

resource "aws_cloudwatch_metric_alarm" "status_check" {
        count = "${length(data.aws_instances.test_id.ids)}"
        alarm_name                = "msp-awsec2-${data.aws_instances.test_id.ids[count.index]}-StatusCheck-Critical"
        comparison_operator       = "GreaterThanOrEqualToThreshold"
        evaluation_periods        = "1"
        metric_name               = "StatusCheckFailed"
        namespace                 = "AWS/EC2"
        period                    = "60"
        statistic                 = "Average"
        threshold                 = "1"
        alarm_description         = "This metric monitors ec2 status check"
        alarm_actions             = [ "${var.sns_arn}" ]
        dimensions {
                InstanceId = "${data.aws_instances.test_id.ids[count.index]}"
        }
}

