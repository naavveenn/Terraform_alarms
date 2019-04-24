output "instance_id" {
        value = "${module.cloudwatch.ids}"
}

output "CPU Alarm Name" {
        value = "${module.cloudwatch.CPU_alarm}"
}

output "StatusCheck Alarm Name" {
        value = "${module.cloudwatch.StatusCheck_alarm}"
}

