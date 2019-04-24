output "cpu_utilization_alarm" {
        value = "${aws_cloudwatch_metric_alarm.cpu_utilization.*.alarm_name}"
}

output "freeable_memory_alarm" {
        value = "${aws_cloudwatch_metric_alarm.freeable_memory.*.alarm_name}"
}

output "freeable_storage_alarm" {
        value = "${aws_cloudwatch_metric_alarm.freeable_storage.*.alarm_name}"
}

output "DBConnections_alarm" {
        value = "${aws_cloudwatch_metric_alarm.DBConnections.*.alarm_name}"
}

output "ReadIOPS_alarm" {
        value = "${aws_cloudwatch_metric_alarm.ReadIOPS.*.alarm_name}"
}

output "WriteIOPS_alarm" {
        value = "${aws_cloudwatch_metric_alarm.WriteIOPS.*.alarm_name}"
}

output "ReadThroughput_alarm" {
        value = "${aws_cloudwatch_metric_alarm.ReadThroughput.*.alarm_name}"
}

output "WriteThroughput_alarm" {
        value = "${aws_cloudwatch_metric_alarm.WriteThroughput.*.alarm_name}"
}

