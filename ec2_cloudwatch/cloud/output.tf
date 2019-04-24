output "ids" {
        value = "${data.aws_instances.test_id.ids}"
}

output "CPU_alarm" {
        value = "${aws_cloudwatch_metric_alarm.cpu_utilization.*.alarm_name}"
}

output "StatusCheck_alarm" {
        value = "${aws_cloudwatch_metric_alarm.status_check.*.alarm_name}"
}

