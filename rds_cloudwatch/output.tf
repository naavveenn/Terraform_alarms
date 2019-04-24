output "CPU Alarm Name" {
        value = "${module.cloudwatch.cpu_utilization_alarm}"
}

output "Freeable Memory Alarm Name" {
        value = "${module.cloudwatch.freeable_memory_alarm}"
}

output "Freeable Storage Name" {
        value = "${module.cloudwatch.freeable_storage_alarm}"
}

output "DBConnections Alarm Name" {
        value = "${module.cloudwatch.DBConnections_alarm}"
}

output "ReadIOPS Alarm Name" {
        value = "${module.cloudwatch.ReadIOPS_alarm}"
}

output "WriteIOPS Alarm Name" {
        value = "${module.cloudwatch.WriteIOPS_alarm}"
}
output "ReadThroughput Alarm Name" {
        value = "${module.cloudwatch.ReadThroughput_alarm}"
}

output "WriteThroughput Alarm Name" {
        value = "${module.cloudwatch.WriteThroughput_alarm}"
}
